class CreatePolls < ActiveRecord::Migration[7.2]
  def change
    create_table :polls do |t|
      t.string :title
      t.text :description
      t.datetime :end_date

      t.timestamps
    end
  end
end
