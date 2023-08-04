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
				baseline: 'OSSubprocess'
				with: [ spec repository: 'github://marianopeck/OSSubprocess:master/repository' ];
	
				baseline: 'NewTools' 
				with: [ 
					spec 
						repository: 'github://pharo-spec/NewTools:Pharo12';
						loads: #('FileBrowser') ].

			spec 
				package: 'CFlowUI'      with: [ spec requires: #(OSSubprocess NewTools) ];
				package: 'CFlowUI-Tests'	with: [ spec requires: #(CFlowUI) ].
			
			spec 
				group: 'Core' 						with: #('CFlowUI' 'NewTools' 'OSSubprocess');
				group: 'Tests' 						with: #('CFlowUI' 'CFlowUI-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
