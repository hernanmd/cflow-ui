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
				package: 'CFlowUI-Tests'	with: [ spec requires: #(CFlowUI) ].
			spec 
				group: 'Core' 						with: #('CFlowUI');
				group: 'Tests' 						with: #('CFlowUI' 'CFlowUI-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
