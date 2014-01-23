require 'spec_helper'

describe Contribution do

  before do
    @user = User.new(github_id: 1, username: "mojombo")
    @user.save
    @contribution = @user.contributions.build(contributed_on: Date.new(), contribution_count: 1)
  end

  subject { @contribution }

  it { should respond_to(:user_id) }
  it { should respond_to(:contributed_on) }
  it { should respond_to(:contribution_count) }

  it { should be_valid }

  describe "when contributed_on is not present" do
    before { @contribution.contributed_on = nil }
    it { should_not be_valid }
  end

  describe "when contribution_count is not present" do
    before { @contribution.contribution_count = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @contribution.user_id = nil }
    it { should_not be_valid }
  end
end
