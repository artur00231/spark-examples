package body LinearSearch
  with SPARK_Mode
is
   
   function Search (A : Ar; I : Integer) return T is
      Curr  : U;
   begin
      Curr  := Ar'First;

      loop
         pragma Loop_Invariant 
           (for all Index in A'First .. Curr - 1 => A (Index) /= I);
         pragma Loop_Variant (Decreases => Ar'Last - Curr);

         if A (Curr) = I then
            return Curr;
         end if;
         
         exit when Curr = Ar'Last;
         
         Curr := Curr + 1;
         
      end loop;

      return 0;
   end Search;
   
end LinearSearch;
