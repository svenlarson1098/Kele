module Messages
  include HTTParty

  def get_messages(page_num = nil)
    if page_num == nil
      response = self.class.get("/message_threads/", headers: {"authorization" => @auth_token} )
    else
      response = self.class.get("/message_threads?page=#{page_num}", headers: {"authorization" => @auth_token} )
    end
    @messages = JSON.parse(response.body)
  end

    def create_message(msg_sender, msg_recipient_id, msg_subject, msg_text)
      response = self.class.post("/messages", 
        body: {
          "sender" => msg_sender,
          "recipient_id" => msg_recipient_id,
          "subject" => msg_subject,
          "stripped-text" => msg_text
        },
        headers: {"authorization" => @auth_token} )
      end
  end