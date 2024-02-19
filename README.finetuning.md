# Fine tuning example - from OK-VQA dataset

Ref: https://wandb.ai/byyoung3/ml-news/reports/How-to-Fine-Tune-LLaVA-on-a-Custom-Dataset--Vmlldzo2NjUwNTc1

1. setup LLaVA, with the extra libraries for training - see [README](./README.md)

2. get/create the data:

```
pip install datasets

python prep_data__OK-VQA__sr.py
```

3. download the base model:

```
./download_llava_weights__sr.sh
```

4. review the script below, and the comments section

```
./train_qlora__wandb.sh
```

5. execute the script:

```
./train_qlora__wandb.sh
```

6. monitor the progress - if quality is high enough, can stop the training early

7. To infer with the QLORA layer - see this script:

```
./infer_qlora__wandb.sh
```
