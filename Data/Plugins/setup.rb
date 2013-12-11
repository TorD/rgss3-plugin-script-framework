# OPTIONAL: This is an optional array of plugins that are to be loaded first, and in the specified order. All other plugins not mentioned here are loaded afterwards and alphabetically.
# You can leave this array empty.
PRIORITY_PLUGINS = [															
	"Global Settings",
]

# REQUIRED: This is the root plugin directory (the one this file resides in).
ROOT_PATH = "Data/Plugins"

# REQUIRED: This is the bootstrap filename that the Plugin module should look for in plugins.
BOOTSTRAP_FILE = "bootstrap.rb"

# We now require the Plugins module
load_script "#{ROOT_PATH}/plugins_module.rb"

# REQUIRED: We set the above settings in the Plugins module
Plugins.root_path = ROOT_PATH 										
Plugins.bootstrap_file = BOOTSTRAP_FILE

# REQUIRED: We load all the plugins found in the ROOT_PATH folder. The :order param includes the above specified PRIORITY_PLUGINS array.
# If you don't have any need for prioritizing plugins, simply call it without any params, like the line commented out below
# Plugins.load_plugins
Plugins.load_plugins(
	:path => "*",
	:order => PRIORITY_PLUGINS)

# Package all plugin scripts into a single scripts file, so that it also works in encrypted environments
Plugins.package

# Now load all the plugin scripts
load_script("#{ROOT_PATH}/scripts.rb")