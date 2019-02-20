require 'ostruct'
require 'json'

module HashSerializer
  class JSON < SimpleDelegator
    alias_method :object, :__getobj__

    def initialize(hash)
      @__hash__ = hash
    end

    class << self
      def reveal(*attrs, as: nil)
        @attributes ||= []
        @attributes.push(*attrs.map {|name| HashSerializer::Attribute.new(name, as: as)})
      end

      def attributes
        @attributes
      end
    end

    def as_json
      hash_to_object!
      attributes.inject({}) do |memo, attribute|
        memo[attribute.key_name] = self.public_send(attribute.name)
        memo
      end
    end

    def to_json
      ::JSON.generate(as_json)
    end

    private

    def attributes
      self.class.attributes
    end

    def hash_to_object!
      @hash_to_object ||= __setobj__(OpenStruct.new(@__hash__)) || true
    end
  end
end
