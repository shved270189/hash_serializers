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

    def as_json(object)
      value = object.public_send(name)
      case options[:format]
      when Symbol
        value = object.formats[options[:format]].call(value)
      end
      { key_name => value }
    end
  end
end
