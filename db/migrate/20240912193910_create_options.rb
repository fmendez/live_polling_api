class CreateOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :options do |t|
      t.string :content
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
