#!/usr/bin/env ruby
puts "Work in progress, non-functioning"
puts "Compiling documents"
templates = Dir.glob("templates/*").select { |f| !File.directory? f}
documents = Dir.glob("documents/*").select { |f| !File.directory? f}
documents.each do |filename|
	text = ""
	File.foreach(filename) do |line|
		newline = line
		matches = line.scan(/\$\{(.*?)\}/)
		matches.each do |include|
			matchstring = include[0].to_s
			begin
				included = File.read("templates/#{matchstring}.md")
				newline = line.gsub(/\$\{#{matchstring}\}/, included);
			rescue
				puts "Could not find file \"templates/#{matchstring}.md\""
			end
		end
		text += newline
	end
	puts text
	changelog = `git log --pretty=format:"| %h | %d %s | %cn | %ci |" #{filename}`
end

#gitversion = `git version`
#puts gitversion
