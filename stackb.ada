  package body Stacks is


    procedure Create(S : out Stack) is 
    begin
      Create(Sequence(S));
    end Create;

    procedure For_Each(S: in out Stack) is 
     An_Element: Element;
    begin
      while not Is_Empty(S) loop
        Pop(An_Element, S);
        The_Procedure(An_Element);
      end loop;
    end For_Each;

    function Is_Empty(S : Stack)
           return Boolean is 
    begin
      return Empty(Sequence(S));
    end Is_Empty;

    procedure Pop(The_Element : out Element; S : in out Stack) is 
      Old : Sequence := Sequence(S);
    begin
      if Empty(Sequence(S)) then raise Stack_Underflow;
      end if;
      The_Element := Top(S);
      S := Stack(Next(Sequence(S)));
      Free_Construct(Old);
    end Pop;

    procedure Push(The_Element : in Element; S : in out Stack) is 
    begin
      if Full(Sequence(S)) then raise Stack_Overflow;
      end if;
      S := Stack(Construct(The_Element, Sequence(S)));
    end Push;

    function Top(S : Stack)
           return Element is 
    begin
      if Is_Empty(S) then raise Stack_Underflow;
      end if;
      return First(Sequence(S));
    end Top;

  end Stacks;
