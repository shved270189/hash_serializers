class UserSerializer < HashSerializer::JSON
  reveal :name, :email
  reveal :avatar, as: :avatar_url
end
