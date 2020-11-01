  generic
    type Element  is private;
    type Sequence is limited private;
    with procedure Create(S : in out Sequence);
    with function Full(S : Sequence) return Boolean;
    with function Empty(S : Sequence) return Boolean;
    with function First(S : Sequence) return Element;
    with function Last(S : Sequence) return Element;
    with procedure Add_First(E : Element; S : in out Sequence);
    with procedure Add_Last(E : Element; S : in out Sequence);
    with procedure Drop_First(S : in out Sequence);
  package Output_Restricted_Deques is
    type Deque is limited private;
    Deque_Underflow, Deque_Overflow : exception;



    procedure Create(D : in out Deque);
    pragma inline(Create);

    generic
    with procedure The_Procedure(E : Element);
    procedure For_Each(D: in out Deque);
    pragma inline(For_Each);

    function Front(D : Deque)
           return Element;
    pragma inline(Front);

    function Is_Empty(D : Deque)
           return Boolean;
    pragma inline(Is_Empty);

    procedure Pop_Front(The_Element : out Element; D : in out Deque);
    pragma inline(Pop_Front);

    procedure Push_Front(The_Element : in Element; D : in out Deque);
    pragma inline(Push_Front);

    procedure Push_Rear(The_Element : in Element; D : in out Deque);
    pragma inline(Push_Rear);

    function Rear(D : Deque)
           return Element;
    pragma inline(Rear);

    private
    type Deque is new Sequence;
  end Output_Restricted_Deques;
