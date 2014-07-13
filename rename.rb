# Each image in each directory needs to be sorted.

file_names = Dir.glob('**/*').select{ |fn| File.file?(fn) }

file_names.sort_by!{ |file_name| File.mtime(file_name) } # Sort array by creation time

# Should probably name files by their unix date.
puts file_names
puts "\n#{file_names.count} files found"
