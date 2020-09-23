class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string  :name,                        null: false
      t.string :genre_id,                    null: false
      t.integer :place,                       null: false
      t.text    :explanation,                 null: false
      t.integer :status_id,                   null: false
      t.integer :delivery_fee_id,             null: false
      t.integer :shipment_source_id,          null: false
      t.integer :delivery_completion_date_id, null: false
      t.integer  :user_id,                     null: false
      t.timestamps
    end
  end
end
