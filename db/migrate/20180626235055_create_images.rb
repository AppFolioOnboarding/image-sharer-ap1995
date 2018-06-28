class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :link, null: false

      t.timestamps
    end
  end
end
