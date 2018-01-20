class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.decimal :starting_bid
      t.references :user

      t.timestamps
    end
  end
end
