"
```language=Pharo
CFlowUISpApplication new run
```
"
Class {
	#name : #CFlowUISpApplication,
	#superclass : #SpApplication,
	#category : #CFlowUI
}

{ #category : #'world menu' }
CFlowUISpApplication class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'CFlow UI')
		parent: #Tools;
		action: [ self new run ];
		icon: (self iconNamed: self taskbarIconName)
]

{ #category : #running }
CFlowUISpApplication >> start [ 
	" Private - See superimplementor's comment "

	(CFlowUISpPresenter newApplication: self) open.
]
