with STM32.Device;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.AFIO; use STM32_SVD.AFIO;
--  with STM32_SVD.GPIO; use STM32_SVD.GPIO;

with STM32.GPIO; use STM32.GPIO;
--  with STM32.Device_Id; use STM32.Device_Id;

procedure Stm32f1xx_Example is

   procedure Init_Periph;
   procedure Delay_Ms;

   procedure Init_Periph is
   begin
      RCC_Periph.APB2ENR.IOPCEN := True;

      AFIO_Periph.MAPR.SWJ_CFG := 2#010#;
   end Init_Periph;

   procedure Delay_Ms is
      foo : Integer := 0;
   begin
      for I in 0 .. 100_000 loop
         foo := foo + 1;
      end loop;
   end Delay_Ms;

   LED_Pin : GPIO_Point renames STM32.Device.PC13;

   --  Device_Id : Device_Id_Tuple := (0, 0, 0);

begin
   --  Device_Id := STM32.Device_Id.Unique_Id;

   Init_Periph;
   LED_Pin.Configure_IO
      ((Mode        => Mode_Out,
        Resistors   => Floating,
        Output_Type => Push_Pull,
        Speed       => Speed_50MHz));

   loop
      LED_Pin.Toggle;
      Delay_Ms;
   end loop;

end Stm32f1xx_Example;
