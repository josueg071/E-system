# == Schema Information
#
# Table name: credito_clientes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cliente_id :bigint(8)
#  venta_id   :bigint(8)
#
# Indexes
#
#  index_credito_clientes_on_cliente_id  (cliente_id)
#  index_credito_clientes_on_venta_id    (venta_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (venta_id => venta.id)
#

require 'test_helper'

class CreditoClienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
