## 使用 `0x2::math`

Move 语言提供了基本的整数算术运算（`+`，`-`，`*`，`/`，`%`）。Sui 框架中的 `sui::math` 模块提供了一些其他基本的数学运算，如 `pow` 和 `square`。

### 1. 最大值和最小值
`sui::math` 包含两个函数，可以轻松从两个 `uint64` 值中提取最大值或最小值：

```move
sui::math::max(1, 2); // 结果为 2
sui::math::min(1, 2); // 结果为 1
```

### 2. 差值
计算绝对值的函数：

```move
sui::math::diff(1, 2); // 结果为 1
sui::math::diff(2, 1); // 结果为 1
```

### 3. 平方根和 `sqrt_u128`
获取 `uint64` 和 `uint128` 输入值的最近较小整数平方根：

```move
sui::math::sqrt(9); // 结果为 3
sui::math::sqrt(8); // 结果为 2
```

8 的平方根接近 2.82，如果您想获得更精确的结果，可以这样尝试：

```move
sui::math::sqrt(8 * 10000); // 结果为 282
```

然后可以通过 `282 / 1000` 获得更精确的结果。

### 4. 向上取整除法
从除法运算中获取向上取整的结果：

```move
sui::math::divide_and_round_up(5, 3); // 结果为 2
```

请访问 [`math` 模块文档](https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/docs/math.md)以获取更详细的介绍。