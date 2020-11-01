  generic
 
    type Cell is private;
    with function Next(S : Cell) return Cell;
    with procedure Set_Next(S1, S2 : Cell);
    with function Is_End(S : Cell) return Boolean;
    with function Copy_Cell(S1, S2 : Cell) return Cell;
 
  package Linked_List_Algorithms is




    generic
          type Element is private;
      with function F(X : Element; Y : Cell) return Element;
    function Accumulate(S : Cell; Initial_Value : Element)
           return Element;

    procedure Advance(S : in out Cell);
    pragma inline(Advance);

    function Append(S1, S2 : Cell)
           return Cell;

    function Append_First_N(S1, S2 : Cell; N : Integer)
           return Cell;

    procedure Attach_To_Tail(X : in out Cell; Y : in Cell);
    pragma inline(Attach_To_Tail);

    generic
          with function Test(X : Cell) return Boolean;
    function Count(S : Cell)
           return Integer;

    generic
          with function Test(X : Cell) return Boolean;
    function Delete_Copy_Append(S1, S2 : Cell)
           return Cell;

    generic
          with function Test(X, Y : Cell) return Boolean;
    function Delete_Copy_Duplicates_Append(S1, S2 : Cell)
           return Cell;

    generic
          with function Test(X, Y : Cell) return Boolean;
      with procedure Free(X : Cell);
    function Delete_Duplicates(S : Cell)
           return Cell;

    generic
          with function Test(X, Y : Cell) return Boolean;
    function Equal(S1, S2 : Cell)
           return Boolean;

    generic
          with function Test(X : Cell) return Boolean;
    function Every(S : Cell)
           return Boolean;

    generic
          with function Test(X : Cell) return Boolean;
    function Find(S : Cell)
           return Cell;

    generic
          with procedure The_Procedure(X : Cell);
    procedure For_Each_Cell(S : Cell);

    generic
          with procedure The_Procedure(X, Y : Cell);
    procedure For_Each_Cell_2(S1, S2 : Cell);

    generic
          with function Test(S: Cell) return Boolean;
    procedure Invert_Partition(S1: in Cell; S2, S3: in out Cell);

    function Last(S : Cell)
           return Cell;

    function Length(S : Cell)
           return Integer;

    generic
          with function Make_Cell(X, Y, Z : Cell) return Cell;
    function Map_Copy_2_Append(S1, S2, S3 : Cell)
           return Cell;

    generic
          with function Make_Cell(X, Y : Cell) return Cell;
    function Map_Copy_Append(S1, S2 : Cell)
           return Cell;

    generic
          with function Test(X, Y : Cell) return Boolean;
    function Merge(S1, S2 : Cell)
           return Cell;

    generic
          with function Test(X, Y : Cell) return Boolean;
    function Merge_Non_Empty(S1, S2 : Cell)
           return Cell;

    generic
          with function Test(X, Y : Cell) return Boolean;
    procedure Mismatch(S1, S2 : in Cell; S3, S4 : out Cell);

    generic
          with function Test(X : Cell) return Boolean;
    function Not_Any(S : Cell)
           return Boolean;

    generic
          with function Test(X : Cell) return Boolean;
    function Not_Every(S : Cell)
           return Boolean;

    function Nth_Rest(N : Integer; S : Cell)
           return Cell;

    generic
          with function Test(X : Cell) return Boolean;
    function Position(S : Cell)
           return Integer;

    function Reverse_Append(S1, S2 : Cell)
           return Cell;

    function Reverse_Concatenate(S1, S2 : Cell)
           return Cell;

    generic
          with function Test(X, Y : Cell) return Boolean;
    function Search(S1, S2 : Cell)
           return Cell;

    generic
          with function Test(X : Cell) return Boolean;
    function Some(S : Cell)
           return Boolean;

    generic
          Log_Of_Max_Num : Integer;
      Empty          : Cell;
      with function Test(X, Y : Cell) return Boolean;
    function Sort(S : Cell)
           return Cell;

  end Linked_List_Algorithms;
