Class {
	#name : #CFlowUIGraphBuilder,
	#superclass : #Object,
	#instVars : [
		'fileReference',
		'outputDirectory'
	],
	#classVars : [
		'OutputDirectory'
	],
	#category : #CFlowUI
}

{ #category : #accessing }
CFlowUIGraphBuilder class >> cFlowOutputFilenameFor: aFileReference [
	" Answer a <FileReference> with the resulting output of cflow command "

	^ (self outputFilenameFor: aFileReference), '0.png'
]

{ #category : #'instance creation' }
CFlowUIGraphBuilder class >> defaultOutputDirectory [

	^ FileSystem workingDirectory / 'cflow_tmp'
]

{ #category : #'instance creation' }
CFlowUIGraphBuilder class >> newFromFileReference: aFileReference [ 
	" Answer a <FileReference> representing the output graph image given aFileReference C source code "
	^ self new
		outputDirectory: self outputDirectory;
		initializeWithFileReference: aFileReference;
		execCFlow;
		outputFileReference
]

{ #category : #'instance creation' }
CFlowUIGraphBuilder class >> outputDirectory [

	^ OutputDirectory
		ifNil: [ OutputDirectory := self defaultOutputDirectory ]
]

{ #category : #accessing }
CFlowUIGraphBuilder class >> outputFilenameFor: aFileReference [
	" Answer a <String> representing the full path to aFileReference "

	^ String streamContents: [ :stream |
			stream 
				<< self outputDirectory fullName;
				<< DiskStore delimiter;
				<< aFileReference basenameWithoutExtension ]
]

{ #category : #accessing }
CFlowUIGraphBuilder >> buildShellCommand [

	^ String streamContents: [ : stream |
		stream
			<< 'cflow2dot -i ';
			<< self fileReference fullName;
			<< ' -f png -o ';
			<< self outputFilename ]
]

{ #category : #accessing }
CFlowUIGraphBuilder >> execCFlow [

	| command |

	command := OSSUnixSubprocess new
		shellCommand: self buildShellCommand;
		redirectStdout;
		redirectStderr;
	 	runAndWaitOnExitDo: [ :process :outString :errString  |
			"errString inspect.
			outString inspect"  ].
	command closeAndCleanStreams.
]

{ #category : #accessing }
CFlowUIGraphBuilder >> fileReference [

	^ fileReference
]

{ #category : #accessing }
CFlowUIGraphBuilder >> fileReference: aFileReference [ 

	fileReference := aFileReference.
]

{ #category : #accessing }
CFlowUIGraphBuilder >> initializeOutputDirectory [

	self outputDirectory 
		ifNotNil: [ : outDir | outDir asFileReference ensureCreateDirectory ]
		
]

{ #category : #initialization }
CFlowUIGraphBuilder >> initializeWithFileReference: aFileReference [ 

	self fileReference: aFileReference.
	self initializeOutputDirectory.
]

{ #category : #accessing }
CFlowUIGraphBuilder >> outputDirectory [
	" Answer a <String> representing the output path of graph files "

	^ outputDirectory 
		ifNil: [ outputDirectory := self fileReference parent pathString ]
]

{ #category : #accessing }
CFlowUIGraphBuilder >> outputDirectory: anObject [

	outputDirectory := anObject
]

{ #category : #accessing }
CFlowUIGraphBuilder >> outputFileReference [
	" Answer a <FileReference> with the resulting output of cflow command "

	^ (self outputFilename , '0.png') asFileReference
]

{ #category : #accessing }
CFlowUIGraphBuilder >> outputFilename [
	" Answer a <String> representing the full path to the receiver's output file "

	^ self class outputFilenameFor: self fileReference
]
