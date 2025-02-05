
class ErrorFormBuilder < ActionView::Helpers::FormBuilder

  def input_field_with_error(attribute,option={}, &block)
    error_messages = @object.errors.full_messages_for(attribute)
    if error_messages.any?
      option[:class] << " "+"error-class"
      error_contents = create_error_div(attribute, error_messages)
    end
    block.call + error_contents || ""
  end

  def create_error_div(attribute, messages)
    @template.content_tag(:div, class: "error-class") do
      messages.each do |message|
        @template.concat(@template.content_tag(:div, message))
      end
    end
  end

  def text_field(attribute, option={})
    input_field_with_error(attribute, option) do
      super
    end
  end

  def number_field(attribute, option={})
    input_field_with_error(attribute, option) do
      super
    end
  end

  def email_field(attribute, option={})
    input_field_with_error(attribute, option) do
      super
    end
  end

  def password_field(attribute, option={})
    input_field_with_error(attribute, option) do
      super
    end
  end

  def text_area(attribute, option={})
    input_field_with_error(attribute, option) do
      super
    end
  end

end 

