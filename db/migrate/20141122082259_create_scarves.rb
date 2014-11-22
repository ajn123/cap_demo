class CreateScarves < ActiveRecord::Migration
  def change
    create_table :scarves do |t|
      t.string :name

      t.timestamps
    end
  end
end
