const std = @import("std");
const AcceptError = @import("std").fs.Dir.AccessError;

pub fn main() !void {
    // Creating the file
    const file = try std.fs.cwd().createFile("file.txt", .{});
    defer file.close();

    // Using `access`
    var flag1 = true;
    std.fs.cwd().access("file.txt", .{}) catch |err| {
        flag1 = switch (err) {
            AcceptError.FileNotFound => true,
            else => false,
        };
    };
    std.debug.print("{}\n", .{flag1});

    // Using `openFile`
    var flag2 = true;
    _ = std.fs.cwd().openFile("file_not_exists.txt", .{}) catch |err| {
        flag2 = err == AcceptError.FileNotFound;
    };
    std.debug.print("{}\n", .{flag2});
}
