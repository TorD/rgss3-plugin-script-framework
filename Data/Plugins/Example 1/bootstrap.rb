puts "Example 1 found Global Settings plugin!" if Plugins.has_plugin?("Global Settings")

Plugins.register("Example 1")
Plugins.require_files(:path => "modules")
Plugins.require_files(:path => "classes")