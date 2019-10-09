Class {
	#name : #JbWhileLoopNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'trueStatements'
	],
	#category : #'Jauburn-AST'
}

{ #category : #accessing }
JbWhileLoopNode >> condition [
	^ condition
]

{ #category : #accessing }
JbWhileLoopNode >> condition: anObject [
	condition := anObject
]

{ #category : #'as yet unclassified' }
JbWhileLoopNode >> executeIn: environment [ 

	[ condition evaluateIn: environment ] whileTrue: [ trueStatements do: [ :e | e executeIn: environment ] ]
]

{ #category : #accessing }
JbWhileLoopNode >> trueStatements [
	^ trueStatements
]

{ #category : #accessing }
JbWhileLoopNode >> trueStatements: anObject [
	trueStatements := anObject
]
