class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :publication_date
      t.references :author, index: true

      t.timestamps
    end
  end
end
