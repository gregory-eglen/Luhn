module Luhn
  def self.is_valid?(number)
    new_digits = []
    digits = number.to_s.split('')
    
    if digits.count > 16 or digits.count < 15
      return false
    end

    digits.map! { |digit| digit.to_i }
    digits[-2] *= 2
    digits[-4] *= 2
    digits[-6] *= 2
    digits[-8] *= 2
    digits[-10] *= 2
    digits[-12] *= 2
    digits[-14] *= 2

    if digits.count == 16
      digits[0] *= 2
    end

    digits.each do |digit|
      if digit < 10
        new_digits << digit
      else
        new_digits << digit - 9
      end
    end
    if new_digits.sum % 10 == 0
      return true
    else
      return false
    end
  end
end