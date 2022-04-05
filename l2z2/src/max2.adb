package body Max2 with SPARK_Mode is

   function FindMax2 (V : Vector) return Integer is
      Max : Integer;
      Max_2 : Integer;
   begin
      if V'Length < 2 then
         return 0;
      end if;
      
      pragma assert (V'Length >= 2);
      
      Max_2 := 0;
      Max := V(V'First);
      
      pragma assert (Max >= Max_2);
      pragma assert (for all I in V'First .. V'First => Max >= V(I));
      pragma assert (for all I in V'First .. V'First => V(I) <= Max_2 or V(I) = Max);
      
      for I in V'First .. V'Last loop
         if (V(I) > Max_2) then
            if (V(I) > Max) then
               Max_2 := Max;
               Max := V(I);
            elsif (V(I) /= Max) then
               Max_2 := V(I);
            end if;
         end if;
         
         pragma Loop_Invariant (Max >= Max_2);
         pragma Loop_Invariant (for some J in V'First .. I => Max = V(J));
         pragma Loop_Invariant ((for some J in V'First .. I => Max_2 = V(J)) or Max_2 = 0);
         pragma Loop_Invariant (if Max_2 = 0 then (for all J in V'First .. I => Max = V(J)));
         pragma Loop_Invariant (for all J in V'First .. I => Max >= V(J));
         pragma Loop_Invariant (for all J in V'First .. I => V(J) <= Max_2 or V(J) = Max);
         
         pragma Loop_Invariant (Max_2 >= 0 and
     (Max_2 = 0 or
        (for some K in V'First .. I => Max_2 = V(K))) and
     (if Max_2 /= 0 then
        (for some K in V'First .. I => V(K) > Max_2)) and
     (if Max_2 = 0
        then
          (for all K in V'First .. I =>
               (for all J in V'First .. I => V(K) = V(J)))
            else
        (for all K in V'First .. I =>
             (if V(K) > Max_2 then
                (for all J in V'First .. I => V(J) <= V(K))))));
      end loop;
      
      pragma Assert (Max >= Max_2);
      pragma Assert ((for some J in V'First .. V'Last => Max_2 = V(J)) or Max_2 = 0);
      pragma Assert (for all J in V'First .. V'Last => Max >= V(J));
      pragma Assert (for all J in V'First .. V'Last => V(J) <= Max_2 or V(J) = Max);
      
      return Max_2;
   end FindMax2;

end Max2;
