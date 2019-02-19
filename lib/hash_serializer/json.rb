module HashSerializer
  class JSON < SimpleDelegator
    alias_method :object, :__getobj__

    class << self
      def attributes(*attrs)

      end
    end
  end
end
