"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> GCD [
	
	^'var euclid = function(a,b) { return mod(a,b); };
		var input1 = 5;
		var input2 = 12;
		
		while(input2 !=0) { 
		var remainder = euclid(input1, input2);
		input1 = input2;
		input2 = remainder; }
		
		var test = println(input1);'
		
		
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"

	^'var x = 1;
var y = 10 * x - 1;
if (y == 9) { 
   x = 16;
}
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]

{ #category : #'sample programs' }
JbSamplePrograms class >> squareRootNewton [

	^self
]
