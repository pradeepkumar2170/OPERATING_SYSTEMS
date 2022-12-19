! Name of package being compiled: EchoPrime
! 
! Symbols from runtime.s
	.import	_putString
	.import	_heapInitialize
	.import	_heapAlloc
	.import	_heapFree
	.import	_IsKindOf
	.import	_RestoreCatchStack
	.import	_PerformThrow
	.import	_runtimeErrorOverflow
	.import	_runtimeErrorZeroDivide
	.import	_runtimeErrorNullPointer
	.import	_runtimeErrorUninitializedObject
	.import	_runtimeErrorWrongObject
	.import	_runtimeErrorWrongObject2
	.import	_runtimeErrorWrongObject3
	.import	_runtimeErrorBadObjectSize
	.import	_runtimeErrorDifferentArraySizes
	.import	_runtimeErrorWrongArraySize
	.import	_runtimeErrorUninitializedArray
	.import	_runtimeErrorBadArrayIndex
	.import	_runtimeErrorNullPointerDuringCall
	.import	_runtimeErrorArrayCountNotPositive
	.import	_runtimeErrorRestoreCatchStackError
	.text
! ErrorDecls
	.import	_Error_P_System_UncaughtThrowError
	.align
! Functions imported from other packages
	.import	print
	.import	printInt
	.import	printHex
	.import	printChar
	.import	GetCh
	.import	printBool
	.import	printDouble
	.import	_P_System_nl
	.import	RuntimeExit
	.import	getCatchStack
	.import	MemoryZero
	.import	MemoryCopy
	.import	_P_System_KPLMemoryInitialize
	.import	_P_System_KPLMemoryAlloc
	.import	_P_System_KPLMemoryFree
	.import	_P_System_KPLUncaughtThrow
	.import	_P_System_KPLIsKindOf
	.import	_P_System_KPLSystemError
! Externally visible functions in this package
	.export	_mainEntry
	.export	main
! The following class and its methods are from other packages
	.import	_P_System_Object
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
! Global variables in this package
	.data
	.align
	.text
! 
! =====  MAIN ENTRY POINT  =====
! 
_mainEntry:
	set	_packageName,r2		! Get CheckVersion started
	set	0x3049a8c8,r3		! .  hashVal = 810133704
	call	_CheckVersion_P_EchoPrime_	! .
	cmp	r1,0			! .
	be	_Label_3		! .
	ret				! .
_Label_3:				! .
	call	_heapInitialize
	jmp	main
! 
! Source Filename and Package Name
! 
_sourceFileName:
	.ascii	"EchoPrime.k\0"
_packageName:
	.ascii	"EchoPrime\0"
	.align
!
! CheckVersion
!
!     This routine is passed:
!       r2 = ptr to the name of the 'using' package
!       r3 = the expected hashVal for 'used' package (myPackage)
!     It prints an error message if the expected hashVal is not correct
!     It then checks all the packages that 'myPackage' uses.
!
!     This routine returns:
!       r1:  0=No problems, 1=Problems
!
!     Registers modified: r1-r4
!
_CheckVersion_P_EchoPrime_:
	.export	_CheckVersion_P_EchoPrime_
	set	0x3049a8c8,r4		! myHashVal = 810133704
	cmp	r3,r4
	be	_Label_4
	set	_CVMess1,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess2,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess3,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess4,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess5,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess6,r1
	call	_putString
	mov	1,r1
	ret	
_Label_4:
	mov	0,r1
! Make sure _P_System_ has hash value 0x138262ef (decimal 327312111)
	set	_packageName,r2
	set	0x138262ef,r3
	call	_CheckVersion_P_System_
	.import	_CheckVersion_P_System_
	cmp	r1,0
	bne	_Label_5
_Label_5:
	ret
_CVMess1:	.ascii	"\nVERSION CONSISTENCY ERROR: Package '\0"
_CVMess2:	.ascii	"' uses package '\0"
_CVMess3:	.ascii	"'.  Whenever a header file is modified, all packages that use that package (directly or indirectly) must be recompiled.  The header file for '\0"
_CVMess4:	.ascii	"' has been changed since '\0"
_CVMess5:	.ascii	"' was compiled last.  Please recompile all packages that depend on '\0"
_CVMess6:	.ascii	"'.\n\n\0"
	.align
! 
! ===============  FUNCTION main  ===============
! 
main:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor_main,r1
	push	r1
	mov	3,r13		! source line 3
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! WHILE STATEMENT...
	mov	4,r13		! source line 4
	mov	"\0\0WH",r10
