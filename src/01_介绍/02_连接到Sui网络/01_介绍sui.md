## 介绍sui

在上一节中，我们对城堡游戏的整体设计有了基本了解。本节中，我们将了解 Sui 网络。

什么是 Sui？

根据他们网站的介绍：

Sui 是一个第一层区块链和智能合约平台，旨在使数字资产所有权变得快速、安全且无需授权。

让我们了解 Sui 网络的一些核心概念和核心特性。

1. 共识机制
    Sui 使用委托权益证明（DPoS）来确定处理交易的验证者集合。这不同于其他像比特币这样的工作量证明（POW）共识网络，Sui 验证者必须持有一定数量的 SUI。

2. Sui 上的 Move
    Move 是一种平台无关的语言，用于多个区块链。Sui 也利用了 Move 语言在智能合约开发中的特性。

    Sui 上的 Move 与其他区块链上的 Move 有一些重要区别：

    - Sui 使用其自己的以对象为中心的全局存储
    - 地址表示对象 ID
    - Sui 对象具有全局唯一 ID
    - Sui 具有模块初始化器（init 函数）
    - Sui 入口点以对象引用作为输入

    请阅读 [Sui 文档](https://docs.sui.io/concepts/sui-move-concepts#differences) 以进一步了解这些区别。

3. 以对象为中心
    在 Sui 上，一切都是对象，对象是基本的数据存储单元，而不是账户。

    对象设计有不同的所有权：专有和共享。通常，一个对象由一个地址拥有，例如一个 NFT。一些对象具有共享所有权，可以由多个账户修改。

4. 并行交易处理
    区块链上的大多数交易是“简单的”，如资产转移、点对点支付、铸造 NFT。这些简单交易是独立的，不需要任何特定顺序。Sui 对这些交易进行了优化，
    由于它们是独立的，不需要全局共识来实现总排序，Sui 并行处理简单交易。