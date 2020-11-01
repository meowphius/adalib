--\begin{verbatim}
  package Examples_Help is

  -- I/O procedures

    procedure Print_Integer(I : in Integer);
    procedure Show(The_String : String);
    procedure Show_Boolean(B : Boolean);
    procedure Show_Integer(I : Integer);

  -- Some other little functions needed to construct examples
  
    function Divides(A, B : Integer) return Boolean;
    function Even(A : Integer) return Boolean;
    function Odd(A : Integer) return Boolean;
    function Greater_Than_7(A : Integer) return Boolean;
    function Square(A : Integer) return Integer;

  end Examples_Help;

  with Text_Io; use Text_Io;
  package body Examples_Help is

  -- I/O procedures

    procedure Print_Integer(I : in Integer) is
    begin
      Put(Integer'Image(I));
      Put(" ");
    end Print_Integer;
 
    procedure Show(The_String : String) is
    begin
      Put(The_String); New_Line;
    end Show;

    procedure Show_Boolean(B : Boolean) is
    begin
      if B then
        Show("--: True");
      else
        Show("--: False");
      end if;
    end Show_Boolean;

    procedure Show_Integer(I : Integer) is
    begin
      Put("--:"); Print_Integer(I); New_Line;
    end Show_Integer;

  -- Some other little functions needed to construct examples
  
    function Divides(A, B : Integer) return Boolean is
    begin
      return B mod A = 0;
    end Divides;
  
    function Even(A : Integer) return Boolean is
    begin
      return Divides(2, A);
    end Even;
  
    function Odd(A : Integer) return Boolean is
    begin
      return not Divides(2, A);
    end Odd;
  
    function Greater_Than_7(A : Integer) return Boolean is
    begin
      return A > 7;
    end Greater_Than_7;
  
    function Square(A : Integer) return Integer is
    begin
      return A * A;
    end Square;

  end Examples_Help;--\end{verbatim}
