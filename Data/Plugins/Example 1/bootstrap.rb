puts "Example 1 found Global Settings plugin!" if Plugins.has_plugin?("Global Settings")

Plugins.register("Example 1")
Plugins.load_files(:path => "modules")
Plugins.load_files(:path => "classes")