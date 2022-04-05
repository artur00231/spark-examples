package body Poly with SPARK_Mode is
   
   function Horner (X : Integer; A : Vector) return Integer is  
      Result : Integer;
      Temp : Integer;
   begin

      
      Result := A(A'Last);
      Temp := A(A'Last) * X ** (A'Last - A'First);
      
      pragma Assert (A'Length > 0);
      pragma Assert (Temp = Result * X ** (A'Last - A'First));
      
      for I in reverse A'First .. A'Last - 1 loop  
         
         --pragma Assert (Temp = Result * X ** (I - A'First ) * X);
         
         Result := Result * X;
         
         --pragma Assert (Temp = Result * X ** (I - A'First));
         
         Result := Result + A(I);
         Temp := Temp + A(I) * X ** (I - A'First);
         
         pragma Assume (Temp = Result * X ** (I - A'First));
         pragma Loop_Invariant (I <= A'Last and I >= A'First);
         pragma Loop_Invariant (I <= A'Last and I >= A'First);
         pragma Loop_Invariant (A'Length > 0);
         
         pragma Loop_Variant (Decreases => (I - A'First));
      end loop;
      
      pragma Assert (Temp = Result);
      
      return Temp;
   end Horner;
   
end Poly;
