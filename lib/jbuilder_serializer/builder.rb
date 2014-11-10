module JbuilderSerializer
  class Builder < ::Jbuilder
    def partial!(serializer, data)
      merge! serializer.new(data).to_hash
    end
  end
end