_Label_6:
!	_Label_7	jmp	_Label_7
_Label_7:
	mov	4,r13		! source line 4
	mov	"\0\0WB",r10
! CALL STATEMENT...
!   Call the function
	mov	5,r13		! source line 5
	mov	"\0\0CA",r10
	call	_function_2_KeyInput
! END WHILE...
	jmp	_Label_6
_Label_8:
! 
! Routine Descriptor
! 
_RoutineDescriptor_main:
	.word	_sourceFileName
	.word	_Label_9
	.word	0		! total size of parameters
	.word	0		! frame size = 0
	.word	0
_Label_9:
	.ascii	"main\0"
	.align
! 
! ===============  FUNCTION KeyInput  ===============
! 
_function_2_KeyInput:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_2_KeyInput,r1
	push	r1
	mov	2,r1
_Label_25:
	push	r0
	sub	r1,1,r1
	bne	_Label_25
	mov	9,r13		! source line 9
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	11,r13		! source line 11
	mov	"\0\0AS",r10
!   Call the function
	mov	11,r13		! source line 11
	mov	"\0\0CE",r10
	call	GetCh
!   Retrieve Result: targetName=input  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-10]
! IF STATEMENT...
	mov	12,r13		! source line 12
	mov	"\0\0IF",r10
!   _temp_12 = input XOR 113		(bool)
	loadb	[r14+-10],r1
	mov	113,r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_12 then goto _Label_11 else goto _Label_10
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_10
	jmp	_Label_11
_Label_10:
! THEN...
	mov	13,r13		! source line 13
	mov	"\0\0TN",r10
! --------------------  DEBUG  --------------------
	mov	13,r13		! source line 13
	mov	"\0\0DE",r10
	debug
! END IF...
_Label_11:
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=input  sizeInBytes=1
	loadb	[r14+-10],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	15,r13		! source line 15
	mov	"\0\0CE",r10
	call	printChar
! CALL STATEMENT...
!   Call the function
	mov	16,r13		! source line 16
	mov	"\0\0CA",r10
	call	_function_1_printCharacter
! RETURN STATEMENT...
	mov	16,r13		! source line 16
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_2_KeyInput:
	.word	_sourceFileName
	.word	_Label_13
	.word	0		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_14
	.word	-9
	.word	1
	.word	_Label_15
	.word	-10
	.word	1
	.word	0
_Label_13:
	.ascii	"KeyInput\0"
	.align
_Label_14:
	.byte	'C'
	.ascii	"_temp_12\0"
	.align
_Label_15:
	.byte	'C'
	.ascii	"input\0"
	.align
! 
! ===============  FUNCTION printCharacter  ===============
! 
_function_1_printCharacter:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_1_printCharacter,r1
	push	r1
	mov	2,r1
_Label_26:
	push	r0
	sub	r1,1,r1
	bne	_Label_26
	mov	19,r13		! source line 19
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! WHILE STATEMENT...
	mov	21,r13		! source line 21
	mov	"\0\0WH",r10
_Label_16:
!	_Label_17	jmp	_Label_17
_Label_17:
	mov	21,r13		! source line 21
	mov	"\0\0WB",r10
! ASSIGNMENT STATEMENT...
	mov	22,r13		! source line 22
	mov	"\0\0AS",r10
!   Call the function
	mov	22,r13		! source line 22
	mov	"\0\0CE",r10
	call	GetCh
!   Retrieve Result: targetName=input  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-10]
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=input  sizeInBytes=1
	loadb	[r14+-10],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	23,r13		! source line 23
	mov	"\0\0CE",r10
	call	printChar
! IF STATEMENT...
	mov	24,r13		! source line 24
	mov	"\0\0IF",r10
!   _temp_21 = input XOR 10		(bool)
	loadb	[r14+-10],r1
	mov	10,r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_21 then goto _Label_20 else goto _Label_19
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_19
	jmp	_Label_20
_Label_19:
! THEN...
	mov	25,r13		! source line 25
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	25,r13		! source line 25
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_20:
! END WHILE...
	jmp	_Label_16
_Label_18:
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_1_printCharacter:
	.word	_sourceFileName
	.word	_Label_22
	.word	0		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_23
	.word	-9
	.word	1
	.word	_Label_24
	.word	-10
	.word	1
	.word	0
_Label_22:
	.ascii	"printCharacter\0"
	.align
_Label_23:
	.byte	'C'
	.ascii	"_temp_21\0"
	.align
_Label_24:
	.byte	'C'
	.ascii	"input\0"
	.align
