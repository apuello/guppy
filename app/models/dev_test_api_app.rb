class DevTestApiApp
  include HTTParty
  base_uri 'devtestapiapp.herokuapp.com'

  def tweets
    self.class.get("/tweets.json")
  end
end