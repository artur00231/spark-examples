procedure Rev (S : in out String)
  with
    SPARK_Mode,
    Pre => S'First < Positive'Last / 2 and S'Last < Positive'Last / 2,
  Post => (for all I in S'Range => S(I) = S'Old(S'First + S'Last - I))
is
   S_Old : String := S with Ghost;
   Temp : Character;
begin
   for I in S'Range loop
      if I >= S'First + S'Last - I then
         exit;
      end if;

      Temp := S(S'First + S'Last - I);
      S(S'First + S'Last - I) := S(I);
      S(I) := Temp;

      pragma Loop_Invariant(for all J in (I + 1) .. (S'First + S'Last - I - 1) => S_Old(J) = S(J));
      pragma Loop_Invariant(for all J in S'First .. I => S_Old(J) = S(S'First + S'Last - J));
      pragma Loop_Invariant(for all J in (S'First + S'Last - I) .. S'Last => S_Old(J) = S(S'First + S'Last - J));
   end loop;
end Rev;
