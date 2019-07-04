# frozen_string_literal: true

require "rails_helper"

describe "GET /api/menus" do
  subject do
    get "/api/menus"
  end

  let(:user) { create(:user) }

  context "ログインしている場合" do
    let(:menus) { create_list(:menu, 3) }

    before do
      stub_login(user)
      menus
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
        menus.map { |a| a.id }
      )
      expect(res.map { |r| r["name"] }).to match_array(
        menus.map { |a| a.name }
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
