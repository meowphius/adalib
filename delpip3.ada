--\begin{verbatim}
       with Auto_Reallocating_Singly_Linked, Double_Ended_Lists;
generic
  Initial_Number_Of_Blocks : in Positive;
  Block_Size               : in Positive;
  Coefficient              : in Float;
  type Element is private;
package Double_Ended_Lists_3 is

  package Low_Level is new 
    Auto_Reallocating_Singly_Linked(Initial_Number_Of_Blocks,
                                    Block_Size, Coefficient, Element);
  use Low_Level;

  package Inner is
    new Double_Ended_Lists(Element, Sequence, Nil, First, Next,
      Construct, Set_First, Set_Next, Free);

end Double_Ended_Lists_3;--\end{verbatim}
