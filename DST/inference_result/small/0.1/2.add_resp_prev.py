# 정답을 수정하고
# 원본을 합치고

import json
import pdb
import ontology


seeds = [1,2,3,4,5]

for seed in seeds:
    pseudo_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/train.json'
    pseudo_save_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/train.json'

    train_data = json.load(open(pseudo_path , "r"))
    resp_dict= {}

    for dial in train_data:
        dial_id = dial[0]['dial_id']
        for turn_id, turn in enumerate(dial):
            turn['resp'] = resp_dict[dial_id][turn_id]

    with open(pseudo_save_path, 'w') as f: json.dump(pseudo, f, ensure_ascii=False, indent=4)

    

    


        



    