## Sui Kiosk

[Kiosk](https://kiosk.page/) 是一个在 Sui 上为商业应用设计的去中心化系统。Kiosk 设计了三种在商业行为中的角色：

- **Creator** - 产品创建者，可以管理转让策略。
- **Kiosk Owner** - 卖家，当前产品的拥有者。
- **Buyer** - 想要购买产品的人。

卖家可以创建自己的 kiosk，添加并列出带价格的商品，买家可以通过 kiosk 购买列出的商品。

一个简单的通过 kiosks 列出并购买商品的流程如下：

1. 卖家和买家都创建他们自己的 `0x2::kiosk::Kiosk` 对象以及 `KioskOwnerCap`。
2. 卖家将商品添加到自己的 kiosk，商品将以动态字段的形式移动到 kiosk 下。
3. 买家通过卖家的 kiosk 购买商品。
4. 解决由商品（类型）创建者创建的转让策略。
5. 购买完成，商品被移动到买家的 kiosk。
6. 买家从 kiosk 中提取商品到自己的地址。

当你构建 kiosk 应用程序时，需要使用 [kiosk SDK](https://sdk.mystenlabs.com/kiosk)，因为在执行复杂的 kiosk 操作（如购买和解决策略）时需要编程交易块。