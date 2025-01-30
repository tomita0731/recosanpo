json.data do
  json.items do
    json.array!(@posts) do |post|
      json.id post.id
      json.user do
        json.name post.user.name
        
      end
      json.body post.body
      json.place post.place
      json.step_count post.step_count
      json.publish_status post.publish_status
      json.genre post.genre
      json.address post.address
      json.latitude post.latitude
      json.longitude post.longitude
    end  
  end
end