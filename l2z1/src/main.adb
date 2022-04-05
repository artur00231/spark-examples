with IsPrime;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   Is_Prime : Boolean;
   Number : Positive;
begin
   Number := 10;

   Get(Number);

   Is_Prime := IsPrime(Number);

   IF (Is_Prime) then
      Put_Line("Prime");
   ELSE
      Put_Line("Not Prime");
   END IF;
end Main;
