# image_compression_project_matlab_MCA

MATLAB image compression using Singular Value Decomposition (SVD). Reconstructs a grayscale image at ranks k=5, 20, 50, 100 and compares relative Frobenius error vs storage usage (%).

## Objective
Compress a grayscale image using matrix factorization while maintaining acceptable image quality.

## MATLAB Concepts
Matrix operations, rank, eigenvalues, singular values, SVD, and error analysis.

**Syllabus Mapping:** Units 1, 2 and 5.

## Files
- `image_compression.m` - Main MATLAB code
- `image.png` - Input grayscale image

## How It Works
1. Load an image using `imread()` and convert it to grayscale with `rgb2gray()`.
2. Represent the image as a matrix with `im2double()`.
3. Apply SVD using MATLAB's `svd(A, 'econ')` function.
4. Reconstruct the image using different numbers of singular values (k = 5, 20, 50, 100).
5. Calculate reconstruction error and compare storage requirements.
6. Display the original and compressed images using `imshow()`.

## How to Run
1. Download this repo or clone it.
2. Open MATLAB (or MATLAB Online).
3. Make sure `image_compression.m` and `image.png` are in the same folder.
4. Run:
```matlab
image_compression
