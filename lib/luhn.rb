module Luhn
  def self.is_valid?(number)
    digits = number.digits

    if digits.count != 16 && digits.count != 15
      return false
    end

    digits.map!.with_index do |digit, i|
      i.odd? && i > 0 ? digit*2 : digit
    end

    digits.map! do |digit|
      digit < 10 ? digit : digit - 9
    end
       
    digits.sum % 10 == 0
  end
end