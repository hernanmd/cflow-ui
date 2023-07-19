Class {
	#name : #CFlowUICSourcePreviewer,
	#superclass : #StFBAbstractPreviewer,
	#category : #CFlowUI
}

{ #category : #private }
CFlowUICSourcePreviewer >> buildImageFrom: aFileReference [ 

	^ (CFlowUIGraphBuilder newFromFileReference: aFileReference)
		binaryReadStreamDo: [ :stream | PNGReadWriter formFromStream: stream ]
]

{ #category : #testing }
CFlowUICSourcePreviewer >> matchingMimeType: element [

	^ element matches: ZnMimeType srcCCode
]

{ #category : #templateMethod }
CFlowUICSourcePreviewer >> previewActionOn: aFileReference [

	^ SpImagePresenter new
		autoScale: true;
		image: (self buildImageFrom: aFileReference);
		yourself
]
