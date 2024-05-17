"
Main Presenter of the CFlowUI application.
"
Class {
	#name : 'CFlowUISpPresenter',
	#superclass : 'StFileNavigationSystemPresenter',
	#instVars : [
		'statusBar',
		'graphSettingPresenter'
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

{ #category : 'specs' }
CFlowUISpPresenter >> initializeLayout [

	^ self layout: (SpBoxLayout newTopToBottom
		add: (SpPanedLayout newLeftToRight
			positionOfSlider: 30 percent;
			add: (SpBoxLayout newLeftToRight
				add: #treePresenter;
				add: #graphSettingPresenter;
				yourself);
			add: #previewPresenter;
			yourself);
		add: statusBar height: self statusBarHeight;
		yourself)
]

{ #category : 'initialization' }
CFlowUISpPresenter >> initializePresenters [

	super initializePresenters.
	self previewer: CFlowUICSourcePreviewer new.
	self filter: (StCustomExtensionsFilter extensions: #( '.c' )).
	self defaultFolder: FileLocator home asFileReference.
	graphSettingPresenter := CFlowUICSettingsPresenter new.
]

{ #category : 'initialization' }
CFlowUISpPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter 
		title: 'CFlow UI';
		windowIcon: (self iconNamed: #objects);
		initialExtent: (900 @ 600) scaledByDisplayScaleFactor;
		statusBar: (statusBar := SpStatusBarPresenter new)
]

{ #category : 'utilities' }
CFlowUISpPresenter >> openFolder: aFileReference [

	self updateWidgetWithFileReference: aFileReference.
	model openFolder: aFileReference.

]

{ #category : 'specs' }
CFlowUISpPresenter >> statusBarHeight [

	^ self class statusBarHeight
]
