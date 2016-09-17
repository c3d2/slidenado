#!/usr/bin/env ruby

require 'yaml'
require 'erb'

# Load files
lecture_path = ARGV[0]
lecture = YAML.load_file lecture_path
deck = YAML.load_file File.join("decks", lecture['deck'])

# Convert pathes to be relative to outdir_path
deck.each do |name, files|
  files.map! do |f|
    File.join("..", "..", "content", f)
  end
end

# Prepare flat list of included .tex files
deck_files = []
deck.each do |name, files|
  deck_files.push *files
end

outdir_path = ARGV[1]
makefile_template = ERB.new(File.read("makefile_template.erb"))
File.write File.join(outdir_path, "Makefile"), makefile_template.result

latex_template = ERB.new(File.read("latex_template.tex.erb"))
notes=false
File.write File.join(outdir_path, "slides.tex"), latex_template.result
notes=true
File.write File.join(outdir_path, "slides_with_notes.tex"), latex_template.result
