require 'spec_helper'

describe User do
  describe '#avatar' do
    it 'returns a correctly formated gravatar url' do
      user = User.new :email => 'username@example.com'
      Digest::MD5.should_receive(:hexdigest).with(user.email).and_return 'GENERATED_ID'
      user.avatar.should eq('http://gravatar.com/avatar/GENERATED_ID.png?s=24')
    end
  end
end
