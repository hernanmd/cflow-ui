Class {
	#name : 'CFlowUICommandBuilder',
	#superclass : 'Object',
	#instVars : [
		'depthCutOff',
		'includeClasses',
		'outputFilename',
		'mainFunctionName',
		'initialTokenStackSize',
		'preprocessorCommand'
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
CFlowUICommandBuilder >> includeClasses [
	
	^ includeClasses
		ifNil: [ includeClasses := OrderedCollection new ]
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
CFlowUICommandBuilder >> outputFilename [

	^ outputFilename
		ifNil: [ outputFilename := String empty ]
]

{ #category : 'accessing' }
CFlowUICommandBuilder >> preprocessorCommand [

	^ preprocessorCommand
		ifNil: [ preprocessorCommand := String empty ]
]
