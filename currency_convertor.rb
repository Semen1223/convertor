# frozen_string_literal: true

# Local class for currency conversion with rates from API.
class CurrencyConvertor
  class << self
    def convert(currency, amount, precision = 2)
      return false unless CONVERT_TO_USD.key?(currency)

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

    def convert_amount(value, currency, precision)
      return false unless value.is_a?(Numeric)

      rate = CONVERT_TO_USD[currency]
      converted_value = value * rate
      converted_value.round(precision)
    end
  end
end
