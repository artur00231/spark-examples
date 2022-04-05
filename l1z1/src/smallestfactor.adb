package body SmallestFactor with SPARK_Mode is

   procedure Smallest_Factor (N : in out Positive; Factor : out Positive)
   is
   begin
      Factor := 2;

      for I in 2 .. N loop

         pragma Loop_Invariant
           (for all Index in 2 .. I - 1 => N rem Index /= 0);

         if N rem I = 0 then
            Factor := I;
            exit;
         end if;

      end loop;

      N := N / Factor;
   end Smallest_Factor;

end SmallestFactor;
