---
title: Fully Spiking Variational Autoencoder
layout: post
post-image: "https://raw.githubusercontent.com/thedevslot/WhatATheme/master/assets/images/SamplePost.png?token=AHMQUEPC4IFADOF5VG4QVN26Z64GG"
description: explanation of Fully Spiking Variational Autoencoder [Kamata+, AAAI2022]
tags:
- Spiking neural network
- vatiational autoencoder
type: none
---

AAAI2022に投稿した、**"Fully Spiking Variational Autoencoder"**について解説します。

# Abstract
> * Spiking Neural Network (SNN)を用いてVAEを構築
> * 通常のANNと同等かそれ以上の精度で画像生成ができることを確認した

* [Arxiv](https://arxiv.org/abs/2110.00375)
* [Github](https://github.com/kamata1729/FullySpikingVAE)

---


# はじめに
Spiking Neural Network (SNN) は人間の脳をより正確に模倣したニューラルネットワークです。
その特徴としては、
> * 生体脳のニューロンモデルを使用している
> * 全ての特徴量はスパイク列と呼ばれる0,1の時系列データで表現される
> * Neuromorphic deviceという専用のデバイス上では超高速かつ超低消費電力で動作する

という点が挙げられます。詳しくは<a href="about-spiking-neural-network">Spiking Neural Network解説</a>を参照してください。

以上の特性から、SNNは多くの実応用が期待されていますが、発展途上の分野ということもあり、<span style="color: red; font-weight: bold">SNNによる生成モデルの研究はほぼ存在しません</span>(一応、[Spiking-GAN](https://arxiv.org/abs/2106.15420)という論文が存在しますが、現実的なレベルで画像生成ができているとは言えません)

しかし、将来的にSNNがエッジデバイスや自動運転など、さまざまな場面で活用されることを考えると、SNNによる生成モデルを構築することは非常に重要です。SNNの高速かつ低消費電力の特性から、あらゆるウェアラブルデバイスで高精度のAIの利用が可能になったり、SNNを組み込んだロボットが自立的に街中で活躍する未来につながるかもしれません。

そこで今回我々は、<u><b>SNNを用いて生成モデルの一つであるVAE(Variational Autoencoder)を構築することを目指します</b></u>

# Spiking Neural Networkについて
SNNでは**Leaky-Integrate-and-Fire (LIF) neuron**というニューロンモデルを使うことが一般的です。LIF neuronに入力スパイク列が入力されると、それに対してシナプスの結合重み$w$が掛け合わされて電流となり、LIF neuronの**膜電位 (membrane potential)**が時間的に変化します。

膜電位がある閾値$V_{th}$を超えると、<u>その時刻でスパイクを発火し、膜電位はゼロにリセットされます。</u>このようにして、LIF neuronはスパイク列を受け取りスパイク列を出力しています。

<figure>
  <img src='/assets/blog_images/lif.png' alt="alphago" width="50%">
  <figcaption>
    LIF neuronの模式図
  </figcaption>
</figure>

LIF neuronの様子を定式化すると以下のようになります。

$$
\begin{align}
    u_{t,n} &= \tau_{\mathrm{decay}} u_{t-1,n}(1-o_{t-1,n}) + x_{t,n-1} \label{eq:mem}\\
    o_{t,n} &= H(u_{t,n}-V_{\mathrm{th}}) \label{eq:heaviside}
\end{align}
$$


