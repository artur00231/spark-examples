package body Selection with SPARK_Mode is

   procedure Sort (A : in out Arr)
   is
      tmp : Integer;
      MinIndex : Integer;
   begin
      
      if A'First >= A'Last then 
         return;
      end if;

      for I in A'First .. A'Last loop
         
         MinIndex := I;
         for J in I .. A'Last loop
         
            if A(MinIndex) > A(J) then 
               MinIndex := J;
            end if;
            
            pragma Loop_Invariant (MinIndex <= A'Last and MinIndex >= A'First);
            pragma Loop_Invariant (for all K in I .. J => A(K) >= A(MinIndex));
            pragma Loop_Invariant (MinIndex >= I);
            pragma Loop_Invariant (for all K in A'First .. I - 1 => A(K) <= A(MinIndex));
           
         
         end loop;

         tmp := A(I);
         A(I) := A(MinIndex);
         A(MinIndex) := tmp;
         
         pragma Loop_Invariant (for all K in I + 1 .. A'Last => A(K) >= A(I));
         pragma Loop_Invariant (for all K in A'First .. I - 1 => A(K) <= A(I));
         pragma Loop_Invariant (Sorted(A(A'First .. I)));
         
      end loop;

   end Sort;

end Selection;
