import json
import pdb
f1= json.load(open("/home/jihyunlee/pptod/DST/ckpt/small/teacher_v2_deb21/epoch_17_dev_joint_accuracy_41.17/dev_joint_accuracy_41.17.json","r"))
f2= json.load(open("/home/jihyunlee/pptod/DST/ckpt/small/teacher_v2_deb1/epoch_4_dev_joint_accuracy_47.06/dev_joint_accuracy_47.06.json","r"))

for key in f1.keys():
    dial1 = f1[key]
    dial2 = f2[key]
    for turn_ids in dial1.keys():
        turn1 = dial1[turn_ids]
        turn2 = dial2[turn_ids]

        if 'gtbs' in turn1 and 'gtbs' not in turn2:
            print(turn1['dial_id'])
            print(turn1['turn_num'])

            pdb.set_trace()
