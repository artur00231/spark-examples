function IsPrime (N : in Positive) return Boolean
  with
    SPARK_Mode,
    Pre => N >= 2,
    Post => (if IsPrime'Result then
               (for all I in 2 .. N - 1 => N rem I /= 0)
                   else
               (for some I in 2 .. N - 1 => N rem I = 0))
is
begin

   FOR I in 2 .. (N - 1) LOOP
      IF N rem I = 0 THEN
         return False;
      END IF;

      pragma Loop_Invariant(for all J in 2 .. I => N rem J /= 0);
   END LOOP;

   return True;
end IsPrime;
