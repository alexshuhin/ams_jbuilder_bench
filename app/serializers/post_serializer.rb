class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :watch_count

  #has_many :comments, serializer: CommentSerializer
  #has_one :author, serializer: UserSerializer
end
