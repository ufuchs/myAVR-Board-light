'
' trafficLights
' Copyright(c) 2014 Uli Fuchs < ufuchs@gmx.com>
' MIT Licensed
'
' [ Whenever you find yourself on the side of the majority, it is time to ]
' [ pause and reflect.                                    - Oscar Wilde - ]
'
'
' -------------------------------------------------------------------------------
' tutors:
' http://www.qsl.net/p/pa3ckr/bascom%20and%20avr/interrupts/index.html
'
'

$regfile = "m8adef.dat"
$crystal = 3686400
$baud = 9600

'
' Port B
'
Ddrb = &B00001110

Rot Alias Portb.3
Gelb Alias Portb.1
Gruen Alias Portb.2

Dim Save_ampel As Byte

'
' Port C
'
Dim Sensor As Integer
Config Adc = Single , Prescaler = Auto , Reference = Avcc

'
' Port D
'
Portd.2 = 1                                                 'set internal pullup

Config Int0 = Low Level
Enable Interrupts
Enable Int0
On Int0 Int0_isr

Dim I As Byte


'
' Main
'
Do

   Sensor = Getadc(1)                                       ' get light sensor

   If Sensor < 350 Then
      Gosub Onnight
   Else
      Gosub Onday
   End If

Loop
End                                                         'end program

'
' Flash
'
Int0_isr:

   Save_ampel = Portb

   Waitms 50

   For I = 0 To 3

      Rot = 1
      Gruen = 1
      Gelb = 1
      Waitms 300

      Rot = 0
      Gruen = 0
      Gelb = 0
      Waitms 300

   Next

   Portb = Save_ampel

Return

'
' OnNight
'
Onnight:

   Rot = 0
   Gruen = 0

   Gelb = 1
   Waitms 500
   Gelb = 0
   Waitms 500

Return

'
' OnDay
'
Onday:

   Rot = 0
   Gelb = 0
   Gruen = 1
   Wait 3
   Gruen = 0
   Gelb = 1
   Wait 2
   Gelb = 0
   Rot = 1
   Wait 3
   Gelb = 1
   Wait 1

Return