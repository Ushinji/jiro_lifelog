# frozen_string_literal: true

require "rails_helper"

describe "GET /api/activities" do
  subject do
    get "/api/activities"
  end

  let(:user) { create(:user) }

  context "ログインしている場合" do
    let(:store) { create(:store) }
    let(:menu) { create(:menu) }
    let(:activities) {
      create_list(:activity, 5, user: user, store_id: store.id, menu_id: menu.id)
    }

    before do
      stub_login(user)
      activities
    end

    it "200を返すこと" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "指定のレスポンスを返すこと" do
      subject

      res = JSON.parse(response.body)

      expect(res.size).to eq(5)
      expect(res.map { |r| r["id"] }).to match_array(
        activities.map { |a| a.id }
      )
      expect(res.map { |r| r["size"] }).to match_array(
        activities.map { |a| a.size }
      )
      expect(res.map { |r| r["yasai"] }).to match_array(
        activities.map { |a| a.yasai }
      )
      expect(res.map { |r| r["ninniku"] }).to match_array(
        activities.map { |a| a.ninniku }
      )
      expect(res.map { |r| r["abura"] }).to match_array(
        activities.map { |a| a.abura }
      )
      expect(res.map { |r| r["karame"] }).to match_array(
        activities.map { |a| a.karame }
      )
      expect(res.map { |r| r["createdAt"] }).to match_array(
        activities.map { |a| a.created_at }
      )
      expect(res.map { |r| r["updatedAt"] }).to match_array(
        activities.map { |a| a.updated_at }
      )
      expect(res.map { |r| r["storeName"] }).to match_array(
        (0..4).map { |_| store.name }
      )
      expect(res.map { |r| r["menuName"] }).to match_array(
        (0..4).map { |_| menu.name }
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
