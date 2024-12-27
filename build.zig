const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Exposing module to the build system so the dependees can use it.
    _ = b.addModule("fast-noise-lite", .{ .root_source_file = b.path("src/fast_noise_lite.zig") });

    const lib = b.addStaticLibrary(.{
        .name = "fast-noise-lite-zig",
        .root_source_file = b.path("src/fast_noise_lite.zig"),
        .optimize = optimize,
        .target = target,
    });
    b.installArtifact(lib);

    const tests = b.addTest(.{
        .root_source_file = b.path("src/test.zig"),
        .optimize = optimize,
        .target = target,
    });
    const run_test_step = b.addRunArtifact(tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_test_step.step);
}
