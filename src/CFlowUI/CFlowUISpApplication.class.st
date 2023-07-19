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

{ #category : #running }
CFlowUISpApplication >> start [ 
	" Private - See superimplementor's comment "

	(CFlowUISpPresenter newApplication: self) open.
]
