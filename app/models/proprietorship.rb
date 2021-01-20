class Proprietorship < ApplicationRecord
  with_options presence: true do
    validates :name, length:{ maximum: 20 }
    validates :info, length:{ maximum: 2000 }
    validates :category
  end
  belongs_to :category
  has_one :user, foreign_key: 'proprietorship_id'
end