
python ../../../inference.py\
    --data_path_prefix /home/jihyunlee/pptod/data/multiwoz/data/unlabeled/0.1/seed1\
    --model_name t5-small\
    --pretrained_path ../../../ckpt/small/0.1/seed1\
    --output_save_path ../../../inference_result/small/0.1/seed1\
    --number_of_gpu 1\
    --batch_size_per_gpu 16

python ../../../inference.py\
    --data_path_prefix /home/jihyunlee/pptod/data/multiwoz/data/unlabeled/0.1/seed2\
    --model_name t5-small\
    --pretrained_path ../../../ckpt/small/0.1/seed2\
    --output_save_path ../../../inference_result/small/0.1/seed2\
    --number_of_gpu 1\
    --batch_size_per_gpu 16

python ../../../inference.py\
    --data_path_prefix /home/jihyunlee/pptod/data/multiwoz/data/unlabeled/0.1/seed3\
    --model_name t5-small\
    --pretrained_path ../../../ckpt/small/0.1/seed3\
    --output_save_path ../../../inference_result/small/0.1/seed3\
    --number_of_gpu 1\
    --batch_size_per_gpu 16

python ../../../inference.py\
    --data_path_prefix /home/jihyunlee/pptod/data/multiwoz/data/unlabeled/0.1/seed4\
    --model_name t5-small\
    --pretrained_path ../../../ckpt/small/0.1/seed4\
    --output_save_path ../../../inference_result/small/0.1/seed4\
    --number_of_gpu 1\
    --batch_size_per_gpu 16

python ../../../inference.py\
    --data_path_prefix /home/jihyunlee/pptod/data/multiwoz/data/unlabeled/0.1/seed5\
    --model_name t5-small\
    --pretrained_path ../../../ckpt/small/0.1/seed5\
    --output_save_path ../../../inference_result/small/0.1/seed5\
    --number_of_gpu 1\
    --batch_size_per_gpu 16
