def greeting
  greet = ARGV[0]
  ARGV.each_with_index do |arg, index|
    unless index == 0
      puts "#{greet} #{arg}"
    end
  end
end
greeting
