





                         with Auto_Reallocating_Singly_Linked_Lists;
  package Integer_Linked_Lists is new 
    Auto_Reallocating_Singly_Linked_Lists(1000, 1, 1.5, Integer);

                     with Integer_Linked_Lists, Text_Io, Examples_Help;
  procedure Examples is
    use Integer_Linked_Lists.Inner, Text_Io, Examples_Help;
    Flag : Boolean := True;  -- used in Shuffle_Test

    function Shuffle_Test(X, Y : Integer) return Boolean is
      -- used in examples of Sort and Merge subprograms to
      -- produce merge with every-other-one interleaving;
      -- ignores X and Y
    begin
      Flag := not Flag;
      return Flag;
    end Shuffle_Test;

    function Iota(N : Integer) return Sequence is
      -- returns a sequence of the integers 0, 1, . . . , N - 1
      Result : Sequence := Nil;
    begin
      for I in reverse 0 .. N - 1 loop
        Result := Construct(I, Result);
      end loop;
      return Result;
    end Iota;
 
    procedure Show_List(S : Sequence) is
      -- prints the sequence S on a line beginning with --:
      -- using Print_Integer from Examples_Help
      procedure Show_List_Aux is new For_Each(Print_Integer);
    begin
      Put("--:"); Show_List_Aux(S); New_Line;
    end Show_List;

  begin



------ Test(s) for Append
Show("------ Tests(s) for Append");
Show("");

Show("Show_List(Append(Iota(5), Iota(6)));");
Show_List(Append(Iota(5), Iota(6)));
Show("--  0  1  2  3  4  0  1  2  3  4  5");
--  0  1  2  3  4  0  1  2  3  4  5
Show("Show_List(Append(Nil, Iota(6)));");
Show_List(Append(Nil, Iota(6)));
Show("--  0  1  2  3  4  5 ");
--  0  1  2  3  4  5 
Show("Show_List(Append(Iota(5), Nil));");
Show_List(Append(Iota(5), Nil));
Show("--  0  1  2  3  4 ");
--  0  1  2  3  4 

------ Test(s) for Butlast
Show("------ Tests(s) for Butlast");
Show("");

Show("Show_List(Butlast(Iota(5)));");
Show_List(Butlast(Iota(5)));
Show("--  0  1  2  3 ");
--  0  1  2  3 
Show("Show_List(Butlast(Iota(5), 3));");
Show_List(Butlast(Iota(5), 3));
Show("--  0  1 ");
--  0  1 
Show("Show_List(Butlast(Iota(5), 5));");
Show_List(Butlast(Iota(5), 5));
Show("--");
--

------ Test(s) for Butlast_Copy
Show("------ Tests(s) for Butlast_Copy");
Show("");

Show("Show_List(Butlast_Copy(Iota(5)));");
Show_List(Butlast_Copy(Iota(5)));
Show("--  0  1  2  3 ");
--  0  1  2  3 
Show("Show_List(Butlast_Copy(Iota(5), 3));");
Show_List(Butlast_Copy(Iota(5), 3));
Show("--  0  1 ");
--  0  1 
Show("Show_List(Butlast_Copy(Iota(5), 5));");
Show_List(Butlast_Copy(Iota(5), 5));
Show("--");
--

------ Test(s) for Concatenate
Show("------ Tests(s) for Concatenate");
Show("");

Show("Show_List(Concatenate(Iota(5), Iota(6)));");
Show_List(Concatenate(Iota(5), Iota(6)));
Show("--  0  1  2  3  4  0  1  2  3  4  5 ");
--  0  1  2  3  4  0  1  2  3  4  5 
Show("Show_List(Concatenate(Nil, Iota(6)));");
Show_List(Concatenate(Nil, Iota(6)));
Show("--  0  1  2  3  4  5 ");
--  0  1  2  3  4  5 
Show("Show_List(Concatenate(Iota(5), Nil));");
Show_List(Concatenate(Iota(5), Nil));
Show("--  0  1  2  3  4 ");
--  0  1  2  3  4 

------ No test included for Concatenate_Copy

------ No test included for Construct

------ No test included for Copy_First_N

------ No test included for Copy_Sequence

