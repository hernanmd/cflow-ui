Class {
	#name : #CFlowUIOpenExternalCommand,
	#superclass : #CmCommand,
	#category : #CFlowUI
}

{ #category : #converting }
CFlowUIOpenExternalCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #open;
		yourself
]

{ #category : #hooks }
CFlowUIOpenExternalCommand >> buildShellCommand: anEntry [

	^ String streamContents: [ : stream |
		stream
			<< 'open ';
			<< (CFlowUIGraphBuilder cFlowOutputFilenameFor: anEntry) ]
]

{ #category : #executing }
CFlowUIOpenExternalCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	
	self context selectedEntry
		ifNotNil: [ : entry | self executeCommand: entry  ]
]

{ #category : #hooks }
CFlowUIOpenExternalCommand >> executeCommand: entry [

	| command |

	self halt.
	command := OSSUnixSubprocess new
		shellCommand: (self buildShellCommand: entry);
		redirectStdout;
		redirectStderr;
	 	runAndWaitOnExitDo: [ :process :outString :errString  |
			"errString inspect.
			outString inspect"  ].
	command closeAndCleanStreams.			

]

{ #category : #initialization }
CFlowUIOpenExternalCommand >> initialize [
	super initialize.
	self
		name: 'Open';
		description: 'Open the selected file with an external viewer'
]
