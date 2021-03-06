require 'spec_helper'

# describe User do

#   let(:user) { User.new(name: "Matt")}
#   let(:user_two) { User.new(name: "")}
#   let(:user_three) {User.create(name: "Matt")}

#   it 'has a name' do
#     user.should respond_to(:name)
#   end

#   it "when a name is not present" do
#     user_two.should_not be_valid
#   end

#   # it "when name is already taken" do
#   #   user_three.should_not be_valid
#   # end

#   context "security" do

#     it "has a password digest" do
#       user.should respond_to(:password_digest)
#     end

#     it "has a password" do
#       user.should respond_to(:password)
#     end

#     it "has a password confirmation" do
#       user.should respond_to(:password_confirmation)
#     end

#     it "password_confirmation should not be blank" do
#       user.password = user.password_confirmation = " "
#       user.should_not be_valid
#     end

#     it "password_confirmation should not be a mismatch" do
#       user.password_confirmation = "mismatch"
#       user.should_not be_valid
#     end

#   end
# end

describe User do

  before do
    @user = User.new(name: "Example User",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }


  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save}
    let (:found_user) { User.find_by_name(@user.name)}

    describe "with valid password" do
      it {should == found_user.authenticate(@user.password)}
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end

    describe "with a password that is too short" do
      before { @user.password = @user.password_confirmation = "a" * 5}
      it { should be_invalid}
    end

  end
end






