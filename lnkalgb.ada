  package body Linked_List_Algorithms is



    function Accumulate(S : Cell; Initial_Value : Element)
           return Element is 
      To_Be_Done : Cell    := S;
      Result     : Element := Initial_Value;
    begin
      while not Is_End(To_Be_Done) loop
        Result := F(Result, To_Be_Done);
        Advance(To_Be_Done);
      end loop;
      return Result;
    end Accumulate;

    procedure Advance(S : in out Cell) is 
    begin
      S := Next(S);
    end Advance;

    function Append(S1, S2 : Cell)
           return Cell is 
      Result, Current : Cell;
      To_Be_Done      : Cell := S1;
    begin
      if Is_End(S1) then
        return S2;
      end if;
      Result := Copy_Cell(To_Be_Done, S2);
      Current := Result;
      loop
        Advance(To_Be_Done);
        if Is_End(To_Be_Done) then
          return Result;
        end if;
        Attach_To_Tail(Current, Copy_Cell(To_Be_Done, S2));
      end loop;
    end Append;

    function Append_First_N(S1, S2 : Cell; N : Integer)
           return Cell is 
      Result, Current, Temp : Cell;
      To_Be_Done            : Cell    := S1;
      I                     : Integer := N - 1;
    begin
      if Is_End(S1) or else I < 0 then
        return S2;
      end if;
      Result := Copy_Cell(To_Be_Done, S2);
      Current := Result;
      loop
        Advance(To_Be_Done);
        I := I - 1;
        if Is_End(To_Be_Done) or else I < 0 then
          return Result;
        end if;
        Attach_To_Tail(Current, Copy_Cell(To_Be_Done, S2));
      end loop;
    end Append_First_N;

    procedure Attach_To_Tail(X : in out Cell; Y : in Cell) is 
    begin
      Set_Next(X, Y);
      X := Y;
    end Attach_To_Tail;

    function Count(S : Cell)
           return Integer is 
      Result     : Integer := 0;
      To_Be_Done : Cell    := S;
    begin
      while not Is_End(To_Be_Done) loop
        if Test(To_Be_Done) then
          Result := Result + 1;
        end if;
        Advance(To_Be_Done);
      end loop;
      return Result;
    end Count;

    function Delete_Copy_Append(S1, S2 : Cell)
           return Cell is 
      To_Be_Done      : Cell := S1;
      Result, Current : Cell;
    begin
      while not Is_End(To_Be_Done) and then Test(To_Be_Done) loop
        Advance(To_Be_Done);
      end loop;
      if Is_End(To_Be_Done) then
        return S2;   
      end if;
      Result := Copy_Cell(To_Be_Done, S2);
      Current := Result;
      Advance(To_Be_Done);
      while not Is_End(To_Be_Done) loop
        if not Test(To_Be_Done) then
          Attach_To_Tail(Current, Copy_Cell(To_Be_Done, S2));
        end if;
        Advance(To_Be_Done);
      end loop;
      return Result;
    end Delete_Copy_Append;

    function Delete_Copy_Duplicates_Append(S1, S2 : Cell)
           return Cell is 
      Result, Current, I : Cell;
      To_Be_Done         : Cell := S1;
    begin
      if Is_End(S1) then
        return S1;
      end if;
      Result := Copy_Cell(To_Be_Done, S2);
      Current := Result;
      Advance(To_Be_Done);
      while not Is_End(To_Be_Done) loop
        I := Result;
        while not Is_End(I) and then not Test(I, To_Be_Done) loop
          Advance(I);
        end loop;
        if Is_End(I) then
          Attach_To_Tail(Current, Copy_Cell(To_Be_Done, S2));
        end if;
        Advance(To_Be_Done);
      end loop;
      return Result;
    end Delete_Copy_Duplicates_Append;

    function Delete_Duplicates(S : Cell)
           return Cell is 
      Tail, To_Be_Done, I : Cell := S;
    begin
      if not Is_End(To_Be_Done) then
        Advance(To_Be_Done);
        while not Is_End(To_Be_Done) loop
          I := S;
          while I /= To_Be_Done and then not Test(I, To_Be_Done) loop
            Advance(I);
          end loop;
          if I = To_Be_Done then
            Tail := To_Be_Done;
            Advance(To_Be_Done);
          else
            I := To_Be_Done;
            Advance(To_Be_Done);
            Set_Next(Tail, To_Be_Done);
            Free(I);
          end if;
        end loop;
      end if;
      return S;
    end Delete_Duplicates;

    function Equal(S1, S2 : Cell)
           return Boolean is 
      Tail_1, Tail_2 : Cell;
      procedure Mismatch_Aux is new Mismatch(Test);
    begin
      Mismatch_Aux(S1, S2, Tail_1, Tail_2);
      return Is_End(Tail_1) and Is_End(Tail_2);
    end Equal;

    function Every(S : Cell)
           return Boolean is 
      To_Be_Done : Cell := S;
    begin
      while not Is_End(To_Be_Done) and then Test(To_Be_Done) loop
        Advance(To_Be_Done);
      end loop;
      return Is_End(To_Be_Done);
    end Every;

    function Find(S : Cell)
           return Cell is 
      To_Be_Done : Cell := S;
    begin
      while not Is_End(To_Be_Done) and then not Test(To_Be_Done) loop
        Advance(To_Be_Done);
      end loop;
      return To_Be_Done;
    end Find;

    procedure For_Each_Cell(S : Cell) is 
      To_Be_Done : Cell := S;
      Temp       : Cell;
    begin
      while not Is_End(To_Be_Done) loop
        Temp := Next(To_Be_Done);
        The_Procedure(To_Be_Done);
        To_Be_Done := Temp;
      end loop;
    end For_Each_Cell;

    procedure For_Each_Cell_2(S1, S2 : Cell) is 
      To_Be_Done1 : Cell := S1;
      To_Be_Done2 : Cell := S2;
      Temp_1       : Cell;
      Temp_2       : Cell;
    begin
      while not Is_End(To_Be_Done1) 
            and then not Is_End(To_Be_Done2) loop
        Temp_1 := Next(To_Be_Done1);
        Temp_2 := Next(To_Be_Done2);
        The_Procedure(To_Be_Done1, To_Be_Done2);
        To_Be_Done1 := Temp_1;
        To_Be_Done2 := Temp_2;
      end loop;
    end For_Each_Cell_2;

    procedure Invert_Partition(S1: in Cell; S2, S3: in out Cell) is 
      To_Be_Done, Temp: Cell := S1;
    begin 
      while not Is_End(To_Be_Done) loop
        Advance(To_Be_Done);
        if Test(Temp) then
          Set_Next(Temp, S2);
          S2 := Temp;
        else
          Set_Next(Temp, S3);
          S3 := Temp;
        end if;
        Temp := To_Be_Done;
      end loop;
    end Invert_Partition;

    function Last(S : Cell)
           return Cell is 
      I, J : Cell := S;
    begin
      loop
        Advance(J);
        exit when Is_End(J);
        I := J;
      end loop;
      return I;
    end Last;

    function Length(S : Cell)
           return Integer is 
      Result     : Integer := 0;
      To_Be_Done : Cell    := S;
    begin
      while not Is_End(To_Be_Done) loop
        Result := Result + 1;
        Advance(To_Be_Done);
      end loop;
      return Result;
    end Length;

    function Map_Copy_2_Append(S1, S2, S3 : Cell)
           return Cell is 
      Result, Current : Cell;
      To_Be_Done1     : Cell := S1;
      To_Be_Done2     : Cell := S2;
    begin
      if Is_End(To_Be_Done1) or else Is_End(To_Be_Done2) then
        return S3;
      end if;
      Result := Make_Cell(To_Be_Done1, To_Be_Done2, S3);
      Current := Result;
      Advance(To_Be_Done1);
      Advance(To_Be_Done2);
      while not Is_End(To_Be_Done1) 
            and then not Is_End(To_Be_Done2) loop
        Attach_To_Tail(Current, 
                       Make_Cell(To_Be_Done1, To_Be_Done2, S3));
        Advance(To_Be_Done1);
        Advance(To_Be_Done2);
      end loop;
      return Result;
    end Map_Copy_2_Append;

    function Map_Copy_Append(S1, S2 : Cell)
           return Cell is 
      Result, Current : Cell;
      To_Be_Done      : Cell := S1;
    begin
      if Is_End(To_Be_Done) then
        return S2;
      end if;
      Result := Make_Cell(To_Be_Done, S2);
      Current := Result;
      Advance(To_Be_Done);
      while not Is_End(To_Be_Done) loop
        Attach_To_Tail(Current, Make_Cell(To_Be_Done, S2));
        Advance(To_Be_Done);
      end loop;
      return Result;
    end Map_Copy_Append;

    function Merge(S1, S2 : Cell)
           return Cell is 
      function Merge_Aux is new Merge_Non_Empty(Test);
    begin
      if Is_End(S1) then
        return S2;
      elsif Is_End(S2) then
        return S1;
      else
        return Merge_Aux(S1, S2);
      end if;
    end Merge;

    function Merge_Non_Empty(S1, S2 : Cell)
           return Cell is 
      I, J, K, Result : Cell;
    begin
      if Test(S2, S1) then
        Result := S2;
        I := Next(S2);
        J := S1;
        K := S2;
        goto Wrong_Loop;
      else
        Result := S1;
        I := Next(S1);
        J := S2;
        K := S1;
        goto Right_Loop;
      end if;
      << Right_Loop >>if Is_End(I) then
        Set_Next(K, J);
        return Result;
      elsif Test(J, I) then
        Attach_To_Tail(K, J);
        J := I;
        I := Next(K);
      else
        K := I;
        Advance(I);
        goto Right_Loop;
      end if;
      << Wrong_Loop >>if Is_End(I) then
        Set_Next(K, J);
        return Result;
      elsif Test(I, J) then
        K := I;
        Advance(I);
        goto Wrong_Loop;
      else
        Attach_To_Tail(K, J);
        J := I;
        I := Next(K);
        goto Right_Loop;
      end if;
    end Merge_Non_Empty;

    procedure Mismatch(S1, S2 : in Cell; S3, S4 : out Cell) is 
      To_Be_Done_1 : Cell := S1;
      To_Be_Done_2 : Cell := S2;
    begin
      while not Is_End(To_Be_Done_1) 
            and then not Is_End(To_Be_Done_2) 
            and then Test(To_Be_Done_1, To_Be_Done_2) loop
        Advance(To_Be_Done_1);
        Advance(To_Be_Done_2);
      end loop;
      S3 := To_Be_Done_1;
      S4 := To_Be_Done_2;
    end Mismatch;

    function Not_Any(S : Cell)
           return Boolean is 
      To_Be_Done : Cell := S;
    begin
      while not Is_End(To_Be_Done) and then not Test(To_Be_Done) loop
        Advance(To_Be_Done);
      end loop;
      return Is_End(To_Be_Done);
    end Not_Any;

    function Not_Every(S : Cell)
           return Boolean is 
      To_Be_Done : Cell := S;
    begin
      while not Is_End(To_Be_Done) and then Test(To_Be_Done) loop
        Advance(To_Be_Done);
      end loop;
      return not Is_End(To_Be_Done);
    end Not_Every;

    function Nth_Rest(N : Integer; S : Cell)
           return Cell is 
      To_Be_Done : Cell    := S;
      I          : Integer := N;
    begin
      while not Is_End(To_Be_Done) and then I > 0 loop
        I := I - 1;
        Advance(To_Be_Done);
      end loop;
      return To_Be_Done;
    end Nth_Rest;

    function Position(S : Cell)
           return Integer is 
      To_Be_Done : Cell    := S;
      I          : Integer := 0;
    begin
      while not Is_End(To_Be_Done) and then not Test(To_Be_Done) loop
        I := I + 1;
        Advance(To_Be_Done);
      end loop;
      if Is_End(To_Be_Done) then
        return -1;
      else
        return I;
      end if;
    end Position;

    function Reverse_Append(S1, S2 : Cell)
           return Cell is 
      Result     : Cell := S2;
      To_Be_Done : Cell := S1;
    begin
      while not Is_End(To_Be_Done) loop
        Result := Copy_Cell(To_Be_Done, Result);
        Advance(To_Be_Done);
      end loop;
      return Result;
    end Reverse_Append;

    function Reverse_Concatenate(S1, S2 : Cell)
           return Cell is 
      Result     : Cell := S2;
      To_Be_Done : Cell := S1;
      Temp       : Cell;
    begin
      while not Is_End(To_Be_Done) loop
        Temp := To_Be_Done;
        Advance(To_Be_Done);
        Set_Next(Temp, Result);
        Result := Temp;
      end loop;
      return Result;
    end Reverse_Concatenate;

    function Search(S1, S2 : Cell)
           return Cell is 
      To_Be_Done     : Cell := S2;
      Tail_1, Tail_2 : Cell;
      procedure Mismatch_Aux is new Mismatch(Test);
    begin
      loop
        Mismatch_Aux(S1, To_Be_Done, Tail_1, Tail_2);
        if Is_End(Tail_1) then
          return To_Be_Done;
        elsif Is_End(Tail_2) then
          return Tail_2;
        end if;
        Advance(To_Be_Done);
      end loop;
    end Search;

    function Some(S : Cell)
           return Boolean is 
      To_Be_Done : Cell := S;
    begin
      while not Is_End(To_Be_Done) and then not Test(To_Be_Done) loop
        Advance(To_Be_Done);
      end loop;
      return not Is_End(To_Be_Done);
    end Some;

    function Sort(S : Cell)
           return Cell is 
-- Merge-sort algorithm, using "register adder" technique
      type Table is array(0 .. Log_Of_Max_Num) of Cell;
      Register                : Table   := (others => Empty);
      I, Maximum_Bit_Position : Integer := 0;
      To_Be_Done              : Cell    := S;
      Bit, Carry              : Cell;
      function Merge_Aux is new Merge_Non_Empty(Test);
    begin
      while not (Is_End(To_Be_Done)) loop
        Carry := To_Be_Done;
        Advance(To_Be_Done);
        Set_Next(Carry, Empty);
        I := 0;
        loop
          Bit := Register(I);
          exit when Is_End(Bit);
          Carry := Merge_Aux(Bit, Carry);
          Register(I) := Empty;
          I := I + 1;
        end loop;
        Register(I) := Carry;
        if Maximum_Bit_Position < I then
          Maximum_Bit_Position := I;
        end if;
      end loop;
      Carry := Register(I);
      loop
        I := I + 1;
        exit when I > Maximum_Bit_Position;
        Bit := Register(I);
        if not Is_End(Bit) then
          Carry := Merge_Aux(Bit, Carry);
        end if;
      end loop;
      return Carry;
    end Sort;

  end Linked_List_Algorithms;
