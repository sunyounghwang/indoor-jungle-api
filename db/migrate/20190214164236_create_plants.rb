class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :type_of
      t.string :location
      t.date :start_date
      t.boolean :archived, default: false
      t.string :img_url
      t.string :notes

      t.timestamps
    end
  end
end
