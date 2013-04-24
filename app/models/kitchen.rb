# == Schema Information
#
# Table name: kitchens
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  auth_code   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Kitchen < ActiveRecord::Base
  attr_accessible :auth_code, :id, :name, :description

  has_and_belongs_to_many :users
  has_many :foods
end
