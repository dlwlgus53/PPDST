# 정답을 수정하고
# 원본을 합치고

import json
import pdb
import ontology


def dict_to_bspn(dict_bspn):
    ans =['<sos_b>']
    for domain_slot in ontology.domain_slot:
        if domain_slot in dict_bspn:
            domain,slot = domain_slot.split("-")[0], domain_slot.split("-")[1]
            if ("[" + domain + ']') not in ans:
                ans.append("[" + domain + ']')
            ans.append(slot)
            ans.append(dict_bspn[domain_slot])
            # del dict_bspn[domain_slot]
    ans.append('<eos_b>')
    ans = ' '.join(ans)
    return ans

seeds = [1,2,3,4,5]
for seed in seeds:
    original_path = f'/home/jihyunlee/pptod/data/multiwoz/data/labeled/0.1/labeled_{seed}.json'
    pseudo_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/pseudo.json'
    pseudo_save_path = f'/home/jihyunlee/pptod/DST/inference_result/small/0.1/seed{seed}/pseudo_processed.json'

    data = json.load(open(original_path , "r"))

    pseudo = json.load(open(pseudo_path , "r"))
    in_dial = []
    for dial in data:
        if 'belief' not in dial[0]: continue
        in_dial.append(dial[0]['dial_id'])
        for turn in dial:
            turn['bspn_ans'] = turn['bspn']
            turn['bspn'] = dict_to_bspn(turn['belief'])
    print(len(in_dial))


    dial_ids = pseudo.keys()
    for dial_id in pseudo.keys():
        new_dial = []
        dial = pseudo[dial_id]
        assert dial_id not in in_dial
        for turn_id in list(dial.keys()):
            turn = dial[turn_id]
            turn['bspn_ans'] = turn['bspn']
            turn['bspn'] = dict_to_bspn(turn['pred_belief_dict'])
            new_dial.append(turn)
        data.append(new_dial)
    print(len(data))
    with open(pseudo_save_path, 'w') as f: json.dump(data, f, ensure_ascii=False, indent=4)

    

    


        



    