class CreateMaraudes < ActiveRecord::Migration[7.1]
  def change
    create_table :maraudes do |t|
      t.string :place
      t.date :date
      t.time :hour
      t.text :action
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
