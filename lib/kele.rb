require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

def initialize(email, password)
  response = self.class.post('https://www.bloc.io/api/v1/sessions', body: { "email": email, "password": password} )
  raise "Unmatched Authentication: Invalid email/password combination" if response.code != 200
  @auth_token = response["auth_token"]
  end

def get_me
  response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: {"authorization" => @auth_token})
    @user = JSON.parse(response.body)
  end
end