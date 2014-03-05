class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso2
      t.string :iso3
      t.string :notes

      t.timestamps
    end
  end
end
