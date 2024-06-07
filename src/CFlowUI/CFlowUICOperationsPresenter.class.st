Class {
	#name : 'CFlowUICOperationsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'settingsPresenter',
		'settingDocPresenter'
	],
	#category : 'CFlowUI-UI',
	#package : 'CFlowUI',
	#tag : 'UI'
}

{ #category : 'layout' }
CFlowUICOperationsPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
		add: settingsPresenter;
		add: settingDocPresenter;
		yourself
]

{ #category : 'initialization' }
CFlowUICOperationsPresenter >> initializePresenters [

	settingsPresenter := self instantiate: CFlowUICSettingsPresenter.
	settingDocPresenter := self newText
]
