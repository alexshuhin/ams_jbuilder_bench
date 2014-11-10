class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
end

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body

  has_one :author, serializer: UserSerializer
end

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :watch_count

  has_many :comments, serializer: CommentSerializer
  has_one :author, serializer: UserSerializer
end
