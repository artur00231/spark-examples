function Sqrt (X : Float; Tolerance : Float) return Float
  with
    SPARK_Mode,
    Pre => X >= 0.0 and X <= 1.8E19 and
  Tolerance > Float'Model_Epsilon and Tolerance <= 1.0,
  Post => abs (X - Sqrt'Result ** 2) <= X * Tolerance
is
   Left  : Float;
   Right : Float;
   Med   : Float;
begin
   Left  := 0.0;
   Right := Float'Max(1.0, X);

   if X = 0.0 then
      return 0.0;
   end if;
   
   if X = 1.0 then
      return 1.0;
   end if;
   
   Med := Left;

   pragma Assert (Right <= 1.8E19);
   pragma Assert (Left >= 0.0);
   pragma Assert (Med >= Left and Med <= Right);
   pragma Assert (X /= 0.0);
   
   while abs (X - Med ** 2) > X * Tolerance loop

      Med := Left + (Right - Left) / 2.0;
      
      pragma Assert (Med >= Left and Med <= Right);

      if Med ** 2 < X then
         Left := Med;
      elsif Med ** 2 > X then
         Right := Med;
      else 
         pragma Assert (abs(X - Med ** 2) = 0.0);
         return Med;
      end if;
      
      pragma Loop_Invariant (Right <= 1.8E19);
      pragma Loop_Invariant (Left >= 0.0);
      pragma Loop_Invariant (Med >= Left and Med <= Right);
      pragma Loop_Invariant (X /= 0.0);
   end loop;

   return Med;
end Sqrt;
