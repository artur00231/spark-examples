with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Interfaces; use Interfaces;
with F;

procedure Main is
   A : Unsigned_64;

   package Unsigned_64_IO is new Modular_IO(Unsigned_64); use Unsigned_64_IO;
begin
   Get(A);

   A := F(A);

   Put(A);
   Put_Line("");
end Main;
