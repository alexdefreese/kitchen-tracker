class Kitchen < ActiveRecord::Base
  attr_accessible :auth_code, :id, :name

  has_and_belongs_to_many :users
  has_many :foods
end
