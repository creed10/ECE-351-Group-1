#include "xparameters.h"
#include "xbasic_types.h"
#include "xgpio.h"
#include "xstatus.h"
#include "my_timer.h"

#define TIMER_RESET   0x00000000
#define TIMER_RUN     0x40000000
#define TIMER_EXPIRED 0x80000000
#define TIMER_HALFSEC 0x02FAF080

XGpio GpioOutput;
unsigned int *my_timer_p =
              (unsigned int *) XPAR_MY_TIMER_0_BASEADDR;

int main (void) {

  Xuint32 my_timer;
  Xuint32 status;

  // Check that the my_timer peripheral exists
  XASSERT_NONVOID(my_timer_p != XNULL);
  my_timer = (Xuint32) my_timer_p;
  // Load the delay register with the delay time of 0.5s
  MY_TIMER_mWriteSlaveReg0(my_timer, TIMER_HALFSEC);

  // Initialize the GPIO driver
  status = XGpio_Initialize(&GpioOutput,
                                  XPAR_LEDS_4BIT_DEVICE_ID);
  if (status != XST_SUCCESS)
    return XST_FAILURE;
  // Set the direction for all signals to be outputs
  XGpio_SetDataDirection(&GpioOutput, 1, 0x0);

  while(1){
    // Turn OFF the LEDs
    XGpio_DiscreteWrite(&GpioOutput, 1, 0xF);
    // Start the timer and wait for it to expire
    MY_TIMER_mWriteSlaveReg1(my_timer, TIMER_RUN);
    while(!(MY_TIMER_mReadSlaveReg1(my_timer) & TIMER_EXPIRED)){}
    // Reset the timer
    MY_TIMER_mWriteSlaveReg1(my_timer, TIMER_RESET);
    // Turn ON the LEDs
    XGpio_DiscreteWrite(&GpioOutput, 1, 0x0);
    // Start the timer and wait for it to expire
    MY_TIMER_mWriteSlaveReg1(my_timer, TIMER_RUN);
    while(!(MY_TIMER_mReadSlaveReg1(my_timer) & TIMER_EXPIRED)){}
    // Reset the timer
    MY_TIMER_mWriteSlaveReg1(my_timer, TIMER_RESET);
  }
}