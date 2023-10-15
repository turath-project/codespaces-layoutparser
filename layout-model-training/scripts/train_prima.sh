#!/bin/bash

cd ../tools

python cocosplit.py \                                  
    --annotation-path     ../../data/downloaded-annotations/result.json \
    --split-ratio         0.85 \
    --train               ../../data/downloaded-annotations/train.json \
    --test                ../../data/downloaded-annotations/test.json 

python train_net.py \
    --dataset_name          prima-layout \
    --json_annotation_train ../../data/downloaded-annotations/train.json \
    --image_path_train      ../../data/downloaded-annotations \
    --json_annotation_val   ../../data/downloaded-annotations/test.json \
    --image_path_val        ../../data/downloaded-annotations \
    --config-file           ../configs/prima/fast_rcnn_R_50_FPN_3x.yaml \
    OUTPUT_DIR  ../../outputs/prima/fast_rcnn_R_50_FPN_3x/ \
    SOLVER.IMS_PER_BATCH 2 