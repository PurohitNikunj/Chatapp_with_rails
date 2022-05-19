class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.belongs_to :user, foreign_key:true, null:false

      t.timestamps
    end
  end
end
