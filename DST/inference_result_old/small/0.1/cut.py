import json
import os
from queue import PriorityQueue
import pdb
percents = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
seeds = [1,2,3,4,5]


def make_label_key(dial_id, turn_id):
    return f'[d]{dial_id}[t]{turn_id}'

for seed in seeds:
    os.makedirs(f"/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/use_list", exist_ok = True)
    for percent in percents:
        use_list = {}
        confidence_que = PriorityQueue()
        peseudo_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/pseudo_processed.json'
        save_path = f"/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/list_{percent}.json"
        dataset = json.load(open(peseudo_path , "r"))

        for dial in dataset:
            dial_id = dial[0]['dial_id']
            for turn_id, turn in enumerate(dial):
                dial_turn_key = make_label_key(dial_id, turn_id)

                if 'confidence' in turn:
                    confidence_que.put((-turn['confidence'], (dial_turn_key)))
                else:
                    use_list[dial_turn_key] = 'true'


        qsize = confidence_que.qsize()
        labeled_cnt = 0
        while confidence_que.empty() != True:
            labeled_cnt +=1
            key = confidence_que.get()[1]
            if labeled_cnt<qsize*percent:
                use_list[key] = 'true'
            else:
                use_list[key] = 'false'


        
        
        with open(save_path, 'w') as f: json.dump(use_list, f, ensure_ascii=False, indent=4)

        