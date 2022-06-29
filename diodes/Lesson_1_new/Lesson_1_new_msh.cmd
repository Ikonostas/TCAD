Title "Untitled"

Controls {
}

IOControls {
	outputFile = "/mnt/diskX/8209/ilin/Lesson_1_new/Lesson_1_new"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_1" {
		Species = "PhosphorusActiveConcentration"
		Value = 3.66e+18
	}
	Constant "ConstantProfileDefinition_2" {
		Species = "BoronActiveConcentration"
		Value = 3.66e+15
	}
	Refinement "RefinementDefinition_1" {
		MaxElementSize = ( 0.015 0.15 )
		MinElementSize = ( 0.015 0.15 )
	}
	Refinement "RefinementDefinition_2" {
		MaxElementSize = ( 15 0.15 )
		MinElementSize = ( 0.015 0.15 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_1" {
		Reference = "ConstantProfileDefinition_1"
		EvaluateWindow {
			Element = region ["emitter"]
		}
	}
	Constant "ConstantProfilePlacement_2" {
		Reference = "ConstantProfileDefinition_2"
		EvaluateWindow {
			Element = region ["basa"]
		}
	}
	Refinement "RefinementPlacement_1" {
		Reference = "RefinementDefinition_1"
		RefineWindow = region ["emitter"]
	}
	Refinement "RefinementPlacement_2" {
		Reference = "RefinementDefinition_2"
		RefineWindow = region ["basa"]
	}
}

