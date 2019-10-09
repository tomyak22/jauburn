Extension { #name : #JbArity1OperatorNode }

{ #category : #'*Jauburn-Interpreter' }
JbArity1OperatorNode >> evaluateIn: environment [ 

	| opValue |
	opValue := self operand evaluateIn: environment.
	self operator = $-
		ifTrue: [ ^0 - opValue ].
]
