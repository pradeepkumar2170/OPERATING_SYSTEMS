#
# Type 'make' with this 'makefile' file to build the example BLITZ programs.
# It will execute the following commands as needed, based on files'
# most-recent-update times.
# 

all: Echo Hello HelloWorld EchoPrime

Echo.o: Echo.s
	asm Echo.s

Echo: Echo.o
	lddd Echo.o -o Echo

Hello.o: Hello.s
	asm Hello.s

Hello: Hello.o
	lddd Hello.o -o Hello

Runtime.o: Runtime.s
	asm Runtime.s

System.s: System.h System.k
	kpl System -unsafe

System.o: System.s
	asm System.s

HelloWorld.s: HelloWorld.h HelloWorld.k System.h
	kpl HelloWorld

HelloWorld.o: HelloWorld.s
	asm HelloWorld.s

HelloWorld: Runtime.o System.o HelloWorld.o
	lddd Runtime.o System.o HelloWorld.o -o HelloWorld
	
EchoPrime.s: EchoPrime.h EchoPrime.k System.h
	kpl EchoPrime

EchoPrime.o: EchoPrime.s
	asm EchoPrime.s

EchoPrime: Runtime.o System.o EchoPrime.o
	lddd Runtime.o System.o EchoPrime.o -o EchoPrime

clean:
	rm -f Echo.o Echo
	rm -f Hello.o Hello
	rm -f Runtime.o System.s System.o HelloWorld.o HelloWorld.s HelloWorld EchoPrime.o EchoPrime.s EchoPrime
