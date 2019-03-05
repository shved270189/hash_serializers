require 'ostruct'
require 'json'

module HashSerializer
  class JSON < SimpleDelegator
    alias_method :object, :__getobj__

    def initialize(hash)
      @__hash__ = hash
    end

    class << self
      def reveal(*attrs, as: nil, format: nil)
        @attributes ||= []
        attribute_options = {as: as, format: format}.merge(default_attribute_options)
        @attributes.push(*attrs.map {|name| HashSerializer::Attribute.new(name, attribute_options)})
      end

      def attributes
        @attributes
      end

      def default_attribute_options
        @default_attribute_options || {}
      end

      def formats
        @formats
      end

      def with_format(format_name)
        @default_attribute_options = { format: format_name }
        yield
        @default_attribute_options = nil
      end

      def format(format_name, &formatter)
        @formats ||= {}
        @formats[format_name] = formatter
      end
    end

    def as_json
      hash_to_object!
      attributes.inject({}) do |memo, attribute|
        memo.merge(attribute.as_json(self))
      end
    end

    def to_json
      ::JSON.generate(as_json)
    end

    def formats
      self.class.formats
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
