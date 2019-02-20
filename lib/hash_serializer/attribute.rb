module HashSerializer
  class Attribute
    attr_reader :name, :options

    def initialize(name, options = {})
      @name = name
      @options = options
    end

    def key_name
      options[:as] || name
    end
  end
end
