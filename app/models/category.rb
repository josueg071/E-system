# == Schema Information
#
# Table name: categories
#
#  id               :bigint(8)        not null, primary key
#  category_active  :boolean          default(TRUE)
#  category_descrip :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Category < ApplicationRecord
# relacion con otras tablas
	has_many :sub_category
	 has_paper_trail
	
#Validaciones
validates :category_descrip, presence: true

class << self
	def activo
		Category.where('category_active != ?', true)
	end
end

# Funcion para listar segun este activo o no
	scope :inactivo, -> {
  where('category_active != ?', true)
}
	scope :activo, -> {
  where(:category_active => true)
}
	scope :todos, -> {
  all
}
end
