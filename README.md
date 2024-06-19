# MPCGPU

Modified version of [MPC-GPU](https://github.com/A2R-Lab/MPCGPU) fine-tuned to run on Jetson Xavier.

TODO: add to the module the custom solver from [KittJr](https://git.hipert.unimore.it/F1-10/kitt_jr/-/tree/master/src/mpc/mpc?ref_type=heads).

## Building and running examples

To download and build the source code:

```bash
git clone --recursive https://git.hipert.unimore.it/fmuzzini/mpc-gpu.git
make pcg
```

To run:

```bash
./examples/pcg.exe
```

## Setting parameters

You can set a bunch of parameters in `include/common/settings.cuh`. You can also modify these by passing them as
compiler flags. This will overwrite the default values set for these parameters.

## License

[MIT](https://choosealicense.com/licenses/mit/)