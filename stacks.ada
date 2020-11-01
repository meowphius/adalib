  generic
    type Element  is private;
    type Sequence is private;
    with procedure Create(S : out Sequence);
    with function Full(S : Sequence) return Boolean;
    with function Empty(S : Sequence) return Boolean;
    with function First(S : Sequence) return Element;
    with function Next(S : Sequence) return Sequence;
    with function Construct(E : Element; S : Sequence) return Sequence;
    with procedure Free_Construct(S : Sequence);
  package Stacks is
    type Stack is limited private;
    Stack_Underflow, Stack_Overflow : exception;



    procedure Create(S : out Stack);
    pragma inline(Create);

    generic
    with procedure The_Procedure(E : Element);
    procedure For_Each(S: in out Stack);
    pragma inline(For_Each);

    function Is_Empty(S : Stack)
           return Boolean;
    pragma inline(Is_Empty);

    procedure Pop(The_Element : out Element; S : in out Stack);
    pragma inline(Pop);

    procedure Push(The_Element : in Element; S : in out Stack);
    pragma inline(Push);

    function Top(S : Stack)
           return Element;
    pragma inline(Top);

    private
    type Stack is new Sequence;

  end Stacks;
