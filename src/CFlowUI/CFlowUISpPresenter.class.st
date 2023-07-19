Class {
	#name : #CFlowUISpPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'treePresenter',
		'graphPresenter',
		'toolbar'
	],
	#category : #CFlowUI
}

{ #category : #specs }
CFlowUISpPresenter >> defaultSpec [

	^ SpBoxLayout newLeftToRight
		add: #treePresenter;
		add: #graphPresenter;
		yourself
]

{ #category : #accessing }
CFlowUISpPresenter >> graphPresenter [

	^ graphPresenter
]

{ #category : #accessing }
CFlowUISpPresenter >> graphPresenter: anObject [

	graphPresenter := anObject
]

{ #category : #TOREMOVE }
CFlowUISpPresenter >> initialExtent [
 
	^ 600 @ 400
]

{ #category : #initialization }
CFlowUISpPresenter >> initializeImagePresenter [

	self graphPresenter: self newImage.

]

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
CFlowUISpPresenter >> initializePresenters [

	self 
		initializeTreePresenter;
		initializeImagePresenter;
		initializeToolbar;
		initializeLayout.
]

{ #category : #initialization }
CFlowUISpPresenter >> initializeToolbar [

	self toolbar: self newToolbar.
]

{ #category : #initialization }
CFlowUISpPresenter >> initializeTreePresenter [

	self treePresenter: (self newTree
		roots: { FileSystem root };
		children: [ : arrayOfFileRef | arrayOfFileRef collect: #children ];
		"displayIcon: [ : aFileReference | self iconNamed: aFileReference systemIconName ];" 
		display: [ : aFileReference | aFileReference basename ];
		contextMenu: [
			SpMenuPresenter new 
				addGroup: [ :group | group 
					addItem: [ :item | item name: self treePresenter selectedItem asString ] ] ];
		yourself)
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

{ #category : #accessing }
CFlowUISpPresenter >> treePresenter [

	^ treePresenter
]

{ #category : #accessing }
CFlowUISpPresenter >> treePresenter: anObject [

	treePresenter := anObject
]
