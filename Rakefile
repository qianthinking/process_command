require 'rubygems'
 
task :clean do
  sh "rm process_command*.gem"
end

task :build do
  sh "gem build process_command.gemspec"
end

task :release do
  sh "gem push `ls -lr process_command*.gem | awk '{print $8}'`"
end

