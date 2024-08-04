class CurrencyConvertor
  CONVERT_TO_USD = {
    'UAH' => 0.036,
    'EUR' => 1.11,
    'GBP' => 1.29,
    'PLN' => 0.25,
    'CHF' => 1.12,
  }

  def self.convert(currency, amount, precision = 2)
    unless CONVERT_TO_USD.key?(currency)
      return false
    end

    begin
      if amount.is_a?(Array)
        converted_amounts = amount.map do |value|
          convert_amount(value, currency, precision)
        end
        return converted_amounts
      else
        return convert_amount(amount, currency, precision)
      end
    rescue StandardError
      return false
    end
  end

  private

  def self.convert_amount(value, currency, precision)
    return false unless value.is_a?(Numeric)
    rate = CONVERT_TO_USD[currency]
    converted_value = value * rate
    converted_value.round(precision)
  end
end
