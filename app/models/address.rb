class Address < ApplicationRecord
  has_one :person
  belongs_to :city
end
