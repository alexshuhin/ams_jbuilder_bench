module JbuilderSerializer
  class Base
    attr_reader :data, :json

    def initialize(data)
      @data = data
      @json = Builder.new
      build
    end

    def build
    end

    def to_hash
      json.attributes!
    end

    def to_json
      json.target!
    end

    def method_missing(method, *args)
      data[method] || nil
    end
  end
end
