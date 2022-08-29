class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :token
      t.string :timeZone
      t.string :device_id
      t.string :device_type
      t.string :device_model
      t.references :user, null: true
      
      t.timestamps
    end
  end
end
