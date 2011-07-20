desc "Build coffeescript files"
task :build do
  FileList['*.coffee'].each do |file|
    puts "building #{file}"
    output = File.basename(file, ".coffee")
    system "cat #{file} | coffee -scp --bare > #{output}.js"
  end
end