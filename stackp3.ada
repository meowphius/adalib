--\begin{verbatim}
       with Auto_Reallocating_Singly_Linked, Stacks;
generic
  Initial_Number_Of_Blocks : in Positive;
  Block_Size               : in Positive;
  Coefficient              : in Float;
  type Element is private;
package Stacks_3 is

  package Low_Level is 
   new Auto_Reallocating_Singly_Linked(Initial_Number_Of_Blocks,
        Block_Size, Coefficient, Element);
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

end Stacks_3;


package body Stacks_3 is

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

end Stacks_3;--\end{verbatim}
