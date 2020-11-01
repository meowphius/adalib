--\begin{verbatim}
  with User_Allocated_Singly_Linked, Singly_Linked_Lists;
  generic
    Heap_Size : in Natural;
    type Element is private;
  package User_Allocated_Singly_Linked_Lists is
 
    package Low_Level 
      is new User_Allocated_Singly_Linked(Heap_Size, Element);
    use  Low_Level;

    package Inner is 
     new Singly_Linked_Lists(Element, Sequence, Nil, First, Next,
           Construct, Set_First, Set_Next, Free);
 
  end User_Allocated_Singly_Linked_Lists;--\end{verbatim}

