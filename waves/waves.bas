'
' waves
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
' set /p x="æµº¹²³©+" <nul >\\.\COM22
'
' http://batchloaf.wordpress.com/2013/02/12/simple-trick-for-sending-characters-to-a-serial-port-in-windows/
'    e6   b5 ba  b9  b2  b3  a9  2b    ein
'    230 181 186 185 178 179 169 43
'
'                                 2d    aus
'                                 45

' Mode Com13 Baud = 115200 Parity = N Data = 8

$regfile = "m8adef.dat"
$crystal = 3686400
$baud = 9600

Config Timer1 = Pwm , Prescale = 1 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up

'
' Port B
'
' Ddrb = &B00001110

Rot Alias Portb.3
Gelb Alias Pwm1a
Gruen Alias Pwm1b

'
' Port D
'
Portd.2 = 1                                                 'set internal pullup

Dim I As Byte

'
' Main
'
I = 0

Do

   Do

      Gruen = I

      Incr I

      Waitms 10

   Loop Until I = 255

   Do

      Gruen = I

      Decr I

      Waitms 10

   Loop Until I = 20





Loop
End                                                         'end program
