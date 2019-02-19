class UserSerializer < HashSerializer::JSON
  attributes :name, :email, :avatar
end