# frozen_string_literal: true

class Api::ActivitySerializer < ActiveModel::Serializer
  attributes :id
  attributes :size
  attributes :yasai
  attributes :ninniku
  attributes :abura
  attributes :karame
  attributes :image_url
  attributes :calorie
  attributes :created_at
  attributes :updated_at

  attributes :store_name
  attributes :menu_name

  def store_name
    object.store.name
  end

  def menu_name
    object.menu.name
  end
end
