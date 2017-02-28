class HotReadsService
  def self.update_urls(url)
    uri      = URI("https://polar-journey-33706.herokuapp.com/api/v1/urls/")
    # uri      = URI("http://localhost:8080/api/v1/urls/")
    # potatoe = url.to_json
    # res = Net::HTTP.post_form(uri, 'url' => potatoe)
    # res.content_type = 'multipart/form-data'

    # http = Net::HTTP.new(uri.host, uri.port)
    # request = Net::HTTP::Post.new(uri)
    # request.set_form_data({"url" => url})
    # uri = URI('http://www.example.com/search.cgi')
    res = Net::HTTP.post_form(uri, {'url' => url})
  end
end
