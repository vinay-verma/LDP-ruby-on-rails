require_relative 'crud'

users = [
  { 'username' => 'spiderman', 'password' => 'spiderman123' },
  { 'username' => 'antman', 'password' => 'antman123' },
  { 'username' => 'ironman', 'password' => 'ironman123' }
]

Crud.create_secure_users(users)

print 'Test 1 >> '
puts Crud.authenticate_user('ironman', 'ironman123', users)

print 'Test 2 >> '
puts Crud.authenticate_user('superman', 'ironman123', users)
