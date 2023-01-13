# 정답을 수정하고
# 원본을 합치고

import json
import pdb
import ontology


seeds = [1,2,3,4,5]

for seed in seeds:
    pseudo_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/train.json'
    pseudo_save_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/train.json'

    pseudo = json.load(open(pseudo_path , "r"))

    for dial in pseudo:
        dial_id = dial[0]['dial_id']
        if 'pred_belief_dict' in dial[0]:
            prev_belief = {}
            for turn_id, turn in enumerate(dial):
                turn['pred_belief'] = turn['pred_belief_dict']
                turn['curr_pred_belief'] =  dict(set(turn['pred_belief'].items()) - set(prev_belief.items()))
                turn['prev_pred_belief'] = prev_belief
                prev_belief = turn['pred_belief']

    with open(pseudo_save_path, 'w') as f: json.dump(pseudo, f, ensure_ascii=False, indent=4)

    

    


        



    