## Abort 和 Assert

在 Sui 上的事务中，对全局存储的更改是“全有或全无”的。更改只有在区块成功消化后才会被确认。如果在执行期间事务遇到错误，则其中的任何更改都将被丢弃。

除了除以 0 值等意外错误外，开发人员还可以通过表达式 `abort` 或 `assert` 主动使事务失败。

### 1. abort
`abort` 可以中止当前事务的执行，它接受一个 `u64` 类型的中止代码作为参数。

```move
abort 66
```

当函数执行遇到 `abort 66` 时，事务将被中止并以错误结束：

```move
public entry fun testAbort(demo: &mut Demo, input: u64) {
    if (input > 100) {
        abort 66
    };
    demo.v = demo.v + 1;
}
```
![abort](../02_控制结构/images/2-1.png?raw=true)

您可以找到中止代码 66 以及中止发生的函数（`testAbort`）。

### 2. assert
`assert` 表达式也可以通过中止代码中止事务，不同于 `abort` 表达式，它接受两个参数：一个条件（`bool`）和一个中止代码（`u64`）。

```move
assert!(a == b, 66);
```

注意 `assert` 的 `!` 符号，这将 `assert` 与函数调用区分开来。`assert` 类似于宏或语法糖，使上面的示例等效于：

```move
if (a == b) {

} else {
    abort 66
};
```

在测试中尝试：

```move
public entry fun testAssert(demo: &mut Demo, input: u64) {
    assert!(input > 100, 66);
    demo.v = demo.v + 1;
}
```
![abort](../02_控制结构/images/2-2.png?raw=true)

您可以看到 `testAssert` 函数调用以代码 66 中止，错误日志与 `abort` 表达式的示例相同。