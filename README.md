# ECE-351-Group-1

# Setup

You will need Xilinx's 2017.4 SDK to utilize the wrapper.hdf and main.c code. 

Instructions:

1. Launch SDK
2. Create a new application. WAIT WAIT WAIT
3. Under Target Hardware you need to choose the Hardware Platform. To do this you will hit New...
Once this is selected, hit "Browse" and look for the "new_HYGRO_wrapper_export" and select the HDL file inside.
4. Hit okay and leave the rest as default.
5. You should have returned back to the main "New Application" pop-up. The Hardware Target section should
have updated to show the hardware wrapper location as well as the "MicroBlaze" processor. Create a name.. I used "myHYGRO" and hit okay.
6. Copy the attached main.c file into the src of the project directory (CAREFUL: There should be two project directories, one with just the name and then another named "myHYGRO_bsp", do not get these mixed up.
7. With the Basys3 connected along with the HYGRO Pmod in PMOD slot JC, hit the program FPGA button in the toolbar at the top of the SDK.
8. Next, the way I checked the device was by opening PuTTy and creating a comport connection to the USB port that is connected to the Basys3. (The one that's powering the device). This is a serial connection and will show the printed data from the main.c file.
9. Once the FPGA has been programmed, run the file in debug hardware mode. (Hit the drop-down arrow and select it.)
10. Open program to read from serial / COM ports (PuTTy) and setup connection to COM port the board is connected to to see data.
# OPTIONAL
11. Open python script and setup to read from that COM port rather than PuTTy (note that two programs cannot read the COM port at once), and the python script will take that data and output to a CSV file.
Open CSV file, load in the addon for Excel provided for creating the chart, and run the macro to get a chart of Temperature and Duty Cycles.
