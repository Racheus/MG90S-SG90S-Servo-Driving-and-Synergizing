安装好[intro.md](intro.md)中介绍的MATLAB Package后，需要对硬件进行配置。

根据自己的需求选择板子型号和对应端口（笔者是Uno和COM6）：

![Insert Error](../Images/set.png)

配置好后下方会有绿色的“Success!”字样。

接着还需要在附加资源管理器中添加`Embedded Coder`包，用于硬件信息的读取。

![Insert Error](../Images/coder.png)

之后便可以运行demo脚本，得到锯齿形的舵机轨迹跟踪结果：

![Insert Error](../Images/cut.png)
