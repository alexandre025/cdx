Globalize::ActiveRecord::ClassMethods.class_eval do
  def define_translated_attr_accessor(name)
    attribute(name)
    define_translated_attr_reader(name)
    define_translated_attr_writer(name)
  end
end