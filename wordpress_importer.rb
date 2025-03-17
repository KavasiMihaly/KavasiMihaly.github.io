require 'fileutils'
require 'rubygems'
require 'jekyll-import'

# Check if XML file path was provided
if ARGV.length != 1
  puts "Usage: ruby wordpress_importer.rb path/to/your-export.xml"
  exit 1
end

xml_file = ARGV[0]

# Ensure the file exists
unless File.exist?(xml_file)
  puts "Error: File '#{xml_file}' not found!"
  exit 1
end

puts "Starting WordPress import from #{xml_file}..."

JekyllImport::Importers::WordpressDotCom.run({
  "source" => xml_file,
  "no_fetch_images" => false,
  "assets_folder" => "assets"
})

puts "Import complete! Your WordPress content has been converted to Jekyll posts."
puts "You may need to adjust front matter and formatting in the generated files."
