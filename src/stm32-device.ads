with STM32_SVD; use STM32_SVD;

with STM32.GPIO; use STM32.GPIO;

package STM32.Device is
   --  pragma Elaborate_Body;

   GPIO_C : aliased GPIO_Port with Import, Volatile, Address => STM32_SVD.GPIOC_Base;

   PC13 : aliased GPIO_Point := (GPIO_C'Access, Pin_13);
private
end STM32.Device;