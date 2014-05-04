# Each image in each directory needs to be sorted.

# Grab each directory
directories = Dir.glob('**/*').select{ |fn| File.directory?(fn) }

# Grab each file and put in an array
file_names = []
directories.each do |directory|
  # If the entry is a file, add it to the file_names array
  file_names << Dir.entries(directory).select { |f| File.file?(f) }
end

puts file_names
