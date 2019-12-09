A = [-2 2; 30 4];
B = [-20 20 30; 4 5 0; -70 0 75];

[lambda1 v1] = poweriter(A, 1e-3);
[lambda2 v2] = poweriter(B, 1e-3);
figure
subplot(2, 2, 1)
plot(1:length(lambda1), [lambda1{:}]);
xlabel('k'); ylabel('\lambda_k');
subplot(2, 2, 3)
for i = 1:length(v1)
  plot(v1{i}(1), v1{i}(2), 'x');
  hold on;
end
xlabel('v_1_1'); ylabel('v_1_2');

subplot(2, 2, 2)
plot(1:length(lambda2), [lambda2{:}]);
xlabel('k'); ylabel('lambda_k');

subplot(2, 2, 4)
for i = 1:length(v2)
  plot3(v2{i}(1), v2{i}(2), v2{i}(3), 'x');
  hold on;
end
xlabel('v_2_1'); ylabel('v_2_2');
zlabel('v_2_3');