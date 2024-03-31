const std = @import("std");
const FastNoiseLite = @import("fast_noise_lite.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello World!\n", .{});

    var fnl = FastNoiseLite{};
    {
        fnl.setFractalType(.FBm);
        fnl.setFrequency(0.03);
        var x: f64 = 42.0;
        var y: f64 = 66.0;
        var noise = fnl.getNoise2D(f64, x, y);
        try stdout.print("Noise: {d}\n", .{noise});
    }

    {
        for (0..40) |y| {
            var s: [80]u8 = undefined;
            for (0..80) |x| {
                var fx = @as(f32, @floatFromInt(x));
                var fy = @as(f32, @floatFromInt(y));
                const noise = std.math.fabs(fnl.getNoise2D(f32, fx, fy));
                if (noise < 0.25) {
                    s[x] = ' ';
                } else if (noise < 0.5) {
                    s[x] = '-';
                } else if (noise < 0.75) {
                    s[x] = '+';
                } else {
                    s[x] = '#';
                }
            }
            try stdout.print("{s}\n", .{s});
        }
    }
}
