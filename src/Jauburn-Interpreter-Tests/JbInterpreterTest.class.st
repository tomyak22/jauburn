Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #tests }
JbInterpreterTest >> testAbsBinding [

	self interpret: 'var x = abs(-100);'.
	self interpret: 'var y = abs(100);'.
	self interpret: 'var z = abs(21);'.
	
	self assert: (interpreter environment at: 'x') equals: 100.
	self assert: (interpreter environment at: 'y') equals: 100.
	self assert: (interpreter environment at: 'z') equals: 21.
]

{ #category : #running }
JbInterpreterTest >> testBooleanExpression [
	
	self interpret: 'var x = true; var z = false;'.
	self assert: (interpreter environment at: 'z') equals: false.
		
	self interpret: 'var x = 1 == 1;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 4 >= 1;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 1 <= 10;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 11 ~= 12;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 10 > 9;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 1 < 2;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 10 <= 10;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 1 >= 1;'.
	self assert: (interpreter environment at: 'x').
	
	self interpret: 'var x = 10 == 1;'.
	self deny: (interpreter environment at: 'x').
]

{ #category : #tests }
JbInterpreterTest >> testConcatBinding [

	self interpret: 'var x = concat("testing", " concat");'.
	self interpret: 'var y = concat("second", " test");'.
	
	self assert: (interpreter environment at: 'x') equals: 'testing concat'.
	self assert: (interpreter environment at: 'y') equals: 'second test'.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
	self interpret: 'var x = 10 - 10 / 2;'.
	self assert: (interpreter environment at: 'x') equals: 5.
	
	self interpret: 'var x = 6;var y = 24/x;'.
	self assert: (interpreter environment at: 'y') equals: 4.
	
	

	

	
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #running }
JbInterpreterTest >> testFunctionCall [

	self interpret: 'var x = function(a, b, c) {return a * b * c;}; var y = x(1, 2, 3);'.
	self assert: (interpreter environment at: 'y') equals: 6.

]

{ #category : #running }
JbInterpreterTest >> testFunctionDefinition [

	self interpret: 'var x = function(a, b, c) {};'.
	self assert: (interpreter environment at: 'x') parameters size equals: 3.
	self assert: (interpreter environment at: 'x') body size equals: 0.
	self assert: (interpreter environment at: 'x') environment equals: interpreter environment.
]

{ #category : #tests }
JbInterpreterTest >> testGCD [

	| x mui |
	mui := MockUIManager new.
	interpreter transcript: Transcript.
	interpreter uimanager: mui.
	x := JbSamplePrograms GCD.
	self interpret: x.
]

{ #category : #tests }
JbInterpreterTest >> testIf [

	self interpret: 'var x = 2; if(1 < 2) {x = 5;};'.
	self assert: (interpreter environment at: 'x') equals: 5.
]

{ #category : #tests }
JbInterpreterTest >> testIfElse [

	self interpret: 'var x = 2; if(1 < 2) {x = 5;} else {var x = 25;};'.
	self assert: (interpreter environment at: 'x') equals: 5.
	
	self interpret: 'var x = 2; if(1 > 2) {x = 5;} else {var x = 25;};'.
	self assert: (interpreter environment at: 'x') equals: 25.
]

{ #category : #tests }
JbInterpreterTest >> testInputBinding [

	| mui |
	mui := MockUIManager new.
	interpreter uimanager: mui.
	
	mui contentsInput: 'Tom'.
	self interpret: 'var x = input("Enter your name (Tom): ");'.
	self assert: (interpreter environment at: 'x') equals: 'Tom'.
]

{ #category : #tests }
JbInterpreterTest >> testLengthBinding [

	self interpret: 'var x = length("test");'.
    self assert: (interpreter environment at: 'x') equals: 4.

	self interpret: 'var y = length("thisIsAnotherTest");'.
    self assert: (interpreter environment at: 'y') equals: 17.
	
]

{ #category : #tests }
JbInterpreterTest >> testModBinding [

	self interpret: 'var x = mod(-100, 10);'.
	self interpret: 'var y = mod(10, 11);'.
	self interpret: 'var z = mod(12, 5);'.
	
	self assert: (interpreter environment at: 'x') equals: 0.
	self assert: (interpreter environment at: 'y') equals: 10.
	self assert: (interpreter environment at: 'z') equals: 2.
]

{ #category : #running }
JbInterpreterTest >> testNotBinding [
	
	self interpret: 'var x = true; var z = not(x);'.
	self assert: (interpreter environment at: 'z') equals: false.
]

{ #category : #tests }
JbInterpreterTest >> testPrintBinding [

	| mt |
	mt := MockTranscript new.
	interpreter transcript: mt. 
	interpreter run: 'var x = print("test");'.
    self assert: mt contents equals: 'test'.
]

{ #category : #tests }
JbInterpreterTest >> testPrintlnBinding [

	| mt |
	mt := MockTranscript new.
	interpreter transcript: mt. 
	interpreter run: 'var x = println("test");'.
    self assert: mt contents equals: 'test
'.
]

{ #category : #tests }
JbInterpreterTest >> testSingleArity [

		self interpret: 'var x = 3;var y = -x;'.
		self assert: (interpreter environment at: 'y') equals: -3.
		
		self interpret: 'var x = -3;var y = -x;'.
		self assert: (interpreter environment at: 'y') equals: 3.
]

{ #category : #tests }
JbInterpreterTest >> testWhile [ 

	self interpret: 'var x = 10;var y = 0;while(x > 0) {y = y + x; x = x - 1;}'.
	self assert: (interpreter environment at: 'y') equals: 55.
]
