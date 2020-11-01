--\begin{verbatim}
  package body Simple_Indexed_Vectors is

  type Storage is array(Integer range 1 .. Max_Size) of Element;

  type Node is record 
      Vector_Field : Storage; 
      Index_Field  : Integer range 0 .. Max_Size := 0;
    end record;

  procedure Create(S : in out Sequence) is
  begin
    S := new Node;
  end Create;

  function Full(S : Sequence) return Boolean is
  begin
    return (S.Index_Field = Max_Size);
  end Full;

  function Empty(S : Sequence) return Boolean is
  begin
    return (S.Index_Field = 0);
  end Empty;

  function First(S : Sequence) return Element is
  begin
    return S.Vector_Field(S.Index_Field);
  end First;

  function Next(S : Sequence) return Sequence is
  begin
    S.Index_Field := S.Index_Field - 1;
    return S;
  end Next;

  function Construct(E : Element; S : Sequence) return Sequence is
  begin
    S.Index_Field := S.Index_Field + 1;
    S.Vector_Field(S.Index_Field) := E;
    return S;
  end Construct;

  procedure Free_Construct(S : Sequence) is
  begin
    null;
  end Free_Construct;

  end Simple_Indexed_Vectors;--\end{verbatim}


