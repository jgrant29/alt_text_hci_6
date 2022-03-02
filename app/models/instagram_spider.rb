require 'open-uri'
require 'json'

def parse
    base_url = "https://www.instagram.com"
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36"

  
    url = "#{base_url}/bts.bighitofficial/"
    data = URI.open(url, "User-Agent" => user_agent).read
    matches = data.match(/window._sharedData =(.*);<\/script>/)
    shared_data = JSON.parse(matches[1])
    puts "Found"

    sharedData = shared_data["entry_data"]["ProfilePage"][0]
    #return nil unless data
    

    edges = sharedData["graphql"]["user"]["edge_owner_to_timeline_media"]["edges"].map { |n| n["node"] }
    edges.each do |x| 
      posts = {}
      if x["__typename"] == "GraphImage"
        
        puts "Height: " + x["dimensions"]["height"].to_s
        puts "Width: " + x["dimensions"]["width"].to_s
        puts "Display Url: " + x["display_url"]
        puts "Alt Text: " + x["accessibility_caption"]
        posts[:body] = x["accessibility_caption"]
        posts[:image] = x["display_url"]
        posts[:title] = ""
        posts[:original_url] = x["display_url"]
        posts[:original_source] = x["display_url"]
       
        puts "\n\n"
      elsif x["__typename"] == "GraphSidecar"
        side_car = x["edge_sidecar_to_children"]["edges"]
        side_car.each do |i| 
            n = i["node"]
            puts "Type: " + n["__typename"]
            puts "Height: " + n["dimensions"]["height"].to_s
            puts "Width: " + n["dimensions"]["width"].to_s
            puts "Display Url: " + n["display_url"]
            puts "Alt Text: " + n["accessibility_caption"]
            puts "\n\n"
            posts[:body] = n["accessibility_caption"]
            posts[:image] = n["display_url"]
            posts[:title] = ""
            posts[:original_url] = n["display_url"]
            posts[:original_source] = n["display_url"]
        end
        @alt = Alt.create(posts)
        puts "\n\n"
      end
    end
end

   