------ Test(s) for Count
Show("------ Tests(s) for Count");
Show(" declare");
Show("   function Count_When_Divides is ");
Show("     new Integer_Linked_Lists.Inner.Count(Test => Divides);");
Show(" begin");
 declare
   function Count_When_Divides is 
     new Integer_Linked_Lists.Inner.Count(Test => Divides);
 begin
Show("   Show_Integer(Count_When_Divides(3, Iota(10))); ");
   Show_Integer(Count_When_Divides(3, Iota(10))); 
Show("--  4 ");
--  4 
Show(" end;");
 end;

------ Test(s) for Count_If
Show("------ Tests(s) for Count_If");
Show(" declare");
Show("    function Count_If_Odd is new Count_If(Test => Odd);");
Show(" begin");
 declare
    function Count_If_Odd is new Count_If(Test => Odd);
 begin
Show("   Show_Integer(Count_If_Odd(Iota(9))); ");
   Show_Integer(Count_If_Odd(Iota(9))); 
Show("--  4 ");
--  4 
Show(" end;");
 end;

------ Test(s) for Count_If_Not
Show("------ Tests(s) for Count_If_Not");
Show(" declare");
Show("    function Count_If_Not_Odd is new Count_If_Not(Test => Odd);");
Show(" begin");
 declare
    function Count_If_Not_Odd is new Count_If_Not(Test => Odd);
 begin
Show("   Show_Integer(Count_If_Not_Odd(Iota(9))); ");
   Show_Integer(Count_If_Not_Odd(Iota(9))); 
Show("--  5 ");
--  5 
Show(" end;");
 end;

------ Test(s) for Delete
Show("------ Tests(s) for Delete");
Show(" declare");
Show("     function Delete_When_Divides ");
Show("        is new Integer_Linked_Lists.Inner.Delete(Test => Divides);");
Show(" begin");
 declare
     function Delete_When_Divides 
        is new Integer_Linked_Lists.Inner.Delete(Test => Divides);
 begin
Show("    Show_List(Delete_When_Divides(3, Iota(15)));");
    Show_List(Delete_When_Divides(3, Iota(15)));
Show("--  1  2  4  5  7  8  10  11  13  14");
--  1  2  4  5  7  8  10  11  13  14
Show(" end;");
 end;

------ Test(s) for Delete_Copy
Show("------ Tests(s) for Delete_Copy");
Show(" declare");
Show("   function Delete_Copy_When_Divides ");
Show("     is new Integer_Linked_Lists.Inner.Delete_Copy(Test => Divides);");
Show(" begin");
 declare
   function Delete_Copy_When_Divides 
     is new Integer_Linked_Lists.Inner.Delete_Copy(Test => Divides);
 begin
Show("    Show_List(Delete_Copy_When_Divides(3, Iota(15)));");
    Show_List(Delete_Copy_When_Divides(3, Iota(15)));
Show("--  1  2  4  5  7  8  10  11  13  14 ");
--  1  2  4  5  7  8  10  11  13  14 
Show(" end;");
 end;

------ Test(s) for Delete_Copy_Duplicates
Show("------ Tests(s) for Delete_Copy_Duplicates");
Show(" declare");
Show("    function Delete_Copy_Duplicates_When_Divides ");
Show("      is new Delete_Copy_Duplicates(Test=>Divides);");
Show(" begin");
 declare
    function Delete_Copy_Duplicates_When_Divides 
      is new Delete_Copy_Duplicates(Test=>Divides);
 begin
Show("   Show_List(Delete_Copy_Duplicates_When_Divides(Next(Next(Iota(20)))));");
   Show_List(Delete_Copy_Duplicates_When_Divides(Next(Next(Iota(20)))));
Show("--  2  3  5  7  11  13  17  19");
--  2  3  5  7  11  13  17  19
Show(" end;");
 end;

------ Test(s) for Delete_Copy_If
Show("------ Tests(s) for Delete_Copy_If");
Show(" declare");
Show("      function Delete_Copy_If_Odd is new Delete_Copy_If(Test => Odd);");
Show(" begin");
 declare
      function Delete_Copy_If_Odd is new Delete_Copy_If(Test => Odd);
 begin
Show("    Show_List(Delete_Copy_If_Odd(Iota(10)));");
    Show_List(Delete_Copy_If_Odd(Iota(10)));
