module Cdx
  module Admin
    module FormHelper

      def translated_field(form_object, field, options = {})
        current_settings.available_locales.each do |locale|
          options[:input_html]                                   ||= {}
          options[:input_html][:data]                            ||= {}
          options[:input_html][:data][:'translation-for-locale'] = locale
          concat form_object.input :"#{field}_#{locale}", options
        end
      end

    end
  end
end