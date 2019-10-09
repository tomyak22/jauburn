"
MockTranscript used to test printBinding and printlnBinding
"
Class {
	#name : #MockTranscript,
	#superclass : #Object,
	#instVars : [
		'contentsToShow'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
MockTranscript >> contents [

	^contentsToShow contents.
]

{ #category : #'stop conditions' }
MockTranscript >> cr [ 

	contentsToShow nextPut: Character cr
]

{ #category : #initialization }
MockTranscript >> initialize [ 

	contentsToShow := String new writeStream.
]

{ #category : #showing }
MockTranscript >> show: anObject [

	^contentsToShow nextPutAll: anObject 
]
