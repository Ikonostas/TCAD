Device DIOD
{ Electrode{
{ Name="emitter_cont" Voltage=0.0 }
{ Name="basa_cont" Voltage=0.0 }
}
File{
Grid = "Lesson_1_new_msh.tdr"
Plot = "Lesson_3.tdr"
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
Vsource_pset vin (1 0) { dc = 0.0 }
#Vsource_pset vin (uzel 0) { sine (0 5 1meg 0 0)  } синусоида 
DIOD diod1 ( "emitter_cont"=1 "basa_cont"=3)
DIOD diod2 ( "emitter_cont"=0 "basa_cont"=3)
DIOD diod3 ( "emitter_cont"=2 "basa_cont"=0)
DIOD diod4 ( "emitter_cont"=2 "basa_cont"=1)
#название диода PMOS pmos1 ( "emotter_cont"=dd "bazza_cont"=out)
Resistor_pset rout (2 3) {resistance = 1000}
Capacitor_pset cout ( 2 3 ){ capacitance = 1e-6 }
Plot "Lesson_3_des.plt" (time() v(1) v(2) v(3) i(diod1,3) i(diod2,0) i(diod3,0) i(diod4,2) i(cout,3) i(rout,3)  )
}

Plot {
eDensity hDensity eCurrent hCurrent
Potential SpaceCharge ElectricField
eMobility hMobility eVelocity hVelocity
Doping DonorConcentration AcceptorConcentration
}

Math {
Extrapolate
*off by default
RelErrControl *on by default
Iterations=20 *default = 50
Notdamped=100 *default = 1000
}

Solve{
Coupled(Iterations=100){ Poisson }
Coupled{ Poisson Electron Hole Contact Circuit }
Quasistationary(
InitialStep=1e-3 Increment=1.1
MinStep=1e-5 MaxStep=0.05
Goal{ Parameter=vin.dc Voltage= 2.4 }
){ Coupled{ diod1.poisson diod1.electron diod1.hole diod1.contact
diod2.poisson diod2.electron diod2.hole diod2.contact
diod3.poisson diod3.electron diod3.hole diod3.contact
diod4.poisson diod4.electron diod4.hole diod4.contact
circuit }
}
}
