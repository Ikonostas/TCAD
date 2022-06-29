File {
* Входные файлы
Grid = "Lesson_1_new_msh.tdr"
*Файл сетки
Parameter = "Silicon.par"
*Файл параметров материалов, входящих в структуру полевого транзистора
* Выходные файлы
Current = "Lesson_2_new_pr.plt"
*Данные для построения выходной характеристики
Plot = "Lesson2_new_pr.tdr"
*Данные для построения распределения полей в структуре
Output = "Lesson2_new_des.log"
*Файл протокола расчёта
}

Electrode {
{ Name="emitter_cont" Voltage=0.0 }
{ Name="basa_cont" Voltage=0.0 }
}

Physics {
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
*- Build-up of initial solution:
Coupled(Iterations=100){ Poisson }
Coupled{ Poisson Electron Hole }
*- Bias drain to target bias
Quasistationary(
InitialStep=0.01 Increment=1.1
MinStep=1e-5 MaxStep=0.2
Goal{ Name="emitter_cont" Voltage= -1.2 }
){ Coupled{ Poisson Electron Hole } }
}
