---
title: Fully Spiking Variational Autoencoder
layout: post
post-image: "https://raw.githubusercontent.com/thedevslot/WhatATheme/master/assets/images/SamplePost.png?token=AHMQUEPC4IFADOF5VG4QVN26Z64GG"
description: explanation of Fully Spiking Variational Autoencoder [Kamata+, AAAI2022]
tags:
- Spiking neural network
- vatiational autoencoder
type: publication
---

AAAI2022に投稿した、"Fully Spiking Variational Autoencoder"について解説します。

# Abstract
> * Spiking Neural Network (SNN)を用いてVAEを構築
> * 通常のANNと同等かそれ以上の精度で画像生成ができることを確認した

* [Arxiv](https://arxiv.org/abs/2110.00375)
* [Github](https://github.com/kamata1729/FullySpikingVAE)

---


# はじめに
Spiking Neural Network (SNN) は人間の脳をより正確に模倣したニューラルネットワークです。
その特徴としては、
* 生体脳のニューロンモデルを使用している
* 全ての特徴量はスパイク列と呼ばれる0,1の時系列データで表現される
* Neuromorphic deviceという専用のデバイス上では超高速かつ超低消費電力で動作する

という点が挙げられます。