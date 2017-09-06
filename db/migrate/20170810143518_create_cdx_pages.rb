class CreateCdxPages < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_pages do |t|
      t.string :state, limit: 45, null: false
      t.date :published_on
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Cdx::Page.create_translation_table!(
            title:   { type: :string, limit: 255 },
            slug:    { type: :string, limit: 255 },
            content: :text
        )
      end
      dir.down do
        Cdx::Page.drop_translation_table!
      end
    end
  end
end
