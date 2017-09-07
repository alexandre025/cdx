module Cdx
  module Admin
    module FormHelper

      def translated_field(form_object, field, options = {})
        concat form_object.input field, options
        current_settings.available_locales.each do |locale|
          unless locale.to_sym == current_settings.default_locale.to_sym
            options[:label]                                        = form_object.object.class.human_attribute_name(field) + ' ' + EmojiFlag.new(locale)
            options[:input_html]                                   ||= {}
            options[:input_html][:data]                            ||= {}
            options[:input_html][:data][:'translation-for-locale'] = locale
            options[:wrapper_html]                                 ||= {}
            options[:wrapper_html][:class]                         = 'hidden-translation'
            concat form_object.input "#{field}_#{locale}", options
          end
        end
      end

      def locales_options_tags
        I18n.available_locales.map { |l| ["#{EmojiFlag.new(l)} (#{l})", l] }
      end

      def available_locales_options_tags
        current_settings.available_locales.map { |l| ["#{EmojiFlag.new(l)} (#{l})", l] }
      end

      def select_locale
        concat select_tag('translation', options_for_select(available_locales_options_tags, current_settings.default_locale), include_blank: false, class: 'select-translation select2-simple')
      end

    end
  end
end