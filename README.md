FastNoiseLite port for Zig (0.11)
==================================

This is a port of the C++ version of [FastNoiseLite](https://github.com/Auburn/FastNoiseLite) library to Zig. No C library used. Should support `f32` and `f64` input coordinates.
To use it, the easiest is to just copy it into your project.

TODO: proper setup for use with package manager?
I added a `build.zig.zon` file but I'm not sure if it's actually necessary, or if it uses the right fields, or how to write `build.zig` accordingly. I'm new to Zig and docs are a bit scarce. Post an issue or open a PR if you know how to do it properly :)
