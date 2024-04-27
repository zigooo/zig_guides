const std = @import("std");

pub fn main() !void {
    // To generate cryptographically secure random data,
    // See: guides/hashing/generate_secure_random_data.zig

    const seed = blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    };

    var prng = std.Random.DefaultPrng.init(seed);
    const rand = prng.random();
    const a = rand.float(f32);
    const b = rand.boolean();
    const c = rand.int(u8);
    const d = rand.intRangeAtMost(u8, 0, 255);
    std.debug.print("{}\n{}\n{}\n{}\n", .{ a, b, c, d });
}
