  with Unchecked_Deallocation;
  package body Auto_Reallocating_Singly_Linked is
 
    Number_Of_Blocks : Positive := Initial_Number_Of_Blocks;
 
    Heap_Size        : Sequence := Sequence(Number_Of_Blocks * Block_Size);
 
    type Node is record
      Datum : Element;
      Link  : Sequence;
    end record;
 
    type Vector_Of_Nodes is array(Sequence range <>) of Node;
 
    type Heap_Of_Nodes   is access Vector_Of_Nodes;
 
    procedure Free_Heap is new Unchecked_Deallocation(Vector_Of_Nodes,
                                                      Heap_Of_Nodes);
 
    Heap         : Heap_Of_Nodes;
 
    Free_List    : Sequence := Nil;
 
    Fill_Pointer : Sequence := 1;
 
    procedure Reallocate is
      New_Number_Of_Blocks : Natural       := 
         Positive(Float(Number_Of_Blocks) * Coefficient + 0.5);
      New_Heap_Size        : Sequence      := 
         Sequence(New_Number_Of_Blocks * Block_Size);
      New_Heap             : Heap_Of_Nodes :=
       new Vector_Of_Nodes(1 .. New_Heap_Size);
    begin
      for I in Heap'range loop
        New_Heap(I) := Heap(I);
      end loop;
      Free_Heap(Heap);
      Heap := New_Heap;
      Number_Of_Blocks := New_Number_Of_Blocks;
      Heap_Size := New_Heap_Size;
    end Reallocate;
 


    function Construct(The_Element : Element; S : Sequence)
           return Sequence is 
      Temp : Sequence;
    begin
      if Free_List /= Nil then
        Temp := Free_List;
        Free_List := Next(Free_List);
      else
        if Fill_Pointer > Sequence(Heap_Size) then
          Reallocate;
        end if;
        Temp := Fill_Pointer;
        Fill_Pointer := Fill_Pointer + 1;
      end if;
      Set_First(Temp, The_Element);
      Set_Next(Temp, S);
      return (Temp);
    end Construct;

    function First(S : Sequence)
           return Element is 
    begin
      return Heap(S).Datum;
    exception
      when Constraint_Error =>
        raise First_Of_Nil;
    end First;

    procedure Free(S : Sequence) is 
    begin
      Set_Next(S, Free_List);
      Free_List := S;
    end Free;

    function Next(S : Sequence)
           return Sequence is 
    begin
      return Heap(S).Link;
    exception
      when Constraint_Error =>
        raise Next_Of_Nil;
    end Next;

    procedure Set_First(S : Sequence; X : Element) is 
    begin
      Heap(S).Datum := X;
    exception
      when Constraint_Error =>
        raise Set_First_Of_Nil;
    end Set_First;

    procedure Set_Next(S1, S2 : Sequence) is 
    begin
      Heap(S1).Link := S2;
    exception
      when Constraint_Error =>
        raise Set_Next_Of_Nil;
    end Set_Next;

  begin
 
    Heap := new Vector_Of_Nodes(1 .. Heap_Size);
 
  exception
 
    when Storage_Error =>
      raise Out_Of_Construct_Storage;
 
  end Auto_Reallocating_Singly_Linked;
