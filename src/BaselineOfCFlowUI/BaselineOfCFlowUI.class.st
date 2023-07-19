Class {
	#name : #BaselineOfCFlowUI,
	#superclass : #BaselineOf,
	#category : #BaselineOfCFlowUI
}

{ #category : #baselines }
BaselineOfCFlowUI >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'CFlowUI';
				package: 'CFlowUI-Tests'	with: [ spec requires: #(CFlowUI) ];
			
				baseline: 'OSSubprocess'
				with: [ spec repository: 'github://marianopeck/OSSubprocess:master/repository' ];
	
				baseline: 'NewTools' 
				with: [ 
					spec 
						repository: 'github://pharo-spec/NewTools:Pharo12';
						loads: #('FileBrowser') ].
			spec 
				group: 'Core' 						with: #('CFlowUI' 'NewTools' 'OSSubprocess');
				group: 'Tests' 						with: #('CFlowUI' 'CFlowUI-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
