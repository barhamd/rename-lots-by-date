# Each image in each directory needs to be sorted.

# Grab each directory
directories = Dir.glob('**/*').select{ |fn| File.directory?(fn) }

# Grab each file and put in an array
file_names = []
directories.each do |directory|
  # If the entry is a file, add it to the file_names array
  file_names << File.expand_path(Dir.entries(directory).select { |f| File.file?(f) })
  file_names.flatten!
end

file_names.sort_by!{ |file_name| File.mtime(file_name) } # Sort array by creation time

# Should probably name files by their unix date.
puts file_names
