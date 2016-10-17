require 'ostruct' 

basedir = ARGV.first.sub(/\/$/, '') || "."

repos = %x[find #{basedir} -name '*.git' -type d | sort].split("\n").map do |path|
  repo = OpenStruct.new
  repo.path = path.sub(/\.git$/, '')
  repo.status = %x[cd #{repo.path}; git status]
  repo
end

clean = repos.select {|_| _.status =~ /working directory clean/ }
unpushed = repos.select {|_| _.status =~ /branch is ahead/ }
unstaged = repos - clean - unpushed

puts "\nUNSTAGED"
puts unstaged.map{|_| _.path }.join("\n")

puts "\nUNPUSHED"
puts unpushed.map{|_| _.path }.join("\n")
