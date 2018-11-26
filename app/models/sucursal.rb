# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint(8)        not null, primary key
<<<<<<< HEAD
#  suc_active  :boolean
=======
#  direccion   :string
#  encargado   :string
#  suc_active  :boolean          default(TRUE)
>>>>>>> 851e55f4722dc881c757d64345547c8094d391fb
#  suc_descrip :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sucursal < ApplicationRecord
# Validaciones
	validates :suc_descrip, presence: true

# Funcion para listar segun este activo o no
# Todos los inactivos
	scope :inactivo, -> {
  where('suc_active != ?', true)
}
	scope :activo, -> {
		# Todos los activos
  where(:suc_active => true)
}
# Todos los registros
	scope :todos, -> {
  all
}
end
