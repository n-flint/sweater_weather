class SessionsFacade
  attr_reader :id

  def initialize(user_data)
    @id = 1
    @email = user_data['email']
    @password = user_data['password']
  end

  def authenticated_user
    user = User.find_by(email: @email)
    user if user.authenticate(@password)
  end

  def api_key
    authenticated_user.api_key
  end

  def user_id
    authenticated_user.id
  end
end