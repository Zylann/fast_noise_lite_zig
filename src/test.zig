const std = @import("std");
const FastNoiseLite = @import("fast_noise_lite.zig");

fn noiseToChar(v: f32) u8 {
    if (v < 0.25) {
        return ' ';
    } else if (v < 0.5) {
        return '-';
    } else if (v < 0.75) {
        return '+';
    } else {
        return '#';
    }
}

fn printNoiseBuffer(writer: anytype, buffer: []const f32, size_x: u32, size_y: u32) !void {
    var i: u32 = 0;
    for (0..size_y) |_| {
        for (0..size_x) |_| {
            const v = buffer[i];
            const c = noiseToChar(v);
            try writer.writeByte(c);
            i += 1;
        }
        try writer.writeByte('\n');
    }
}

test "noise_gen_test" {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello World!\n", .{});

    // Create and configure FastNoise object
    var noise = FastNoiseLite{};
    noise.setNoiseType(.OpenSimplex2);

    // Gather noise data
    var noise_data: [128 * 128]f32 = undefined;
    var index: u32 = 0;
    for (0..128) |y| {
        for (0..128) |x| {
            noise_data[index] = noise.getNoise2D(f32, @as(f32, @floatFromInt(x)), @as(f32, @floatFromInt(y)));
            index += 1;
        }
    }

    try printNoiseBuffer(stdout, &noise_data, 128, 128);

    {
        noise.setFractalType(.None);
        noise.setNoiseType(.Cellular);
        noise.setFrequency(0.03);
        const x: f64 = 42.0;
        const y: f64 = 66.0;
        const v = noise.getNoise2D(f64, x, y);
        try stdout.print("Noise: {d}\n", .{v});
    }

    // {
    //     for (0..40) |y| {
    //         var s: [80]u8 = undefined;
    //         for (0..80) |x| {
    //             var fx = @as(f32, @floatFromInt(x));
    //             var fy = @as(f32, @floatFromInt(y));
    //             const v = std.math.fabs(noise.getNoise2D(f32, fx, fy));
    //             if (v < 0.25) {
    //                 s[x] = ' ';
    //             } else if (v < 0.5) {
    //                 s[x] = '-';
    //             } else if (v < 0.75) {
    //                 s[x] = '+';
    //             } else {
    //                 s[x] = '#';
    //             }
    //         }
    //         try stdout.print("{s}\n", .{s});
    //     }
    // }
}
