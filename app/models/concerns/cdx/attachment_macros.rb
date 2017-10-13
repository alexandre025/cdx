# Mimic ActiveStorage DSL, but works with nested attributes
module Cdx
  module AttachmentMacros
    def has_one_attached(name, class_name)
      has_one name.to_sym, -> { where(name: name) }, class_name: class_name, as: :record, dependent: :destroy
      accepts_nested_attributes_for name.to_sym, allow_destroy: true
    end

    def has_many_attached(name, class_name)
      has_many name.to_sym, -> { where(name: name) }, class_name: class_name, as: :record, dependent: :destroy
      accepts_nested_attributes_for name.to_sym, allow_destroy: true, reject_if: :all_blank
    end
  end
end
