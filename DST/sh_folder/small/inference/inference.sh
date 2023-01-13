#!/bin/sh
#SBATCH -J testing # Job name
#SBATCH -o  ./out/testing.%j.out   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p A5000 # queue  name  or  partiton name

#SBATCH -t 72:00:00               # Run time (hh:mm:ss) - 1.5 hours

## 노드 지정하지않기
#SBATCH   --nodes=1

#### Select  GPU
#SBATCH   --gres=gpu:1
#SBTACH   --ntasks=1
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
/home/jihyunlee/pptod/DST/inference_result/small/0.1/debug1
echo "conda activate QA_new "
conda activate QA_new

export PYTHONPATH=.



python ../../../inference.py\
    --train_path /home/jihyunlee/pptod/data/multiwoz/data/labeled/0.1/labeled_$1.json\
    --dev_path /home/jihyunlee/pptod/data/multiwoz/data/multi-woz-fine-processed/multiwoz-fine-processed-dev.json \
    --test_path /home/jihyunlee/pptod/data/multiwoz/data/multi-woz-fine-processed/multiwoz-fine-processed-test.json \
    --model_name t5-small\
    --pretrained_path /home/jihyunlee/pptod/DST/ckpt/small/teacher_v2_deb1\
    --output_save_path ../../../inference_result/small/0.1/debug1\
    --number_of_gpu 1\
    --batch_size_per_gpu 16
