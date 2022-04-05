with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Rev;

procedure Main is
   Line : Unbounded_String;
begin
   Line := Get_Line;

   declare
      Line_String : String(1 .. Length(Line));
   begin
      Line_String := To_String(Line);

      Rev(Line_String);

      Put_Line(Line_String);
   end;
end Main;
