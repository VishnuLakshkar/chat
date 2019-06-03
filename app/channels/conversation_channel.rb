class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations-#{current_user.id}"
    current_user.update_attributes(current_sign_in_at: Time.now)
  end

  def unsubscribed
    current_user.update_attributes(last_sign_in_at: Time.now)
    stop_all_streams
  end

  def speak(data)
    message_params = data['message'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end
    
    Message.create(message_params)
  end
end