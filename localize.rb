pattern = /NSLocalizedString\([^"]*"[^"]*"[^"]*"[^"]*"[^)]*\)/

strings = []

Dir.glob("**/*") do |file|
  if not File::directory?(file) then
    File.open(file) do |f|
      f.each_line do |line|
        unless (matches = line.scan(pattern)).empty?
          matches.each do |match|
            strings << match.match(/@("[^"]*")/).captures
          end
        end
      end
    end
  end
end

strings = strings.sort
strings.uniq.each do |string|
  print string
  print ' = '
  print string
  print ' ;'
  puts
end

strings.uniq.each do |string|
  print string
  print ' = '
  print '""'
  print ' ;'
  puts
end