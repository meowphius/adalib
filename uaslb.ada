  package body User_Allocated_Singly_Linked is
 
    type Node is record
      Datum : Element;
      Link  : Sequence;
    end record;
 
    type Heap_Of_Records is array(Sequence range <>) of Node;
 
    Heap         : Heap_Of_Records(1 .. Sequence(Heap_Size));
 
    Free_List    : Sequence := Nil;
 
    Fill_Pointer : Sequence := 1;
 


    function Construct(The_Element : Element; S : Sequence)
           return Sequence is 
      Temp : Sequence;
    begin
      if Free_List /= Nil then
        Temp := Free_List;
        Free_List := Next(Free_List);
      elsif Fill_Pointer <= Sequence(Heap_Size) then
        Temp := Fill_Pointer;
        Fill_Pointer := Fill_Pointer + 1;
      else
        raise Out_Of_Construct_Storage;
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

  end User_Allocated_Singly_Linked;
