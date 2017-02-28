class HotReadsService
  def self.update_urls(url)
    uri      = URI("https://polar-journey-33706.herokuapp.com/api/v1/urls/")
    # uri      = URI("http://localhost:8080/api/v1/urls/")
    potatoe = url
    res = Net::HTTP.post_form(uri, 'url' => potatoe)
  end
end
