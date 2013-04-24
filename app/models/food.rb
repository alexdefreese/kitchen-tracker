# == Schema Information
#
# Table name: foods
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  added         :date
#  left          :string(255)
#  perishibility :string(255)
#  category      :string(255)
#  kitchen_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Food < ActiveRecord::Base
  attr_accessible :added, :category, :id, :kitchen_id, :left, :name, :perishibility

  belongs_to :kitchen
end
