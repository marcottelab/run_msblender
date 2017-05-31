#!/bin/bash
#SBATCH -J runCe_1104_example      # job name
#SBATCH -o runCe_1104_example.o%j       # output and error file name (%j expands to jobID)
#SBATCH -n 2              # total number of mpi tasks requested
#SBATCH -p development     # queue (partition) -- normal, development, etc.
#SBATCH -c 16 		# number of CPUs/task
#SBATCH -t 2:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=claire.mcwhite@utexas.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A A-cm10          # Specify allocation to charge against

module load python/2.7.12

export LAUNCHER_JOB_FILE=Ce_1104_example_COMMANDS.txt

### Nothing needs to change below here
module load launcher;
export EXECUTABLE=$LAUNCHER_DIR/init_launcher
export LAUNCHER_WORKDIR=$( pwd )

echo $EXECUTABLE
echo $LAUNCHER_WORKDIR
echo $LAUNCHER_JOB_FILE
cd $LAUNCHER_WORKDIR;
pwd
ls $LAUNCHER_JOB_FILE
$LAUNCHER_DIR/paramrun $EXECUTABLE $LAUNCHER_JOB_FILE;

