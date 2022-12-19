code EchoPrime
  
	function main ()
		while true
			KeyInput()
		endWhile
	endFunction
	
	function KeyInput()
		var input: char
		input = GetCh()
		if input == 'q'
			debug
		endIf
		printChar(input)
		printCharacter()     -- This function call is to continue operation if q falls in between.
	endFunction

	function printCharacter()
		var input: char
		while true
			input = GetCh()
			printChar(input)
			if input == '\n'
				return
			endIf
		endWhile
	endFunction
	
endCode
