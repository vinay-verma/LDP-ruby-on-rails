require 'bcrypt'

users = [
  { 'username' => 'spiderman', 'password' => 'spiderman123' },
  { 'username' => 'antman', 'password' => 'antman123' },
  { 'username' => 'ironman', 'password' => 'ironman123' }
]

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

create_secure_users(users)

puts users
