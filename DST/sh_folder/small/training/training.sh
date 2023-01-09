python ../../../learn.py\
    --seed 1\
    --data_path_prefix ../../../../data/multiwoz/data/multi-woz-fine-processed/\
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/seed0\
    --epoch_num 1\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \
    --train_data_ratio 0.1



python ../../../learn.py\
    --seed 1\
    --data_path_prefix ../../../../data/multiwoz/data/multi-woz-fine-processed/\
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/seed1\
    --epoch_num 20\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \
    --train_data_ratio 0.1

python ../../../learn.py\
    --seed 2\
    --data_path_prefix ../../../../data/multiwoz/data/multi-woz-fine-processed/\
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/seed2\
    --epoch_num 20\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \
    --train_data_ratio 0.1

python ../../../learn.py\
    --seed 3\
    --data_path_prefix ../../../../data/multiwoz/data/multi-woz-fine-processed/\
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/seed3\
    --epoch_num 20\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \
    --train_data_ratio 0.1

python ../../../learn.py\
    --seed 4\
    --data_path_prefix ../../../../data/multiwoz/data/multi-woz-fine-processed/\
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/seed4\
    --epoch_num 20\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \
    --train_data_ratio 0.1

python ../../../learn.py\
    --seed 5\
    --data_path_prefix ../../../../data/multiwoz/data/multi-woz-fine-processed/\
    --model_name t5-small\
    --ckpt_save_path ../../../ckpt/small/seed5\
    --epoch_num 20\
    --gradient_accumulation_steps 4\
    --number_of_gpu 2\
    --batch_size_per_gpu 16 \
    --train_data_ratio 0.1