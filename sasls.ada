  with Linked_Exceptions;
  generic
 
    type Element is private;
 
  package System_Allocated_Singly_Linked is
 
    type Sequence is private;
 
    Nil : constant Sequence;
 
    First_Of_Nil : exception 
        renames Linked_Exceptions.First_Of_Nil;
    Set_First_Of_Nil : exception
        renames Linked_Exceptions.Set_First_Of_Nil;
    Next_Of_Nil : exception
        renames Linked_Exceptions.Next_Of_Nil;
    Set_Next_Of_Nil : exception
        renames Linked_Exceptions.Set_Next_Of_Nil;
    Out_Of_Construct_Storage : exception
        renames Linked_Exceptions.Out_Of_Construct_Storage;




    function Construct(The_Element : Element; S : Sequence)
           return Sequence;
    pragma inline(Construct);

    function First(S : Sequence)
           return Element;
    pragma inline(First);

    procedure Free(S : Sequence);
    pragma inline(Free);

    function Next(S : Sequence)
           return Sequence;
    pragma inline(Next);

    procedure Set_First(S : Sequence; X : Element);
    pragma inline(Set_First);

    procedure Set_Next(S1, S2 : Sequence);
    pragma inline(Set_Next);

  private
 
    type Node;
 
    type Sequence is access Node;
 
    Nil                      : constant Sequence := null;
 
  end System_Allocated_Singly_Linked;
