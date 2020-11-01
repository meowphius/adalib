--\begin{verbatim}
  with Auto_Reallocating_Singly_Linked;
  with Singly_Linked_Lists;
  generic
 
    Initial_Number_Of_Blocks : in Positive;
    Block_Size               : in Positive;
    Coefficient              : in Float;
    type Element is private;
 
  package Auto_Reallocating_Singly_Linked_Lists is
 
    package Low_Level is new 
      Auto_Reallocating_Singly_Linked(Initial_Number_Of_Blocks,
                               Block_Size, Coefficient, Element);
    use  Low_Level;
 
    package Inner is 
     new Singly_Linked_Lists(Element, Sequence, Nil, First, Next,
           Construct, Set_First, Set_Next, Free);
 
  end Auto_Reallocating_Singly_Linked_Lists;--\end{verbatim}

