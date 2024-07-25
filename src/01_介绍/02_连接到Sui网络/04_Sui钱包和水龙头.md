## Sui 钱包和水龙头

在连接到 Sui 网络之前，您需要先创建您的账户（地址）。无论您使用 Sui 客户端 CLI 还是 Sui 钱包，创建账户都非常方便。

为了您的方便，我们在课程平台中集成了 ChainIDE studio 工作区以支持 Sui。只需展开当前页面的右侧部分，即可显示一个空工作区。点击“工具”部分下的“终端”按钮，等待终端初始化。此终端环境已预先安装了 Sui 二进制文件。您可以通过执行 `sui --version` 来检查 Sui 版本。请随意在此环境中探索和实验。

### 1. 创建账户
使用 Sui 客户端 CLI，输入以下命令生成一个新的 Sui 地址：
```shell
sui client new-address ed25519
```
在此命令中，`ed25519` 参数是密钥对方案。您可以在此文档中找到有关 `sui client` 命令的更多子命令详情。

执行此命令后将得到以下输出：
![new-address](../02_连接到Sui网络/images/2-2.png?raw=true)
* `地址`：账户地址。
* `密钥方案`：密钥对方案。
* `恢复短语`：通常称为助记词，是 Sui 钱包的备份。它可以导入到任何 Sui 钱包中，您必须记住它。

现在账户已经创建并自动添加到 Sui 客户端，运行以下命令进行检查：
```
sui client addresses
```
![addresses](../02_连接到Sui网络/images/2-3.png?raw=true)

如果您在 Sui 客户端中有其他地址，可以切换到您刚刚创建的地址：
```
sui client switch --address {your_address}
```

### 2. 使用 Sui 钱包
使用 Sui 钱包，您可以轻松管理在 Sui 网络上的资产。

要安装 [Sui钱包](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)，只需在 Chrome Web Store 上安装 Chrome 浏览器扩展，访问 Sui 钱包扩展页面，点击“添加到 Chrome”，然后点击“添加扩展”。

我们已经创建了账户，点击“导入现有钱包”并粘贴账户的`恢复助记词`。然后，您需要设置 Sui 钱包的密码。

### 3. 从水龙头获取 SUI 代币
Sui 水龙头是一个工具，您可以请求免费的测试 SUI 代币来与 Sui Devnet 和 Testnet 交互，这是我们开发和测试中必不可少的。

> 获取 SUI 代币的更多方法：https://docs.sui.io/guides/developer/getting-started/get-coins

使用钱包请求测试代币非常简单。在钱包设置中将钱包网络切换到 Devnet，然后您可以看到“大按钮‘请求 Devnet SUI 代币’”，点击它，您将获得10个代币。
![request](../02_连接到Sui网络/images/2-4.png?raw=true)

返回到 Sui 客户端 CLI，您还可以使用以下命令检查您的代币余额：
```
sui client gas
```
![gas](../02_连接到Sui网络/images/2-5.png?raw=true)