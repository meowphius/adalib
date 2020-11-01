  with Linked_List_Algorithms;
  package body Singly_Linked_Lists is
 
    function Copy_Cell(S1, S2 : Sequence) return Sequence is
    begin
      return Construct(First(S1), S2);
    end Copy_Cell;
 
    pragma Inline(Copy_Cell);
 
    package Algorithms is new Linked_List_Algorithms(Cell => Sequence, 
     Next => Next, Set_Next => Set_Next, Is_End => Is_End, 
     Copy_Cell => Copy_Cell);

    generic
      Item : Element;
      with function Test(X, Y : Element) return Boolean;
    function Make_Test(S : Sequence) return Boolean;
 
    function Make_Test(S : Sequence) return Boolean is
    begin
      return Test(Item, First(S));
    end Make_Test;
 
    pragma Inline(Make_Test);
 
    generic
      with function Test(X : Element) return Boolean;
    function Make_Test_If(S : Sequence) return Boolean;
 
    function Make_Test_If(S : Sequence) return Boolean is
    begin
      return Test(First(S));
    end Make_Test_If;
 
    pragma Inline(Make_Test_If);
 
    generic
      with function Test(X : Element) return Boolean;
    function Make_Test_If_Not(S : Sequence) return Boolean;
 
    function Make_Test_If_Not(S : Sequence) return Boolean is
    begin
      return not Test(First(S));
    end Make_Test_If_Not;
 
    pragma Inline(Make_Test_If_Not);
 
    generic
      with function Test(X, Y : Element) return Boolean;
    function Make_Test_Both(S1, S2 : Sequence) return Boolean;
 
    function Make_Test_Both(S1, S2 : Sequence) return Boolean is
    begin
      return Test(First(S1), First(S2));
    end Make_Test_Both;
 
    pragma Inline(Make_Test_Both);


    function Append(S1, S2 : Sequence)
           return Sequence is 
    begin
      return Algorithms.Append(S1, S2);
    end Append;

    function Butlast(S : Sequence; N : Integer := 1)
           return Sequence is 
      I : Integer := Length(S) - N;
    begin
      if I <= 0 then
        return Nil;
      elsif N > 0 then
        Set_Next(Nth_Rest(I - 1, S), Nil);
      end if;
      return S;
    end Butlast;

    function Butlast_Copy(S : Sequence; N : Integer := 1)
           return Sequence is 
    begin
      return Copy_First_N(S, Length(S) - N);
    end Butlast_Copy;

    function Concatenate(S1, S2 : Sequence)
           return Sequence is 
    begin
      if Is_End(S1) then
        return S2;
      end if;
      Set_Next(Last(S1), S2);
      return S1;
    end Concatenate;

    function Concatenate_Copy(S1, S2 : Sequence)
           return Sequence is 
    begin
      return Append(S1, Append(S2, Nil));
    end Concatenate_Copy;

    function Copy_First_N(S : Sequence; N : Integer)
           return Sequence is 
    begin
      return Algorithms.Append_First_N(S, Nil, N);
    end Copy_First_N;

    function Copy_Sequence(S : Sequence)
           return Sequence is 
    begin
      return Append(S, Nil);
    end Copy_Sequence;

    function Count(Item : Element; S : Sequence)
           return Integer is 
      function Test_Aux is new Make_Test(Item, Test);
      function Count_Aux is new Algorithms.Count(Test_Aux);
    begin
      return Count_Aux(S);
    end Count;

    function Count_If(S : Sequence)
           return Integer is 
      function Test_Aux is new Make_Test_If(Test);
      function Count_Aux is new Algorithms.Count(Test_Aux);
    begin
      return Count_Aux(S);
    end Count_If;

    function Count_If_Not(S : Sequence)
           return Integer is 
      function Test_Aux is new Make_Test_If_Not(Test);
      function Count_Aux is new Algorithms.Count(Test_Aux);
    begin
      return Count_Aux(S);
    end Count_If_Not;

    function Delete(Item : Element; S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test(Item, Test);
      procedure Partition_Aux
        is new Algorithms.Invert_Partition(Test_Aux);
      Temp_1, Temp_2: Sequence := Nil;
    begin
      Partition_Aux(S, Temp_1, Temp_2);
      Free_Sequence(Temp_1);
      return Invert(Temp_2);
    end Delete;

    function Delete_Copy(Item : Element; S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test(Item, Test);
      function Delete_Copy_Aux 
        is new Algorithms.Delete_Copy_Append(Test_Aux);
    begin
      return Delete_Copy_Aux(S, Nil);
    end Delete_Copy;

    function Delete_Copy_Duplicates(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_Both(Test);
      function Delete_Copy_Aux 
        is new Algorithms.Delete_Copy_Duplicates_Append(Test_Aux);
    begin
      return Delete_Copy_Aux(S, Nil);
    end Delete_Copy_Duplicates;

    function Delete_Copy_If(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_If(Test);
      function Delete_Copy_Aux 
        is new Algorithms.Delete_Copy_Append(Test_Aux);
    begin
      return Delete_Copy_Aux(S, Nil);
    end Delete_Copy_If;

    function Delete_Copy_If_Not(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_If_Not(Test);
      function Delete_Copy_Aux 
        is new Algorithms.Delete_Copy_Append(Test_Aux);
    begin
      return Delete_Copy_Aux(S, Nil);
    end Delete_Copy_If_Not;

    function Delete_Duplicates(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_Both(Test);
      function Delete_Aux is 
         new Algorithms.Delete_Duplicates(Test_Aux, Free);
    begin
      return Delete_Aux(S);
    end Delete_Duplicates;

    function Delete_If(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_If(Test);
      procedure Partition_Aux 
        is new Algorithms.Invert_Partition(Test_Aux);
      Temp_1, Temp_2: Sequence := Nil;
    begin
      Partition_Aux(S, Temp_1, Temp_2);
      Free_Sequence(Temp_1);
      return Invert(Temp_2);
    end Delete_If;

    function Delete_If_Not(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_If(Test);
      procedure Partition_Aux is 
        new Algorithms.Invert_Partition(Test_Aux);
      Temp_1, Temp_2: Sequence := Nil;
    begin
      Partition_Aux(S, Temp_1, Temp_2);
      Free_Sequence(Temp_2);
      return Invert(Temp_1);
    end Delete_If_Not;

    function Equal(S1, S2 : Sequence)
           return Boolean is 
      function Test_Aux is new Make_Test_Both(Test);
      function Equal_Aux is new Algorithms.Equal(Test_Aux);
    begin
      return Equal_Aux(S1, S2);
    end Equal;

    function Every(S : Sequence)
           return Boolean is 
      function Test_Aux is new Make_Test_If(Test);
      function Every_Aux is new Algorithms.Every(Test_Aux);
    begin
      return Every_Aux(S);
    end Every;

    function Find(Item : Element; S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test(Item, Test);
      function Find_Aux is new Algorithms.Find(Test_Aux);
    begin
      return Find_Aux(S);
    end Find;

    function Find_If(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_If(Test);
      function Find_Aux is new Algorithms.Find(Test_Aux);
    begin
      return Find_Aux(S);
    end Find_If;

    function Find_If_Not(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_If_Not(Test);
      function Find_Aux is new Algorithms.Find(Test_Aux);
    begin
      return Find_Aux(S);
    end Find_If_Not;

    procedure For_Each(S : Sequence) is 
      procedure The_Procedure_Aux(X : Sequence) is
      begin
        The_Procedure(First(X));
      end The_Procedure_Aux;
      pragma Inline(The_Procedure_Aux);
      procedure For_Each_Aux 
        is new Algorithms.For_Each_Cell(The_Procedure_Aux);
    begin
      For_Each_Aux(S);
    end For_Each;

    procedure For_Each_Cell(S : Sequence) is 
      procedure For_Each_Aux 
        is new Algorithms.For_Each_Cell(The_Procedure);
    begin
      For_Each_Aux(S);
    end For_Each_Cell;

    procedure For_Each_2(S1, S2 : Sequence) is 
      procedure The_Procedure_Aux(X, Y : Sequence) is
      begin
        The_Procedure(First(X), First(Y));
      end The_Procedure_Aux;
      pragma Inline(The_Procedure_Aux);
      procedure For_Each_Aux 
        is new Algorithms.For_Each_Cell_2(The_Procedure_Aux);
    begin
      For_Each_Aux(S1,S2);
    end For_Each_2;

    procedure For_Each_Cell_2(S1, S2 : Sequence) is 
      procedure For_Each_Aux 
        is new Algorithms.For_Each_Cell_2(The_Procedure);
    begin
      For_Each_Aux(S1,S2);
    end For_Each_Cell_2;

    procedure Free_Sequence(S : Sequence) is 
      procedure Free_Sequence_Aux is new Algorithms.For_Each_Cell(Free);
    begin
      Free_Sequence_Aux(S);
    end Free_Sequence;

    function Invert(S : Sequence)
           return Sequence is 
    begin
      return Reverse_Concatenate(S, Nil);
    end Invert;

    function Invert_Copy(S : Sequence)
           return Sequence is 
    begin
      return Reverse_Append(S, Nil);
    end Invert_Copy;

    function Is_End(S : Sequence)
           return Boolean is 
    begin
      return S = Nil;
    end Is_End;

    function Is_Not_End(S : Sequence)
           return Boolean is 
    begin
      return not Is_End(S);
    end Is_Not_End;

    function Last(S : Sequence)
           return Sequence is 
    begin
      return Algorithms.Last(S);
    end Last;

    function Length(S : Sequence)
           return Integer is 
    begin
      return Algorithms.Length(S);
    end Length;

    function Make_Sequence(Size : Integer; Initial : Element)
           return Sequence is 
      Result : Sequence := Nil;
      I      : Integer  := Size;
    begin
      while I > 0 loop
        Result := Construct(Initial, Result);
        I := I - 1;
      end loop;
      return Result;
    end Make_Sequence;

    function Map(S : Sequence)
           return Sequence is 
      procedure The_Procedure_Aux(S : Sequence) is
      begin
        Set_First(S, F(First(S)));
      end The_Procedure_Aux;
      pragma Inline(The_Procedure_Aux);
      procedure Map_Aux 
        is new Algorithms.For_Each_Cell(The_Procedure_Aux);
    begin
      Map_Aux(S);
      return S;
    end Map;

    function Map_2(S1, S2 : Sequence)
           return Sequence is 
      procedure The_Procedure_Aux(S1, S2 : Sequence) is
      begin
        Set_First(S1, F(First(S1), First(S2)));
      end The_Procedure_Aux;
      pragma Inline(The_Procedure_Aux);
      procedure Map_Aux 
        is new Algorithms.For_Each_Cell_2(The_Procedure_Aux);
    begin
      Map_Aux(S1, S2);
      return S1;
    end Map_2;

    function Map_Copy(S : Sequence)
           return Sequence is 
      function Make_Cell(S1, S2 : Sequence) return Sequence is
      begin
        return Construct(F(First(S1)), S2);
      end Make_Cell;
      pragma Inline(Make_Cell);
      function Map_Copy_Aux 
        is new Algorithms.Map_Copy_Append(Make_Cell);
    begin
      return Map_Copy_Aux(S, Nil);
    end Map_Copy;

    function Map_Copy_2(S1, S2 : Sequence)
           return Sequence is 
      function Make_Cell(S1, S2, S3 : Sequence) return Sequence is
      begin
        return Construct(F(First(S1), First(S2)), S3);
      end Make_Cell;
      pragma Inline(Make_Cell);
      function Map_Copy_Aux 
        is new Algorithms.Map_Copy_2_Append(Make_Cell);
    begin
      return Map_Copy_Aux(S1, S2, Nil);
    end Map_Copy_2;

    function Merge(S1, S2 : Sequence)
           return Sequence is 
 function Test_Aux is new Make_Test_Both(Test);
      function Merge_Aux is new Algorithms.Merge(Test_Aux);
    begin
      return Merge_Aux(S1, S2);
    end Merge;

    procedure Mismatch(S1, S2 : in Sequence; S3, S4 : out Sequence) is 
      function Test_Aux is new Make_Test_Both(Test);
      procedure Mismatch_Aux is new Algorithms.Mismatch(Test_Aux);
    begin
      Mismatch_Aux(S1, S2, S3, S4);
    end Mismatch;

    function Not_Any(S : Sequence)
           return Boolean is 
      function Test_Aux is new Make_Test_If(Test);
      function Not_Any_Aux is new Algorithms.Not_Any(Test_Aux);
    begin
      return Not_Any_Aux(S);
    end Not_Any;

    function Not_Every(S : Sequence)
           return Boolean is 
      function Test_Aux is new Make_Test_If(Test);
      function Not_Every_Aux is new Algorithms.Not_Every(Test_Aux);
    begin
      return Not_Every_Aux(S);
    end Not_Every;

    function Nth(N : Integer; S : Sequence)
           return Element is 
    begin
      return First(Nth_Rest(N, S));
    end Nth;

    function Nth_Rest(N : Integer; S : Sequence)
           return Sequence is 
    begin
      return Algorithms.Nth_Rest(N, S);
    end Nth_Rest;

    function Position(Item : Element; S : Sequence)
           return Integer is 
      function Test_Aux is new Make_Test(Item, Test);
      function Position_Aux is new Algorithms.Position(Test_Aux);
    begin
      return Position_Aux(S);
    end Position;

    function Position_If(S : Sequence)
           return Integer is 
      function Test_Aux is new Make_Test_If(Test);
      function Position_Aux is new Algorithms.Position(Test_Aux);
    begin
      return Position_Aux(S);
    end Position_If;

    function Position_If_Not(S : Sequence)
           return Integer is 
      function Test_Aux is new Make_Test_If_Not(Test);
      function Position_Aux is new Algorithms.Position(Test_Aux);
    begin
      return Position_Aux(S);
    end Position_If_Not;

    function Reduce(S : Sequence)
           return Element is 
      function F_Aux(X : Element; S : Sequence) return Element is
      begin
        return F(X, First(S));
      end F_Aux;
      pragma Inline(F_Aux);
      function Reduce_Aux 
        is new Algorithms.Accumulate(Element, F_Aux);
    begin
      if Is_End(S) then
        return Identity;
      end if;
      return Reduce_Aux(Next(S), First(S));
    end Reduce;

    function Reverse_Append(S1, S2 : Sequence)
           return Sequence is 
    begin
      return Algorithms.Reverse_Append(S1, S2);
    end Reverse_Append;

    function Reverse_Concatenate(S1, S2 : Sequence)
           return Sequence is 
    begin
      return Algorithms.Reverse_Concatenate(S1, S2);
    end Reverse_Concatenate;

    function Search(S1, S2 : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_Both(Test);
      function Search_Aux is new Algorithms.Search(Test_Aux);
    begin
      return Search_Aux(S1, S2);
    end Search;

    procedure Set_Nth(S : Sequence; Index : Integer; New_Item : Element) is 
    begin
      Set_First(Nth_Rest(Index, S), New_Item);
    end Set_Nth;

    function Some(S : Sequence)
           return Boolean is 
      function Test_Aux is new Make_Test_If(Test);
      function Some_Aux is new Algorithms.Some(Test_Aux);
    begin
      return Some_Aux(S);
    end Some;

    function Sort(S : Sequence)
           return Sequence is 
      function Test_Aux is new Make_Test_Both(Test);
      function Sort_Aux is new Algorithms.Sort(32, Nil, Test_Aux);
    begin
      return Sort_Aux(S);
    end Sort;

    function Subsequence(S : Sequence; Start, Stop : Integer)
           return Sequence is 
    begin
      return Copy_First_N(Nth_Rest(Start, S), Stop - Start);
    end Subsequence;

    function Substitute(New_Item, Old_Item : Element; S : Sequence)
           return Sequence is 
      procedure The_Procedure_Aux(S : Sequence) is
      begin
        if Test(Old_Item, First(S)) then
          Set_First(S, New_Item);
        end if;
      end The_Procedure_Aux;
      pragma Inline(The_Procedure_Aux);
      procedure Nsub_Aux 
        is new Algorithms.For_Each_Cell(The_Procedure_Aux);
    begin
      Nsub_Aux(S);
      return (S);
    end Substitute;

    function Substitute_Copy(New_Item, Old_Item : Element; S : Sequence)
           return Sequence is 
      function F_Aux(X : Element) return Element is
      begin
        if Test(Old_Item, X) then
          return New_Item;
        else
          return X;
        end if;
      end F_Aux;
      pragma Inline(F_Aux);
      function Subst_Aux is new Map_Copy(F_Aux);
    begin
      return Subst_Aux(S);
    end Substitute_Copy;

    function Substitute_Copy_If(New_Item : Element; S : Sequence)
           return Sequence is 
      function F_Aux(X : Element) return Element is
      begin
        if Test(X) then
          return New_Item;
        else
          return X;
        end if;
      end F_Aux;
      pragma Inline(F_Aux);
      function Subst_Aux is new Map_Copy(F_Aux);
    begin
      return Subst_Aux(S);
    end Substitute_Copy_If;

    function Substitute_Copy_If_Not(New_Item : Element; S : Sequence)
           return Sequence is 
      function F_Aux(X : Element) return Element is
      begin
        if Test(X) then
          return X;
        else
          return New_Item;
        end if;
      end F_Aux;
      pragma Inline(F_Aux);
      function Subst_Aux is new Map_Copy(F_Aux);
    begin
      return Subst_Aux(S);
    end Substitute_Copy_If_Not;

    function Substitute_If(New_Item : Element; S : Sequence)
           return Sequence is 
      procedure The_Procedure_Aux(S : Sequence) is
      begin
        if Test(First(S)) then
          Set_First(S, New_Item);
        end if;
      end The_Procedure_Aux;
      pragma Inline(The_Procedure_Aux);
      procedure Nsub_Aux 
        is new Algorithms.For_Each_Cell(The_Procedure_Aux);
    begin
      Nsub_Aux(S);
      return S;
    end Substitute_If;

    function Substitute_If_Not(New_Item : Element; S : Sequence)
           return Sequence is 
      procedure The_Procedure_Aux(S : Sequence) is
      begin
        if not Test(First(S)) then
          Set_First(S, New_Item);
        end if;
      end The_Procedure_Aux;
      pragma Inline(The_Procedure_Aux);
      procedure Nsub_Aux 
        is new Algorithms.For_Each_Cell(The_Procedure_Aux);
    begin
      Nsub_Aux(S);
      return S;
    end Substitute_If_Not;

 
  end Singly_Linked_Lists;
