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
