class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string  :key
      t.string  :value
      t.references :ownable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
