with Sqrt;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is
   Number : Float;
   Tolerance : Float;
begin
   Number := 25.0;
   Tolerance := 0.01;

   Put(Sqrt(Number, Tolerance));
   Put_Line("");
end Main;
