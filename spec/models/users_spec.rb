# frozen_string_literal: true

require "rails_helper"

describe User, type: :model do
  describe "validation" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
