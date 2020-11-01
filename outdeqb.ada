  package body Output_Restricted_Deques is


    procedure Create(D : in out Deque) is 
    begin
      Create(Sequence(D));
    end Create;

    procedure For_Each(D: in out Deque) is 
     An_Element: Element;
    begin
      while not Is_Empty(D) loop
        Pop_Front(An_Element, D);
        The_Procedure(An_Element);
      end loop;
    end For_Each;

    function Front(D : Deque)
           return Element is 
    begin
      if Is_Empty(D) then raise Deque_Underflow;
      end if;
      return First(Sequence(D));
    end Front;

    function Is_Empty(D : Deque)
           return Boolean is 
    begin
      return Empty(Sequence(D));
    end Is_Empty;

    procedure Pop_Front(The_Element : out Element; D : in out Deque) is 
    begin
      if Empty(Sequence(D)) then raise Deque_Underflow;
      else
        The_Element := Front(D);
        Drop_First(Sequence(D));
      end if;
    end Pop_Front;

    procedure Push_Front(The_Element : in Element; D : in out Deque) is 
    begin
      if Full(Sequence(D)) then raise Deque_Overflow;
      end if;
      Add_First(The_Element, Sequence(D));
    end Push_Front;

    procedure Push_Rear(The_Element : in Element; D : in out Deque) is 
    begin
      if Full(Sequence(D)) then raise Deque_Overflow;
      end if;
      Add_Last(The_Element, Sequence(D));
    end Push_Rear;

    function Rear(D : Deque)
           return Element is 
    begin
      if Is_Empty(D) then raise Deque_Underflow;
      end if;
      return Last(Sequence(D));
    end Rear;

  end Output_Restricted_Deques;
