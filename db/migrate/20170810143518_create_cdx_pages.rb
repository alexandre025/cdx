class CreateCdxPages < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_pages do |t|
      t.string :title, limit: 255, null: false
      t.string :slug, limit: 255, null: false
      t.string :state, limit: 45, null: false
      t.text :content
      t.date :published_on
      t.timestamps
    end
  end
end
