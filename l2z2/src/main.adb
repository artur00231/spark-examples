with Max2; use Max2;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   My_Array : Max2.Vector(-1 .. 1);
begin
   My_Array := (3, 1, 2);

   Put(FindMax2(My_Array));
   Put_Line("");
end Main;
