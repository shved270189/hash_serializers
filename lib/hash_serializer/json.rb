module HashSerializer
  class JSON < SimpleDelegator
    alias_method :object, :__getobj__

    def initialize(hash)
      @__hash__ = hash
    end

    class << self
      def attributes(*attrs)
        @attributes ||= []
        @attributes.push(*attrs)
      end

      def attributes_list
        @attributes
      end
    end

    def as_json
      hash_to_object!
      attributes.inject({}) do |memo, key|
        memo[key] = self.public_send(key)
        memo
      end
    end

    private

    def attributes
      self.class.attributes_list
    end

    def hash_to_object!
      @hash_to_object ||= __setobj__(OpenStruct.new(@__hash__)) || true
    end
  end
end
