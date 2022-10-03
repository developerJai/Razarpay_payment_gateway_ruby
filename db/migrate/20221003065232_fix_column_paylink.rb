class FixColumnPaylink < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :Paylink_id, :pay_link_id
  end
end
