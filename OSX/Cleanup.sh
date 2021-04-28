cd ~/Downloads
rm */system.xml
rm -rf */BACKINFO
rm -rf */CS
for i in *; do mv $i/RAPID/TASK1/PROGMOD/*.mod $i; done
for i in *; do mv $i/RAPID/TASK2/PROGMOD/*.mod $i; done
for i in *; do mv $i/RAPID/TASK3/PROGMOD/*.mod $i; done
for i in *; do mv $i/RAPID/TASK4/PROGMOD/*.mod $i; done
for i in *; do mv $i/RAPID/TASK5/PROGMOD/*.mod $i; done
for i in *; do mv $i/RAPID/TASK6/PROGMOD/*.mod $i; done
for i in *; do mv $i/RAPID/TASK1/SYSMOD/*.sys $i; done
for i in *; do mv $i/RAPID/TASK3/SYSMOD/CommRoutines.sys $i; done
for i in *; do git diff --no-index --quiet $i/RobotRoutines.sys ~/Desktop/Loadset/bpr_modules/RobotRoutines.sys && rm $i/RobotRoutines.sys; done
for i in *; do git diff --no-index --quiet $i/CommRoutines.sys ~/Desktop/Loadset/bpr_modules/CommRoutines.sys && rm $i/CommRoutines.sys; done
for i in *; do git diff --no-index --quiet $i/DataStructures.sys ~/Desktop/Loadset/bpr_modules/DataStructures.sys && rm $i/DataStructures.sys; done
for i in *; do git diff --no-index --quiet $i/Library.sys ~/Desktop/Loadset/bpr_modules/Library.sys && rm $i/Library.sys; done
for i in *; do git diff --no-index --quiet $i/Sequencer.sys ~/Desktop/Loadset/bpr_modules/Sequencer.sys && rm $i/Sequencer.sys; done
for i in *; do git diff --no-index --quiet $i/BeltMonitor.mod ~/Desktop/Loadset/bpr_modules/BeltMonitor.mod && rm $i/BeltMonitor.mod; done
for i in *; do git diff --no-index --quiet $i/InterruptTask.mod ~/Desktop/Loadset/bpr_modules/InterruptTask.mod && rm $i/InterruptTask.mod; done
for i in *; do git diff --no-index --quiet $i/PollTask.mod ~/Desktop/Loadset/bpr_modules/PollTask.mod && rm $i/PollTask.mod; done
rm */user.sys
rm -rf */RAPID
rm -rf */HOME
