#!/bin/bash

#SBATCH --job-name=dreamerv3
#SBATCH --partition=long                        
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:rtx8000:2
#SBATCH --mem=120G                                     


#conda_env=${1}

# 1. Load the required modules
module load anaconda/3
module load mujoco/2.0
module load cuda/11.8
conda activate choreo

env=$1
seed=$2
#LD_PRELOAD=/cvmfs/ai.mila.quebec/apps/arch/common/cuda/11.8/lib64/libcudart.so.11.0 \
nohup python offline_train.py configs=dmc_states agent=choreo dataset=exorl collection_method=rnd domain=${env} seed=${seed} > ${env}_${seed}.out 