json.extract! comment, :id, :body
json.author do
  json.partial! 'models/user', user: comment.author
end
