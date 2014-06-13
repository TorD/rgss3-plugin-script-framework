#==============================================================================
# ** TDD Plugins Module - Blank Setup File
#------------------------------------------------------------------------------
# Description
# ===========
# This is a minified setup file without all the comments and descriptions. If
# you want to use it in your project instead of the inflated default setup.rb
# file, just delete setup.rb and rename this file into setup.rb
#==============================================================================
plugins = {
}
ROOT_PATH = "Plugins"
load_script "Data/#{ROOT_PATH}/plugins_module.rb"
Plugins.root_path = ROOT_PATH
Plugins.load_recursive(plugins)
Plugins.package
load_script("Data/#{ROOT_PATH}/scripts.rb")