Show("--  0  2  4  6  8");
--  0  2  4  6  8
Show(" end;");
 end;

------ Test(s) for Delete_Copy_If_Not
Show("------ Tests(s) for Delete_Copy_If_Not");
Show(" declare");
Show("     function Delete_Copy_If_Not_Odd is new Delete_Copy_If_Not(Test => Odd);");
Show(" begin");
 declare
     function Delete_Copy_If_Not_Odd is new Delete_Copy_If_Not(Test => Odd);
 begin
Show("    Show_List(Delete_Copy_If_Not_Odd(Iota(10)));");
    Show_List(Delete_Copy_If_Not_Odd(Iota(10)));
Show("--  1  3  5  7  9");
--  1  3  5  7  9
Show(" end;");
 end;

------ Test(s) for Delete_Duplicates
Show("------ Tests(s) for Delete_Duplicates");
Show(" declare");
Show("      function Delete_Duplicates_When_Divides is ");
Show("         new Delete_Duplicates(Test=>Divides);");
Show(" begin");
 declare
      function Delete_Duplicates_When_Divides is 
         new Delete_Duplicates(Test=>Divides);
 begin
Show("    Show_List(Delete_Duplicates_When_Divides(Next(Next(Iota(20)))));");
    Show_List(Delete_Duplicates_When_Divides(Next(Next(Iota(20)))));
Show("--  2  3  5  7  11  13  17  19");
--  2  3  5  7  11  13  17  19
Show(" end;");
 end;

------ Test(s) for Delete_If
Show("------ Tests(s) for Delete_If");
Show(" declare");
Show("        function Delete_If_Odd is new Delete_If(Test => Odd);");
Show(" begin");
 declare
        function Delete_If_Odd is new Delete_If(Test => Odd);
 begin
Show("    Show_List(Delete_If_Odd(Iota(10)));");
    Show_List(Delete_If_Odd(Iota(10)));
Show("--  0  2  4  6  8");
--  0  2  4  6  8
Show(" end;");
 end;

------ Test(s) for Delete_If_Not
Show("------ Tests(s) for Delete_If_Not");
Show(" declare");
Show("        function Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);");
Show(" begin");
 declare
        function Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);
 begin
Show("    Show_List(Delete_If_Not_Odd(Iota(10)));");
    Show_List(Delete_If_Not_Odd(Iota(10)));
Show("--  1  3  5  7  9");
--  1  3  5  7  9
Show(" end;");
 end;

------ Test(s) for Equal
Show("------ Tests(s) for Equal");
Show(" declare");
Show("      function Equal_Equal is new Equal(Test => ""="");");
Show(" begin");
 declare
      function Equal_Equal is new Equal(Test => "=");
 begin
Show("    Show_Boolean(Equal_Equal(Iota(10),Iota(10)));");
    Show_Boolean(Equal_Equal(Iota(10),Iota(10)));
Show("--True");
--True
Show("    Show_Boolean(Equal_Equal(Iota(10),Iota(11)));");
    Show_Boolean(Equal_Equal(Iota(10),Iota(11)));
Show("--False");
--False
Show("    Show_Boolean(Equal_Equal(Invert(Iota(10)),Iota(10)));");
    Show_Boolean(Equal_Equal(Invert(Iota(10)),Iota(10)));
Show("--False");
--False
Show("    Show_Boolean(Equal_Equal(Iota(10),Nil));");
    Show_Boolean(Equal_Equal(Iota(10),Nil));
Show("--False");
--False
Show("    Show_Boolean(Equal_Equal(Nil,Iota(10)));");
    Show_Boolean(Equal_Equal(Nil,Iota(10)));
Show("--False");
--False
Show("    Show_Boolean(Equal_Equal(Nil,Nil));");
    Show_Boolean(Equal_Equal(Nil,Nil));
Show("--True");
--True
Show(" end;");
 end;

------ Test(s) for Every
Show("------ Tests(s) for Every");
Show(" declare");
Show("     function Every_Odd is new Every(Test => Odd);");
Show("     function Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);");
Show("  begin");
 declare
     function Every_Odd is new Every(Test => Odd);
     function Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);
  begin
Show("    Show_Boolean(Every_Odd(Iota(10)));");
    Show_Boolean(Every_Odd(Iota(10)));
