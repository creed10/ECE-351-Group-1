#include "PWM.h"
#include "stdio.h"

#include <math.h>
#include <stdlib.h>

#include "stdio.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xgpio.h"




void PWM_x(u64 BaseAddr, double period, double Duty){

double clk = 100000000;   //this is your board clock speed. Note, you probably need to enable the Floating Point Unit in BSB, and change floating support to extended.

double clk_width = 1/clk;




#define TCSR0 (*(volatile u64 *)(BaseAddr+0x00))
#define TLR0 (*(volatile u64 *)(BaseAddr+0x04))
#define TCR0 (*(volatile u64 *)(BaseAddr+0x08))
#define TCSR1 (*(volatile u64 *)(BaseAddr+0x10))
#define TLR1 (*(volatile u64 *)(BaseAddr+0x14))
#define TCR1 (*(volatile u64 *)(BaseAddr+0x18))


u64 PWM_period = period/clk_width;
u64 PWM_high = Duty * PWM_period;



//TLR0 = 0x2625900;
//TLR1 = 0x16E3500;

TLR0 = PWM_period;
TLR1 = PWM_high;

TCSR0 = 0x606; //note, this counts down for easier period and high time setting.

TCSR1=0x606; //

 

putnum(BaseAddr);


//print("PWM test");


}
