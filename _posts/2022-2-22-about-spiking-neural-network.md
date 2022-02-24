---
title: Spiking Neural Network解説 第一回
layout: post
post-image: "https://i.imgur.com/jC9Cvex.png"
description: Spiking Neural Networkの概要を解説します
tags:
- Spiking neural network
type: blog
---

# 3行まとめ！
今回は、SNNの概要を包括的に解説していきます
> * SNNは**人間の脳をもっと正確に**模倣したニューラルネットワーク
> * 専用のデバイス上では**超高速&超低消費電力**で動く
> * 近年では通常のニューラルネットワークを**上回る精度**を出しつつある

---

# 現在の人工知能の課題点
近年の人工知能の発展はめざましく、画像認識や自然言語処理、3DCGや自動運転に至るまで、さまざまな場所で活用されています。
しかし、現在の人工知能の主流であるニューラルネットワークは一般に計算量が大きく、その発展は非常に大規模な計算資源に依存しています。

例えば、2017年にAlphaGoが世界最強棋士柯潔九段に勝利した際には、その消費電力も比較されました。このときのAlphaGoの消費電力は**約20万W**でしたが、人間の脳の消費電力は**20~21W**程度です。

つまりは、<span style="font-size: 100%; color: red; font-weight: bold">人間の脳をより正確に模倣すれば、低消費電力の人工知能を作れるのではないか？</span>ということが考えられます。そこで今注目されているのが、<b><u>Spiking Neural Network (SNN) </u></b>です。

<figure>
  <img src='https://i.imgur.com/f74g9B0.png' alt="alphago">
  <figcaption>
    <a href='https://www.ft.com/content/cada14c4-d366-11e6-b06b-680c49b4b4c0'>AlphaGo</a>
  </figcaption>
</figure>

# Spiking Neural Networkの概要

Spiking Neural Network (SNN) は、生体脳のより正確なニューロンモデルを用いたニューラルネットワークです。ここで使用されるニューロンモデルは複数存在しますが、最も一般的なものは**LIFニューロン**と呼ばれるモデルです。これの詳細は次回の記事で述べます。

LIFニューロンは、生体脳の観察から導出されたニューロンモデルであり、入出力は**スパイク列**と呼ばれる0か1だけの時系列データになります。SNNでは、情報をスパイクの頻度やタイミングに暗黙的に埋め込んでいると考えられています。
一方、通常のニューラルネットワーク (ANN)は特徴量として実数値を取りますが、これはスパイク列の発火率を直に扱っていると考えることができます。
<figure>
  <img src='https://i.imgur.com/V32Qw3R.png' alt="SNNとANNの比較">
  <figcaption>
    SNNとANNの比較
  </figcaption>
</figure>

# SNNの特徴
SNNは、専用の**Neuromorphic device**では低消費電力かつ高速に動作することが知られています。
その理由は、
* SNNはバイナリの値を使用しているため
* スパイクが入力された時のみ計算を実行すればよいため (event-driven)

であり、これによって回路上にネットワークを直に実現することができます。

Neuromorphic deviceは、IntelのLoihiやIBMのTrueNorthなど、現在多くの研究機関や企業などで開発が進められています。このうちIBMのTrueNorthでは、ANNに比べて〜100倍程度の高速化と~1/100,000程度の低消費電力化を実現しています。

<figure>
  <img src='https://i.imgur.com/E29i084.jpg' alt="Neurmophic devices">
  <figcaption>
    Neuromorphic deviceの例
  </figcaption>
</figure>

# 最近の研究
最近では、精度の面でもSNNはANNを上回りつつあります。
画像認識においては、[TSSL-BP[Zhang+, NeurIPS2020]](https://arxiv.org/abs/2002.10085)で4層~5層のSpiking CNNを訓練し、同じ構造のANNの認識精度を上回っています。また、[[Zheng+, AAAI2021]](https://arxiv.org/abs/2011.05280)ではさらに短いスパイク列でさらに良い認識精度を更新しています。

画像認識以外にも、物体検出や画像生成、オプティカルフローの推定やDVSカメラの解析など、さまざまなタスクにSNNは応用され始めています。

エッジデバイス上での人工知能は、計算スペックや電力の制約が課題となっていましたが、SNNによってそれが全て解決する日も近いかもしれません。

# まとめ
このように、脳を模倣したSNNはその高速かつ低エネルギーの特性から注目を集め始めています！このブログでは、SNNの解説を数回に分けて行います。次回は生体脳の神経構造と、ニューロンモデルに関して解説していきます。
