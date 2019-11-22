class CreateDataStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :data_storages do |t|
      t.bigint :user_id, null: false, unsigned: true
      t.string :key, limit: 64, null: false
      t.text :value

      t.timestamps
    end
  end
end
