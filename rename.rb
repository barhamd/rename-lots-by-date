# Each image in each directory needs to be sorted.

file_names = Dir.glob('**/*').select{ |fn| File.file?(fn) }

file_names.sort_by!{ |file_name| File.mtime(file_name) } # Sort array by creation time

# Should probably name files by their unix date.
puts file_names
puts "\n#{file_names.count} files found.\nWould you like to rename these files? This can't be undone."
answer = gets.chomp.downcase()

if answer == 'yes' || answer == 'y'
  i = 1
  file_names.each do |file_name|
    File.rename(file_name, "#{'%06d' % i}.jpg")
    i = i + 1
  end
end
