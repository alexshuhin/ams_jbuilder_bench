json.posts posts do |post|
  json.extract! post, :id, :title, :body, :watch_count
  #json.partial! 'models/post', post: post
end
