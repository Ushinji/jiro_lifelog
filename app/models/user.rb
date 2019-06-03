class User < ApplicationRecord
  has_many :activities
  
  validates :name, presence: true
  validates :email, presence: true

  class << self
    def find_for_google(auth_hash)
      user = User.find_or_create_by(email: auth_hash.info.email) do |u|
        u.name = auth_hash.info.name
      end
      user
    end
  end
end
