desc "Build coffeescript files"
task :build do
  FileList['*.coffee'].each do |file|
    puts "building #{file}"
    output = File.basename(file, ".coffee")
    system "cat #{file} | coffee -scp > #{output}.js"

    processed_output = File.read(output + ".js")
    processed_output.gsub!(/^\s+REQUIRE\(([\w\.]+)\)/) { |f|
      dep = f.scan(/\s+REQUIRE\(([\w\.]+)\)/).flatten.first
      File.read("vendor/" + dep)
    }

    File.open(output + ".js", "w+") { |f| f.puts(processed_output) }
  end
end
