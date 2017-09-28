class Cdx::DatePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group date form_datetime') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat calendar
    end
  end

  def input_html_options
    super.merge(class: 'form-control datepicker')
  end

  def calendar
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat('<i class="fa fa-calendar"></i>'.html_safe)
    end
  end
end
