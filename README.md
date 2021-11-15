# singularity-ce-install-scripts

These simple scripts will help with installing [singularity](https://github.com/sylabs/singularity/).

## Aalto Ubuntu 20.04

To install singularity, do the following:

```sh
cd ubuntu

./install_requirements.sh     # Requires sudo priviliges
./build_singularity.sh        # Does not require sudo privileges
./install_singularity.sh      # Requires sudo priviliges
```

See `versions.sh` for information on versions, checksums etc.
