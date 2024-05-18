"
```language=Pharo
CFlowUISpApplication new run
```
"
Class {
	#name : 'CFlowUISpApplication',
	#superclass : 'SpApplication',
	#instVars : [
		'graphSettings',
		'configurationFile',
		'builder'
	],
	#category : 'CFlowUI-Core',
	#package : 'CFlowUI',
	#tag : 'Core'
}

{ #category : 'world menu' }
CFlowUISpApplication class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'CFlow UI')
		parent: #Tools;
		action: [ self new run ];
		icon: (self iconNamed: self taskbarIconName)
]

{ #category : 'accessing' }
CFlowUISpApplication >> builder [

	^ builder
]

{ #category : 'accessing' }
CFlowUISpApplication >> builder: anObject [

	builder := anObject
]

{ #category : 'accessing' }
CFlowUISpApplication >> configurationFile [
	"Answer a default <FileReference> for storing user defined settings"

	^ configurationFile
		ifNil: [ configurationFile := self defaultConfigurationFile ]
]

{ #category : 'accessing' }
CFlowUISpApplication >> defaultConfigurationFile [
	"Answer a default <FileReference> for storing user defined settings"

	| configFileRef |
	configFileRef := (StartupPreferencesLoader preferencesGeneralFolder / 'cflowui.ston') asFileReference.
	configFileRef ensureCreateFile.
	^ configFileRef.
]

{ #category : 'accessing' }
CFlowUISpApplication >> graphSettingAt: aVariableName [

	^ self graphSettings 
		at: aVariableName
		ifAbsent: [ String empty ]
]

{ #category : 'accessing' }
CFlowUISpApplication >> graphSettings [
	"Answer a <Dictionary> mapping the application's badge variable names and its values"

	^ graphSettings
		ifNil: [ graphSettings := Dictionary new ]
]

{ #category : 'accessing' }
CFlowUISpApplication >> graphSettings: anObject [

	graphSettings := anObject
]

{ #category : 'initialization' }
CFlowUISpApplication >> initialize [

	super initialize.
	self builder: CFlowUICommandBuilder new 
]

{ #category : 'accessing' }
CFlowUISpApplication >> saveDefinedVariables [
	"Save the user defined variables in a configuration file"

	self configurationFile writeStreamDo: [ :out | 
		(STON writer on: out) nextPut: self graphSettings ].

]

{ #category : 'running' }
CFlowUISpApplication >> start [ 
	" Private - See superimplementor's comment "

	(CFlowUISpPresenter 
		newApplication: self 
		model: StFileSystemModel new) open.
]
