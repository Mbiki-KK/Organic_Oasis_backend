class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :image_data
end
