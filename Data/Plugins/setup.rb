# This is the root plugin directory (the one this file resides in).
ROOT_PATH = "Data/Plugins"

# We then load the plugins module file that takes care of all the magic
load_script "Data/Plugins/plugins_module.rb"

# We then the plugins module where the root path is
Plugins.root_path = ROOT_PATH

# Now we set up our folder structure with options
plugins = {
  "Global Settings" => {},
  "Example 1" => {
    "classes" => {},  # This is a subfolder; any string key will be regarded as a subfolder, and
                      # any parameters within its hash value will be evaluated as options
                      # for that folder. You can nest subfolders infinitely
    "modules" => {
      exclude: ["exclude me"] # If you specify an exclude array, those files will not be loaded.
                              # Typing .rb behind the filename is not necessary.
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

# Load folder structure using load_recursive
Plugins.load_recursive(plugins)

# Package all plugin scripts into a single scripts file, so that it also works in encrypted environments
Plugins.package

# Now load all the plugin scripts
load_script("#{ROOT_PATH}/scripts.rb")