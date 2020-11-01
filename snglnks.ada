  with Linked_Exceptions;
   generic
 
    type Element0  is private;
    type Sequence0 is private;
    Nil0 : Sequence0;
    with function First0(S : Sequence0) return Element0;
    with function Next0(S : Sequence0) return Sequence0;
    with function Construct0(E : Element0; S : Sequence0) return Sequence0;
    with procedure Set_First0(S : Sequence0; E : Element0);
    with procedure Set_Next0(S1, S2 : Sequence0);
    with procedure Free0(S : Sequence0);
 
  package Singly_Linked_Lists is

    subtype Element  is  Element0;
    subtype Sequence is  Sequence0;
    Nil : Sequence renames Nil0;

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




    function Append(S1, S2 : Sequence)
           return Sequence;

    function Butlast(S : Sequence; N : Integer := 1)
           return Sequence;

    function Butlast_Copy(S : Sequence; N : Integer := 1)
           return Sequence;

    function Concatenate(S1, S2 : Sequence)
           return Sequence;

    function Concatenate_Copy(S1, S2 : Sequence)
           return Sequence;

    function Construct(E: Element; S : Sequence)
           return Sequence renames Construct0;

    function Copy_First_N(S : Sequence; N : Integer)
           return Sequence;

    function Copy_Sequence(S : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Count(Item : Element; S : Sequence)
           return Integer;

    generic
    with function Test(X : Element) return Boolean;
    function Count_If(S : Sequence)
           return Integer;

    generic
    with function Test(X : Element) return Boolean;
    function Count_If_Not(S : Sequence)
           return Integer;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Delete(Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Delete_Copy(Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Delete_Copy_Duplicates(S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Delete_Copy_If(S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Delete_Copy_If_Not(S : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Delete_Duplicates(S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Delete_If(S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Delete_If_Not(S : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Equal(S1, S2 : Sequence)
           return Boolean;

    generic
    with function Test(X : Element) return Boolean;
    function Every(S : Sequence)
           return Boolean;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Find(Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Find_If(S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Find_If_Not(S : Sequence)
           return Sequence;

    function First(S : Sequence)
           return Element renames First0;

    generic
    with procedure The_Procedure(X : Element);
    procedure For_Each(S : Sequence);

    generic
    with procedure The_Procedure(X : Sequence);
    procedure For_Each_Cell(S : Sequence);

    generic
          with procedure The_Procedure(X, Y : Element);
    procedure For_Each_2(S1, S2 : Sequence);

    generic
          with procedure The_Procedure(X, Y : Sequence);
    procedure For_Each_Cell_2(S1, S2 : Sequence);

    procedure Free(S : Sequence) renames Free0;

    procedure Free_Sequence(S : Sequence);

    function Invert(S : Sequence)
           return Sequence;

    function Invert_Copy(S : Sequence)
           return Sequence;

    function Is_End(S : Sequence)
           return Boolean;

    function Is_Not_End(S : Sequence)
           return Boolean;

    function Last(S : Sequence)
           return Sequence;

    function Length(S : Sequence)
           return Integer;

    function Make_Sequence(Size : Integer; Initial : Element)
           return Sequence;

    generic
    with function F(E : Element) return Element;
    function Map(S : Sequence)
           return Sequence;

    generic
    with function F(X, Y : Element) return Element;
    function Map_2(S1, S2 : Sequence)
           return Sequence;

    generic
    with function F(E : Element) return Element;
    function Map_Copy(S : Sequence)
           return Sequence;

    generic
    with function F(X, Y : Element) return Element;
    function Map_Copy_2(S1, S2 : Sequence)
           return Sequence;

    generic
    with function Test(X, Y :Element) return Boolean;
    function Merge(S1, S2 : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    procedure Mismatch(S1, S2 : in Sequence; S3, S4 : out Sequence);

    function Next(S : Sequence)
           return Sequence renames Next0;

    generic
    with function Test(X : Element) return Boolean;
    function Not_Any(S : Sequence)
           return Boolean;

    generic
    with function Test(X : Element) return Boolean;
    function Not_Every(S : Sequence)
           return Boolean;

    function Nth(N : Integer; S : Sequence)
           return Element;

    function Nth_Rest(N : Integer; S : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Position(Item : Element; S : Sequence)
           return Integer;

    generic
    with function Test(X : Element) return Boolean;
    function Position_If(S : Sequence)
           return Integer;

    generic
    with function Test(X : Element) return Boolean;
    function Position_If_Not(S : Sequence)
           return Integer;

    generic
    Identity : Element;
    with function F(X, Y : Element) return Element;
    function Reduce(S : Sequence)
           return Element;

    function Reverse_Append(S1, S2 : Sequence)
           return Sequence;

    function Reverse_Concatenate(S1, S2 : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Search(S1, S2 : Sequence)
           return Sequence;

    procedure Set_First(S : Sequence; E : Element) renames Set_First0;

    procedure Set_Next(S1, S2 : Sequence) renames Set_Next0;

    procedure Set_Nth(S : Sequence; Index : Integer; New_Item : Element);

    generic
    with function Test(X : Element) return Boolean;
    function Some(S : Sequence)
           return Boolean;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Sort(S : Sequence)
           return Sequence;

    function Subsequence(S : Sequence; Start, Stop : Integer)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Substitute(New_Item, Old_Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X, Y : Element) return Boolean;
    function Substitute_Copy(New_Item, Old_Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Substitute_Copy_If(New_Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Substitute_Copy_If_Not(New_Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Substitute_If(New_Item : Element; S : Sequence)
           return Sequence;

    generic
    with function Test(X : Element) return Boolean;
    function Substitute_If_Not(New_Item : Element; S : Sequence)
           return Sequence;

  end Singly_Linked_Lists;
