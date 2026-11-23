I = imread('image.png');

if ndims(I) == 3
    I = rgb2gray(I);
end

A = im2double(I);
[m, n] = size(A);

[U, S, V] = svd(A, 'econ');
s = diag(S);

ranks = unique(min([5 20 50 100], min(m, n)));
errors = zeros(size(ranks));
storage = zeros(size(ranks));
compressed = cell(size(ranks));

for i = 1:numel(ranks)
    k = ranks(i);
    Ak = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
    Ak = min(max(Ak, 0), 1);
    compressed{i} = Ak;
    errors(i) = norm(A - Ak, 'fro') / norm(A, 'fro');
    storage(i) = k * (m + n + 1) / (m * n);
end

figure;
tiledlayout(2, ceil((numel(ranks) + 1) / 2));

nexttile;
imshow(A);
title('Original Image');

for i = 1:numel(ranks)
    nexttile;
    imshow(compressed{i});
    title(sprintf('Rank %d', ranks(i)));
end

figure;
subplot(1,2,1);
plot(ranks, errors, '-o', 'LineWidth', 1.5);
grid on;
xlabel('Number of Singular Values');
ylabel('Relative Frobenius Error');
title('Reconstruction Error');

subplot(1,2,2);
plot(ranks, 100 * storage, '-o', 'LineWidth', 1.5);
grid on;
xlabel('Number of Singular Values');
ylabel('Storage Used (%)');
title('Storage Comparison');

fprintf('Rank\tRelative Error\tStorage (%%)\n');
fprintf('%d\t%.6f\t\t%.2f\n', [ranks(:), errors(:), 100 * storage(:)].');
