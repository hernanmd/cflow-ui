Class {
	#name : 'CFlowUICommandBuilder',
	#superclass : 'Object',
	#instVars : [
		'depthCutOff',
		'includeClasses',
		'outputFilename',
		'mainFunctionName',
		'initialTokenStackSize',
		'preprocessorCommand',
		'useIndentation',
		'setAllFunctions',
		'setPrintNestingLevel',
		'outputFormat'
	],
	#category : 'CFlowUI-Core',
	#package : 'CFlowUI',
	#tag : 'Core'
}

{ #category : 'accessing' }
CFlowUICommandBuilder >> depthCutOff [
	
	^ depthCutOff
		ifNil: [ depthCutOff := String empty ]
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> doNotUseIndentation [

	useIndentation := false
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> includeClasses [
	
	^ includeClasses
		ifNil: [ includeClasses := OrderedCollection new ]
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> includeClasses: aString [ 

	self includeClasses addAll: aString
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> initialTokenStackSize [

	^ initialTokenStackSize
		ifNil: [ initialTokenStackSize := 0 ]
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> mainFunctionName [

	^ mainFunctionName
		ifNil: [ mainFunctionName := String empty ]
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> mainFunctionName: aString [ 
	mainFunctionName := aString
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> outputFilename [

	^ outputFilename
		ifNil: [ outputFilename := String empty ]
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> outputFormat: aString [ 

	outputFormat := aString
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> preprocessorCommand [

	^ preprocessorCommand
		ifNil: [ preprocessorCommand := String empty ]
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> setAllFunctions [

	setAllFunctions := true
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> setPrintNestingLevel [

	setPrintNestingLevel := true
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> unsetAllFunctions [

	setAllFunctions := false
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> unsetPrintNestingLevel [

	setPrintNestingLevel := false
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> useIndentation [
	
	useIndentation := true
]
