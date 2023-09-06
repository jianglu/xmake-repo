package("libnfs")
    set_homepage("https://github.com/sahlberg/libnfs")
    set_description("NFS client library")

    add_urls("https://github.com/sahlberg/libnfs/archive/refs/tags/libnfs-$(version).tar.gz",
             "https://github.com/sahlberg/libnfs.git")

    add_versions("5.0.2", "637e56643b19da9fba98f06847788c4dad308b723156a64748041035dcdf9bd3")

    add_deps("cmake")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:is_debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)