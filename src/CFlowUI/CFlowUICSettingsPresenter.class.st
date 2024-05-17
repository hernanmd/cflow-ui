"
A small settings presenter for CFlow graph generation.
"
Class {
	#name : 'CFlowUICSettingsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'settingTable'
	],
	#category : 'CFlowUI-UI',
	#package : 'CFlowUI',
	#tag : 'UI'
}

{ #category : 'initialization' }
CFlowUICSettingsPresenter >> initializePresenters [

	settingTable := self newTable.
]

{ #category : 'accessing' }
CFlowUICSettingsPresenter >> settingTable [

	^ settingTable
]

{ #category : 'accessing' }
CFlowUICSettingsPresenter >> settingTable: anObject [

	settingTable := anObject
]
