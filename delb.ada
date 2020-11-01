  with Singly_Linked_Lists;
  package body Double_Ended_Lists is
 
    package Regular_Lists is 
        new Singly_Linked_Lists(Element, Sequence, Nil, First,
                 Next, Construct, Set_First, Set_Next, Free_Construct);

    procedure Make_Empty(S : out Del) is
    begin
      S.First := Nil;
      S.Current := Nil;
      S.Last := Nil;
    end Make_Empty;
    pragma Inline(Make_Empty);
 
    procedure Put_List(S : out Del; L : Sequence) is
    begin
      S.First := L;
      S.Current := L;
      S.Last := Regular_Lists.Last(L);
    end Put_List;
    pragma Inline(Put_List);



    procedure Add_Current(The_Element : Element; S : in out Del) is 
      Next_One, New_One : Sequence;
    begin
      Next_One := Next(S.Current);
      New_One := Construct(The_Element, Next_One);
      Set_Next(S.Current, New_One);
      if Regular_Lists.Is_End(Next_One) then
        S.Last := New_One;
      end if;
    end Add_Current;

    procedure Add_First(The_Element : Element; S : in out Del) is 
    begin
      S.First := Construct(The_Element, S.First);
      if Regular_Lists.Is_End(S.Last) then
        S.Last := S.First;
        Initialize(S);
      end if;
    end Add_First;

    procedure Add_Last(The_Element : Element; S : in out Del) is 
      Temp : Sequence := S.Last;
    begin
      S.Last := Construct(The_Element, Nil);
      if Regular_Lists.Is_End(Temp) then
        S.First := S.Last;
        Initialize(S);
      else
        Set_Next(Temp, S.Last);
      end if;
    end Add_Last;

    procedure Advance(S : in out Del) is 
    begin
      S.Current := Next(S.Current);
    end Advance;

    procedure Concatenate(S1, S2 : in out Del) is 
    begin
      if Is_Empty(S1) then
        S1 := S2;
        Make_Empty(S2);
      elsif not Is_Empty(S2) then
        Set_Next(S1.Last, S2.First);
        S1.Last := S2.Last;
        Make_Empty(S2); 
      end if;
    end Concatenate;

    procedure Copy_Sequence(S1 : out Del; S2 : Del) is 
      Temp : Sequence := Regular_Lists.Copy_Sequence(S2.First);
    begin
      S1.First := Temp;
      S1.Current := Temp;
      S1.Last := Regular_Lists.Last(Temp);
    end Copy_Sequence;

    function Count(Item : Element; S : Del)
           return Integer is 
      function Count_Aux is new Regular_Lists.Count(Test);
    begin
      return Count_Aux(Item, S.Current);
    end Count;

    function Count_If(S : Del)
           return Integer is 
      function Count_Aux is new Regular_Lists.Count_If(Test);
    begin
      return Count_Aux(S.Current);
    end Count_If;

    function Count_If_Not(S : Del)
           return Integer is 
      function Count_Aux is new Regular_Lists.Count_If_Not(Test);
    begin
      return Count_Aux(S.Current);
    end Count_If_Not;

    function Current(S : Del)
           return Element is 
    begin
      return First(S.Current);
    end Current;

    procedure Delete(Item : Element; S : in out Del) is 
      function Delete_Aux is new Regular_Lists.Delete(Test);
    begin
      Put_List(S, Delete_Aux(Item, S.First));
    end Delete;

    procedure Delete_Duplicates(S : in out Del) is 
      function Delete_Aux is new Regular_Lists.Delete_Duplicates(Test);
    begin
      Put_List(S, Delete_Aux(S.First));
    end Delete_Duplicates;

    procedure Delete_If(S : in out Del) is 
      function Delete_Aux is new Regular_Lists.Delete_If(Test);
    begin
      Put_List(S, Delete_Aux(S.First));
    end Delete_If;

    procedure Delete_If_Not(S : in out Del) is 
      function Delete_Aux is new Regular_Lists.Delete_If_Not(Test);
    begin
      Put_List(S, Delete_Aux(S.First));
    end Delete_If_Not;

    procedure Drop_Head(S : in out Del) is 
      Next_One : Sequence;
    begin
      if Is_End(S) then
        Regular_Lists.Free_Sequence(S.First);
        Make_Empty(S);
      else
        Next_One := Next(S.Current);
        if Regular_Lists.Is_End(Next_One) then
          Regular_Lists.Free_Sequence(S.First);
          Make_Empty(S);
        else
          Set_Next(S.Current, Nil);
          Regular_Lists.Free_Sequence(S.First);
          S.First := Next_One;
          Initialize(S);
        end if;
      end if;
    end Drop_Head;

    procedure Drop_Tail(S : in out Del) is 
      Next_One : Sequence;
    begin
      if not Is_End(S) then
        Next_One := Next(S.Current);
        if not Regular_Lists.Is_End(Next_One) then
          Set_Next(S.Current, Nil);
          Regular_Lists.Free_Sequence(Next_One);
          S.Last := S.Current;
        end if;
      end if;
    end Drop_Tail;

    function Equal(S1, S2: Del)
           return Boolean is 
      function Equal_Aux is new Regular_Lists.Equal(Test);
    begin
      return Equal_Aux(S1.Current, S2.Current);
    end Equal;

    function Every(S : Del)
           return Boolean is 
      function Every_Aux is new Regular_Lists.Every(Test);
    begin
      return Every_Aux(S.Current);
    end Every;

    procedure Find(Item : Element; S : in out Del) is 
      function Find_Aux is new Regular_Lists.Find(Test);
    begin
      S.Current := Find_Aux(Item, S.Current);
    end Find;

    procedure Find_If(S : in out Del) is 
      function Find_Aux is new Regular_Lists.Find_If(Test);
    begin
      S.Current := Find_Aux(S.Current);
    end Find_If;

    procedure Find_If_Not(S : in out Del) is 
      function Find_Aux is new Regular_Lists.Find_If_Not(Test);
    begin
      S.Current := Find_Aux(S.Current);
    end Find_If_Not;

    function First(S : Del)
           return Element is 
    begin
      return First(S.First);
    end First;

    procedure For_Each(S : Del) is 
      procedure For_Each_Aux is 
            new Regular_Lists.For_Each(The_Procedure);
    begin
      For_Each_Aux(S.Current);
    end For_Each;

    procedure For_Each_2(S1, S2 : Del) is 
      procedure For_Each_Aux is 
            new Regular_Lists.For_Each_2(The_Procedure);
    begin
      For_Each_Aux(S1.Current, S2.Current);
    end For_Each_2;

    procedure Free(S : in out Del) is 
    begin
      Regular_Lists.Free_Sequence(S.First);
      Make_Empty(S);
    end Free;

    procedure Initialize(S : in out Del) is 
    begin
      S.Current := S.First;
    end Initialize;

    procedure Invert(S : in out Del) is 
      Temp : Sequence := Regular_Lists.Invert(S.First);
    begin
      S.Last := S.First;
      S.First := Temp;
    end Invert;

    function Is_Empty(S : Del)
           return Boolean is 
    begin
      return Regular_Lists.Is_End(S.First);
    end Is_Empty;

    function Is_End(S : Del)
           return Boolean is 
    begin
      return Regular_Lists.Is_End(S.Current);
    end Is_End;

    function Last(S : Del)
           return Element is 
    begin
      return First(S.Last);
    end Last;

    function Length(S : Del)
           return Integer is 
    begin
      return Regular_Lists.Length(S.Current);
    end Length;

    procedure Map(S : Del) is 
      Dummy : Sequence;
      function Map_Aux is new Regular_Lists.Map(F);
    begin
      Dummy := Map_Aux(S.Current);
    end Map;

    procedure Map_2(S1, S2 : Del) is 
      Dummy : Sequence;
      function Map_2_Aux is new Regular_Lists.Map_2(F);
    begin
      Dummy := Map_2_Aux(S1.Current, S2.Current);
    end Map_2;

    procedure Merge(S1, S2 : in out Del) is 
      function Merge_Aux is new Regular_Lists.Merge(Test);
    begin
      Put_List(S1, Merge_Aux(S1.First, S2.First));
      Make_Empty(S2);
    end Merge;

    procedure Mismatch(S1, S2 : in out Del) is 
      Temp_1, Temp_2 : Sequence;
      procedure Mismatch_Aux is new Regular_Lists.Mismatch(Test);
    begin
      Mismatch_Aux(S1.Current, S2.Current, Temp_1, Temp_2);
      S1.Current := Temp_1;
      S2.Current := Temp_2;
    end Mismatch;

    function Not_Any(S : Del)
           return Boolean is 
      function Not_Any_Aux is new Regular_Lists.Not_Any(Test);
    begin
      return Not_Any_Aux(S.Current);
    end Not_Any;

    function Not_Every(S : Del)
           return Boolean is 
      function Not_Every_Aux is new Regular_Lists.Not_Every(Test);
    begin
      return Not_Every_Aux(S.Current);
    end Not_Every;

    function Reduce(S : Del)
           return Element is 
      function Reduce_Aux is new Regular_Lists.Reduce(Identity, F);
    begin
      return Reduce_Aux(S.Current);
    end Reduce;

    procedure Search(S1 : Del; S2 : in out Del) is 
      function Search_Aux is new Regular_Lists.Search(Test);
    begin
      S2.Current := Search_Aux(S1.Current, S2.Current);
    end Search;

    procedure Set_Current(S : Del; X : Element) is 
    begin
      Set_First(S.Current, X);
    end Set_Current;

    procedure Set_First(S : Del; X : Element) is 
    begin
      Set_First(S.First, X);
    end Set_First;

    procedure Set_Last(S : Del; X : Element) is 
    begin
      Set_First(S.Last, X);
    end Set_Last;

    function Some(S : Del)
           return Boolean is 
      function Some_Aux is new Regular_Lists.Some(Test);
    begin
      return Some_Aux(S.Current);
    end Some;

    procedure Sort(S : in out Del) is 
      function Sort_Aux is new Regular_Lists.Sort(Test);
    begin
      Put_List(S, Sort_Aux(S.First));
    end Sort;

    procedure Split(S1, S2 : in out Del) is 
      Next_One : Sequence;
    begin
      Free(S2);
      if not Is_End(S1) then
        Next_One := Next(S1.Current);
        if not Regular_Lists.Is_End(Next_One) then
          Set_Next(S1.Current, Nil);
          S2.First := Next_One;
          S2.Current := Next_One;
          S2.Last := S1.Last;
          S1.Last := S1.Current;
        end if;
      end if;
    end Split;

    procedure Substitute(New_Item, Old_Item : Element; S : Del) is 
      Dummy : Sequence;
      function Substitute_Aux is new Regular_Lists.Substitute(Test);
    begin
      Dummy := Substitute_Aux(New_Item, Old_Item, S.Current);
    end Substitute;

    procedure Substitute_If(New_Item : Element; S : Del) is 
      Dummy : Sequence;
      function Substitute_If_Aux is new Regular_Lists.Substitute_If(Test);
    begin
      Dummy := Substitute_If_Aux(New_Item, S.Current);
    end Substitute_If;

    procedure Substitute_If_Not(New_Item : Element; S : Del) is 
      Dummy : Sequence;
      function Substitute_If_Not_Aux is 
          new Regular_Lists.Substitute_If_Not(Test);
    begin
      Dummy := Substitute_If_Not_Aux(New_Item, S.Current);
    end Substitute_If_Not;

  end Double_Ended_Lists;
