class CreateCorps < ActiveRecord::Migration[5.1]
  def change
    create_table :corps do |t|
      t.string :name

      t.timestamps
    end
  end
end
