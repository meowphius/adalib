





  with Output_Restricted_Deques_1;  -- a PIP
  package Integer_Output_Restricted_Deques is new
      Output_Restricted_Deques_1(Integer); 

  with Integer_Output_Restricted_Deques, Text_Io, Examples_Help;
  procedure Test_Deques is
    use Integer_Output_Restricted_Deques.Inner, Text_Io, Examples_Help;

    procedure Show_Deque(D : in out Deque) is
    -- note that this makes D empty;
      procedure Show_Deque_Aux is new For_Each(Print_Integer);
    begin
      Put("--:"); Show_Deque_Aux(D); New_Line;
    end Show_Deque;
 
begin




------ Test(s) for Create
Show("------ Tests(s) for Create");
Show("-- See Push_Front");
-- See Push_Front
Show("");


------ Test(s) for For_Each
Show("------ Tests(s) for For_Each");
Show("-- See Push_Front");
-- See Push_Front
Show("");


------ Test(s) for Front
Show("------ Tests(s) for Front");
Show("-- See Push_Front, Push_Rear");
-- See Push_Front, Push_Rear
Show("");


------ Test(s) for Is_Empty
Show("------ Tests(s) for Is_Empty");
Show("-- See Push_Front");
-- See Push_Front
Show("");


------ Test(s) for Pop_Front
Show("------ Tests(s) for Pop_Front");
Show("-- See Push_Front, Push_Rear");
-- See Push_Front, Push_Rear
Show("");


------ Test(s) for Push_Front
Show("------ Tests(s) for Push_Front");
Show(" declare");
Show("    D : Deque; E : Integer;");
Show("  begin");
 declare
    D : Deque; E : Integer;
  begin
Show("   Create(D);");
   Create(D);
Show("   Push_Front(2, D); Push_Front(3, D); Push_Front(5, D); Push_Front(7, D);");
   Push_Front(2, D); Push_Front(3, D); Push_Front(5, D); Push_Front(7, D);
Show("   Show_Integer(Front(D));");
   Show_Integer(Front(D));
Show("--  7");
--  7
Show("   Pop_Front(E, D);");
   Pop_Front(E, D);
Show("   Show_Integer(E);");
   Show_Integer(E);
Show("--  7");
--  7
Show("   Show_Integer(Front(D));");
   Show_Integer(Front(D));
Show("--  5");
--  5
Show("   Show_Boolean(Is_Empty(D));");
   Show_Boolean(Is_Empty(D));
Show("-- False");
-- False
Show("   Show_Deque(D);");
   Show_Deque(D);
Show("--  5  3  2");
--  5  3  2
Show("   Show_Boolean(Is_Empty(D));");
   Show_Boolean(Is_Empty(D));
Show("--  True");
--  True
Show("  end;");
  end;

------ Test(s) for Push_Rear
Show("------ Tests(s) for Push_Rear");
Show(" declare");
Show("    D : Deque; E : Integer;");
Show("  begin");
 declare
    D : Deque; E : Integer;
  begin
Show("   Push_Rear(2, D); Push_Rear(3, D); Push_Rear(5, D); Push_Rear(7, D);");
   Push_Rear(2, D); Push_Rear(3, D); Push_Rear(5, D); Push_Rear(7, D);
Show("   Show_Integer(Rear(D));");
   Show_Integer(Rear(D));
Show("--  7");
--  7
Show("   Pop_Front(E, D);");
   Pop_Front(E, D);
Show("   Show_Integer(E);");
   Show_Integer(E);
Show("--  2");
--  2
Show("   Show_Integer(Front(D));");
   Show_Integer(Front(D));
Show("--  3");
--  3
Show("   Show_Boolean(Is_Empty(D));");
   Show_Boolean(Is_Empty(D));
Show("-- False");
-- False
Show("   Show_Deque(D);");
   Show_Deque(D);
Show("--  3  5  7");
--  3  5  7
Show("   Show_Boolean(Is_Empty(D));");
   Show_Boolean(Is_Empty(D));
Show("--  True");
--  True
Show("  end;");
  end;

------ Test(s) for Rear
Show("------ Tests(s) for Rear");
Show("-- See Push_Rear");
-- See Push_Rear
Show("");



    Show("End Of Tests");
end;
