#!/usr/bin/env ruby

require 'yaml'

lecture_path = ARGV[0]
lecture = YAML::load_file lecture_path
sections = YAML::load_file File.join(File.dirname(lecture_path), lecture['sections'])
section_files = []
sections.each do |name, files|
  p :name => name, :files => files
  section_files.push *files
end

outdir_path = ARGV[1]
# TODO: convert to erb as well?
File.write File.join(outdir_path, "Makefile"), <<EOF
slides.pdf: slides.tex #{section_files.join " "}
\tpdflatex $<
EOF
