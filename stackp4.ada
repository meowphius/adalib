--\begin{verbatim}
  with Simple_Indexed_Vectors, Stacks;
  generic
    Max_Size : in Natural;
    type Element is private;
  package Stacks_4 is

    package Low_Level is new Simple_Indexed_Vectors(Max_Size, Element);
    use Low_Level;

    package Inner is new Stacks(Element, Sequence, Create, Full,
      Empty, First, Next, Construct, Free_Construct);

  end Stacks_4;--\end{verbatim}

  
