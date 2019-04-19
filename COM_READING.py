import serial
import re
serialport = serial.Serial('COM4', 9600)
print(serialport.name)
while True:    
    command = serialport.read(46)
    print (str(command))
    fo = open("test.txt", 'a')
    s = str(command)
    s = re.sub("b'Temperature:`",'',s)
    s = re.sub("deg C  Humidity:",'',s)
    s = re.sub('RH','',s)
    s = re.sub('  ',' ',s)
    s = s[:12]
    fo.write(s)
    fo.write('\n')
    fo.close()
serialport.close()
