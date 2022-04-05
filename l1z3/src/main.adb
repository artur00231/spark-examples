with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

with Selection;       use Selection;


procedure Main is
   MyArray : Arr (1 .. 11);
begin
   MyArray := (10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0);

   Put_Line("Start");

   for Val of MyArray loop
      Put(Val);
   end loop;

   Sort(MyArray);

   Put_Line("");
   Put_Line("Koniec");

   for Val of MyArray loop
      Put(Val);
   end loop;


end Main;
