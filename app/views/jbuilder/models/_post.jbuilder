json.extract! post, :id, :title, :body, :watch_count
json.comments post.comments do |comment|
  json.partial! 'models/comment', comment: comment
end
json.author do
  json.partial! 'models/user', user: post.author
end
