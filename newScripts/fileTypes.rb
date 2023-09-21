require 'rugged'
require 'linguist'

repo = Rugged::Repository.new(ARGV[0])
project = Linguist::Repository.new(repo, repo.head.target_id)
result = project.breakdown_by_file

# Create a hash to store the counts of files per language
file_counts = Hash.new(0)

# Iterate through the result and count files per language
result.each do |language, files|
  file_counts[language] = files.length
end

# Print the counts
file_counts.each do |language, count|
  puts "#{language}: #{count} files"
end