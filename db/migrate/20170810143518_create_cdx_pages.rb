class CreateCdxPages < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_pages do |t|
      t.hstore :title_translations
      t.hstore :slug_translations
      t.string :state, limit: 45, null: false
      t.hstore :content_translations
      t.date :published_on
      t.timestamps
    end
  end
end
