class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :room_id
      t.integer :user_id
      t.integer :owner_id
      t.boolean :request_status

      t.timestamps
    end
  end
end
