# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Travail\s4InfoAtelier4\project_system\_ide\scripts\debugger_project-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Travail\s4InfoAtelier4\project_system\_ide\scripts\debugger_project-default.tcl
# 
connect -url tcp:localhost:4354
targets 3
dow C:/Travail/s4InfoAtelier4/project/Debug/project.elf
bpadd -addr &main
