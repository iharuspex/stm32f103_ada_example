with STM32.Device; use STM32.Device;
with STM32.GPIO;   use STM32.GPIO;

--  Bluepill board
package STM32.Board is
   pragma Elaborate_Body;

   subtype User_LED is GPIO_Point;
   Onboard_LED : GPIO_Point renames STM32.Device.PC13;

   procedure Initialize_LED;

   procedure Turn_On (This : in out User_LED) renames STM32.GPIO.Clear;
   procedure Turn_Off (This : in out User_LED) renames STM32.GPIO.Set;
   procedure Toggle (This : in out User_LED) renames STM32.GPIO.Toggle;

   procedure Initialize_Board;

end STM32.Board;
