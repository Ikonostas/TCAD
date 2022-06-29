Title ""

Controls {
}

IOControls {
	outputFile = "/mnt/diskX/8209/Ilin/kursov/kt631"
	EnableSections
}

Definitions {
	AnalyticalProfile "AnalyticalProfileDefinition_1" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1.16e+20, ValueAtDepth = 8e+17, Depth = 2)
		LateralFunction = Gauss(Factor = 0.8)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_2" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1.16e+18, ValueAtDepth = 1.16e+16, Depth = 7.6)
		LateralFunction = Gauss(Factor = 0.8)
	}
	Constant "ConstantProfileDefinition_1" {
		Species = "BoronActiveConcentration"
		Value = 1.16e+16
	}
	Refinement "RefinementDefinition_1" {
		MaxElementSize = ( 2.45 0.63 )
		MinElementSize = ( 2.45 0.63 )
	}
}

Placements {
	AnalyticalProfile "AnalyticalProfilePlacement_1" {
		Reference = "AnalyticalProfileDefinition_1"
		ReferenceElement {
			Element = Line [(31.6 0) (50.4 0)]
		}
	}
	AnalyticalProfile "AnalyticalProfilePlacement_2" {
		Reference = "AnalyticalProfileDefinition_2"
		ReferenceElement {
			Element = Line [(34 0) (463 0)]
		}
	}
	Constant "ConstantProfilePlacement_1" {
		Reference = "ConstantProfileDefinition_1"
		EvaluateWindow {
			Element = region ["tranzistor"]
		}
	}
	Refinement "RefinementPlacement_1" {
		Reference = "RefinementDefinition_1"
		RefineWindow = region ["tranzistor"]
	}
}

