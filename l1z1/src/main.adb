with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

with SmallestFactor;       use SmallestFactor;

procedure Main is
   x : Integer;
   Result : Integer;
begin
   x := 5291;

   Put_Line("START");

   Smallest_Factor(X, Result);

   Put(x);
   Put_Line(" ");
   Put(Result);
end Main;
