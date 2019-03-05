FactoryBot.define do
  factory :user, class: Hash do
    initialize_with do
      {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        avatar: Faker::Avatar.image,
        beer_style: Faker::Beer.style,
        is_admin: nil,
        registered_at: Time.now,
        location: {
          latitude: Faker::Address.latitude,
          longitude: Faker::Address.longitude
        },
        addresses: [
          {
            country: Faker::Address.country,
            city: Faker::Address.city,
            street: Faker::Address.street_address,
            building: Faker::Address.building_number,
            zip: Faker::Address.zip_code
          },
          {
            country: Faker::Address.country,
            city: Faker::Address.city,
            street: Faker::Address.street_address,
            building: Faker::Address.building_number,
            zip: Faker::Address.zip_code
          },
          {
            country: Faker::Address.country,
            city: Faker::Address.city,
            street: Faker::Address.street_address,
            building: Faker::Address.building_number,
            zip: Faker::Address.zip_code
          }
        ]
      }
    end
  end
end
