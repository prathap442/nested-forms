class CreateItems < ActiveRecord::Migration[5.1]
  enable_extension 'hstore' unless extension_enabled?('hstore')
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.json :item_information

      t.timestamps
    end
  end
end