Show("--False");
--False
Show("    Show_Boolean(Every_Odd(Delete_If_Not_Odd(Iota(10))));");
    Show_Boolean(Every_Odd(Delete_If_Not_Odd(Iota(10))));
Show("--True");
--True
Show(" end;");
 end;

------ Test(s) for Find
Show("------ Tests(s) for Find");
Show(" declare");
Show("     function Find_When_Greater is new Find(Test => ""<"");");
Show(" begin");
 declare
     function Find_When_Greater is new Find(Test => "<");
 begin
Show("    Show_List(Find_When_Greater(9, Iota(20)));");
    Show_List(Find_When_Greater(9, Iota(20)));
Show("--  10  11  12  13  14  15  16  17  18  19");
--  10  11  12  13  14  15  16  17  18  19
Show(" end;");
 end;

------ Test(s) for Find_If
Show("------ Tests(s) for Find_If");
Show(" declare");
Show("     function Find_If_Greater_Than_7 ");
Show("       is new Find_If(Test => Greater_Than_7);");
Show(" begin");
 declare
     function Find_If_Greater_Than_7 
       is new Find_If(Test => Greater_Than_7);
 begin
Show("    Show_List(Find_If_Greater_Than_7(Iota (15)));");
    Show_List(Find_If_Greater_Than_7(Iota (15)));
Show("--  8  9  10  11  12  13  14");
--  8  9  10  11  12  13  14
Show(" end;");
 end;

------ Test(s) for Find_If_Not
Show("------ Tests(s) for Find_If_Not");
Show(" declare");
Show("     function Find_If_Not_Greater_Than_7 ");
Show("       is new Find_If_Not(Test => Greater_Than_7);");
Show(" begin");
 declare
     function Find_If_Not_Greater_Than_7 
       is new Find_If_Not(Test => Greater_Than_7);
 begin
Show("    Show_List(Find_If_Not_Greater_Than_7(Invert(Iota (15))));");
    Show_List(Find_If_Not_Greater_Than_7(Invert(Iota (15))));
Show("--  7  6  5  4  3  2  1  0");
--  7  6  5  4  3  2  1  0
Show(" end;");
 end;

------ No test included for First

------ No test included for For_Each

------ No test included for For_Each_Cell

------ No test included for For_Each_2

------ No test included for For_Each_Cell_2

------ No test included for Free

------ No test included for Free_Sequence

------ Test(s) for Invert
Show("------ Tests(s) for Invert");
Show("");

Show("    Show_List(Invert(Iota(6)));");
    Show_List(Invert(Iota(6)));
Show("--  5  4  3  2  1  0 ");
--  5  4  3  2  1  0 

------ Test(s) for Invert_Copy
Show("------ Tests(s) for Invert_Copy");
Show("");

Show("    Show_List(Invert_Copy(Iota(6)));");
    Show_List(Invert_Copy(Iota(6)));
Show("--  5  4  3  2  1  0 ");
--  5  4  3  2  1  0 

------ No test included for Is_End

------ No test included for Is_Not_End

------ Test(s) for Last
Show("------ Tests(s) for Last");
Show("");

Show("    Show_List(Last(Iota(6)));");
    Show_List(Last(Iota(6)));
Show("--  5 ");
--  5 

------ No test included for Length

------ Test(s) for Make_Sequence
Show("------ Tests(s) for Make_Sequence");
Show("");

Show("    Show_List(Make_Sequence(5, 9));");
    Show_List(Make_Sequence(5, 9));
Show("--  9  9  9  9  9 ");
--  9  9  9  9  9 

------ Test(s) for Map
Show("------ Tests(s) for Map");
Show(" declare");
Show("        function Map_Square is new Map(F => Square);");
Show(" begin");
 declare
        function Map_Square is new Map(F => Square);
 begin
Show("    Show_List(Map_Square(Iota(5)));");
    Show_List(Map_Square(Iota(5)));
Show("--  0  1  4  9  16");
--  0  1  4  9  16
Show(" end;");
 end;

------ Test(s) for Map_2
Show("------ Tests(s) for Map_2");
Show(" declare");
Show("        function Map_2_Times is new Map_2(F => ""*"");");
Show(" begin");
 declare
        function Map_2_Times is new Map_2(F => "*");
 begin
