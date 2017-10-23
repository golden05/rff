class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.references :corp, foreign_key: true

      t.timestamps
    end
  end
end
