# DKLIB
This is a library of random things that bleed across different projects
like an error enum and pretty test printing.

plus it's a way to learn how to import "3rd party" zig module.

# Installation
using the bellow zig fetch command, will download the specified tag version. 

```console
zig fetch --save git+https://github.com/BearzRobotics/dklib?tag=dklib-v0.0.2
```

Under the release section of the project you can click on a realse version
and take the end part after tag/. In the example below dklib-v0.0.2 and replace
everything afther the "=" sgin the zig fetch command above to target a specific 
version of the library

https://github.com/BearzRobotics/dklib/releases/tag/dklib-v0.0.2

Now in your build.zig

```console
const dklib = b.dependency("dklib", .{
    .target = target,
    .optimize = optimize,
});
exe.root_module.addImport("dklib", dklib.module("dklib"));
```