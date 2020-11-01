--\begin{verbatim}
  with System_Allocated_Singly_Linked, Singly_Linked_Lists;
  generic
    type Element is private;
  package System_Allocated_Singly_Linked_Lists is
 
    package Low_Level is new System_Allocated_Singly_Linked(Element);
    use  Low_Level;

    package Inner is 
     new Singly_Linked_Lists(Element, Sequence, Nil, First, Next,
           Construct, Set_First, Set_Next, Free);
 
  end System_Allocated_Singly_Linked_Lists;--\end{verbatim}