Show("    Show_List(Map_2_Times(Iota(5), Invert(Iota(5))));");
    Show_List(Map_2_Times(Iota(5), Invert(Iota(5))));
Show("--  0  3  4  3  0");
--  0  3  4  3  0
Show(" end;");
 end;

------ Test(s) for Map_Copy
Show("------ Tests(s) for Map_Copy");
Show(" declare");
Show("        function Map_Copy_Square is new Map_Copy(F => Square);");
Show(" begin");
 declare
        function Map_Copy_Square is new Map_Copy(F => Square);
 begin
Show("    Show_List(Map_Copy_Square(Iota(5)));");
    Show_List(Map_Copy_Square(Iota(5)));
Show("--  0  1  4  9  16");
--  0  1  4  9  16
Show(" end;");
 end;

------ Test(s) for Map_Copy_2
Show("------ Tests(s) for Map_Copy_2");
Show(" declare");
Show("        function Map_Copy_2_Times is new Map_Copy_2(F => ""*"");");
Show(" begin");
 declare
        function Map_Copy_2_Times is new Map_Copy_2(F => "*");
 begin
Show("    Show_List(Map_Copy_2_Times(Iota(5), Invert(Iota(5))));");
    Show_List(Map_Copy_2_Times(Iota(5), Invert(Iota(5))));
Show("--  0  3  4  3  0");
--  0  3  4  3  0
Show(" end;");
 end;

------ No test included for Merge

------ Test(s) for Mismatch
Show("------ Tests(s) for Mismatch");
Show(" declare");
Show("     Temp_1, Temp_2 : Sequence;");
Show("     procedure Mismatch_Equal is new Mismatch(Test => ""="");");
Show(" begin");
 declare
     Temp_1, Temp_2 : Sequence;
     procedure Mismatch_Equal is new Mismatch(Test => "=");
 begin
Show("Mismatch_Equal(Iota(10),Iota(10), Temp_1, Temp_2); ");
Mismatch_Equal(Iota(10),Iota(10), Temp_1, Temp_2); 
Show("    Show_List(Temp_1); Show_List(Temp_2);");
    Show_List(Temp_1); Show_List(Temp_2);
Show("--");
--
Show("--");
--
Show("    Mismatch_Equal(Iota(10),Iota(11), Temp_1, Temp_2); ");
    Mismatch_Equal(Iota(10),Iota(11), Temp_1, Temp_2); 
Show("    Show_List(Temp_1); Show_List(Temp_2);");
    Show_List(Temp_1); Show_List(Temp_2);
Show("--");
--
Show("--  10 ");
--  10 
Show("    Mismatch_Equal(Invert(Iota(10)),Iota(10), Temp_1, Temp_2); ");
    Mismatch_Equal(Invert(Iota(10)),Iota(10), Temp_1, Temp_2); 
Show("    Show_List(Temp_1); Show_List(Temp_2);");
    Show_List(Temp_1); Show_List(Temp_2);
Show("--  9  8  7  6  5  4  3  2  1  0 ");
--  9  8  7  6  5  4  3  2  1  0 
Show("--  0  1  2  3  4  5  6  7  8  9 ");
--  0  1  2  3  4  5  6  7  8  9 
Show("    Mismatch_Equal(Iota(10),Nil, Temp_1, Temp_2); ");
    Mismatch_Equal(Iota(10),Nil, Temp_1, Temp_2); 
Show("    Show_List(Temp_1); Show_List(Temp_2);");
    Show_List(Temp_1); Show_List(Temp_2);
Show("--  0  1  2  3  4  5  6  7  8  9 ");
--  0  1  2  3  4  5  6  7  8  9 
Show("--");
--
Show("    Mismatch_Equal(Nil,Iota(10), Temp_1, Temp_2); ");
    Mismatch_Equal(Nil,Iota(10), Temp_1, Temp_2); 
Show("    Show_List(Temp_1); Show_List(Temp_2);");
    Show_List(Temp_1); Show_List(Temp_2);
Show("--");
--
Show("--  0  1  2  3  4  5  6  7  8  9 ");
--  0  1  2  3  4  5  6  7  8  9 
Show("    Mismatch_Equal(Nil,Nil, Temp_1, Temp_2); ");
    Mismatch_Equal(Nil,Nil, Temp_1, Temp_2); 
