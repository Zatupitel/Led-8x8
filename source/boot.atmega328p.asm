;;; generated by ../../BootSetup/BootSetup.rb (2016-12-18 22:58:01 +0100)

	.include "ports.ATmega328P.inc"	

;;; ========================================================================
;;; Interrupt Table
;;; ========================================================================

	.org  0                   	
	rjmp  RESET               	
	nop                       	
	rjmp  ISR_INT0            	; INT0
	nop                       	
	reti                      	; INT1
	nop                       	
	reti                      	; PCINT0
	nop                       	
	reti                      	; PCINT1
	nop                       	
	reti                      	; PCINT2
	nop                       	
	reti                      	; WATCHDOG
	nop                       	
	reti                      	; Timer2 Compare A
	nop                       	
	reti                      	; Timer2 Compare B
	nop                       	
	reti                      	; Timer2 Overflow
	nop                       	
	reti                      	; Timer1 Capture
	nop                       	
	reti                      	; Timer1 Compare A
	nop                       	
	reti                      	; Timer1 Compare B
	nop                       	
	reti                      	; Timer1 Overflow
	nop                       	
	reti                      	; Timer0 Compare A
	nop                       	
	reti                      	; Timer0 Compare B
	nop                       	
	reti                      	; Timer0 Overflow
	nop                       	
	reti                      	; SPI
	nop                       	
	reti                      	; USART RX Complete
	nop                       	
	reti                      	; USART UDR Empty
	nop                       	
	reti                      	; USART TX Complete
	nop                       	
	reti                      	; ADC Conversion Complete
	nop                       	
	reti                      	; EEPROM Ready
	nop                       	
	reti                      	; Analog Compare
	nop                       	
	reti                      	; 2-wire Serial Interface
	nop                       	
	reti                      	; Store Program Memory Ready
	nop                       	

;;; ========================================================================
;;; Boot Setup
;;; ========================================================================

RESET:	ldi   r16, 0x00           	; 0
	out   DDRB, r16           	; Port B Data Direction Register [0x04]
	out   PORTB, r16          	; Port B Data Register [0x05]
	out   DDRC, r16           	; Port C Data Direction Register [0x07]
	out   PORTC, r16          	; Port C Data Register [0x08]
	out   DDRD, r16           	; Port D Data Direction Register [0x0a]
	ldi   r17, 0x04           	; 4
	out   PORTD, r17          	; Port D Data Register [0x0b]
	out   TIFR0, r16          	; Timer/Counter 0 Interrupt Flag Register [0x15]
	ldi   r17, 0x01           	; 1
	out   EIMSK, r17          	; External Interrupt Mask Register [0x1d]
	out   TCCR0A, r16         	; Timer/Counter Control Register A [0x24]
	out   TCCR0B, r16         	; Timer/Counter Control Register B [0x25]
	out   TCNT0, r16          	; Timer/Counter Register [0x26]
	out   OCR0A, r16          	; Output Compare Register A [0x27]
	out   OCR0B, r16          	; Output Compare Register B [0x28]
	out   SPCR, r16           	; SPI Control Register [0x2c]
	out   SPSR, r16           	; SPI Status Register [0x2d]
	out   SMCR, r17           	; Sleep Mode Control Register [0x33]
	out   MCUCR, r16          	; MCU Control Register [0x35]
	ldi   r17, 0xef           	; 239
	sts   PRR, r17            	; Power Reduction Register [0x64]
	ldi   r17, 0x02           	; 2
	sts   EICRA, r17          	; External Interrupt Control Register A [0x69]
	sts   TIMSK0, r16         	; Timer/Counter Interrupt Mask Register [0x6e]
	sts   ADCL, r16           	; ADC Data Register Low [0x78]
	sts   ADCH, r16           	; ADC Data Register High [0x79]
	sts   ADCSRA, r16         	; ADC Control and Status Register A [0x7a]
	sts   ADCSRB, r16         	; ADC Control and Status Register B [0x7b]
	sts   ADMUX, r16          	; ADC Multiplexer Selection Register [0x7c]
	sts   DIDR0, r16          	; Digital Input Disable Register 0 [0x7e]
	sts   TWBR, r16           	; TWI Bit Rate Register [0xb8]
	sts   TWSR, r16           	; TWI Status Register [0xb9]
	ldi   r17, 0xfe           	; 254
	sts   TWAR, r17           	; TWI (Slave) Address Register [0xba]
	sts   TWCR, r16           	; TWI Control Register [0xbc]
	sts   TWAMR, r16          	; TWI (Slave) Address Mask Register [0xbd]
	sts   UCSR0A, r16         	; USART Control and Status Register 0 A [0xc0]
	sts   UCSR0B, r16         	; USART Control and Status Register 0 B [0xc1]
	ldi   r17, 0x06           	; 6
	sts   UCSR0C, r17         	; USART Control and Status Register 0 C [0xc2]
	sts   UBRR0L, r16         	; USART Baud Rate Register Low [0xc4]
	sts   UBRR0H, r16         	; USART Baud Rate Register High [0xc5]

	ldi   r17, 0x01           	
	out   MCUCR, r17          	; MCU Control Register [0x35]
	ldi   r17, 0x00           	
	out   MCUCR, r17          	; MCU Control Register [0x35]

	ldi   r17, 0x80           	
	sts   CLKPR, r17          	; Clock Prescale Register [0x61]
	ldi   r17, 0x00           	
	sts   CLKPR, r17          	; Clock Prescale Register [0x61]

	ldi   r17, lo8(RAMEND)    	
	out   SPL, r17            	; Stack Pointer Low [0x3d]
	ldi   r17, hi8(RAMEND)    	
	out   SPH, r17            	; Stack Pointer High [0x3e]
	out   SREG, r16           	; Status Register [0x3f]

	rjmp  Main                	

;;; generated by ../../BootSetup/BootSetup.rb (2016-12-18 22:58:01 +0100)
