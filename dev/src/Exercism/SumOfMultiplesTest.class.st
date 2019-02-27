"
# Sum Of Multiples

Given a number, find the sum of all the unique multiples of particular numbers up to
but not including that number.

If we list all the natural numbers below 20 that are multiples of 3 or 5,
we get 3, 5, 6, 9, 10, 12, 15, and 18.

The sum of these multiples is 78.

## Hint

The trick to this exercise understanding how to iterate accross a range of numbers as well as check a Collection for any multiples that are divisible by a number. Try using the Spotter to look up potential classes and browse the categories of methods in those classes. 

Remember that the Pharo environment is extensively cross referenced. You can right click on any class or method and browse ""references"" to a class (to see how it might be created), as well as ""senders"" of a method (to see how it might be used). 


"
Class {
	#name : #SumOfMultiplesTest,
	#superclass : #ExercismTest,
	#instVars : [
		'sumOfMultiplesCalculator'
	],
	#category : #'Exercism-SumOfMultiples'
}

{ #category : #config }
SumOfMultiplesTest class >> difficulty [
	^3
]

{ #category : #config }
SumOfMultiplesTest class >> topics [
	"Answer a String Array of topics that classify the exercise"
	
	^#('iteration' 'filtering' 'math')
]

{ #category : #config }
SumOfMultiplesTest class >> unlockedBy [
	"Answer the exercise this is dependent on (if core, this is the exercise this one should appear after in the config.json)"
	
	^LeapTest 
]

{ #category : #config }
SumOfMultiplesTest class >> uuid [
	"Answer a unique id for this exercise"
	^'34b0900f-de21-4fef-b24b-f125b608e65e'
]

{ #category : #config }
SumOfMultiplesTest class >> version [
	"Generated from specification: 25 February 2019"
	^'1.5.0'
]

{ #category : #setup }
SumOfMultiplesTest >> setUp [
	sumOfMultiplesCalculator := SumOfMultiples new
]

{ #category : #test }
SumOfMultiplesTest >> testAMuchLargerLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 1000 .
	self assert: result equals: 233168
]

{ #category : #test }
SumOfMultiplesTest >> testAllNumbersAreMultiplesOf1 [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(1 ) limit: 100 .
	self assert: result equals: 4950
]

{ #category : #test }
SumOfMultiplesTest >> testEachMultipleIsOnlyCountedOnce [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 100 .
	self assert: result equals: 2318
]

{ #category : #test }
SumOfMultiplesTest >> testFactorsNotRelativelyPrime [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(4 6 ) limit: 15 .
	self assert: result equals: 30
]

{ #category : #test }
SumOfMultiplesTest >> testMoreThanOneFactorWithMultiplesWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 10 .
	self assert: result equals: 23
]

{ #category : #test }
SumOfMultiplesTest >> testMoreThanOneMultipleWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 ) limit: 7 .
	self assert: result equals: 9
]

{ #category : #test }
SumOfMultiplesTest >> testMuchLargerFactors [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(43 47 ) limit: 10000 .
	self assert: result equals: 2203160
]

{ #category : #test }
SumOfMultiplesTest >> testNoFactorsMeansAnEmptySum [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #() limit: 10000 .
	self assert: result equals: 0
]

{ #category : #test }
SumOfMultiplesTest >> testNoMultiplesWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 1 .
	self assert: result equals: 0
]

{ #category : #test }
SumOfMultiplesTest >> testOneFactorHasMultiplesWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 4 .
	self assert: result equals: 3
]

{ #category : #test }
SumOfMultiplesTest >> testOneFactorIsAMultipleOfAnother [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(5 25 ) limit: 51 .
	self assert: result equals: 275
]

{ #category : #test }
SumOfMultiplesTest >> testSolutionsUsingIncludeexcludeMustExtendToCardinalityGreaterThan3 [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(2 3 5 7 11 ) limit: 10000 .
	self assert: result equals: 39614537
]

{ #category : #test }
SumOfMultiplesTest >> testSomePairsOfFactorsRelativelyPrimeAndSomeNot [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(5 6 8 ) limit: 150 .
	self assert: result equals: 4419
]

{ #category : #test }
SumOfMultiplesTest >> testTheFactor0DoesNotAffectTheSumOfMultiplesOfOtherFactors [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 0 ) limit: 4 .
	self assert: result equals: 3
]

{ #category : #test }
SumOfMultiplesTest >> testTheOnlyMultipleOf0Is0 [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(0 ) limit: 1 .
	self assert: result equals: 0
]

{ #category : #test }
SumOfMultiplesTest >> testThreeFactors [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(7 13 17 ) limit: 20 .
	self assert: result equals: 51
]