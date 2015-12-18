class DatePickerInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    @builder.text_field(attribute_name, input_html_options)
  end

  def input_html_options
    { class: 'datepicker-input', data: { type: 'datetime' } }
  end

end