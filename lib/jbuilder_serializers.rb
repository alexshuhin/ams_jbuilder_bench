class JbuilderPostsSerializer < JbuilderSerializer::Base
  def build
    json.posts posts do |post|
      json.partial! JbuilderPostSerializer, post: post
    end
  end
end

class JbuilderPostSerializer < JbuilderSerializer::Base
  def build
    json.extract! post, :id, :title, :body, :watch_count
    json.comments post.comments do |comment|
      json.partial! JbuilderCommentSerializer, comment: comment
    end
    json.author do
      json.partial! JbuilderUserSerializer, user: post.author
    end
  end
end

class JbuilderCommentSerializer < JbuilderSerializer::Base
  def build
    json.extract! comment, :id, :body
    json.author do
      json.partial! JbuilderUserSerializer, user: comment.author
    end
  end
end

class JbuilderUserSerializer < JbuilderSerializer::Base
  def build
    json.extract! user, :id, :name
  end
end
