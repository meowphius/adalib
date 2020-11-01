





  with Double_Ended_Lists_1; -- a PIP;
  package Integer_Double_Ended_Lists is 
     new Double_Ended_Lists_1(Integer);

  with Integer_Double_Ended_Lists, Text_Io, Examples_Help; 
  procedure Test_Del is
    use Integer_Double_Ended_Lists.Inner, Text_Io, Examples_Help; 
    Flag : Boolean := True;

    function Shuffle_Test(X, Y : Integer) return Boolean is
    begin
      Flag := not Flag;
      return Flag;
    end Shuffle_Test;

    procedure Iota(N : Integer; Result : in out Del) is
    begin
      for I in 0 .. N - 1 loop
        Add_Last(I, Result);
      end loop;
    end Iota;
 
    procedure Show_List(S : Del) is
      procedure Show_List_Aux is new For_Each(Print_Integer);
    begin
      Put("--:"); Show_List_Aux(S); New_Line;
    end Show_List;
 
begin




------ Test(s) for Add_Current
Show("------ Tests(s) for Add_Current");
Show("    declare");
Show("      Temp : Del;");
Show("    begin");
    declare
      Temp : Del;
    begin
Show("      Iota(3, Temp);");
      Iota(3, Temp);
Show("      Add_Current(5, Temp);");
      Add_Current(5, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  0  5  1  2 ");
--  0  5  1  2 
Show("      Add_Current(6, Temp);");
      Add_Current(6, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  0  6  5  1  2");
--  0  6  5  1  2
Show("    end;");
    end;

------ Test(s) for Add_First
Show("------ Tests(s) for Add_First");
Show("    declare");
Show("      Temp : Del;");
Show("    begin");
    declare
      Temp : Del;
    begin
Show("      Iota(3, Temp);");
      Iota(3, Temp);
Show("      Add_First(5, Temp);");
      Add_First(5, Temp);
Show("      Initialize(Temp);");
      Initialize(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  5  0  1  2 ");
--  5  0  1  2 
Show("    end;");
    end;

------ Test(s) for Add_Last
Show("------ Tests(s) for Add_Last");
Show("    declare");
Show("      Temp : Del;");
Show("    begin");
    declare
      Temp : Del;
    begin
Show("      Iota(3, Temp);");
      Iota(3, Temp);
Show("      Add_Last(5, Temp);");
      Add_Last(5, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  0  1  2  5 ");
--  0  1  2  5 
Show("    end;");
    end;

------ No test included for Advance

------ Test(s) for Concatenate
Show("------ Tests(s) for Concatenate");
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
    begin
Show("      Iota(5, Temp_1);");
      Iota(5, Temp_1);
Show("      Iota(6, Temp_2);");
      Iota(6, Temp_2);
Show("      Concatenate(Temp_1, Temp_2);");
      Concatenate(Temp_1, Temp_2);
Show("      Show_List(Temp_1);");
      Show_List(Temp_1);
Show("--  0  1  2  3  4  0  1  2  3  4  5 ");
--  0  1  2  3  4  0  1  2  3  4  5 
Show("    end;");
    end;
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
    begin
Show("      Iota(6, Temp_2);");
      Iota(6, Temp_2);
Show("      Concatenate(Temp_1, Temp_2);");
      Concatenate(Temp_1, Temp_2);
Show("      Show_List(Temp_1);");
      Show_List(Temp_1);
Show("--  0  1  2  3  4  5 ");
--  0  1  2  3  4  5 
Show("    end;");
    end;
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
    begin
Show("      Iota(5, Temp_1);");
      Iota(5, Temp_1);
Show("      Concatenate(Temp_1, Temp_2);");
      Concatenate(Temp_1, Temp_2);
Show("      Show_List(Temp_1);");
      Show_List(Temp_1);
Show("--  0  1  2  3  4 ");
--  0  1  2  3  4 
Show("    end;");
    end;

------ Test(s) for Copy_Sequence
Show("------ Tests(s) for Copy_Sequence");
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
    begin
Show("      Iota(3, Temp_1);");
      Iota(3, Temp_1);
Show("      Copy_Sequence(Temp_2, Temp_1);");
      Copy_Sequence(Temp_2, Temp_1);
Show("      Show_List(Temp_2);");
      Show_List(Temp_2);
Show("--  0  1  2 ");
--  0  1  2 
Show("    end;");
    end;

------ Test(s) for Count
Show("------ Tests(s) for Count");
Show("    declare");
Show("      Temp : Del;");
Show("      function Count_When_Divides is ");
Show("        new Integer_Double_Ended_Lists.Inner.Count(Test => Divides);");
Show("    begin");
    declare
      Temp : Del;
      function Count_When_Divides is 
        new Integer_Double_Ended_Lists.Inner.Count(Test => Divides);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Show_Integer(Count_When_Divides(3, Temp));");
      Show_Integer(Count_When_Divides(3, Temp));
Show("--  4");
--  4
Show("    end;");
    end;

------ Test(s) for Count_If
Show("------ Tests(s) for Count_If");
Show("    declare");
Show("      Temp : Del;");
Show("      function Count_If_Odd is new Count_If(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Count_If_Odd is new Count_If(Test => Odd);
    begin
Show("      Iota(9, Temp);");
      Iota(9, Temp);
Show("      Show_Integer(Count_If_Odd(Temp));");
      Show_Integer(Count_If_Odd(Temp));
Show("--  4");
--  4
Show("    end;");
    end;

------ Test(s) for Count_If_Not
Show("------ Tests(s) for Count_If_Not");
Show("    declare");
Show("      Temp : Del;");
Show("      function Count_If_Not_Odd is new Count_If_Not(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Count_If_Not_Odd is new Count_If_Not(Test => Odd);
    begin
Show("      Iota(9, Temp);");
      Iota(9, Temp);
Show("      Show_Integer(Count_If_Not_Odd(Temp));");
      Show_Integer(Count_If_Not_Odd(Temp));
Show("--  5");
--  5
Show("    end;");
    end;

------ No test included for Current

------ Test(s) for Delete
Show("------ Tests(s) for Delete");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Delete_When_Divides is ");
Show("        new Integer_Double_Ended_Lists.Inner.Delete(Test => Divides);");
Show("    begin");
    declare
      Temp : Del;
      procedure Delete_When_Divides is 
        new Integer_Double_Ended_Lists.Inner.Delete(Test => Divides);
    begin
Show("      Iota(15, Temp);");
      Iota(15, Temp);
Show("      Delete_When_Divides(3, Temp);");
      Delete_When_Divides(3, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  1  2  4  5  7  8  10  11  13  14 ");
--  1  2  4  5  7  8  10  11  13  14 
Show("    end;");
    end;

------ Test(s) for Delete_Duplicates
Show("------ Tests(s) for Delete_Duplicates");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Delete_Duplicates_When_Divides is ");
Show("          new Delete_Duplicates(Test=>Divides);");
Show("    begin");
    declare
      Temp : Del;
      procedure Delete_Duplicates_When_Divides is 
          new Delete_Duplicates(Test=>Divides);
    begin
Show("      Iota(20, Temp);");
      Iota(20, Temp);
Show("      Advance(Temp);");
      Advance(Temp);
Show("      Drop_Head(Temp);");
      Drop_Head(Temp);
Show("      Delete_Duplicates_When_Divides(Temp);");
      Delete_Duplicates_When_Divides(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  2  3  5  7  11  13  17  19 ");
--  2  3  5  7  11  13  17  19 
Show("    end;");
    end;

------ Test(s) for Delete_If
Show("------ Tests(s) for Delete_If");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Delete_If_Odd is new Delete_If(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      procedure Delete_If_Odd is new Delete_If(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Delete_If_Odd(Temp);");
      Delete_If_Odd(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  0  2  4  6  8 ");
--  0  2  4  6  8 
Show("    end;");
    end;

------ Test(s) for Delete_If_Not
Show("------ Tests(s) for Delete_If_Not");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      procedure Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Delete_If_Not_Odd(Temp);");
      Delete_If_Not_Odd(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  1  3  5  7  9 ");
--  1  3  5  7  9 
Show("    end;");
    end;

------ Test(s) for Drop_Head
Show("------ Tests(s) for Drop_Head");
Show("    declare");
Show("      Temp : Del;");
Show("    begin");
    declare
      Temp : Del;
    begin
Show("      Iota(4, Temp);");
      Iota(4, Temp);
Show("      Advance(Temp);");
      Advance(Temp);
Show("      Drop_Head(Temp);");
      Drop_Head(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  2  3 ");
--  2  3 
Show("    end;");
    end;

------ Test(s) for Drop_Tail
Show("------ Tests(s) for Drop_Tail");
Show("    declare");
Show("      Temp : Del;");
Show("    begin");
    declare
      Temp : Del;
    begin
Show("      Iota(4, Temp);");
      Iota(4, Temp);
Show("      Advance(Temp);");
      Advance(Temp);
Show("      Drop_Tail(Temp);");
      Drop_Tail(Temp);
Show("      Initialize(Temp);");
      Initialize(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  0  1 ");
--  0  1 
Show("    end;");
    end;

------ No test included for Equal

------ Test(s) for Every
Show("------ Tests(s) for Every");
Show("    declare");
Show("      Temp : Del;");
Show("      function Every_Odd is new Every(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Every_Odd is new Every(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Show_Boolean(Every_Odd(Temp));");
      Show_Boolean(Every_Odd(Temp));
Show("--  False");
--  False
Show("    end;");
    end;
Show("    declare");
Show("      Temp : Del;");
Show("      function Every_Odd is new Every(Test => Odd);");
Show("      procedure Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Every_Odd is new Every(Test => Odd);
      procedure Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Delete_If_Not_Odd(Temp);");
      Delete_If_Not_Odd(Temp);
Show("      Show_Boolean(Every_Odd(Temp));");
      Show_Boolean(Every_Odd(Temp));
Show("--  True");
--  True
Show("    end;");
    end;

------ Test(s) for Find
Show("------ Tests(s) for Find");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Find_When_Greater is new Find(Test => ""<""); ");
Show("    begin");
    declare
      Temp : Del;
      procedure Find_When_Greater is new Find(Test => "<"); 
    begin
Show("      Iota(20, Temp);");
      Iota(20, Temp);
Show("      Find_When_Greater(9, Temp);");
      Find_When_Greater(9, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  10  11  12  13  14  15  16  17  18  19 ");
--  10  11  12  13  14  15  16  17  18  19 
Show("    end;");
    end;

------ Test(s) for Find_If
Show("------ Tests(s) for Find_If");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Find_If_Greater_Than_7 is ");
Show("         new Find_If(Test => Greater_Than_7);");
Show("    begin");
    declare
      Temp : Del;
      procedure Find_If_Greater_Than_7 is 
         new Find_If(Test => Greater_Than_7);
    begin
Show("      Iota(15, Temp);");
      Iota(15, Temp);
Show("      Find_If_Greater_Than_7(Temp);");
      Find_If_Greater_Than_7(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  8  9  10  11  12  13  14 ");
--  8  9  10  11  12  13  14 
Show("    end;");
    end;

------ Test(s) for Find_If_Not
Show("------ Tests(s) for Find_If_Not");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Find_If_Not_Greater_Than_7 is ");
Show("          new Find_If_Not(Test => Greater_Than_7);");
Show("    begin");
    declare
      Temp : Del;
      procedure Find_If_Not_Greater_Than_7 is 
          new Find_If_Not(Test => Greater_Than_7);
    begin
Show("      Iota(15, Temp);");
      Iota(15, Temp);
Show("      Invert(Temp);");
      Invert(Temp);
Show("      Initialize(Temp);");
      Initialize(Temp);
Show("      Find_If_Not_Greater_Than_7(Temp);");
      Find_If_Not_Greater_Than_7(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  7  6  5  4  3  2  1  0 ");
--  7  6  5  4  3  2  1  0 
Show("    end;");
    end;

------ No test included for First

------ No test included for For_Each

------ No test included for For_Each_2

------ No test included for Free

------ No test included for Initialize

------ Test(s) for Invert
Show("------ Tests(s) for Invert");
Show("    declare");
Show("      Temp : Del;");
Show("    begin");
    declare
      Temp : Del;
    begin
Show("      Iota(6, Temp);");
      Iota(6, Temp);
Show("      Invert(Temp);");
      Invert(Temp);
Show("      Initialize(Temp);");
      Initialize(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  5  4  3  2  1  0 ");
--  5  4  3  2  1  0 
Show("    end;");
    end;
Show("    declare");
Show("      Temp : Del;");
Show("    begin");
    declare
      Temp : Del;
    begin
Show("      Invert(Temp);");
      Invert(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--");
--
Show("    end;");
    end;

------ No test included for Is_Empty

------ No test included for Is_End

------ No test included for Last

------ No test included for Length

------ Test(s) for Map
Show("------ Tests(s) for Map");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Map_Square is new Map(F => Square);");
Show("    begin");
    declare
      Temp : Del;
      procedure Map_Square is new Map(F => Square);
    begin
Show("      Iota(5, Temp);");
      Iota(5, Temp);
Show("      Map_Square(Temp);");
      Map_Square(Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  0  1  4  9  16 ");
--  0  1  4  9  16 
Show("    end;");
    end;

------ Test(s) for Map_2
Show("------ Tests(s) for Map_2");
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("      procedure Map_2_Times is new Map_2(F => ""*"");");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
      procedure Map_2_Times is new Map_2(F => "*");
    begin
Show("      Iota(5, Temp_1);");
      Iota(5, Temp_1);
Show("      Iota(5, Temp_2);");
      Iota(5, Temp_2);
Show("      Invert(Temp_2);");
      Invert(Temp_2);
Show("      Initialize(Temp_2);");
      Initialize(Temp_2);
Show("      Map_2_Times(Temp_1, Temp_2);");
      Map_2_Times(Temp_1, Temp_2);
Show("      Show_List(Temp_1);");
      Show_List(Temp_1);
Show("--  0  3  4  3  0 ");
--  0  3  4  3  0 
Show("    end;");
    end;

------ Test(s) for Merge
Show("------ Tests(s) for Merge");
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("      procedure Shuffle_Merge is new Merge(Test => Shuffle_Test);");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
      procedure Shuffle_Merge is new Merge(Test => Shuffle_Test);
    begin
Show("      Iota(5, Temp_1);");
      Iota(5, Temp_1);
Show("      Iota(5, Temp_2);");
      Iota(5, Temp_2);
Show("      Invert(Temp_2);");
      Invert(Temp_2);
Show("      Initialize(Temp_2);");
      Initialize(Temp_2);
Show("      Shuffle_Merge(Temp_1, Temp_2);");
      Shuffle_Merge(Temp_1, Temp_2);
Show("      Show_List(Temp_1);");
      Show_List(Temp_1);
Show("--  0  4  1  3  2  2  3  1  4  0 ");
--  0  4  1  3  2  2  3  1  4  0 
Show("    end;");
    end;

------ No test included for Mismatch

------ Test(s) for Not_Any
Show("------ Tests(s) for Not_Any");
Show("    declare");
Show("      Temp : Del;");
Show("      function Not_Any_Odd is new Not_Any(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Not_Any_Odd is new Not_Any(Test => Odd);
    begin
Show("     Iota(10, Temp);");
     Iota(10, Temp);
Show("      Show_Boolean(Not_Any_Odd(Temp));");
      Show_Boolean(Not_Any_Odd(Temp));
Show("--  False");
--  False
Show("    end;");
    end;
Show("    declare");
Show("      Temp : Del;");
Show("      function Not_Any_Odd is new Not_Any(Test => Odd);");
Show("      procedure Delete_If_Odd is new Delete_If(Test => Odd);");
Show("   begin");
    declare
      Temp : Del;
      function Not_Any_Odd is new Not_Any(Test => Odd);
      procedure Delete_If_Odd is new Delete_If(Test => Odd);
   begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Delete_If_Odd(Temp);");
      Delete_If_Odd(Temp);
Show("      Show_Boolean(Not_Any_Odd(Temp));");
      Show_Boolean(Not_Any_Odd(Temp));
Show("--  True");
--  True
Show("    end;");
    end;

------ Test(s) for Not_Every
Show("------ Tests(s) for Not_Every");
Show("    declare");
Show("      Temp : Del;");
Show("      function Not_Every_Odd is new Not_Every(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Not_Every_Odd is new Not_Every(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Show_Boolean(Not_Every_Odd(Temp));");
      Show_Boolean(Not_Every_Odd(Temp));
Show("--  True");
--  True
Show("    end;");
    end;
Show("    declare");
Show("      Temp : Del;");
Show("      function Not_Every_Odd is new Not_Every(Test => Odd);");
Show("      procedure Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Not_Every_Odd is new Not_Every(Test => Odd);
      procedure Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Delete_If_Not_Odd(Temp);");
      Delete_If_Not_Odd(Temp);
Show("      Show_Boolean(Not_Every_Odd(Temp));");
      Show_Boolean(Not_Every_Odd(Temp));
Show("--  False");
--  False
Show("    end;");
    end;

------ Test(s) for Reduce
Show("------ Tests(s) for Reduce");
Show("    declare");
Show("      Temp : Del;");
Show("      function Reduce_Times is new Reduce(Identity => 1, F => ""*"");");
Show("    begin");
    declare
      Temp : Del;
      function Reduce_Times is new Reduce(Identity => 1, F => "*");
    begin
Show("      Iota(5, Temp);");
      Iota(5, Temp);
Show("      Advance(Temp);");
      Advance(Temp);
Show("      Show_Integer(Reduce_Times(Temp));");
      Show_Integer(Reduce_Times(Temp));
Show("--  24");
--  24
Show("    end;");
    end;
Show("    declare");
Show("      Temp : Del;");
Show("      function Reduce_Plus is new Reduce(Identity => 0, F => ""+"");");
Show("    begin");
    declare
      Temp : Del;
      function Reduce_Plus is new Reduce(Identity => 0, F => "+");
    begin
Show("      Iota(100, Temp);");
      Iota(100, Temp);
Show("      Show_Integer(Reduce_Plus(Temp));");
      Show_Integer(Reduce_Plus(Temp));
Show("--  4950");
--  4950
Show("    end;");
    end;

------ Test(s) for Search
Show("------ Tests(s) for Search");
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("      procedure Search_Equal is new Search(Test => ""="");");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
      procedure Search_Equal is new Search(Test => "=");
    begin
Show("      Add_Last(7, Temp_1);");
      Add_Last(7, Temp_1);
Show("      Add_Last(8, Temp_1);");
      Add_Last(8, Temp_1);
Show("      Add_Last(9, Temp_1);");
      Add_Last(9, Temp_1);
Show("      Iota(12, Temp_2);");
      Iota(12, Temp_2);
Show("      Search_Equal(Temp_1, Temp_2);");
      Search_Equal(Temp_1, Temp_2);
Show("      Show_List(Temp_2);");
      Show_List(Temp_2);
Show("--  7  8  9  10  11 ");
--  7  8  9  10  11 
Show("    end;");
    end;

------ No test included for Set_Current

------ No test included for Set_First

------ No test included for Set_Last

------ Test(s) for Some
Show("------ Tests(s) for Some");
Show("    declare");
Show("      Temp : Del;");
Show("      function Some_Odd is new Some(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Some_Odd is new Some(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Show_Boolean(Some_Odd(Temp));");
      Show_Boolean(Some_Odd(Temp));
Show("--  True");
--  True
Show("    end;");
    end;
Show("    declare");
Show("      Temp : Del;");
Show("      function Some_Odd is new Some(Test => Odd);");
Show("      procedure Delete_If_Odd is new Delete_If(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      function Some_Odd is new Some(Test => Odd);
      procedure Delete_If_Odd is new Delete_If(Test => Odd);
    begin
Show("      Iota(10, Temp);");
      Iota(10, Temp);
Show("      Delete_If_Odd(Temp);");
      Delete_If_Odd(Temp);
Show("      Show_Boolean(Some_Odd(Temp));");
      Show_Boolean(Some_Odd(Temp));
Show("--  False");
--  False
Show("    end;");
    end;

------ Test(s) for Sort
Show("------ Tests(s) for Sort");
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("      procedure Sort_Ascending is new Sort(Test => ""<"");");
Show("      procedure Shuffle_Merge is new Merge(Test => Shuffle_Test);");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
      procedure Sort_Ascending is new Sort(Test => "<");
      procedure Shuffle_Merge is new Merge(Test => Shuffle_Test);
    begin
Show("      Iota(5, Temp_1);");
      Iota(5, Temp_1);
Show("      Iota(5, Temp_2);");
      Iota(5, Temp_2);
Show("      Invert(Temp_2);");
      Invert(Temp_2);
Show("      Initialize(Temp_2);");
      Initialize(Temp_2);
Show("      Shuffle_Merge(Temp_1, Temp_2);");
      Shuffle_Merge(Temp_1, Temp_2);
Show("      Sort_Ascending(Temp_1);");
      Sort_Ascending(Temp_1);
Show("      Show_List(Temp_1);");
      Show_List(Temp_1);
Show("--  0  0  1  1  2  2  3  3  4  4 ");
--  0  0  1  1  2  2  3  3  4  4 
Show("    end;");
    end;

------ Test(s) for Split
Show("------ Tests(s) for Split");
Show("    declare");
Show("      Temp_1, Temp_2 : Del;");
Show("    begin");
    declare
      Temp_1, Temp_2 : Del;
    begin
Show("      Iota(4, Temp_1);");
      Iota(4, Temp_1);
Show("      Advance(Temp_1);");
      Advance(Temp_1);
Show("      Split(Temp_1, Temp_2);");
      Split(Temp_1, Temp_2);
Show("      Initialize(Temp_1);");
      Initialize(Temp_1);
Show("      Show_List(Temp_2);");
      Show_List(Temp_2);
Show("--  2  3 ");
--  2  3 
Show("      Show_List(Temp_1);");
      Show_List(Temp_1);
Show("--  0  1 ");
--  0  1 
Show("    end;");
    end;

------ Test(s) for Substitute
Show("------ Tests(s) for Substitute");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Substitute_When_Divides is ");
Show("         new Substitute(Test => Divides);");
Show("    begin");
    declare
      Temp : Del;
      procedure Substitute_When_Divides is 
         new Substitute(Test => Divides);
    begin
Show("      Iota(15, Temp);");
      Iota(15, Temp);
Show("      Substitute_When_Divides(-1, 3, Temp);");
      Substitute_When_Divides(-1, 3, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("-- -1  1  2 -1  4  5 -1  7  8 -1  10  11 -1  13  14 ");
-- -1  1  2 -1  4  5 -1  7  8 -1  10  11 -1  13  14 
Show("    end;");
    end;

------ Test(s) for Substitute_If
Show("------ Tests(s) for Substitute_If");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Substitute_If_Odd is new Substitute_If(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      procedure Substitute_If_Odd is new Substitute_If(Test => Odd);
    begin
Show("      Iota(15, Temp);");
      Iota(15, Temp);
Show("      Substitute_If_Odd(-1, Temp);");
      Substitute_If_Odd(-1, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("--  0 -1  2 -1  4 -1  6 -1  8 -1  10 -1  12 -1  14 ");
--  0 -1  2 -1  4 -1  6 -1  8 -1  10 -1  12 -1  14 
Show("    end;");
    end;

------ Test(s) for Substitute_If_Not
Show("------ Tests(s) for Substitute_If_Not");
Show("    declare");
Show("      Temp : Del;");
Show("      procedure Substitute_If_Not_Odd is ");
Show("         new Substitute_If_Not(Test => Odd);");
Show("    begin");
    declare
      Temp : Del;
      procedure Substitute_If_Not_Odd is 
         new Substitute_If_Not(Test => Odd);
    begin
Show("      Iota(15, Temp);");
      Iota(15, Temp);
Show("      Substitute_If_Not_Odd(-1, Temp);");
      Substitute_If_Not_Odd(-1, Temp);
Show("      Show_List(Temp);");
      Show_List(Temp);
Show("-- -1  1 -1  3 -1  5 -1  7 -1  9 -1  11 -1  13 -1 ");
-- -1  1 -1  3 -1  5 -1  7 -1  9 -1  11 -1  13 -1 
Show("    end;");
    end;


    Show("End Of Tests");
end;
