#!/bin/bash
#SBATCH -J runEXPID      # job name
#SBATCH -o runEXPID.o%j       # output and error file name (%j expands to jobID)
#SBATCH -n 35              # total number of mpi tasks requested
#SBATCH -p normal     # queue (partition) -- normal, development, etc.
#SBATCH -c 16 		# number of CPUs/task
#SBATCH -t 2:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=claire.mcwhite@utexas.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes
#SBATCH -A A-cm10          # Specify allocation to charge against

module load python/2.7.12
module load gsl/2.2.1

export LAUNCHER_JOB_FILE=EXPID_COMMANDS.txt

### Nothing needs to change below here
module load launcher;
export EXECUTABLE=$LAUNCHER_DIR/init_launcher
export LAUNCHER_WORKDIR=$( pwd )
$LAUNCHER_DIR/paramrun $EXECUTABLE $LAUNCHER_JOB_FILE;

