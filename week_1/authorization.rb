# frozen_string_literal: true

# using global variable is bad practice in general, used here only for learning purpose
$users = [
  { 'username' => 'spiderman', 'password' => 'spiderman123' },
  { 'username' => 'antman', 'password' => 'antman123' },
  { 'username' => 'ironman', 'password' => 'ironman123' }
]

def validate_user(username, password)
  user = $users.select { |u| u['username'] == username }
  if user.length.positive?
    return 'AUTHORISED' if user[0]['password'] == password

    return 'INCORRECT_PASSWORD'
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
30.times { print '*' }
puts
nick_name = input_nick_name
pass_code = input_pass_code
retries = 3
while retries.positive?
  status = validate_user(nick_name, pass_code)
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
