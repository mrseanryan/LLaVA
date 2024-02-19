#!/bin/bash

set -e -x  # stop on 1st error, debug output of args used

# BEFORE USE:
# 1 - get/create the data:
#   ./python prep_data__OK-VQA__sr.py
# 2 - download the base model:
#   ./download_llava_weights__sr.sh
#
# 3 - review args below, and the comments section

WANDB_MODE=offline

# Set the prompt and model versions directly in the command
deepspeed ./llava/train/train_mem.py \
    --deepspeed ./scripts/zero2.json \
    --lora_enable True \
    --lora_r 128 \
    --lora_alpha 256 \
    --mm_projector_lr 2e-5 \
    --bits 4 \
    --model_name_or_path ./temp/llava-v1.6-mistral-7b \
    --version llava_mistral \
    --data_path ./temp/dataset/train/dataset.json \
    --validation_data_path ./temp/dataset/validation/dataset.json \
    --image_folder ./temp/dataset/images/ \
    --vision_tower openai/clip-vit-large-patch14-336 \
    --mm_projector_type mlp2x_gelu \
    --mm_vision_select_layer -2 \
    --mm_use_im_start_end False \
    --mm_use_im_patch_token False \
    --image_aspect_ratio pad \
    --group_by_modality_length True \
    --bf16 True \
    --output_dir ./temp/checkpoints/mistral-7b-chat-task-qlora \
    --num_train_epochs 10 \
    --per_device_train_batch_size 16 \
    --per_device_eval_batch_size 16 \
    --gradient_accumulation_steps 4 \
    --evaluation_strategy "epoch" \
    --save_strategy "steps" \
    --save_steps 50000 \
    --save_total_limit 1 \
    --learning_rate 2e-4 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 2048 \
    --gradient_checkpointing True \
    --dataloader_num_workers 4 \
    --lazy_preprocess True

# PROBLEM: mistral base model does not have a 'mm_projector.bin' file and none is output from this script
