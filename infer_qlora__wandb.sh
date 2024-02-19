#!/bin/bash

set -e -x  # stop on 1st error, debug output of args used

# To infer with the QLORA layer:
#
python run_llava.py --model-path ./temp/checkpoints/llava-2-7b-chat-task-qlora/best_llava_eval_model
--model-base ./temp/llava-v1.6-7b
--image-file ./temp/dataset/images/0f47c0b5-2c77-45e6-87b0-89af46e99500.jpg
--query “why was this photo taken?”
