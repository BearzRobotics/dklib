const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Create the module (library)
    const lib = b.addStaticLibrary(.{
        .name = "dklib",
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Make it installable (so dependent projects can use it)
    b.installArtifact(lib);

    // Optional: unit tests for this library
    const unit_tests = b.addTest(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_tests = b.addRunArtifact(unit_tests);

    const test_step = b.step("test", "Run dklib tests");
    test_step.dependOn(&run_tests.step);
}
