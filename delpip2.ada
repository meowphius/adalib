--\begin{verbatim}
       with User_Allocated_Singly_Linked, Double_Ended_Lists;
generic
  Heap_Size : in Natural;
  type Element is private;
package Double_Ended_Lists_2 is

  package Low_Level 
    is new User_Allocated_Singly_Linked(Heap_Size, Element);
  use Low_Level;

  package Inner is
    new Double_Ended_Lists(Element, Sequence, Nil, First, Next,
      Construct, Set_First, Set_Next, Free);

end Double_Ended_Lists_2;--\end{verbatim}
