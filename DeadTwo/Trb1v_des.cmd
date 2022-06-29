 
File {
* Входные файлы
Grid = "DiabolicTranzistor_msh.tdr"
*Файл сетки
Parameter = "Silicon.par"
*Файл параметров материалов, входящих в структуру полевого транзистора
* Выходные файлы
Current = "Trb1v_des.plt"
*Данные для построения выходной характеристики
Plot = "Trb1v_des.tdr"
*Данные для построения распределения полей в структуре
Output = "Trb1v_des.log"
*Файл протокола расчёта
}


Electrode {
{ Name="emit" Voltage=0.0 }
{ Name="baze" Voltage=0.0 }
{ Name="koll_c0" Voltage=0.0 }
}


Physics {
AreaFactor=11.76
Mobility( DopingDep HighFieldSat Enormal )
EffectiveIntrinsicDensity( OldSlotboom )
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


Solve {
set("baze" mode current)
*- Build-up of initial solution:
Coupled(Iterations=100){ Poisson }
Coupled{ Poisson Electron Hole }
*- Bias drain to target bias
Quasistationary(
InitialStep=0.01 Increment=1.35
MinStep=1e-5 MaxStep=0.2
Goal{ Name="baze" Voltage= 1 }
){ Coupled{ Poisson Electron Hole } }
*- Gate voltage sweep
Quasistationary(
InitialStep=1e-3 Increment=1.35
MinStep=1e-5 MaxStep=0.05
Goal{ Name="koll_c0" Voltage= 11 }
){ Coupled{ Poisson Electron Hole } }
}
