# frozen_string_literal: true

class ActivityPayload::Create
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :userId, :integer
  attribute :storeId, :integer
  attribute :menuId, :integer
  attribute :size, :string
  attribute :yasai, :string
  attribute :ninniku, :string
  attribute :abura, :string
  attribute :karame, :string
  attribute :calorie, :integer
  attribute :imageUrl, :string

  validates :userId, presence: true
  validates :storeId, presence: true
  validates :menuId, presence: true
  validates :calorie, presence: true
  validates :imageUrl, presence: true
  validates :size, presence: true, inclusion: {
    in: ["small", "large"]
  }
  validates :yasai, presence: true, inclusion: {
    in: ["small", "normal", "large", "mashimashi"]
  }
  validates :ninniku, presence: true, inclusion: {
    in: ["small", "normal", "large", "mashimashi"]
  }
  validates :abura, presence: true, inclusion: {
    in: ["small", "normal", "large", "mashimashi", "crazy"]
  }
  validates :karame, presence: true, inclusion: {
    in: ["small", "normal", "large", "mashimashi"]
  }

  def initialize(params, user_id)
    p = params.permit(
      :storeId,
      :menuId,
      :size,
      :yasai,
      :ninniku,
      :abura,
      :karame,
      :calorie,
      :imageUrl,
    )
    p[:userId] = user_id
    super(p)
  end

  def to_h
    {
      user_id: self.userId,
      store_id: self.storeId,
      menu_id: self.menuId,
      size: self.size,
      yasai: self.yasai,
      ninniku: self.ninniku,
      abura: self.abura,
      karame: self.karame,
      calorie: self.calorie,
      image_url: self.imageUrl,
    }
  end
end
