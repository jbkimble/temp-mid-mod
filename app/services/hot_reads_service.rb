class HotReadsService
  def self.update_urls(url)
    uri      = URI("https://polar-journey-33706.herokuapp.com/api/v1/urls/")
    # uri      = URI("http://localhost:8080/api/v1/urls/")
    res = Net::HTTP.post_form(uri, 'url' => url)
    #
    # req = Net::HTTP::Post.new(uri)
    # req.set_form_data('url' => url)

  end
end
