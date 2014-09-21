class CreatePublishings < ActiveRecord::Migration
  def change
    create_table :publishings do |t|
      t.references :book, index: true
      t.references :author, index: true
      t.date :publication_date

      t.timestamps
    end
  end
end
