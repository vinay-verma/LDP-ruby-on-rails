# frozen_string_literal: true

require_relative 'avenger'

users = [
  { 'username' => 'spiderman', 'password' => 'spiderman123', 'special_ability' => 'Shoots spider web' },
  { 'username' => 'antman', 'password' => 'antman123', 'special_ability' => 'Can change his size' },
  { 'username' => 'ironman', 'password' => 'ironman123', 'special_ability' => 'Super intelligent and powerful suit' }
]

def create_avengers(list_of_users)
  avengers = []
  list_of_users.each do |user|
    avengers.push(Avenger.new(user['username'], user['password'], user['special_ability']))
  end
  avengers
end

avengers = create_avengers(users)

def validate_user(username, password, avengers)
  avengers.each do |user|
    if user.name == username
      return 'AUTHORISED' if user.decode_password(user.password) == password

      return 'INCORRECT_PASSWORD'
    end
  end
  'UNKNOWN_USER'
end

def input_nick_name
  print '>> '
  puts 'Please enter your nickname'
  gets.chomp
end

def input_pass_code
  print '>> '
  puts 'Please enter your passcode'
  gets.chomp
end

30.times { print '*' }
puts
puts 'Welcome to Avengers Secret HQ'
puts avengers
30.times { print '*' }
puts
nick_name = input_nick_name
pass_code = input_pass_code
retries = 3
while retries.positive?
  status = validate_user(nick_name, pass_code, avengers)
  case status
  when 'AUTHORISED'
    retries = 0
    puts "@@ Welcome back #{nick_name.capitalize}, Captain America is waiting for you. :)"
  when 'INCORRECT_PASSWORD'
    retries -= 1
    puts '@@ Incorrect password !!!'
    puts
    pass_code = input_pass_code
  when 'UNKNOWN_USER'
    retries -= 1
    puts '@@ Hey, You are not an Avenger :('
    puts
    nick_name = input_nick_name
    pass_code = input_pass_code
  else
    retries -= 1
    puts '@@ Oops, this is embarrassing ! even Jarvis is not perfect :P'
    nick_name = input_nick_name
    pass_code = input_pass_code
  end
  puts 'Intruder alert !!' if status != 'AUTHORISED' && retries.zero?
end
