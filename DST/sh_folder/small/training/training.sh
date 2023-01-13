#!/bin/sh
#SBATCH -J teacher # Job name
#SBATCH -o  ./out/teacher.%j.out   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p TITANRTX # queue  name  or  partiton name

#SBATCH -t 72:00:00               # Run time (hh:mm:ss) - 1.5 hours

## 노드 지정하지않기
#SBATCH   --nodes=1

#### Select  GPU
#SBATCH   --gres=gpu:2
#SBTACH   --ntasks=2
#SBATCH   --tasks-per-node=16
#SBATCH     --mail-user=jihyunlee@postech.ac.kr
#SBATCH     --mail-type=ALL

cd  $SLURM_SUBMIT_DIR

echo "SLURM_SUBMIT_DIR=$SLURM_SUBMIT_DIR"
echo "CUDA_HOME=$CUDA_HOME"
echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
echo "CUDA_VERSION=$CUDA_VERSION"

## path  Erase because of the crash
module purge
module add cuda/10.4
module add cuDNN/cuda/10.4/8.0.4.30
#module  load  postech

echo "Start"
echo "conda PATH "

echo "source  $HOME/anaconda3/etc/profile.d/conda.sh"
source  $HOME/anaconda3/etc/profile.d/conda.sh

echo "conda activate QA_new "
conda activate QA_new

export PYTHONPATH=.


python ../../../learn.py\
    --seed 1\
    --train_path /home/jihyunlee/pptod/data/multiwoz/data/labeled/0.1/labeled_$1.json\
    --dev_path /home/jihyunlee/pptod/data/multiwoz/data/multi-woz-fine-processed_working/multiwoz-fine-processed-dev.json \
    --test_path /home/jihyunlee/pptod/data/multiwoz/data/multi-woz-fine-processed_working/multiwoz-fine-processed-test.json \
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/teacher_v2_deb3$1\
    --epoch_num 20\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \