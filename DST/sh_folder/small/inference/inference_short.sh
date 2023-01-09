python ../../../inference.py\
    --data_path_prefix ../../../../data/multiwoz/data/multi-woz-fine-processed-short/\
    --model_name t5-small\
    --pretrained_path ../../../ckpt/small/0.1/seed1\
    --output_save_path ../../../inference_result/short\
    --number_of_gpu 1\
    --batch_size_per_gpu 16
