RSpec.describe 'UserSerializer' do
  let(:user) { build(:user) }
  let(:user_as_json) { UserSerializer.new(user).as_json }

  subject { user_as_json }

  it 'contains name' do
    expect(subject[:name]).to eq user[:name]
  end

  it 'does not contain beer_style' do
    expect(subject[:beer_style]).to be_nil
  end

  it 'contains avatar as avatar_url' do
    expect(subject[:avatar_url]).to eq user[:avatar]
  end
end
