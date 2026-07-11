# RealImpact

Please check out our preprocessing code here or our hardware equipment lists and designs for the gantry or the hammer striking mechanisms in the [hardware](hardware) directory.

To download our preprocessed data, run the following, starting from within this repository's base directory:

    cd dataset
    bash download.sh

We are currently working on packaging and releasing the remainder of our code as well as our raw dataset. For specific requests or inquiries, please open an issue in this repo.

_The rest of this Readme is added by Karl Hiner._

This repository is a standalone mirror of [samuel-clarke/RealImpact](https://github.com/samuel-clarke/RealImpact) (standalone because GitHub forks cannot host git-lfs objects).
It mirrors each object's preprocessed surface mesh (`dataset/<id>_<name>/preprocessed/transformed.obj`) in git-lfs.
The meshes serve as a corpus for [MeshEditor](https://github.com/khiner/MeshEditor) modal audio tests and as a backup of the upstream-hosted files.
All other dataset files stay local. Hydrate them with `dataset/download.sh` as described above.

See the [`explore_dataset` notebook](/explore_dataset.ipynb) for load/view/analysis examples for this dataset's object files:

- `angle.npy`
- `deconvolved_0db.npy`
- `distance.npy`
- `listenerXYZ.npy`
- `material_0.mtl`
- `material_0.png`
- `micID.npy`
- `transformed.obj`
- `vertexID.npy`
- `vertexXYZ.npy`

[Here](https://arxiv.org/pdf/2306.09944.pdf) is an arXiv link to the RealImpact paper.
A copy of it is committed to this fork.

## Mesh repairs

Four of the mirrored surface meshes deviate from upstream. The scans of `37_PiePan`, `51_ShellPlate`, `73_PlasticBin`, and `83_WoodVase` contain small clusters of self-intersecting triangles, which makes them invalid input for tetrahedralization. Each was repaired as follows:

- `37_PiePan` and `51_ShellPlate` each had a single sub-millimeter cluster of crossing triangles. The offending faces and their one-ring neighborhood were deleted and the holes closed with MeshLab, preserving each enclosed volume to within one part in 100,000.
- `73_PlasticBin` and `83_WoodVase` had crossings spread across many sites, so their surfaces were rebuilt entirely with [fTetWild](https://github.com/wildmeshing/fTetWild), which tolerates self-intersecting input. The rebuilt surfaces stay within 0.1% of the bounding-box diagonal of the originals.
