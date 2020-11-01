--\begin{verbatim}
       with Double_Ended_Lists_1, Output_Restricted_Deques;
generic
  type Element is private;
package Output_Restricted_Deques_1 is

  package Low_Level is new Double_Ended_Lists_1(Element);
  use Low_Level.Inner;

  function Full(D : Del) return Boolean;
  pragma inline(Full);
  procedure Drop_First(D : in out Del);
  pragma inline(Drop_First);

  package Inner is new
    Output_Restricted_Deques(Element, Del, Free, Full, Is_Empty, First, 
      Last, Add_First, Add_Last, Drop_First);

end Output_Restricted_Deques_1;

package body Output_Restricted_Deques_1 is
  use Low_Level.Inner;

  function Full(D : Del) return Boolean is
  begin
    return False;  -- double-ended-lists are unbounded when 
                   -- represented as singly-linked-lists;
  end Full;

  procedure Drop_First(D : in out Del) is
  begin
    Initialize(D);
    Drop_Head(D);
  end Drop_First;

end Output_Restricted_Deques_1;--\end{verbatim}
