Class {
	#name : 'CFlowUISpPresenter',
	#superclass : 'StFileNavigationSystemPresenter',
	#instVars : [
		'toolbar'
	],
	#category : 'CFlowUI',
	#package : 'CFlowUI'
}

{ #category : 'commands' }
CFlowUISpPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: ((CmCommandGroup named: 'Menu') asSpecGroup
			register: CFlowUIOpenExternalCommand forSpec;
			register: StFileBrowserNewDirectoryCommand forSpec;
			register: StFileBrowserInspectCommand forSpec;	
			register: ((CmCommandGroup named: 'Bookmarks') asSpecGroup
				register: StFileBrowserAddBookmarkCommand forSpec;
				yourself);
			yourself).

]

{ #category : 'defaults' }
CFlowUISpPresenter >> defaultDirectory [ 

	^ StFileBrowserSettings defaultDirectory.
]

{ #category : 'specs' }
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

{ #category : 'initialization' }
CFlowUISpPresenter >> initializeToolbar [

	self toolbar: self newToolbar.
]

{ #category : 'initialization' }
CFlowUISpPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	self previewer: CFlowUICSourcePreviewer new.
	self filter: (StCustomExtensionsFilter extensions: #( '.c' )).
	self defaultFolder: FileLocator home asFileReference.


]

{ #category : 'specs' }
CFlowUISpPresenter >> labelHeight [

	^ self class labelHeight
]

{ #category : 'utilities' }
CFlowUISpPresenter >> openFolder: aFileReference [

	self updateWidgetWithFileReference: aFileReference.
	model openFolder: aFileReference.

]

{ #category : 'TOREMOVE' }
CFlowUISpPresenter >> title [ 

	^ 'CFlow UI'
]

{ #category : 'accessing' }
CFlowUISpPresenter >> toolbar [

	^ toolbar
]

{ #category : 'accessing' }
CFlowUISpPresenter >> toolbar: anObject [

	toolbar := anObject
]

{ #category : 'specs' }
CFlowUISpPresenter >> toolbarHeight [

	^ self class toolbarHeight
]
