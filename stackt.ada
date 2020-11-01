





  with Stacks_1; -- a PIP;
  package Integer_Stacks is new Stacks_1(Integer);  

  with Integer_Stacks, Text_Io, Examples_Help;
  procedure Test_Stacks is
    use Integer_Stacks.Inner, Text_Io, Examples_Help;

    procedure Show_Stack(S : in out Stack) is
      procedure Show_Stack_Aux is new For_Each(Print_Integer);
    begin
      Put("--:"); Show_Stack_Aux(S); New_Line;
    end Show_Stack;
 
begin




------ Test(s) for Create
Show("------ Tests(s) for Create");
Show("-- See Push");
-- See Push
Show("");


------ Test(s) for For_Each
Show("------ Tests(s) for For_Each");
Show("-- See Push");
-- See Push
Show("");


------ Test(s) for Is_Empty
Show("------ Tests(s) for Is_Empty");
Show("-- See Push");
-- See Push
Show("");


------ Test(s) for Pop
Show("------ Tests(s) for Pop");
Show("-- See Push");
-- See Push
Show("");


------ Test(s) for Push
Show("------ Tests(s) for Push");
Show(" declare");
Show("    S : Stack; E : Integer;");
Show("  begin");
 declare
    S : Stack; E : Integer;
  begin
Show("   Create(S);");
   Create(S);
Show("   Push(2, S); Push(3, S); Push(5, S); Push(7, S);");
   Push(2, S); Push(3, S); Push(5, S); Push(7, S);
Show("   Show_Integer(Top(S));");
   Show_Integer(Top(S));
Show("--  7");
--  7
Show("   Pop(E, S);");
   Pop(E, S);
Show("   Show_Integer(E);");
   Show_Integer(E);
Show("--  7");
--  7
Show("   Show_Integer(Top(S));");
   Show_Integer(Top(S));
Show("--  5");
--  5
Show("   Show_Boolean(Is_Empty(S));");
   Show_Boolean(Is_Empty(S));
Show("-- False");
-- False
Show("   Show_Stack(S);");
   Show_Stack(S);
Show("--  5  3  2");
--  5  3  2
Show("   Show_Boolean(Is_Empty(S));");
   Show_Boolean(Is_Empty(S));
Show("-- True");
-- True
Show("  end;");
  end;

------ Test(s) for Top
Show("------ Tests(s) for Top");
Show("-- See Push");
-- See Push
Show("");



    Show("End Of Tests");
end;
