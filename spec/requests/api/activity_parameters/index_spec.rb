# frozen_string_literal: true

require "rails_helper"

describe "GET /api/activity_parameters" do
  subject do
    get "/api/activity_parameters"
  end

  let(:user) { create(:user) }

  context "ログインしている場合" do
    let(:stores) { create_list(:store, 3) }
    let(:menus) { create_list(:menu, 3) }

    before do
      stub_login(user)
      stores
      menus
    end

    it "200を返すこと" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "指定のレスポンスを返すこと" do
      subject

      res = JSON.parse(response.body)

      expect(res["store"].size).to eq(stores.size)
      expect(res["store"].map { |r| r["id"] }).to match_array(
        stores.map { |s| s.id }
      )
      expect(res["store"].map { |s| s["value"] }).to match_array(
        stores.map { |s| s.id }
      )
      expect(res["store"].map { |s| s["label"] }).to match_array(
        stores.map { |s| s.name }
      )

      expect(res["menu"].size).to eq(menus.size)
      expect(res["menu"].map { |r| r["id"] }).to match_array(
        menus.map { |m| m.id }
      )
      expect(res["menu"].map { |r| r["value"] }).to match_array(
        menus.map { |m| m.id }
      )
      expect(res["menu"].map { |r| r["label"] }).to match_array(
        menus.map { |m| m.name }
      )

      expect(res["size"].size).to eq(2)
      expect(res["size"].map { |r| r["id"] }).to match_array(
        [1, 2]
      )
      expect(res["size"].map { |r| r["value"] }).to match_array(
        ['small', 'large']
      )
      expect(res["size"].map { |r| r["label"] }).to match_array(
        ['小', '大']
      )

      expect(res["yasai"].size).to eq(4)
      expect(res["yasai"].map { |r| r["id"] }).to match_array(
        [1, 2, 3, 4]
      )
      expect(res["yasai"].map { |r| r["value"] }).to match_array(
        ['small', 'normal', 'large', 'mashimashi']
      )
      expect(res["yasai"].map { |r| r["label"] }).to match_array(
        ['小', 'ノーコール', 'マシ', 'マシマシ']
      )

      expect(res["abura"].size).to eq(5)
      expect(res["abura"].map { |r| r["id"] }).to match_array(
        [1, 2, 3, 4, 5]
      )
      expect(res["abura"].map { |r| r["value"] }).to match_array(
        ['small', 'normal', 'large', 'mashimashi', 'crazy']
      )
      expect(res["abura"].map { |r| r["label"] }).to match_array(
        ['小', 'ノーコール', 'マシ', 'マシマシ', 'ザブトン']
      )

      expect(res["ninniku"].size).to eq(4)
      expect(res["ninniku"].map { |r| r["id"] }).to match_array(
        [1, 2, 3, 4]
      )
      expect(res["ninniku"].map { |r| r["value"] }).to match_array(
        ['small', 'normal', 'large', 'mashimashi']
      )
      expect(res["ninniku"].map { |r| r["label"] }).to match_array(
        ['小', 'ノーコール', 'マシ', 'マシマシ']
      )

      expect(res["karame"].size).to eq(4)
      expect(res["karame"].map { |r| r["id"] }).to match_array(
        [1, 2, 3, 4]
      )
      expect(res["karame"].map { |r| r["value"] }).to match_array(
        ['small', 'normal', 'large', 'mashimashi']
      )
      expect(res["karame"].map { |r| r["label"] }).to match_array(
        ['小', 'ノーコール', 'マシ', 'マシマシ']
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
