with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

with Mult;

procedure Main is
   A, B : Natural;
   C : Natural;
begin
   Get(A);
   Get(B);

   C := Mult(A, B);

   Put(C);
   Put_Line("");
end Main;
