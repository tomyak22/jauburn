Class {
	#name : #JbFunctionCallNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'arguments'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionCallNode >> arguments [
	^ arguments
]

{ #category : #accessing }
JbFunctionCallNode >> arguments: anObject [
	arguments := anObject
]

{ #category : #'as yet unclassified' }
JbFunctionCallNode >> evaluateIn: environment [ 
	
	| evaldArgs |
	
	evaldArgs := arguments collect: [ :arg | arg evaluateIn: environment ].
	
	^(environment at: identifier) call: evaldArgs in: environment.
]

{ #category : #accessing }
JbFunctionCallNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbFunctionCallNode >> identifier: anObject [
	identifier := anObject
]
