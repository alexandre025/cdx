class CreateCdxSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_settings do |t|
      t.string :acronym
      t.string :default_locale
      t.string :available_locales, array: true, default: []
      t.timestamps
    end
  end
end
