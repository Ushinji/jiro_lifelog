# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  belongs_to :store
  
end
