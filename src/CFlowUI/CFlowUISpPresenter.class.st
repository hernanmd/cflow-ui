Class {
	#name : #CFlowUISpPresenter,
	#superclass : #StFBFileNavigationSystemPresenter,
	#instVars : [
		'toolbar'
	],
	#category : #CFlowUI
}

{ #category : #specs }
CFlowUISpPresenter >> initializeLayout [

	^ self layout: (SpBoxLayout newTopToBottom
		add: #toolbar height: self toolbarHeight + 10;
		add: (SpPanedLayout newLeftToRight
			positionOfSlider: 30 percent;
			add: #treePresenter;
			add: #graphPresenter;
			yourself);
		yourself)
]

{ #category : #initialization }
CFlowUISpPresenter >> initializeToolbar [

	self toolbar: self newToolbar.
]

{ #category : #initialization }
CFlowUISpPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	self previewer: CFlowUICSourcePreviewer new.
	self filter: (StFBCustomExtensionsFilter extensions: #( '.c' )).
	self defaultFolder: FileLocator home asFileReference.


]

{ #category : #specs }
CFlowUISpPresenter >> labelHeight [

	^ self class labelHeight
]

{ #category : #TOREMOVE }
CFlowUISpPresenter >> title [ 

	^ 'CFlow UI'
]

{ #category : #accessing }
CFlowUISpPresenter >> toolbar [

	^ toolbar
]

{ #category : #accessing }
CFlowUISpPresenter >> toolbar: anObject [

	toolbar := anObject
]

{ #category : #specs }
CFlowUISpPresenter >> toolbarHeight [

	^ self class toolbarHeight
]
