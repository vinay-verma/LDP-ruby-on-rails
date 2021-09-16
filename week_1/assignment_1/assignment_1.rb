# frozen_string_literal: true

pincode_directory = {
  'newyork' => '212',
  'newbrunswick' => '732',
  'edison' => '908',
  'plainsboro' => '609',
  'sanfrancisco' => '301',
  'miami' => '305',
  'paloalto' => '650',
  'evanston' => '847',
  'orlando' => '407',
  'lancaster' => '717'
}

def get_city_names(directory)
  directory.keys
end

def get_area_code(directory, city)
  directory[city]
end

30.times { print '*' }
puts
puts 'Welcome to City Pin Code Directory'
30.times { print '*' }
puts

puts 'Search pincode for following cities: '
puts get_city_names(pincode_directory).join(', ')

loop do
  puts
  puts '>> Enter city name to search or "q" to exit.'
  input_city = gets.chomp

  break if input_city == 'q'

  if pincode_directory.include?(input_city)
    puts get_area_code(pincode_directory, input_city)
  else
    puts "Entered city \"#{input_city}\" is not in directory"
  end
end
