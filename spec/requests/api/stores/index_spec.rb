# frozen_string_literal: true

require "rails_helper"

describe "GET /api/stores" do
  subject do
    get "/api/stores"
  end

  let(:user) { create(:user) }

  context "ログインしている場合" do
    let(:stores) { create_list(:store, 3) }

    before do
      stub_login(user)
      stores
    end

    it "200を返すこと" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "指定のレスポンスを返すこと" do
      subject

      res = JSON.parse(response.body)
      expect(res.size).to eq(3)
      expect(res.map { |r| r["id"] }).to match_array(
        stores.map { |a| a.id }
      )
      expect(res.map { |r| r["name"] }).to match_array(
        stores.map { |a| a.name }
      )
    end
  end

  context "ログインしていない場合" do
    it "401を返すこと" do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
