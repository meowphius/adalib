--\begin{verbatim}
       with System_Allocated_Singly_Linked, Double_Ended_Lists;
generic
  type Element is private;
package Double_Ended_Lists_1 is

  package Low_Level is new System_Allocated_Singly_Linked(Element);
  use Low_Level;

  package Inner is
    new Double_Ended_Lists(Element, Sequence, Nil, First, Next,
      Construct, Set_First, Set_Next, Free);

end Double_Ended_Lists_1;--\end{verbatim}
