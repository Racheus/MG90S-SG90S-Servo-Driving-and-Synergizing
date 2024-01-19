# MG90S-SG90S-Servo-Driving-and-Synergizing
### Racheus Zhao
#### School of Mechanic Enginnering , SJTU
#### 2023-2024-1 Winter

---
本学期笔者的专业有一门备受诟病的课程《设计与制造II》(Design and Manufacturing II , ME3220)。课程项目是做一只能弹跳的青蛙。

但是很可惜，我们的青蛙终究没有能够实现跳跃。或许是机械结构设计有些问题，或许是舵机动力力不从心，又或许是我们的项目时间管理观念不到位。总之答辩已经结束，这们让人痛苦的课程已然画上句号。

但我并不想就此以“遗憾”作罢。我希望能从这学期不多的经验里吸取经验，**让犯的错反省出梦想**。为此，我决定写下这个项目。感谢我的组员们提供的支持让我能全身心投入这个方向的探究。

<img src="https://github.com/Racheus/MG90S-SG90S-Servo-Driving-and-Synergizing/blob/main/Images/Frog.jpg" align="center" width="400" height="350" />

*再看，再看把你吃了*

我们能看到，在这个“艺术品”里用了两个舵机来控制左右腿部的机构姿态调整实现跳跃。这里就不禁问：如何才能实现两个舵机的同步呢？当然，同一个单片机发出的信号延迟可能不高，只要设置好了高低电平的拉动，在宏观上基本看不出什么相位差、速度差。但是，如果物理接线不足以满足单片机控制的距离(比如需要两块Board分别控制的情况)，我们应该怎样实现对舵机转角的监控和同步调整呢？

所以我决定以兴趣的名义，以小青蛙的名义，对这个方面进行一定的探索。笔者所写不一定完全正确，在这篇文章里也只是记录心路历程，作为将来江河回望之时，开心的瞬间。

---

*人总需要勇敢生存，我还是重新许愿*

*————Eason《明年今日》*

---


### MATLAB 舵机控制

(基础控制 Basic Control)[Click here to MATLAB_Servo_Controling](Install&Initializing/MATLAB_Initialize.md)

(随动控制 follower control)[Click here to MATLAB_Servo——Follower_Controling](./MATLAB_Servo_Follower_Control.md)
