# frozen_string_literal: true

require 'bcrypt'

# Regular people with special abilities
class Avenger
  attr_accessor :name, :password, :special_ability

  def initialize(name, password, special_ability)
    @name = name
    @password = BCrypt::Password.create(password)
    @special_ability = special_ability
  end

  def to_s
    "Name: #{@name}, Password: #{@password}, Special Ability: #{@special_ability}"
  end
end

ironman = Avenger.new('ironman', 'ironman123', 'armored suit')
hulk = Avenger.new('hulk', 'hulk123', 'raged indestructible beast')
puts ironman
puts hulk
