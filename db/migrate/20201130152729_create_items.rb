class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                   null: false
      t.text       :text,                   null: false
      t.integer    :category,               null: false
      t.integer    :status,                 null: false
      t.integer    :shopping_fee_id,        null: false
      t.integer    :prefecture_id,          null: false
      t.integer    :scheduled_delivery_id,  null: false
      t.integer    :price,                  null: false
      t.references :user,                   foreign_key: true
      t.timestamps
    end
  end
end