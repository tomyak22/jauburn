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

{ #category : #running }
JbInterpreterTest >> testNotBinding [
	
	self interpret: 'var x = true; var z = not(x);'.
	self assert: (interpreter environment at: 'z') equals: false.
]
