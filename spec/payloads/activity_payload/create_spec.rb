# frozen_string_literal: true

require "rails_helper"

describe ActivityPayload::Create, type: :model do
  describe "validation" do
    let(:params) {
      ActionController::Parameters.new({
        storeId: 2,
        menuId: 3,
        size: "normal",
        yasai: "normal",
        ninniku: "normal",
        abura: "normal",
        karame: "normal",
        calorie: 1234,
        imageUrl: "http://test.image.path/12345.png",
      })
    }
    let(:user_id) { 1 }

    subject { ActivityPayload::Create.new(params, user_id) }

    it { should validate_presence_of(:userId) }
    it { is_expected.to validate_presence_of(:storeId) }
    it { is_expected.to validate_presence_of(:menuId) }
    it { is_expected.to validate_presence_of(:size) }
    it { is_expected.to validate_presence_of(:yasai) }
    it { is_expected.to validate_presence_of(:ninniku) }
    it { is_expected.to validate_presence_of(:abura) }
    it { is_expected.to validate_presence_of(:karame) }
    it { is_expected.to validate_presence_of(:calorie) }
    it { is_expected.to validate_presence_of(:imageUrl) }

    it do
      is_expected.to validate_inclusion_of(:size).
        in_array(["small", "large"])
    end

    it do
      is_expected.to validate_inclusion_of(:yasai).
        in_array(["small", "normal", "large", "mashimashi"])
    end

    it do
      is_expected.to validate_inclusion_of(:ninniku).
        in_array(["small", "normal", "large", "mashimashi"])
    end

    it do
      is_expected.to validate_inclusion_of(:abura).
        in_array(["small", "normal", "large", "mashimashi", "crazy"])
    end

    it do
      is_expected.to validate_inclusion_of(:karame).
        in_array(["small", "normal", "large", "mashimashi"])
    end
  end
end
