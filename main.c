/******************************************************************************/
/*                                                                            */
/* main.c -- Definition for HYGROI2C demo                                     */
/*                                                                            */
/******************************************************************************/
/* Author: Arthur Brown                                                       */
/* Copyright 2017, Digilent Inc.                                              */
/******************************************************************************/
/* File Description:                                                          */
/*                                                                            */
/* This file defines a demonstration for the use of the Pmod HYGRO IP core.   */
/* Temperature and humidity data are captured from the I2C connection and     */
/* displayed over the serial connection once per second.                      */
/*                                                                            */
/* This application configures UART 16550 to Baud rate 9600. PS7 UART (Zynq)  */
/* is not initialized by this application, since bootrom/bsp configures it to */
/* Baud rate 115200.                                                          */
/*                                                                            */
/*    UART TYPE   BAUD RATE                                                   */
/*    uartns550   9600                                                        */
/*    uartlite    Configurable only in HW design                              */
/*    ps7_uart    115200 (configured by bootrom/bsp)                          */
/*                                                                            */
/******************************************************************************/
/* Revision History:                                                          */
/*                                                                            */
/*    01/30/2017(ArtVVB):   Created                                           */
/*    02/21/2017(ArtVVB):   Validated                                         */
/*    11/08/2017(atangzwj): Validated for Vivado 2016.4                       */
/*    02/17/2018(atangzwj): Validated for Vivado 2017.4                       */
/*                                                                            */
/******************************************************************************/
/*
 * 	TEAM ONE	:	ECE351 Final Project Group
 *
 * 	Engineers	:	Ryan Pauly
 * 					Tanner Fry
 *					Cristian Romo
 *					Hunter Mann
 *
 *
 * 	DATE		:	4/17/2019
 *
 * 	*********************************************
 *
 * 		PURPOSE:
 *
 * 		->	SDK .C code for the Block Design utilizing the MicroBlaze processor.
 * 			PMOD HYGRO interfacing/controller.
 *
 *
 * 		NOTES:
 *
 * 		->	COM4 (not static if host-device is changed) USB Port reads serial info in debug hardware mode.
 *
 ************************************************/
#include "PmodHYGRO.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
//AXI GPIO driver
#include "xgpio.h"
//information about AXI peripherals
#include "xparameters.h"

#include "xbasic_types.h"


#include "stdio.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "xgpio.h"


#include "PWM.h"

#define PWM


#define TCSR0_x	((*(volatile uint32_t *)(XPAR_AXI_TIMER_0_BASEADDR+0x00)))
#define TCSR1_x	((*(volatile uint32_t *)(XPAR_AXI_TIMER_0_BASEADDR+0x10)))









//XPAR_AXI_GPIO_0_DEVICE_ID

//#define PWM1_addr XPAR_TIMER1_BASEADDR
//#define PWM2_addr XPAR_TIMER2_BASEADDR
//#define PWM3_addr XPAR_TIMER3_BASEADDR

/*
int main(){




	//unsigned long BaseAddr, double period, double Duty
	//period is in seconds, and duty cycle is in decimal, not percentage

	print("\n\n");
	PWM_x(XPAR_AXI_TIMER_0_BASEADDR, 0.00004, 0.50);
	print("\r\nsuccess");

	//PWM_x(PWM2_addr, 0.022, 0.5);

	//PWM_x(PWM3_addr, 0.022, 0.25);


	return 1;
}

*/



#define BLANK	10	// Blank pattern index
#define MINUS 	11
// The seven-segment display patterns for digits 0 to 9 and blank.

u32 pattern[14] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x98, 0xFF, 0xBF, 0x9C, 0xC6};
// The patterns for activating the anodes for seven-segment displays 0 to 7, respectively.
u32 anode[8] = {0xFE, 0xFD, 0xFB, 0xF7, 0xEF, 0xDF, 0xBF, 0x7F};



// GPIOs for seven-segment displays and DIP switches
XGpio ssd;
XGpio pwm;



#ifdef __MICROBLAZE__
#define TIMER_FREQ_HZ XPAR_CPU_M_AXI_DP_FREQ_HZ
#else
#define TIMER_FREQ_HZ 100000000
#endif

PmodHYGRO myDevice;

float time1 = 0.0;

void DemoInitialize();
int DemoRun();
void DemoCleanup();
void EnableCaches();
void DisableCaches();

