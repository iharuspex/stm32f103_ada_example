package body STM32.Board is

   --------------------
   -- Initialize_LED --
   --------------------

   procedure Initialize_LED is
   begin
      STM32.Device.Enable_Clock (Onboard_LED);

      Configure_IO
        (Onboard_LED,
         (Mode        => Mode_Out,
          Resistors   => Floating,
          Output_Type => Push_Pull,
          Speed       => Speed_50MHz));
   end Initialize_LED;

   procedure Initialize_Board is
   begin

      Configure_Debug_Ports (Only_SWDP);
      Initialize_LED;

   end Initialize_Board;

end STM32.Board;
