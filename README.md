Plugin Framework for RPG Maker VXAce / RGSS3
============================================
The Plugin Framework for RPG Maker VXAce is an alternative to using the build-in code editor. While the editor is sufficient for many projects and uses, once you get to a substantial amount of scripts, managing them all starts requiring a lot of manual labor. I don't like manual labor when I can help it.

The Plugin Framework aims to make your life easier by doing the following:
* Group scripts into folders and subfolders. And subfolders of subfolders of subfolders, if you like.
* Order scripts the way you want to, by using an optional array. By default, files are read alphabetically.
* Exclude files using simple options. This is handled using arrays, and you can implement your own logic for how to do this smartly. Examples will be provided.
* Compatibility: The Framework requires no special structuring of scripts, and is therefore **compatible with all existing scripts**.

Installation in RPG Maker VXAce
===============================
The framework consists of two parts; one that goes into the script editor in RPG Maker VXAce (to make it actually load the framework), and two files which should be placed within "Your Project Directory/Data/Plugins". The "Plugins" folder can be named whatever you want (like "Scripts"?) but you *must* place it within your Data directory. This is so that the whole thing works in encrypted projects, which put restrictions of placement of external files.

Here's what you need to paste into the script editor in RPG Maker VXAce, in a slot below ▼ Materials and above ▼ Main Process:

First, there's Tsukihime's "External Script Loader" script:
```
=begin
#===============================================================================
 Title: External Script Loader
 Author: Tsukihime
 Date: Dec 2, 2013
 URL: http://himeworks.wordpress.com/2013/12/02/external-script-loader/
--------------------------------------------------------------------------------
 ** Change log
 Dec 2, 2013
   - Initial release
--------------------------------------------------------------------------------   
 ** Terms of Use
 * Free to use in commercial/non-commercial projects
 * No real support. The script is provided as-is
 * Will do bug fixes, but no compatibility patches
 * Features may be requested but no guarantees, especially if it is non-trivial
 * Credits to Tsukihime in your project
 * Preserve this header
--------------------------------------------------------------------------------
 ** Description
 
 This script allows you to load external scripts into the game. It supports
 loading from encrypted archives as well.

--------------------------------------------------------------------------------
 ** Installation
 
 Place this script below Materials and above Main

--------------------------------------------------------------------------------
 ** Usage 
 
 To load and evaluate script, use the following function call:
 
   load_script(script_path)
   
--------------------------------------------------------------------------------
 ** Example
 
 I have a folder called "Scripts" and a script called "test.rb" in that folder.
 If I want to load the script, I would just write
 
   load_script("Scripts/test.rb")
   
 This will evaluate the test script.
 
#===============================================================================
=end
$imported = {} if $imported.nil?
$imported["TH_ExternalScriptLoader"] = true
#===============================================================================
# * Rest of Script
#===============================================================================
#-------------------------------------------------------------------------------
# Convenience function. Equivalent to
#   script = load_data(path)
#   eval(script)
# It supports loading from encrypted archives
#-------------------------------------------------------------------------------
def load_script(path)
  eval(load_data(path))
end

#-------------------------------------------------------------------------------
# Load files from non-RM files
#-------------------------------------------------------------------------------
class << Marshal
  alias_method(:th_core_load, :load)
  def load(port, proc = nil)
    th_core_load(port, proc)
  rescue TypeError
    if port.kind_of?(File)
      port.rewind 
      port.read
    else
      port
    end
  end
end unless Marshal.respond_to?(:th_core_load)
```
Then you need to paste this below that (but above ▼ Main Process.) If you name your plugins directory something other than "Plugins", be sure to change this to reflect that:
```
load_script("Data/Plugins/setup.rb")
```
This is all you need in RPG Maker VXAce's script editor; all your other scripts can then be placed within files in the plugins director.

Usage
=====
To use the Plugin Framework, you will need two files in your "Data/Plugins" folder. These are a [setup.rb](https://github.com/TorD/rgss3-plugin-script-framework/blob/master/Data/Plugins/setup.rb) file and a [plugins_module.rb](https://github.com/TorD/rgss3-plugin-script-framework/blob/master/Data/Plugins/plugins_module.rb) file. For now, please look at [the demo project's plugins folder](https://github.com/TorD/rgss3-plugin-script-framework/tree/master/Data/Plugins) to see how the setup.rb file should be structured; it's documented pretty well. The plugins_module.rb file should be included unchanged.

An additional undocumented and minifed setup file has been included, called [setup_blank.rb](https://github.com/TorD/rgss3-plugin-script-framework/blob/master/Data/Plugins/setup_blank.rb). Use this when you know how it all works and don't want the comments and explanations in your project :)

The scripts.rb file
===================
This is a file generated in your plugins directory every time you test your project in RPG Maker VXAce. It is generated for compatibility with Ace's encryption mode (when you export your game to a standalone executable, and select encrypted archive). **You should never edit this file yourself**; edit the scripts individually, and **test the game to autogenerate it**.

**Important:** As this file is generated when you test your game, it is important that you **always test your game** after you perform changes to your scripts. This is not only required, but also good coding practice, since you should never ship an untested game!

Todo
====
Expanded explanations and documentation (in the form of GitHub wiki pages)

License
=======
Free for commercial and non-commercial use with credits. Please credits all names mentioned in the below credits section. Thank you.

Credits
=======
* Tsukihime for the "External Script Loader" script
* Galenmereth / Tor Damian for the Plugin Framework




_The Empire Never Ended_
