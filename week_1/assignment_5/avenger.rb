# frozen_string_literal: true

require_relative 'crud'

# Regular people with special abilities
class Avenger
  include Crud
  attr_accessor :name, :password, :special_ability

  def initialize(name, password, special_ability)
    @name = name
    @password = encode_password(password)
    @special_ability = special_ability
  end

  def to_s
    "Name: #{@name}, Password: #{@password}, Special Ability: #{@special_ability}"
  end
end
