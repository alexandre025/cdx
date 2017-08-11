class Cdx::WysiwygInput < SimpleForm::Inputs::TextInput
  def input_html_classes
    super.push('page-content')
  end
end