void mostRecentValue(int a);
void displayTemp(float a);
void displayPattern(u32 segment, u32 patIndex);
int Round(float a);


int main() {
	DemoInitialize();
	//7-segment:
	XGpio_Initialize(&ssd, XPAR_AXI_GPIO_0_DEVICE_ID);


	int temp = 0;
	//int temp = Round(((int)(temp_degc * 100)) % 100);
	displayPattern(1, 0);
	displayPattern(0, 0);


	//PWM_x(XPAR_AXI_TIMER_0_BASEADDR, 0.00004, 0.25);


	while(1){

		displayPattern(1, 12);
		displayPattern(0, 13);

		int digits = 0;
		//Find digitCount.
		if(temp >= 10 && temp < 100){
			//2 digit number
			digits = 2;
		}else if(temp < 10){
			//1 digit number
			digits = 1;
		}else{
			//3 digit number
			digits = 3;
		}

		int hundresPlace = 0;
		int tensPlace = 0;
		int onesPlace = 0;

		if(digits == 2){

			tensPlace = temp / 10;

			int hold = 0;
			hold = tensPlace * 10;

			onesPlace = temp - hold;

			displayPattern(3, tensPlace);
			displayPattern(2, onesPlace);
		}

		if(time1 >= 0.000000019)
		{
			//fprintf(stderr, "\n\n\n\n\n");

			TCSR0_x = 0x0; //note, this counts down for easier period and high time setting.
			TCSR1_x = 0x0;

			temp = DemoRun();

			printf("Temperature: %u", temp);

			//PWM_x(XPAR_AXI_TIMER_0_BASEADDR, 0.00004, 0.25);

			if(temp >= 21){
				PWM_x(XPAR_AXI_TIMER_0_BASEADDR, 0.00004, 0.99);
				printf(" DUTY: %.2f\n", 0.99);
			}else{
				PWM_x(XPAR_AXI_TIMER_0_BASEADDR, 0.00004, 0.25);
				printf(" DUTY: %.2f\n", 0.25);
			}

			time1 = 0.0;
		}

		time1 += 0.00000000001;
	}

	DemoCleanup();
	return 0;
}


void DemoInitialize() {
   EnableCaches();
   xil_printf("Init Started\n\r");
   HYGRO_begin(
      &myDevice,
      XPAR_PMODHYGRO_0_AXI_LITE_IIC_BASEADDR,
      0x40, // Chip address of PmodHYGRO IIC
      XPAR_PMODHYGRO_0_AXI_LITE_TMR_BASEADDR,
      XPAR_PMODHYGRO_0_DEVICE_ID,
      TIMER_FREQ_HZ // Clock frequency of AXI bus, used to convert timer data
   );
   xil_printf("Init Done\n\r");
}

void DemoCleanup() {
   DisableCaches();
}

int DemoRun() {
	float temp_degc, hum_perrh, temp_degf;

	temp_degc = HYGRO_getTemperature(&myDevice);
	temp_degf = HYGRO_tempC2F(temp_degc);
	hum_perrh = HYGRO_getHumidity(&myDevice);


	//xil_printf(
		//"Temperature: %d.%02d deg C  Humidity: %d.%02d RH\n\r",
		//(int) temp_degc,
		//((int) (temp_degc * 100)) % 100,
		//(int) hum_perrh,
		//((int) (hum_perrh * 100)) % 100
	//);

	int temp = Round((temp_degc));
	// %f does not work with xil_printf
	// instead, converting float to a pair of ints to display %.2f.

	// 1 sample per second maximum, as per 9.2.1 in HDC1080 reference manual
	//sleep(5);

	return temp;

}




// This function displays a specific pattern on a seven-segment display.
void displayPattern(u32 segment, u32 patIndx)
{
	// Use the anode activation and display patterns to drive the SSD
	XGpio_DiscreteWrite(&ssd, 1, anode[segment]);
	XGpio_DiscreteWrite(&ssd, 2, pattern[patIndx]);

	//Display Temp symbol.

	int t;
	for (t = 0; t < 10000; t++);
}

int Round(float a){

	double integral;
	float fraction = (float)modf(a, &integral);

	if(fraction >= 0.5){
		integral += 1;
	}
	if(fraction <= -0.5){
		integral -= 1;
	}

	return (int)integral;
}



void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#endif
}

