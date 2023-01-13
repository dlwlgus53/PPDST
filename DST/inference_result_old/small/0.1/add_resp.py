# 정답을 수정하고
# 원본을 합치고

import json
import pdb
import ontology


seeds = [1,2,3,4,5]

for seed in seeds:
    original_path = f'/home/jihyunlee/pptod/data/multiwoz/data/multi-woz-fine-processed/multiwoz-fine-processed-train.json'
    pseudo_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/train.json'
    pseudo_save_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/train_ans.json'

    data = json.load(open(original_path , "r"))
    pseudo = json.load(open(pseudo_path , "r"))
    resp_dict= {}

    for dial in data:
        dial_id = dial[0]['dial_id']
        resp_dict[dial_id] = {}
        for turn_id, turn in enumerate(dial):
            resp_dict[dial_id][turn_id] = turn['resp']

    for dial in pseudo:
        dial_id = dial[0]['dial_id']
        for turn_id, turn in enumerate(dial):
            turn['resp'] = resp_dict[dial_id][turn_id]

    with open(pseudo_save_path, 'w') as f: json.dump(pseudo, f, ensure_ascii=False, indent=4)

    

    


        



    