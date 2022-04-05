with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

function Sqrt (X : Float; Tolerance : Float) return Float
  with
    SPARK_Mode,
    Pre => X >= 0.0 and X <= 1.8E19 and
  Tolerance > Float'Model_Epsilon and Tolerance <= 1.0,
  Post => abs (X - Sqrt'Result ** 2) <= X * Tolerance
is
   Approx  : Float;
   Temp1 : Float;
   --New_Approx  : Float;
begin
   if X = 0.0 then
      return 0.0;
   end if;
   
   if X = 1.0 then
      return 1.0;
   end if;
   
   
   if X > 1.0 then
      Approx := 1.0 + Float'Model_Epsilon;
      pragma Assert (X > 1.0);
   
   
      while abs (X - Approx ** 2) > X * Tolerance loop
      
         pragma Assert(Approx > 1.0);
      
         Temp1 := X / Approx; 
         Temp1 := Temp1 + Approx;
      
         pragma Assert(Temp1 <= 2.0 * X);
      
         Approx := Temp1 / 2.0;
      
         pragma Loop_Invariant(X > 1.0);
         pragma Loop_Invariant(Approx <= X);
         pragma Loop_Invariant (Approx /= 0.0);
         pragma Loop_Invariant (Approx > 1.0);
      

      end loop;
   else
      Approx := 1.0 - Float'Model_Epsilon;
      pragma Assert (X < 1.0);
   
      while abs (X - Approx ** 2) > X * Tolerance loop
      
         pragma Assert(Approx <= 1.0);
      
         Temp1 := X / Approx; 
         Temp1 := Temp1 + Approx;
      
         pragma Assert(Temp1 >= 2.0 * X);
      
         Approx := Temp1 / 2.0;
      
         pragma Loop_Invariant(X < 1.0);
         pragma Loop_Invariant(Approx >= X);
         pragma Loop_Invariant (Approx /= 0.0);
         pragma Loop_Invariant (Approx <= 1.0);
      
      end loop;
   end if;

   return Approx;
end Sqrt;