Show("    Show_List(Temp_1); Show_List(Temp_2);");
    Show_List(Temp_1); Show_List(Temp_2);
Show("--");
--
Show("--");
--
Show(" end;");
 end;

------ No test included for Next

------ Test(s) for Not_Any
Show("------ Tests(s) for Not_Any");
Show(" declare");
Show("      function Not_Any_Odd is new Not_Any(Test => Odd);");
Show("      function Delete_If_Odd is new Delete_If(Test => Odd);");
Show(" begin");
 declare
      function Not_Any_Odd is new Not_Any(Test => Odd);
      function Delete_If_Odd is new Delete_If(Test => Odd);
 begin
Show("    Show_Boolean(Not_Any_Odd(Iota(10)));");
    Show_Boolean(Not_Any_Odd(Iota(10)));
Show("--False");
--False
Show("    Show_Boolean(Not_Any_Odd(Delete_If_Odd(Iota(10))));");
    Show_Boolean(Not_Any_Odd(Delete_If_Odd(Iota(10))));
Show("--True");
--True
Show(" end;");
 end;

------ Test(s) for Not_Every
Show("------ Tests(s) for Not_Every");
Show(" declare");
Show("      function Not_Every_Odd is new Not_Every(Test => Odd);");
Show("      function Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);");
Show(" begin");
 declare
      function Not_Every_Odd is new Not_Every(Test => Odd);
      function Delete_If_Not_Odd is new Delete_If_Not(Test => Odd);
 begin
Show("    Show_Boolean(Not_Every_Odd(Iota(10)));");
    Show_Boolean(Not_Every_Odd(Iota(10)));
Show("--True");
--True
Show("    Show_Boolean(Not_Every_Odd(Delete_If_Not_Odd(Iota(10))));");
    Show_Boolean(Not_Every_Odd(Delete_If_Not_Odd(Iota(10))));
Show("--False");
--False
Show(" end;");
 end;

------ No test included for Nth

------ No test included for Nth_Rest

------ Test(s) for Position
Show("------ Tests(s) for Position");
Show(" declare");
Show("     function Position_When_Greater is new Position(Test => ""<"");");
Show(" begin");
Show("");
 declare
     function Position_When_Greater is new Position(Test => "<");
 begin

Show("   Show_Integer(Position_When_Greater(3, Iota(7))); ");
   Show_Integer(Position_When_Greater(3, Iota(7))); 
Show("--  4");
--  4
Show(" end;");
 end;

------ Test(s) for Position_If
Show("------ Tests(s) for Position_If");
Show(" declare");
Show("     function Position_If_Greater_Than_7 is ");
Show("        new Position_If(Test => Greater_Than_7);");
Show(" begin");
 declare
     function Position_If_Greater_Than_7 is 
        new Position_If(Test => Greater_Than_7);
 begin
Show("   Show_Integer(Position_If_Greater_Than_7(Iota(10))); ");
   Show_Integer(Position_If_Greater_Than_7(Iota(10))); 
Show("--  8");
--  8
Show(" end;");
 end;

------ Test(s) for Position_If_Not
Show("------ Tests(s) for Position_If_Not");
Show(" declare");
Show("     function Position_If_Not_Greater_Than_7 is ");
Show("        new Position_If_Not(Test=>Greater_Than_7);");
Show(" begin");
 declare
     function Position_If_Not_Greater_Than_7 is 
        new Position_If_Not(Test=>Greater_Than_7);
 begin
Show("   Show_Integer(Position_If_Not_Greater_Than_7(Invert(Iota(10))));");
   Show_Integer(Position_If_Not_Greater_Than_7(Invert(Iota(10))));
Show("--  2");
--  2
Show(" end;");
 end;

------ Test(s) for Reduce
Show("------ Tests(s) for Reduce");
Show(" declare");
Show("     function Reduce_Times is new Reduce(Identity => 1, F => ""*"");");
Show("     function Reduce_Plus is new Reduce(Identity => 0, F => ""+"");");
Show(" begin");
 declare
     function Reduce_Times is new Reduce(Identity => 1, F => "*");
     function Reduce_Plus is new Reduce(Identity => 0, F => "+");
 begin
