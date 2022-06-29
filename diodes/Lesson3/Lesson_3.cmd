Device DIOD
{ Electrode{
{ Name="emitter_cont" Voltage=0.0 }
{ Name="bazza_cont" Voltage=0.0 }
}
File{
Grid = "Lesson_1_new1_msh.tdr"
Plot = "Lesson3_pr.tdr"
Current = "Lesson_3.plt"
Param = "Silicon.par"
}
Physics{
AreaFactor=5e+5
Mobility( DopingDep HighFieldSaturation Enormal )
EffectiveIntrinsicDensity( oldSlotboom )
}
}

File{
Output = "protocol_MOST.log" 
}

System {
Vsource_pset vdd ( 1 0) { sine =(0 3 10000 0 0)  } 
DIOD diod1 ( "emitter_cont"=1 "bazza_cont"=3)
DIOD diod2 ( "emitter_cont"=0 "bazza_cont"=3)
DIOD diod3 ( "emitter_cont"=2 "bazza_cont"=0)
DIOD diod4 ( "emitter_cont"=2 "bazza_cont"=1)
#название диода PMOS pmos1 ( "emotter_cont"=dd "bazza_cont"=out)
Resistor_pset rout (2 3) {resistance = 1000}
Capacitor_pset cout ( 2 3 ){ capacitance = 1e-6 }
Plot "Lesson_3_des.plt" (time() v(1) v(2) v(3) i(diod1,3) i(diod2,0) i(diod3,0) i(diod4,2) i(cout,3) i(rout,3)  )
}

Solve{
Coupled(Iterations=100){ Poisson }
Coupled{ Poisson Electron Hole Contact Circuit }
Transient (
InitialTime=0 FinalTime=5e-4
InitialStep=1e-5 Increment=1.3
MaxStep=5e-5 MinStep=1e-15
){ Coupled{ diod1.poisson diod1.electron diod1.hole diod1.contact
diod2.poisson diod2.electron diod2.hole diod2.contact
diod3.poisson diod3.electron diod3.hole diod3.contact
diod4.poisson diod4.electron diod4.hole diod4.contact
circuit }
}
}
