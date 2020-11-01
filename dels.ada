  generic
 
    type Element  is private;
    type Sequence is private;
    Nil : Sequence;
    with function First(S : Sequence) return Element;
    with function Next(S : Sequence) return Sequence;
    with function Construct(E : Element; S : Sequence) return Sequence;
    with procedure Set_First(S : Sequence; E : Element);
    with procedure Set_Next(S1, S2 : Sequence);
    with procedure Free_Construct(S : Sequence);
 
  package Double_Ended_Lists is
 
    type Del is limited private;




    procedure Add_Current(The_Element : Element; S : in out Del);
    pragma inline(Add_Current);

    procedure Add_First(The_Element : Element; S : in out Del);
    pragma inline(Add_First);

    procedure Add_Last(The_Element : Element; S : in out Del);
    pragma inline(Add_Last);

    procedure Advance(S : in out Del);
    pragma inline(Advance);

    procedure Concatenate(S1, S2 : in out Del);
    pragma inline(Concatenate);

    procedure Copy_Sequence(S1 : out Del; S2 : Del);

    generic
          with function Test(X, Y : Element) return Boolean;
    function Count(Item : Element; S : Del)
           return Integer;

    generic
          with function Test(X : Element) return Boolean;
    function Count_If(S : Del)
           return Integer;

    generic
          with function Test(X : Element) return Boolean;
    function Count_If_Not(S : Del)
           return Integer;

    function Current(S : Del)
           return Element;
    pragma inline(Current);

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Delete(Item : Element; S : in out Del);

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Delete_Duplicates(S : in out Del);

    generic
          with function Test(X : Element) return Boolean;
    procedure Delete_If(S : in out Del);

    generic
          with function Test(X : Element) return Boolean;
    procedure Delete_If_Not(S : in out Del);

    procedure Drop_Head(S : in out Del);
    pragma inline(Drop_Head);

    procedure Drop_Tail(S : in out Del);
    pragma inline(Drop_Tail);

    generic
          with function Test(X, Y : Element) return Boolean;
    function Equal(S1, S2: Del)
           return Boolean;

    generic
          with function Test(X : Element) return Boolean;
    function Every(S : Del)
           return Boolean;

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Find(Item : Element; S : in out Del);

    generic
          with function Test(X : Element) return Boolean;
    procedure Find_If(S : in out Del);

    generic
          with function Test(X : Element) return Boolean;
    procedure Find_If_Not(S : in out Del);

    function First(S : Del)
           return Element;
    pragma inline(First);

    generic
          with procedure The_Procedure(X : Element);
    procedure For_Each(S : Del);

    generic
          with procedure The_Procedure(X, Y : Element);
    procedure For_Each_2(S1, S2 : Del);

    procedure Free(S : in out Del);
    pragma inline(Free);

    procedure Initialize(S : in out Del);
    pragma inline(Initialize);

    procedure Invert(S : in out Del);

    function Is_Empty(S : Del)
           return Boolean;
    pragma inline(Is_Empty);

    function Is_End(S : Del)
           return Boolean;
    pragma inline(Is_End);

    function Last(S : Del)
           return Element;
    pragma inline(Last);

    function Length(S : Del)
           return Integer;

    generic
          with function F(E : Element) return Element;
    procedure Map(S : Del);

    generic
          with function F(X, Y : Element) return Element;
    procedure Map_2(S1, S2 : Del);

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Merge(S1, S2 : in out Del);

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Mismatch(S1, S2 : in out Del);

    generic
          with function Test(X : Element) return Boolean;
    function Not_Any(S : Del)
           return Boolean;

    generic
          with function Test(X : Element) return Boolean;
    function Not_Every(S : Del)
           return Boolean;

    generic
          Identity : Element;
      with function F(X, Y : Element) return Element;
    function Reduce(S : Del)
           return Element;

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Search(S1 : Del; S2 : in out Del);

    procedure Set_Current(S : Del; X : Element);
    pragma inline(Set_Current);

    procedure Set_First(S : Del; X : Element);
    pragma inline(Set_First);

    procedure Set_Last(S : Del; X : Element);
    pragma inline(Set_Last);

    generic
          with function Test(X : Element) return Boolean;
    function Some(S : Del)
           return Boolean;

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Sort(S : in out Del);

    procedure Split(S1, S2 : in out Del);
    pragma inline(Split);

    generic
          with function Test(X, Y : Element) return Boolean;
    procedure Substitute(New_Item, Old_Item : Element; S : Del);

    generic
          with function Test(X : Element) return Boolean;
    procedure Substitute_If(New_Item : Element; S : Del);

    generic
          with function Test(X : Element) return Boolean;
    procedure Substitute_If_Not(New_Item : Element; S : Del);

  private
 
    type Del is record
      First   : Sequence := Nil;
      Current : Sequence := Nil;
      Last    : Sequence := Nil;
    end record;
 
  end Double_Ended_Lists;
