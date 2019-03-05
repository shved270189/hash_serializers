class UserSerializer < HashSerializer::JSON
  format :boolean do |val|
    !!val
  end

  format :date do |val|
    val.iso8601
  end

  reveal :name, :email
  reveal :avatar, as: :avatar_url

  reveal :is_admin, format: :boolean

  with_format :date do
    reveal :registered_at
  end
end
