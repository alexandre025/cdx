class CreateCdxPages < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_pages do |t|
      t.string :name, limit: 255, null: false
      t.text :content
    end
  end
end
