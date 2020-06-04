class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :description 
      t.belongs_to :user
      t.timestamps
    end
  end
end
