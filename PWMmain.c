#include "PWM.h"
#include "stdio.h"

#include <math.h>
#include <stdlib.h>

#include "xparameters.h"
#include "xbasic_types.h"
#include "xgpio.h"

#include "stdint.h"	//gives us uint32_t

//double clk = 100000000;   //this is your board clock speed. Note, you probably need to enable the Floating Point Unit in BSB, and change floating support to extended.
const double clk_width = 1/100000000;

void PWM_x(uint32_t BaseAddr, double period, double Duty){

	#define TCSR0	((*(volatile uint32_t *)(BaseAddr+0x00)))
	#define TLR0	((*(volatile uint32_t *)(BaseAddr+0x04)))
	#define TCR0	((*(volatile uint32_t *)(BaseAddr+0x08)))
	#define TCSR1	((*(volatile uint32_t *)(BaseAddr+0x10)))
	#define TLR1	((*(volatile uint32_t *)(BaseAddr+0x14)))
	#define TCR1 	((*(volatile uint32_t *)(BaseAddr+0x18)))

	uint32_t PWM_period = 4000;
	uint32_t PWM_high = (uint32_t)(Duty * PWM_period);

	TLR0 = PWM_period;
	TLR1 = PWM_high;

	TCSR0 = 0x606; //note, this counts down for easier period and high time setting.
	TCSR1 = 0x606;

	while(!(TCSR0 & 0x786)){
		//printf("TCSR0 = %u\n", TCSR0);
	}
	while(!(TCSR1 & 0x786)){
		//printf("TCSR1 = %u\n", TCSR1);

	}

}
