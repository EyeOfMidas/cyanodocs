#!/usr/bin/env ruby
puts "Work in progress, non-functioning"
puts "Compiling documents"
templates = Dir.entries("../templates").select { |f| !File.directory? f}
documents = Dir.entries("../documents").select { |f| !File.directory? f}

documents.each do |filename|
	text = File.read("../documents/" + filename)
	header = File.read("../templates/" + "header.md")
	newtext = text.gsub(/\$\{header\}/, header);
	puts newtext;
end

gitversion = `git version`
puts gitversion
