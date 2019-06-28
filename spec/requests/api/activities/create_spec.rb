# frozen_string_literal: true

require "rails_helper"

describe "GET /api/activities" do
  subject do
    post "/api/activities", params: params
  end

  let(:user) { create(:user) }
  let(:store) { create(:store) }
  let(:menu) { create(:menu) }

  context "正常系" do
    let(:params) {
      {
        storeId: store.id,
        menuId: menu.id,
        size: "small",
        yasai: "small",
        ninniku: "small",
        abura: "small",
        karame: "small",
        calorie: 1234,
        imageUrl: "http://example.com/1234.jpeg",
      }
    }

    before do
      stub_login(user)
    end

    it "200 okを返すこと" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "Activityが1件増えること" do
      expect {
        subject
      }.to change(Activity, :count).by(1)
    end

    it "リクエストに応じたActivityが作成されること" do
      subject

      activity = Activity.last

      expect(activity.store_id).to eq(params[:storeId])
      expect(activity.menu_id).to eq(params[:menuId])
      expect(activity.size).to eq(params[:size])
      expect(activity.yasai).to eq(params[:yasai])
      expect(activity.ninniku).to eq(params[:ninniku])
      expect(activity.abura).to eq(params[:abura])
      expect(activity.karame).to eq(params[:karame])
      expect(activity.calorie).to eq(params[:calorie])
      expect(activity.image_url).to eq(params[:imageUrl])
    end

    it "作成されたActivityがレスポンスとして返ってくること" do
      subject

      activity = Activity.last
      json = JSON.parse(response.body)

      expect(json["id"]).to eq(activity.id)

      expect(json["id"].present?).to eq(true)
      expect(json["size"].present?).to eq(true)
      expect(json["yasai"].present?).to eq(true)
      expect(json["ninniku"].present?).to eq(true)
      expect(json["abura"].present?).to eq(true)
      expect(json["karame"].present?).to eq(true)
      expect(json["store_name"].present?).to eq(true)
      expect(json["menu_name"].present?).to eq(true)
      expect(json["created_at"].present?).to eq(true)
      expect(json["updated_at"].present?).to eq(true)
    end
  end

  context "ログインしていない場合" do
    let(:params) {
      {
        storeId: store.id,
        menuId: menu.id,
        size: "small",
        yasai: "small",
        ninniku: "small",
        abura: "small",
        karame: "small",
        calorie: 1234,
        imageUrl: "http://example.com/1234.jpeg",
      }
    }

    it "401を返すこと" do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "不正なパラメタの場合" do
    let(:params) {
      {
        storeId: store.id,
        menuId: menu.id,
        size: "",
        yasai: "small",
        ninniku: "small",
        abura: "small",
        karame: "small",
        calorie: 1234,
        imageUrl: "http://example.com/1234.jpeg",
      }
    }

    before do
      stub_login(user)
    end

    it "422を返すこと" do
      subject
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
