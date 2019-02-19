RSpec.describe 'HashSerializer::JSON' do
  let(:user) { build(:user) }
  let(:user_json) { UserSerializer.new(user).to_json }

  subject { JSON.parse(user_json).symbolize_keys }

  it do
    expect(subject[:name]).to eq user[:name]
    expect(subject[:beer_style]).to be_nil
  end
end
