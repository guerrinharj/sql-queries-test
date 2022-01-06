class City < ApplicationRecord
  has_many :addresses, dependent: :destroy
  belongs_to :state
end
