class AddCurrencyToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :currency, :string
  end
end
