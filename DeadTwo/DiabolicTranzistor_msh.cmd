Title ""

Controls {
}

IOControls {
	outputFile="/mnt/DiskX/6205/Lemeshko/WelcomeToHell/DeadTwo/DiabolicTranzistor"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_koll" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+16
	}
	AnalyticalProfile "AnalyticalProfileDefinition_emit" {
		Species = "ArsenicActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+20, ValueAtDepth = 1e+17, Depth = 0.5)
		LateralFunction = Gauss(Factor = 0.8)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_baze" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+18, ValueAtDepth = 1e+16, Depth = 2.75)
		LateralFunction = Gauss(Factor = 0.8)
	}
	Constant "ConstantProfileDefinition_podl2" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+16
	}
	Constant "ConstantProfileDefinition_podl" {
		Species = "BoronActiveConcentration"
		Value = 1e+18
	}
	Refinement "RefinementDefinition_podl" {
		MaxElementSize = ( 280 40 )
		MinElementSize = ( 2 4 )
	}
	Refinement "RefinementDefinition_koll" {
		MaxElementSize = ( 1 0.1 )
		MinElementSize = ( 0.429 0.1 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_podl" {
		Reference = "ConstantProfileDefinition_podl"
		EvaluateWindow {
			Element = Rectangle [(0 0) (280 160)]
		}
	}
	Constant "ConstantProfilePlacement_koll" {
		Reference = "ConstantProfileDefinition_koll"
		EvaluateWindow {
			Element = region ["koll"]
		}
	}
	AnalyticalProfile "AnalyticalProfilePlacement_emit" {
		Reference = "AnalyticalProfileDefinition_emit"
		ReferenceElement {
			Element = Line [(134.52 204.29) (145.48 204.29)]
		}
	}
	AnalyticalProfile "AnalyticalProfilePlacement_baze" {
		Reference = "AnalyticalProfileDefinition_baze"
		ReferenceElement {
			Element = Line [(32.2 204.29) (247.8 204.29)]
		}
	}
	Constant "ConstantProfilePlacement_podl2" {
		Reference = "ConstantProfileDefinition_podl2"
		EvaluateWindow {
			Element = Rectangle [(0 160) (280 200)]
		}
	}
	Refinement "RefinementPlacement_podl" {
		Reference = "RefinementDefinition_podl"
		RefineWindow = region ["podl"]
	}
	Refinement "RefinementPlacement_koll" {
		Reference = "RefinementDefinition_koll"
		RefineWindow = region ["koll"]
	}
}

