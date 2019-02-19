RSpec.describe 'HashSerializer::JSON' do
  let(:user) { build(:user) }
  let(:user_as_json) { UserSerializer.new(user).as_json }

  subject { user_as_json }

  it do
    expect(subject[:name]).to eq user[:name]
    expect(subject[:beer_style]).to be_nil
  end
end
