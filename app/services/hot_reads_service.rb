class HotReadsService
  def self.update_urls(url)
    puts "test IT GOT HERE AND THEN FAILEDDDDDD"
    uri      = URI("https://polar-journey-33706.herokuapp.com/api/v1/urls/")
    # uri      = URI("http://localhost:8080/api/v1/urls/")
    res = Net::HTTP.post_form(uri, 'url' => url)
    Net::HTTP.post(uri)
  end
end