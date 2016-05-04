module ApplicationHelper
  def display_error_message(error_object, attribute)
    "#{error_object.errors.full_messages_for(attribute).to_sentence}"
  end
end
