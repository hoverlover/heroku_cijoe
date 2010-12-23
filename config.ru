puts "Making projects directory at tmp/projects"
File.mkdirp "tmp/projects"

puts "Cloning git repo"
`git clone https://hoverlover@github.com/bustoutsolutions/affluence.git tmp/projects/affluence`

puts "Starting CI Joe"
`cijoe tmp/projects/affluence`

puts "Done"
