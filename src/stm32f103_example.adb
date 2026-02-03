with STM32.Board; use STM32.Board;
--  with STM32.Device_Id; use STM32.Device_Id;

procedure STM32F103_Example is

   procedure Delay_Ms;

   procedure Delay_Ms is
      foo : Integer := 0;
   begin
      for I in 0 .. 100_000 loop
         foo := foo + 1;
      end loop;
   end Delay_Ms;

   --  Device_Id : Device_Id_Tuple := (0, 0, 0);

begin
   --  Device_Id := STM32.Device_Id.Unique_Id;
   Initialize_Board;

   loop
      Onboard_LED.Toggle;
      Delay_Ms;
   end loop;

end STM32F103_Example;
