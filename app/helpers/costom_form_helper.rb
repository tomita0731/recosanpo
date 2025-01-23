module ::CostomFormHelper

  def pick_errors(attribute)
    return nil if @object.nil? || (messages = @object.errors.messages[attribute]).nil?

    lis = messages.collect do |message|
      %{<li>#{@object.errors.full_message(attribute, message)}</li>}
    end.join

    %{<ul class="errors">#{lis}</ul>}.html_safe
  end


  def text_field(attribute, options={})
  return super(attribute) if options[:no_errors]
  super(attribute,options) + pick_errors(attribute)
end

def number_field(attribute, options={})
  return super(attribute) if options[:no_errors]
  super(attribute,options) + pick_errors(attribute)
end
end