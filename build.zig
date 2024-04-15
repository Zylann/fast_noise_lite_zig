const std = @import("std");

pub fn build(b: *std.Build) void {
    // TODO Proper library build (how to retain the ability to make an executable for development?)
    // Though honestly I think the easiest way to use this library is to just copy it into your project.

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "FastNoiseLite",
        .root_source_file = .{ .path = "test.zig" },
        .optimize = optimize,
        .target = target,
    });

    b.installArtifact(exe);
}
