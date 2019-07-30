class SessionsSerializer
  include FastJsonapi::ObjectSerializer

  attribute :id, :api_key
end