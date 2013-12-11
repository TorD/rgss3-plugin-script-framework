puts "Example 3 system ready"
puts "Example 3 system found Example 1; extra functionality added, zing!" if Plugins.has_plugin?("Example 1")

class TDD
	def self.extension
		puts "Extension called"
	end
end