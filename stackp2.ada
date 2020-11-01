--\begin{verbatim}
       with User_Allocated_Singly_Linked, Stacks;
generic
  Heap_Size : in Natural;
  type Element is private;
package Stacks_2 is

  package Low_Level is 
   new User_Allocated_Singly_Linked(Heap_Size, Element);
  use Low_Level;

  procedure Create(S : out Sequence);
  pragma inline(Create);
  function Full(S : Sequence) return Boolean;
  pragma inline(Full);
  function Empty(S : Sequence) return Boolean;
  pragma inline(Empty);

  package Inner is
    new Stacks(Element, Sequence, Create, Full, Empty, 
      First, Next, Construct, Free);

end Stacks_2;


package body Stacks_2 is

  use Low_Level;
  procedure Create(S : out Sequence) is
  begin
    S := Nil;
  end Create;

  function Full(S : Sequence) return Boolean is
  begin
    return False;  -- Stacks are unbounded when
                   -- represented as singly-linked-lists;
  end Full;

  function Empty(S : Sequence) return Boolean is
  begin 
    return S = Nil;
  end Empty;

end Stacks_2;--\end{verbatim}
