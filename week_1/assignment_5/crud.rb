module Crud
  require 'bcrypt'

  # users = [
  #   { 'username' => 'spiderman', 'password' => 'spiderman123' },
  #   { 'username' => 'antman', 'password' => 'antman123' },
  #   { 'username' => 'ironman', 'password' => 'ironman123' }
  # ]

  def encode_password(password)
    BCrypt::Password.create(password)
  end

  def decode_password(password)
    BCrypt::Password.new(password)
  end

  def create_secure_users(list_of_users)
    list_of_users.each do |user|
      user['password'] = encode_password(user['password'])
    end
  end

  # create_secure_users(users)

  def authenticate_user(username, password, list_of_users)
    list_of_users.each do |user|
      return user if user['username'] == username && decode_password(user['password']) == password
    end
    'Incorrect username or password !!!'
  end

  # print 'Test 1 >> '
  # puts authenticate_user('ironman', 'ironman123', users)

  # print 'Test 2 >> '
  # puts authenticate_user('superman', 'ironman123', users)
end
