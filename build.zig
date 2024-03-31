const std = @import("std");

pub fn build(b: *std.Build) void {
    // TODO Proper library build
    // Though honestly I think the easiest way to use this library is to just copy it into your project.

    const exe = b.addExecutable(.{
        .name = "FastNoiseLite",
        .root_source_file = .{ .path = "test.zig" },
        // .target = b.host,
    });

    b.installArtifact(exe);
}