Show("   Show_Integer(Reduce_Times(Next(Iota(5)))); ");
   Show_Integer(Reduce_Times(Next(Iota(5)))); 
Show("--  24 ");
--  24 
Show("   Show_Integer(Reduce_Plus(Iota(100))); ");
   Show_Integer(Reduce_Plus(Iota(100))); 
Show("--  4950");
--  4950
Show(" end;");
 end;

------ No test included for Reverse_Append

------ Test(s) for Reverse_Concatenate
Show("------ Tests(s) for Reverse_Concatenate");
Show("");

Show("    Show_List(Reverse_Concatenate(Iota(5), Iota(6)));");
    Show_List(Reverse_Concatenate(Iota(5), Iota(6)));
Show("--  4  3  2  1  0  0  1  2  3  4  5 ");
--  4  3  2  1  0  0  1  2  3  4  5 
Show("    Show_List(Reverse_Concatenate(Nil, Iota(6)));");
    Show_List(Reverse_Concatenate(Nil, Iota(6)));
Show("--  0  1  2  3  4  5 ");
--  0  1  2  3  4  5 
Show("    Show_List(Reverse_Concatenate(Iota(5), Nil));");
    Show_List(Reverse_Concatenate(Iota(5), Nil));
Show("--  4  3  2  1  0 ");
--  4  3  2  1  0 

------ Test(s) for Search
Show("------ Tests(s) for Search");
Show(" declare");
Show("     function Search_Equal is new Search(Test => ""="");");
Show("  begin");
 declare
     function Search_Equal is new Search(Test => "=");
  begin
Show("    Show_List(Search_Equal(Construct(7, Construct(8, Construct(9, Nil))), Iota(12)));");
    Show_List(Search_Equal(Construct(7, Construct(8, Construct(9, Nil))), Iota(12)));
Show("--  7  8  9  10  11");
--  7  8  9  10  11
Show(" end;");
 end;

------ No test included for Set_First

------ No test included for Set_Next

------ No test included for Set_Nth

------ Test(s) for Some
Show("------ Tests(s) for Some");
Show(" declare");
Show("     function Some_Odd is new Some(Test => Odd);");
Show("     function Delete_If_Odd is new Delete_If(Test => Odd);");
Show("  begin");
 declare
     function Some_Odd is new Some(Test => Odd);
     function Delete_If_Odd is new Delete_If(Test => Odd);
  begin
Show("    Show_Boolean(Some_Odd(Iota(10)));");
    Show_Boolean(Some_Odd(Iota(10)));
Show("--True");
--True
Show("    Show_Boolean(Some_Odd(Delete_If_Odd(Iota(10))));");
    Show_Boolean(Some_Odd(Delete_If_Odd(Iota(10))));
Show("--False");
--False
Show(" end;");
 end;

------ Test(s) for Sort
Show("------ Tests(s) for Sort");
Show(" declare");
Show("     function Sort_Ascending is new Sort(Test => ""<"");");
Show("     function Shuffle_Merge is new Merge(Test => Shuffle_Test);");
Show("  begin");
 declare
     function Sort_Ascending is new Sort(Test => "<");
     function Shuffle_Merge is new Merge(Test => Shuffle_Test);
  begin
Show("    Show_List(Sort_Ascending(Shuffle_Merge(Iota(5), Invert(Iota(5)))));");
    Show_List(Sort_Ascending(Shuffle_Merge(Iota(5), Invert(Iota(5)))));
Show("--  0  0  1  1  2  2  3  3  4  4");
--  0  0  1  1  2  2  3  3  4  4
Show(" end;");
 end;

------ Test(s) for Subsequence
Show("------ Tests(s) for Subsequence");
Show("");

Show("    Show_List(Subsequence(Iota(10), 2, 5));");
    Show_List(Subsequence(Iota(10), 2, 5));
Show("--  2  3  4 ");
--  2  3  4 

------ Test(s) for Substitute
Show("------ Tests(s) for Substitute");
Show(" declare");
Show("     function Substitute_When_Divides ");
Show("               is new Substitute(Test => Divides);");
Show("  begin");
 declare
     function Substitute_When_Divides 
               is new Substitute(Test => Divides);
  begin
