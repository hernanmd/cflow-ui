"
A small settings presenter for CFlow graph generation.
"
Class {
	#name : 'CFlowUICSettingsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'settingTable',
		'depthCutOffPresenter',
		'outputFormatPresenter',
		'includesClassesPresenter',
		'outputFilenamePresenter',
		'reversePresenter',
		'mainFunctionPresenter',
		'initialTokenStackSizePresenter',
		'preprocessorCommandPresenter',
		'useIndentationPresenter',
		'allFunctionsPresenter',
		'nestingLevelPresenter'
	],
	#category : 'CFlowUI-UI',
	#package : 'CFlowUI',
	#tag : 'UI'
}

{ #category : 'initialization' }
CFlowUICSettingsPresenter >> builder [

	^ self application builder
]

{ #category : 'layout' }
CFlowUICSettingsPresenter >> defaultLayout [

	^ SpGridLayout new 
		add: 'Depth to cut off' at: 1 @ 1;
		add: depthCutOffPresenter at: 2 @ 1 span: 2 @ 1;
		add: 'Output format' at: 1 @ 2;
		add: outputFormatPresenter at: 2 @ 2 span: 2 @ 1;
		add: 'Include classes' at: 1 @ 3;
		add: includesClassesPresenter at: 2 @ 3 span: 2 @ 1;
		add: 'Output file name' at: 1 @ 4;
		add: outputFilenamePresenter at: 2 @ 4 span: 2 @ 1;
		add: 'Reverse call tree' at: 1 @ 5;
		add: reversePresenter at: 2 @ 5 span: 2 @ 1;
		add: 'Main function' at: 1 @ 6;
		add: mainFunctionPresenter at: 2 @ 6 span: 2 @ 1;
		add: 'Initial token stack size' at: 1 @ 7;
		add: initialTokenStackSizePresenter at: 2 @ 7 span: 2 @ 1;
		add: 'Preprocessor command' at: 1 @ 8;
		add: preprocessorCommandPresenter at: 2 @ 8 span: 2 @ 1;
		add: 'Use indentation' at: 1 @ 9;
		add: useIndentationPresenter at: 2 @ 9 span: 2 @ 1;
		add: 'All functions' at: 1 @ 10;
		add: allFunctionsPresenter at: 2 @ 10 span: 2 @ 1;
		add: 'Nesting level' at: 1 @ 11;
		add: nestingLevelPresenter at: 2 @ 11 span: 2 @ 1;
		beColumnNotHomogeneous;
		yourself
]

{ #category : 'initialization' }
CFlowUICSettingsPresenter >> includeClasses [

	^ #('-' 's' 't' 'x')
]

{ #category : 'initialization' }
CFlowUICSettingsPresenter >> initializePresenters [

	depthCutOffPresenter := self newNumberInput
		minimum: 0;
		number: self builder depthCutOff;
		beInteger;
		help: 'Set the depth at which the flowgraph is cut off.  By default the depth is not limited.';
		yourself.

	outputFormatPresenter := self newDropList
		help: 'Use given output format';
		items: #(gnu posix);
		selectIndex: 1;
		whenSelectedItemChangedDo: [ : outFmt | self builder outputFormat: outFmt ];
		yourself.
		
	includesClassesPresenter := self newDropList
		help: 'Include specified classes of symbols. The ^or- symbol excludes the classes that follow it.
	 _(underscore)    Symbols whose names begin with an underscore.
              s      Static symbols
              t      Typedefs (for cross-references only).
              x      All data symbols, both external and static';
		items: self includeClasses;
		selectIndex: 1;
		whenSelectedItemChangedDo: [ : incClass | self builder includeClasses: incClass ];
		yourself.

	outputFilenamePresenter := self newTextInput
		text: self builder outputFilename;
		help: 'Set output file name (default is -, meaning stdout).';
		yourself.

	reversePresenter := self newCheckBox
		whenActivatedDo: [ ];
		whenDeactivatedDo: [ ];
		state: false;
		help: 'Print reverse call tree.';
		yourself.
	
	mainFunctionPresenter := self newTextInput
		text: self builder mainFunctionName;
		help: 'Main function name';
		whenTextChangedDo: [ : mainFnName | self builder mainFunctionName: mainFnName ];
		yourself.
		
	initialTokenStackSizePresenter := self newNumberInput
		minimum: 0;
		number: self builder initialTokenStackSize;
		beInteger;
		help: 'Set initial token stack size.';
		yourself.
		
	preprocessorCommandPresenter := self newTextInput
		text: self builder preprocessorCommand;
		help: 'Run the specified preprocessor command.';
		whenTextChangedDo: [ : ppCmd | self builder preprocessorCommand: ppCmd ];
		yourself.
		
	useIndentationPresenter := self newCheckBox
		whenActivatedDo: [ self builder useIndentation ];
		whenDeactivatedDo: [ self builder doNotUseIndentation ];
		state: false;
		help: 'Rely on indentation to solve suspicious constructs.';
		yourself.

	allFunctionsPresenter := self newCheckBox
		whenActivatedDo: [ self builder setAllFunctions ];
		whenDeactivatedDo: [ self builder unsetAllFunctions ];
		state: false;
		help: 'Produce graphs for all global functions in the program.  Use this option if your program contains functions
              which are not directly reachable from main().';
		yourself.

	nestingLevelPresenter := self newCheckBox
		whenActivatedDo: [ self builder setPrintNestingLevel ];
		whenDeactivatedDo: [ self builder unsetPrintNestingLevel ];
		state: false;
		help: 'Print nesting level along with the call tree.';
		yourself.
]

{ #category : 'accessing' }
CFlowUICSettingsPresenter >> settingTable [

	^ settingTable
]

{ #category : 'accessing' }
CFlowUICSettingsPresenter >> settingTable: anObject [

	settingTable := anObject
]

{ #category : 'initialization' }
CFlowUICSettingsPresenter >> updateGraphSettingVariable: assoc value: text [
	"Private - User has pressed enter to accept a new variable value"

	self application
		 graphSettingVariablesAt: assoc key
		 put: text.
]
