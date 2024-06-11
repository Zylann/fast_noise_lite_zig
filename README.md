# FastNoiseLite port for Zig (0.12.0)

This is a port of the C++ version of [FastNoiseLite](https://github.com/Auburn/FastNoiseLite) library to Zig. No C library used. Should support `f32` and `f64` input coordinates.

# Add to your project

1. Use `zig fetch --save "git+https://github.com/Zylann/fast_noise_lite_zig#COMMIT_HASH"` to add fast_noise_lite_zig to your `build.zig.zon` replacing `COMMIT_HASH` with the respective commit hash you want to get.

2. Add the following to your `build.zig`:

```zig
const fnl_dep = b.dependency("fast_noise_lite");
your_exe_or_lib.root_module.addImport("fast-noise-lite", fnl_dep.module("fast-noise-lite"));
```
