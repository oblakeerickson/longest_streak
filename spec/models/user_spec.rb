require 'spec_helper'

describe User do

  before do
    @user = User.new(github_id: 1, username: "mojombo")
  end

  subject { @user }

  it { should respond_to(:github_id) }
  it { should respond_to(:username) }

  it { should be_valid }

  describe "when github_id is not present" do
    before { @user.github_id = " " }
    it { should_not be_valid }
  end

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when github_id is already taken" do
    before do
      user_with_same_github_id = @user.dup
      user_with_same_github_id.username = @user.username + "a"
      user_with_same_github_id.save
    end

    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.github_id = @user.github_id + 1
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

end
