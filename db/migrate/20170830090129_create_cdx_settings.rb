class CreateCdxSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_settings do |t|
      t.string :acronym, length: 45, null: false
      t.string :default_theme, length: 45, null: false
      t.string :default_locale, length: 45, null: false
      t.string :available_locales, array: true, default: []
      t.timestamps
    end
  end
end