Show("    Show_List(Substitute_When_Divides(-1, 3, Iota(15)));");
    Show_List(Substitute_When_Divides(-1, 3, Iota(15)));
Show("--  -1  1  2 -1  4  5 -1  7  8 -1  10  11 -1  13  14");
--  -1  1  2 -1  4  5 -1  7  8 -1  10  11 -1  13  14
Show(" end;");
 end;

------ Test(s) for Substitute_Copy
Show("------ Tests(s) for Substitute_Copy");
Show(" declare");
Show("     function Substitute_Copy_When_Divides ");
Show("               is new Substitute_Copy(Test => Divides);");
Show("  begin");
 declare
     function Substitute_Copy_When_Divides 
               is new Substitute_Copy(Test => Divides);
  begin
Show("    Show_List(Substitute_Copy_When_Divides(-1, 3, Iota(15)));");
    Show_List(Substitute_Copy_When_Divides(-1, 3, Iota(15)));
Show("--  -1  1  2 -1  4  5 -1  7  8 -1  10  11 -1  13  14");
--  -1  1  2 -1  4  5 -1  7  8 -1  10  11 -1  13  14
Show(" end;");
 end;

------ Test(s) for Substitute_Copy_If
Show("------ Tests(s) for Substitute_Copy_If");
Show(" declare");
Show("     function Substitute_Copy_If_Odd ");
Show("              is new Substitute_Copy_If(Test => Odd);");
Show("  begin");
 declare
     function Substitute_Copy_If_Odd 
              is new Substitute_Copy_If(Test => Odd);
  begin
Show("    Show_List(Substitute_Copy_If_Odd(-1, Iota(15)));");
    Show_List(Substitute_Copy_If_Odd(-1, Iota(15)));
Show("--  0 -1  2 -1  4 -1  6 -1  8 -1  10 -1  12 -1  14");
--  0 -1  2 -1  4 -1  6 -1  8 -1  10 -1  12 -1  14
Show(" end;");
 end;

------ Test(s) for Substitute_Copy_If_Not
Show("------ Tests(s) for Substitute_Copy_If_Not");
Show(" declare");
Show("     function Substitute_Copy_If_Not_Odd ");
Show("             is new Substitute_Copy_If_Not(Test => Odd);");
Show("  begin");
 declare
     function Substitute_Copy_If_Not_Odd 
             is new Substitute_Copy_If_Not(Test => Odd);
  begin
Show("    Show_List(Substitute_Copy_If_Not_Odd(-1, Iota(15)));");
    Show_List(Substitute_Copy_If_Not_Odd(-1, Iota(15)));
Show("--  -1  1 -1  3 -1  5 -1  7 -1  9 -1  11 -1  13 -1");
--  -1  1 -1  3 -1  5 -1  7 -1  9 -1  11 -1  13 -1
Show(" end;");
 end;

------ Test(s) for Substitute_If
Show("------ Tests(s) for Substitute_If");
Show(" declare");
Show("     function Substitute_If_Odd is new Substitute_If(Test => Odd);");
Show("  begin");
 declare
     function Substitute_If_Odd is new Substitute_If(Test => Odd);
  begin
Show("    Show_List(Substitute_If_Odd(-1, Iota(15)));");
    Show_List(Substitute_If_Odd(-1, Iota(15)));
Show("--  0 -1  2 -1  4 -1  6 -1  8 -1  10 -1  12 -1  14");
--  0 -1  2 -1  4 -1  6 -1  8 -1  10 -1  12 -1  14
Show(" end;");
 end;

------ Test(s) for Substitute_If_Not
Show("------ Tests(s) for Substitute_If_Not");
Show(" declare");
Show("     function Substitute_If_Not_Odd ");
Show("             is new Substitute_If_Not(Test => Odd);");
Show("  begin");
 declare
     function Substitute_If_Not_Odd 
             is new Substitute_If_Not(Test => Odd);
  begin
Show("    Show_List(Substitute_If_Not_Odd(-1, Iota(15)));");
    Show_List(Substitute_If_Not_Odd(-1, Iota(15)));
Show("--  -1  1 -1  3 -1  5 -1  7 -1  9 -1  11 -1  13 -1");
--  -1  1 -1  3 -1  5 -1  7 -1  9 -1  11 -1  13 -1
Show(" end;");
 end;

end Examples;
