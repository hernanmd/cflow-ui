"
Main Presenter of the CFlowUI application.
"
Class {
	#name : 'CFlowUISpPresenter',
	#superclass : 'StFileNavigationSystemPresenter',
	#instVars : [
		'operationsPresenter',
		'toolbarPresenter'
	],
	#category : 'CFlowUI-UI',
	#package : 'CFlowUI',
	#tag : 'UI'
}

{ #category : 'commands' }
CFlowUISpPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: ((CmCommandGroup named: 'StFileBrowserNavigationMenu') asSpecGroup
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

{ #category : 'layout' }
CFlowUISpPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight 
		add: (	SpBoxLayout newTopToBottom
			add: self navigationLayout expand: false;	
			add: self topPaneLayout;
			add: notebookPreviewer;
			yourself);
		add: operationsPresenter;
		yourself
]

{ #category : 'initialization' }
CFlowUISpPresenter >> initializePresenters [

	super initializePresenters.
	self previewer: CFlowUICSourcePreviewer new.
	self filter: (StCustomExtensionsFilter extensions: #( '.c' )).
	self defaultFolder: FileLocator home asFileReference.
	operationsPresenter := self instantiate: CFlowUICOperationsPresenter.

]

{ #category : 'initialization' }
CFlowUISpPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'CFlow UI';
		windowIcon: (self iconNamed: #objects);
		initialExtent: (900 @ 600) scaledByDisplayScaleFactor;
		statusBar: (toolbarPresenter := self newToolbar
			addItemRight: (SpToolbarButtonPresenter new
				label: 'Close';
				icon: (self application iconNamed: #smallCancel);
				action: [ self delete ];
				yourself);
			addItemRight: (SpToolbarButtonPresenter new
				label: 'Update';
				icon: (self application iconNamed: #smallUpdate);				
				action: [ self updateCFlowImage ];
				yourself))
]

{ #category : 'utilities' }
CFlowUISpPresenter >> openFolder: aFileReference [

	self updateWidgetWithFileReference: aFileReference.
	model openFolder: aFileReference.

]

{ #category : 'specs' }
CFlowUISpPresenter >> statusBarHeight [

	^ self class toolbarHeight
]

{ #category : 'utilities' }
CFlowUISpPresenter >> updateCFlowImage [

	self selectedEntry isFile
		ifFalse: [ ^ self ].
	
]
