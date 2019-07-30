require 'securerandom'
class UserFacade
  attr_reader :id

  def initialize(user_data)
    @id = 1
    @user_data = user_data
  end

  def api_key
    key = SecureRandom.hex(10)
    create_user(key)
  end

  private

  def create_user(key)
    User.create(emal: user_data['email'], password: user_data['password'], api_key: key)
  end


end