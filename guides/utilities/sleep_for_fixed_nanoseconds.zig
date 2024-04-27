const std = @import("std");

pub fn main() !void {
    // Sleep for 1 second
    const now = std.time.milliTimestamp();
    std.debug.print("now: {}.\n", .{now});
    std.time.sleep(1e9);
    const cost = std.time.milliTimestamp();
    std.debug.print("now: {}, cost: {}, after 1 second.\n", .{ cost, cost - now });
}
