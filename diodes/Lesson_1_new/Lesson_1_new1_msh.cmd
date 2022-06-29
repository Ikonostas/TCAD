Title "Untitled"

Controls {
}

IOControls {
	outputFile = "/mnt/diskX/8209/Ilin/Lesson_1_new/Lesson_1_new1"
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
	Refinement "RefinementDefinition_2" {
		MaxElementSize = ( 15 5 )
		MinElementSize = ( 0.5 1 )
	}
	Refinement "RefinementDefinition_1" {
		MaxElementSize = ( 0.5 5 )
		MinElementSize = ( 0.1 1 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_1" {
		Reference = "ConstantProfileDefinition_1"
		EvaluateWindow {
			Element = region ["emit"]
		}
	}
	Constant "ConstantProfilePlacement_2" {
		Reference = "ConstantProfileDefinition_2"
		EvaluateWindow {
			Element = region ["baas"]
		}
	}
	Refinement "RefinementPlacement_2" {
		Reference = "RefinementDefinition_2"
		RefineWindow = region ["baas"]
	}
	Refinement "RefinementPlacement_1" {
		Reference = "RefinementDefinition_1"
		RefineWindow = region ["emit"]
	}
}

