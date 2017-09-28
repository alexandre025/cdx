class CreateCdxPages < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_pages do |t|
      t.jsonb :title_translations, null: false, default: {}
      t.jsonb :slug_translations, null: false, default: {}
      t.string :state, limit: 45, null: false
      t.jsonb :content_translations, null: false, default: {}
      t.date :published_on
      t.timestamps
    end
  end
end
