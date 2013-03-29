module Constants
  module_function

  def get(base, value)
    case value
    when Integer
      value
    when NSArray
      value.reduce { |i, j|
        const_int_get(base, i) | const_int_get(base, j)
      }
    else
      value = value.to_s.camelize
      Kernel.const_get("#{base}#{value}")
    end
  end
end
