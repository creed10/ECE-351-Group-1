import serial
import csv
import re

serial_port = serial.Serial('COM4', 9600)
print(serial_port.name)
csv_file = open("test.csv",'w', newline='')
writer = csv.writer(csv_file)
while True:
    csv_file = open("test.csv", 'a', newline='')
    writer = csv.writer(csv_file)
    command = serial_port.read(28)
    line = str(command)
    line = re.sub("b'Temperature: ",'',line)
    line = re.sub("DUTY: ",'', line)
    line = line[:7]
    line1 = line.split()
    num1 = int(line1[0])
    num2 = float(line1[1])
    print(num1)
    print(num2)
    writer.writerow({num1, num2})
    csv_file.close()
serialport.close()