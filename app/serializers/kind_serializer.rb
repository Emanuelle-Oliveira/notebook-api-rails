# Quando existe o serializer, a controller automaticamente busca ele, ao invés do render json padrão
class KindSerializer < ActiveModel::Serializer
  attributes :id, :description
end
