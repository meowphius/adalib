--\begin{verbatim}
  generic

    Max_Size : in Natural;
    type Element is private;

  package Simple_Indexed_Vectors is

    type Sequence is private;
    procedure Create(S : in out Sequence);
    function Full(S : Sequence) return Boolean;
    function Empty(S : Sequence) return Boolean;
    function First(S : Sequence) return Element;
    function Next(S : Sequence) return Sequence;
    function Construct(E : Element; S : Sequence) return Sequence;
    procedure Free_Construct(S : Sequence);

  private

    type Node;
    type Sequence is access Node;

  end Simple_Indexed_Vectors;--\end{verbatim}


