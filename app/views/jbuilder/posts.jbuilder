json.posts posts do |post|
  json.extract! post, :id, :title, :body, :watch_count
  #json.comments post.comments do |comment|
    #json.extract! comment, :id, :body
    #json.author do
      #json.extract! comment.author, :id, :name
    #end
  #end
  #json.author do
    #json.extract! post.author, :id, :name
  #end
end


#json.posts @posts do |post|
  #json.partial! 'models/post', post: post
#end
