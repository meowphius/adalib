  with Unchecked_Deallocation;
  package body System_Allocated_Singly_Linked is
 
    type Node is record
      Datum : Element;
      Link  : Sequence;
    end record;

    procedure Free_Aux is new Unchecked_Deallocation(Node, Sequence);



    function Construct(The_Element : Element; S : Sequence)
           return Sequence is 
    begin
      return new Node'(The_Element, S);
    exception
      when Storage_Error =>
        raise Out_Of_Construct_Storage;
    end Construct;

    function First(S : Sequence)
           return Element is 
    begin
      return S.Datum;
    exception
      when Constraint_Error =>
        raise First_Of_Nil;
    end First;

    procedure Free(S : Sequence) is 
      Temp : Sequence := S;
    begin
      Free_Aux(Temp);
    end Free;

    function Next(S : Sequence)
           return Sequence is 
    begin
      return S.Link;
    exception
      when Constraint_Error =>
        raise Next_Of_Nil;
    end Next;

    procedure Set_First(S : Sequence; X : Element) is 
    begin
      S.Datum := X;
    exception
      when Constraint_Error =>
        raise Set_First_Of_Nil;
    end Set_First;

    procedure Set_Next(S1, S2 : Sequence) is 
    begin
      S1.Link := S2;
    exception
      when Constraint_Error =>
        raise Set_Next_Of_Nil;
    end Set_Next;

  end System_Allocated_Singly_Linked;
