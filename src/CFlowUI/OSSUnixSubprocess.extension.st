Extension { #name : 'OSSUnixSubprocess' }

{ #category : '*CFlowUI' }
OSSUnixSubprocess >> collectArgumentPointersInto: aPointer [
	"Allocates each string argument with a null terminated char and add them into aPointer"
	
	"#allButLast is because the last is 0."
	self argVArguments allButLast withIndexDo: [ :string :index |
		| pointer | "0 terminated"
		pointer := ExternalAddress allocate: string size + 1.
		self registerPointer: pointer.
		LibC memCopy: string to: pointer size: string size.
		pointer uint8AtOffset: string size put: 0. "string terminating null char"
		aPointer platformUnsignedLongAt: ((index - 1) * self systemAccessor sizeOfPointer) + 1 put: pointer value ].

	aPointer platformUnsignedLongAt: ((self argVArguments size - 1) * self systemAccessor sizeOfPointer) + 1 put: 0.
]

{ #category : '*CFlowUI' }
OSSUnixSubprocess >> collectEnvVariablesPointersInto: aPointer [
	"Creates the pair of KEY=VALUE string, allocating the memory and adding a null terminated char to each of the env.
	Each processed pair of KEY=VALUE is added to aPointer. "
	envVariables keys withIndexDo: [ :aKey :index |
		| string pointer | 
		string := aKey trimmed , '=', (envVariables at: aKey) trimmed. 
		"The +1 is because string must be NULL terminated"
		pointer := ExternalAddress allocate: string size + 1.
		self registerPointer: pointer.
		LibC memCopy: string to: pointer size: string size.
		pointer uint8AtOffset: string size put: 0. "string terminating null char"
		aPointer platformUnsignedLongAt: ((index - 1) * self systemAccessor sizeOfPointer) + 1 put: pointer value
	].
	"The array of pointers also needs to finish with a NULL"
	aPointer platformUnsignedLongAt: (envVariables keys size * self systemAccessor sizeOfPointer) + 1 put: 0

]
