% 创建 Arduino 连接对象
clear all;
a = arduino('COM6', 'Uno');

% 创建舵机对象
servoPin = 'D9';  % 舵机连接到 Arduino 的数字引脚 D9
servoObj = servo(a, servoPin);

% 创建图形窗口
figure;
h = animatedline('Color', 'b', 'LineWidth', 2);

% 实时监控舵机角度
while true
    % 读取舵机角度
    writePosition(servoObj,0.30);
    position = readPosition(servoObj);
    fprintf('舵机角度：%.2f\n', position);
    
    % 绘制角度曲线
    addpoints(h, now, position);
    datetick('x', 'keeplimits');
    drawnow;
    pause(0.5);

    writePosition(servoObj,0.40);
    position = readPosition(servoObj);
    fprintf('舵机角度：%.2f\n', position);
    
    % 绘制角度曲线
    addpoints(h, now, position);
    drawnow;
    legend('Single Servo')
    % 暂停一段时间，以便观察
    pause(0.5);
end