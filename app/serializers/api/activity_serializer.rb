# frozen_string_literal: true

class Api::ActivitySerializer < ActiveModel::Serializer
  attributes :id
  attributes :size
  attributes :yasai
  attributes :ninniku
  attributes :abura
  attributes :karame
  attributes :calorie

  attributes :storeName
  attributes :menuName
  attributes :imageUrl
  attributes :createdAt
  attributes :updatedAt

  def storeName
    object.store.name
  end

  def menuName
    object.menu.name
  end

  def imageUrl
    object.image_url
  end

  def createdAt
    object.created_at
  end

  def updatedAt
    object.updated_at
  end
end
