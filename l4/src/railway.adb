package body Railway with SPARK_Mode is

   procedure Open_Route (Route: in Route_Type; Success: out Boolean) is
   begin  
      case Route is
      when Route_Enter_Left =>
         if Segment_State.Left = Free then
            Segment_State.Left := Reserved_Moving_From_Left;
            Success := True;
         else
            Success := False;
         end if;
         
      when Route_Left_Middle =>
         if Segment_State.Left = Occupied_Standing and then Segment_State.Middle = Free then
            Segment_State.Middle := Reserved_Moving_From_Left;
            Segment_State.Left := Occupied_Moving_Right;
            Signal_State.Left_Middle := Green;
            Success := True;
         else
            Success := False;
         end if;
         
      when Route_Middle_Right =>
         if Segment_State.Middle = Occupied_Standing and then Segment_State.Right = Free then
            Segment_State.Middle := Occupied_Moving_Right;
            Segment_State.Right := Reserved_Moving_From_Left;
            Signal_State.Middle_Right := Green;
            Success := True;
         else
            Success := False;
         end if;
         
      when Route_Leave_Right =>
         if Segment_State.Right = Occupied_Standing then
            Segment_State.Right := Occupied_Moving_Right;
            Success := True;
         else
            Success := False;
         end if;
         
      when Route_Enter_Right =>
         if Segment_State.Right = Free then
            Segment_State.Right := Reserved_Moving_From_Right;
            Success := True;
         else
            Success := False;
         end if;
         
      when Route_Right_Middle =>
         if Segment_State.Right = Occupied_Standing and then Segment_State.Middle = Free then
            Segment_State.Middle := Reserved_Moving_From_Right;
            Segment_State.Right := Occupied_Moving_Left;
            Signal_State.Right_Middle := Green;
            Success := True;
         else
            Success := False;
         end if;
         
      when Route_Middle_Left =>
         if Segment_State.Middle = Occupied_Standing and then Segment_State.Left = Free then
            Segment_State.Middle := Occupied_Moving_Left;
            Segment_State.Left := Reserved_Moving_From_Right;
            Signal_State.Middle_Left := Green;
            Success := True;
         else
            Success := False;
         end if;
         
      when Route_Leave_Left =>
         if Segment_State.Left = Occupied_Standing then
            Segment_State.Left := Occupied_Moving_Left;
            Success := True;
         else
            Success := False;
         end if;
         
         --when others => raise Constraint_Error with "Invalid Route";
      end case;
   end Open_Route;
   
   procedure Move_Train (Route: in Route_Type; Success: out Boolean) is
   begin
      case Route is
         when Route_Enter_Left =>
            if Segment_State.Left = Reserved_Moving_From_Left then
               Segment_State.Left := Occupied_Standing;
               Success := True;
            else
               Success := False;
            end if;
            
         when Route_Left_Middle =>
            if Segment_State.Left = Occupied_Moving_Right and Segment_State.Middle = Reserved_Moving_From_Left then
               Segment_State.Left := Free;
               Segment_State.Middle := Occupied_Standing;
               Signal_State.Left_Middle := Red;
               Success := True;
            else
               Success := False;
            end if;
            
         when Route_Middle_Right =>
            if Segment_State.Middle = Occupied_Moving_Right and Segment_State.Right = Reserved_Moving_From_Left then
               Segment_State.Middle := Free;
               Segment_State.Right := Occupied_Standing;
               Signal_State.Middle_Right := Red;
               Success := True;
            else
               Success := False;
            end if;
            
         when Route_Leave_Right =>
            if Segment_State.Right = Occupied_Moving_Right then
               Segment_State.Right := Free;
               Success := True;
            else
               Success := False;
            end if;
            
            when Route_Enter_Right =>
            if Segment_State.Right = Reserved_Moving_From_Right then
               Segment_State.Right := Occupied_Standing;
               Success := True;
            else
               Success := False;
            end if;
            
         when Route_Right_Middle =>
            if Segment_State.Right = Occupied_Moving_Left and Segment_State.Middle = Reserved_Moving_From_Right then
               Segment_State.Right := Free;
               Segment_State.Middle := Occupied_Standing;
               Signal_State.Right_Middle := Red;
               Success := True;
            else
               Success := False;
            end if;
            
         when Route_Middle_Left =>
            if Segment_State.Middle = Occupied_Moving_Left and Segment_State.Left = Reserved_Moving_From_Right then
               Segment_State.Middle := Free;
               Segment_State.Left := Occupied_Standing;
               Signal_State.Middle_Left := Red;
               Success := True;
            else
               Success := False;
            end if;
            
         when Route_Leave_Left =>
            if Segment_State.Left = Occupied_Moving_Left then
               Segment_State.Left := Free;
               Success := True;
            else
               Success := False;
            end if;
            
         when others => raise Constraint_Error with "Invalid Route";
      end case;
   end Move_Train;

end Railway;
