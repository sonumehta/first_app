require 'spec_helper'

describe User do

  before do
    @user = User.new(username: "Example User", email_id: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email_id) }
  it { should respond_to(:encrypted_password) }

describe "when email_id address is already taken" do
    before do
      user_with_same_email_id = @user.dup
      user_with_same_email_id.save
    end

    it { should_not be_valid }
  end
  

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end
describe "when username is too long" do
    before { @user.username = "a" * 51 }
    it { should_not be_valid }
  end

describe "when email_id is not present" do
    before { @user.email_id = " " }
    it { should_not be_valid }
  end

describe "when email_id format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email_id = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email_id format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

end
