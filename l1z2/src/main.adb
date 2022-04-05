with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

with Poly;       use Poly;

procedure Main is
   Polynomial : Vector (1 .. 6);
   Result : Integer;
begin

   Polynomial := (0, 1, 1, 1, 1, 1);

   Result := Horner(2, Polynomial);

   Put(Result);

end Main;
