module Remaining_Checkpoints
  include HTTParty

  def get_remaining_checkpoints(chain_id)
      response = self.class.get("/enrollment_chains/#{chain_id}/checkpoints_remaining_in_section", headers: { "authorization" => @auth_token } )
        @remaining_checkpoints = JSON.parse(response.body)
    end
end


# irb terminal will only return an empty array due to bug in the Kele endpoint.  
