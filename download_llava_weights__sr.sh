# Download the LLaVA weights so can fine-tune
#
# ref https://wandb.ai/byyoung3/ml-news/reports/How-to-Fine-Tune-LLaVA-on-a-Custom-Dataset--Vmlldzo2NjUwNTc1
set -e -x

pushd temp

git clone https://huggingface.co/liuhaotian/llava-v1.6-mistral-7b # was https://huggingface.co/liuhaotian/llava-v1.5-7b

popd
