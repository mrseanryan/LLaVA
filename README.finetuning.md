# Fine tuning example - from OK-VQA dataset

Ref: https://wandb.ai/byyoung3/ml-news/reports/How-to-Fine-Tune-LLaVA-on-a-Custom-Dataset--Vmlldzo2NjUwNTc1

1. setup LLaVA, with the extra libraries for training - see [README](./README.md#install)

2. get/create the data:

```
pip install datasets

python prep_data__OK-VQA__sr.py
```

3. install git lfs:

```
./install-lfs__sr.sh
```

4. download the base model:

```
./download_llava_weights__sr.sh
```

5. review the script below, and the comments section

```
cat ./train_qlora__wandb.sh
```

6. execute the script:

```
./train_qlora__wandb.sh
```

7. monitor the progress - if quality is high enough, can stop the training early

- if you run out of GPU memory, then adjust the script to offload more work to CPU

8. To infer with the QLORA layer - see this script:

```
./infer_qlora__wandb.sh
```
