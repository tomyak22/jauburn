"
MockUIManager used for unit tests
"
Class {
	#name : #MockUIManager,
	#superclass : #Object,
	#instVars : [
		'contentsInput'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
MockUIManager >> contentsInput [
	^ contentsInput
]

{ #category : #accessing }
MockUIManager >> contentsInput: anObject [
	contentsInput := anObject
]

{ #category : #initialization }
MockUIManager >> initialize [ 

	super initialize.
	^self
]

{ #category : #accessing }
MockUIManager >> input: queryString [

	^contentsInput
]
