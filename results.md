# Results

## Original vs Compressed Images
![Original vs Compressed](result_images.png)

Rank 5 is very blurry. As rank increases to 100, the image becomes clear and close to the original..

## Reconstruction Error and Storage Graphs
![Results Graphs](result_graphs.png)

As rank increases, reconstruction error decreases but storage used increases. This shows the trade-off in image compression.

## Command Window Output

| Rank | Relative Error | Storage (%) |
| --- | --- | --- |
| 5 | 0.206232 | 0.61 |
| 20 | 0.152811 | 2.43 |
| 50 | 0.121646 | 6.08 |
| 100 | 0.098194 | 12.16 |

Higher rank = better quality but more storage needed.
