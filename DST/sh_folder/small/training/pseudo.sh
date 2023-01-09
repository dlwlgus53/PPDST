python ../../../learn.py\
    --seed 1\
    --data_path_prefix /home/jihyunlee/pptod/DST/inference_result/small/0.1/seed$1\
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/seed$1_pseudo\
    --epoch_num 1\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \
    --use_list_path /home/jihyunlee/pptod/DST/inference_result/small/0.1/seed$1/list_$2.json \

