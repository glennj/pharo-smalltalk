Class {
	#name : #ExampleExtensionMethodTest,
	#superclass : #ExercismTest,
	#category : #ExercismTestRunnerTests
}

{ #category : #private }
ExampleExtensionMethodTest class >> exampleSolutionSourceCode [

	^ 'Extension { #name : #String }

{ #category : #''*ExercismTestRunnerTests'' }
String >> somethingReturned [

	^ ''something returned''
]
'
]

{ #category : #private }
ExampleExtensionMethodTest class >> exampleTestCasesSourceCode [

	^ 'Class {
#name : #ExampleExtensionMethodTest,
#superclass : #ExercismTest,
#category : #ExercismTestRunnerTests
}

{ #category : #''as yet unclassified'' }
ExampleExtensionMethodTest >> testStringExtensionSomethingReturned [
	self assert: String new somethingReturned equals: ''something returned''
]
'
]

{ #category : #config }
ExampleExtensionMethodTest class >> exercise [
	^ (self createExerciseAfter: HelloWorldTest)
		isCore: true;
		difficulty: 1;
		topics: #(''introduction'');
		yourself.
]