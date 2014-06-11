load_script "Data/Plugins/plugins_module.rb"

plugins = {
  "Global Settings" => {},
  "Example 1" => {
    "classes" => {},  # This is a subfolder; any string key will be regarded as a subfolder, and
                      # any parameters within its hash value will be evaluated as options
                      # for that folder. You can nest subfolders infinitely
    "modules" => {
      exclude: ["exclude me"] # If you specify an exclude array, those files will not be loaded
    }
  },
  "Example 2" => {
    order: ["data"] # If you specify an order array for a folder, those files will be loaded first
  },
  "Example 3" => {
    "sub 1" => {    # Nested subfolder level 1
      "sub 2" => {} # Nested subfolder level 2
    }
  }
}

Plugins.load_recursive(plugins)

# REQUIRED: This is the root plugin directory (the one this file resides in).
ROOT_PATH = "Data/Plugins"

# REQUIRED: This is the bootstrap filename that the Plugin module should look for in plugins.
BOOTSTRAP_FILE = "bootstrap.rb"

# REQUIRED: We load all the plugins found in the ROOT_PATH folder. The :order param includes the above specified PRIORITY_PLUGIN_FOLDERS array.
# If you don't have any need for prioritizing plugins, simply call it without any params, like the line commented out below
# Plugins.load_plugins
# Plugins.load_plugins(
# 	:path => "*",
# 	:order => PRIORITY_PLUGIN_FOLDERS)

# Package all plugin scripts into a single scripts file, so that it also works in encrypted environments
Plugins.package

# Now load all the plugin scripts
load_script("#{ROOT_PATH}/scripts.rb")