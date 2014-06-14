puts "Global Settings loaded"
puts "Example 1 class ready"
puts "Example 1 module ready"
puts "Example 2 data ready"
puts "Example 2 core ready"
puts "Example 2 exclude me should not be excluded"
puts "Example 2 insert in between"
puts "Example 2 Insert Last"
puts "Example 3 system ready"
puts "Example 3 system found Example 1; extra functionality added, zing!" if Plugins.has_plugin?("Example 1")

class TDD
	def self.extension
		puts "Extension called"
	end
end
puts "Example 3 sub 1 loaded"
puts "Example 3 sub 2 loaded"
