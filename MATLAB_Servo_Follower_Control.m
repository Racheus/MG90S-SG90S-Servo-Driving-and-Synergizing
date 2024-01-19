clear all;
clc;
a = arduino('COM6', 'Uno', 'Libraries', 'Servo');
s1 = servo(a, 'D9');
s2 = servo(a, 'D6');

writePosition(s1, 0.2);
prevDu1 = 0.2;  % 初始角度
prevDu2 = 0;    % s2 初始角度设为 0
delta1 = 0.01;  % s1 的角度增量
delta2 = 0.01;  % s2 的角度增量

figure;

% 第一个子图，显示 s1 的角度
subplot(2, 1, 1);
h1 = animatedline('MaximumNumPoints', 180*4, 'Color', 'r', 'LineWidth', 1.5);
ax1 = gca;
ax1.YGrid = 'on';
ax1.YLim = [0, 180];
ytickformat('degrees');
xlabel('real time');
ylabel('servo angle');
title('Servo 1');

% 第二个子图，显示 s2 的角度
subplot(2, 1, 2);
h2 = animatedline('MaximumNumPoints', 180*4, 'Color', 'b', 'LineWidth', 1.5);
ax2 = gca;
ax2.YGrid = 'on';
ax2.YLim = [0, 180];
ytickformat('degrees');
xlabel('real time');
ylabel('servo angle');
title('Servo 2');

while ishandle(gcf)
    % 执行舵机转动并实时绘图
    writePosition(s1, prevDu1);
    writePosition(s2, prevDu1);  % s2 跟随 s1 的角度
    
    t = datetime('now', 'format', 'HH:mm:ss');
    tnum = datenum(t);
    
    % 更新第一个子图
    subplot(2, 1, 1);
    addpoints(h1, tnum, prevDu1*180);
    datetick('x', 'dd-mmm-yyyy HH:MM:SS', 'keeplimits');
    legend('Servo 1');
    
    % 更新第二个子图
    subplot(2, 1, 2);
    addpoints(h2, tnum, prevDu1*180);  % s2 跟随 s1 的角度
    datetick('x', 'dd-mmm-yyyy HH:MM:SS', 'keeplimits');
    legend('Servo 2');
    
    drawnow limitrate;
    
    % 更新舵机目标角度
    [prevDu1, delta1] = getTarget(prevDu1, delta1);
end

function [targetDu, newDelta] = getTarget(prevDu, delta)
    targetDu = prevDu + delta;
    newDelta = delta;
    
    if targetDu > 1
        targetDu = 1;
        newDelta = -delta;
    elseif targetDu < 0
        targetDu = 0;
        newDelta = -delta;
    end
end