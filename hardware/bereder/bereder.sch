EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 5FDE5A33
P 4350 4400
F 0 "Q1" H 4541 4446 50  0000 L CNN
F 1 "BC547" H 4541 4355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4550 4325 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 4350 4400 50  0001 L CNN
	1    4350 4400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q2
U 1 1 5FDE6103
P 4850 4700
F 0 "Q2" H 5041 4746 50  0000 L CNN
F 1 "BC547" H 5041 4655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5050 4625 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 4850 4700 50  0001 L CNN
	1    4850 4700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q4
U 1 1 5FDE66CF
P 6600 4400
F 0 "Q4" H 6791 4446 50  0000 L CNN
F 1 "BC547" H 6791 4355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6800 4325 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 6600 4400 50  0001 L CNN
	1    6600 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FDE772A
P 4450 3850
F 0 "R1" H 4520 3896 50  0000 L CNN
F 1 "1M" H 4520 3805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 4380 3850 50  0001 C CNN
F 3 "~" H 4450 3850 50  0001 C CNN
	1    4450 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FDE9185
P 4950 4150
F 0 "R2" H 5020 4196 50  0000 L CNN
F 1 "100k" H 5020 4105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 4880 4150 50  0001 C CNN
F 3 "~" H 4950 4150 50  0001 C CNN
	1    4950 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FDE95F2
P 6700 3700
F 0 "R5" H 6770 3746 50  0000 L CNN
F 1 "10k" H 6770 3655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 6630 3700 50  0001 C CNN
F 3 "~" H 6700 3700 50  0001 C CNN
	1    6700 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5FDE9F0D
P 6200 4400
F 0 "R4" V 5993 4400 50  0000 C CNN
F 1 "1M" V 6084 4400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 6130 4400 50  0001 C CNN
F 3 "~" H 6200 4400 50  0001 C CNN
	1    6200 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FDEA625
P 5800 4700
F 0 "R3" H 5870 4746 50  0000 L CNN
F 1 "47k" H 5870 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 5730 4700 50  0001 C CNN
F 3 "~" H 5800 4700 50  0001 C CNN
	1    5800 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 5FDEB773
P 5450 3250
F 0 "#PWR0101" H 5450 3100 50  0001 C CNN
F 1 "+3.3V" H 5465 3423 50  0000 C CNN
F 2 "" H 5450 3250 50  0001 C CNN
F 3 "" H 5450 3250 50  0001 C CNN
	1    5450 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5FDEC3F0
P 5450 5300
F 0 "#PWR0102" H 5450 5050 50  0001 C CNN
F 1 "GND" H 5455 5127 50  0000 C CNN
F 2 "" H 5450 5300 50  0001 C CNN
F 3 "" H 5450 5300 50  0001 C CNN
	1    5450 5300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC557 Q3
U 1 1 5FDEE35D
P 5350 3800
F 0 "Q3" H 5541 3754 50  0000 L CNN
F 1 "BC557" H 5541 3845 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5550 3725 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC556BTA-D.pdf" H 5350 3800 50  0001 L CNN
	1    5350 3800
	1    0    0    1   
$EndComp
Wire Wire Line
	5450 5050 5450 5300
Wire Wire Line
	5450 4850 5450 5050
Connection ~ 5450 5050
Wire Wire Line
	5800 4850 5800 5050
Wire Wire Line
	5800 5050 5450 5050
Wire Wire Line
	5450 4550 5450 4400
Wire Wire Line
	5450 4400 5800 4400
Wire Wire Line
	5800 4550 5800 4400
Connection ~ 5800 4400
Wire Wire Line
	5800 4400 6050 4400
Wire Wire Line
	6350 4400 6400 4400
Wire Wire Line
	6700 4200 6700 4000
Wire Wire Line
	6700 4600 6700 5050
Wire Wire Line
	6700 5050 5800 5050
Connection ~ 5800 5050
Text GLabel 6850 4000 2    50   Input ~ 0
sense_out
Wire Wire Line
	6850 4000 6700 4000
Connection ~ 6700 4000
Wire Wire Line
	6700 4000 6700 3850
Text GLabel 3950 4400 0    50   Input ~ 0
sense_antenna
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 5FDFE47D
P 3300 3550
F 0 "J1" H 3408 3931 50  0000 C CNN
F 1 "Header" V 3200 3550 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x05_P1.00mm_Vertical" H 3300 3550 50  0001 C CNN
F 3 "~" H 3300 3550 50  0001 C CNN
	1    3300 3550
	1    0    0    -1  
$EndComp
Text GLabel 3650 3450 2    50   Input ~ 0
sense_antenna
Wire Wire Line
	3500 3450 3650 3450
$Comp
L power:+3.3V #PWR0103
U 1 1 5FE00DC5
P 3600 3250
F 0 "#PWR0103" H 3600 3100 50  0001 C CNN
F 1 "+3.3V" H 3615 3423 50  0000 C CNN
F 2 "" H 3600 3250 50  0001 C CNN
F 3 "" H 3600 3250 50  0001 C CNN
	1    3600 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3350 3600 3350
Wire Wire Line
	3600 3350 3600 3250
$Comp
L power:GND #PWR0104
U 1 1 5FE029E9
P 3600 3850
F 0 "#PWR0104" H 3600 3600 50  0001 C CNN
F 1 "GND" H 3605 3677 50  0000 C CNN
F 2 "" H 3600 3850 50  0001 C CNN
F 3 "" H 3600 3850 50  0001 C CNN
	1    3600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3750 3600 3750
Wire Wire Line
	3600 3750 3600 3850
Text GLabel 3650 3550 2    50   Input ~ 0
sense_out
Wire Wire Line
	3650 3550 3500 3550
Wire Wire Line
	4450 4600 4450 4700
Wire Wire Line
	4450 4700 4650 4700
Wire Wire Line
	4950 4300 4950 4500
Wire Wire Line
	4950 4900 4950 5050
Wire Wire Line
	4950 5050 5450 5050
Wire Wire Line
	5450 4000 5450 4400
Connection ~ 5450 4400
Wire Wire Line
	4950 4000 4950 3800
Wire Wire Line
	4950 3800 5150 3800
Wire Wire Line
	4450 4200 4450 4000
Wire Wire Line
	6700 3550 6700 3400
Wire Wire Line
	6700 3400 5450 3400
Wire Wire Line
	5450 3400 5450 3250
Wire Wire Line
	5450 3600 5450 3400
Connection ~ 5450 3400
Wire Wire Line
	4450 3700 4450 3400
Wire Wire Line
	4450 3400 5450 3400
Wire Wire Line
	3950 4400 4150 4400
$Comp
L Device:CP C1
U 1 1 5FE4BB7A
P 5450 4700
F 0 "C1" H 5568 4746 50  0000 L CNN
F 1 "4.7??" H 5568 4655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5488 4550 50  0001 C CNN
F 3 "~" H 5450 4700 50  0001 C CNN
	1    5450 4700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
