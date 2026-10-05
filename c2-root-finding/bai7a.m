% Tạo dãy giá trị x từ -pi đến pi
x = linspace(-1.5*pi, 1.5*pi, 100);

% Tính giá trị y cho hai hàm
y1 = x;
y2 = 2*sin(x);

% Vẽ đồ thị
figure;
plot(x, y1, 'r', 'LineWidth', 2); 
% Đồ thị y = x, màu đỏ, độ rộng nét vẽ là 2
hold on; % Giữ cùng một đồ thị để vẽ thêm đồ thị khác
plot(x, y2, 'b--', 'LineWidth', 2); 
% Đồ thị y = 2*sin(x), màu xanh dương, nét đứt, độ rộng nét vẽ là 2

% Thêm tiêu đề và nhãn cho trục
title('Đồ thị của y = x và y = 2*sin(x)');
xlabel('x');
ylabel('y');

% Thêm chú thích cho các đường
legend('y = x', 'y = 2*sin(x)', 'Location', 'best');

% Hiển thị lưới trên đồ thị
grid on;

% Kết thúc vẽ
hold off;