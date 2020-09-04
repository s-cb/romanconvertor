

def fromRoman(romanNumber)
    roman_numerals = {
        1 => "I",
        4 => "IV",
        5 => "V",
        10 => "X",
        50 => "L",
        100 => "C",
        500 => "D",
        1000 => "M",
    }
    result = 0
    roman_numerals = roman_numerals.invert()
    #finding exceptions to remove and calculate first
    if romanNumber.include?("CD")
        splitNum = romanNumber.split("CD")
        result = result + 400
        romanNumber = splitNum.join()
    end
    if romanNumber.include?("XC")
        splitNum = romanNumber.split("XC")
        result = result + 90
        romanNumber = splitNum.join()
    end
    if romanNumber.include?("XL")
        splitNum = romanNumber.split("XL")
        result = result + 40
        romanNumber = splitNum.join()
    end
    if romanNumber.include?("IV")
        splitNum = romanNumber.split("IV")
        result = result + 4
        romanNumber = splitNum.join()
    end
    numberarray = romanNumber.split("")
    numberarray.each do |i|
        arabicValue = roman_numerals[i]
    if arabicValue == nil
        raise TypeError
    else
        result = result + arabicValue
        
    end
end
    return result
end

def toRoman(arabicNumber)
    roman_numerals = {
        1000 => "M",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        5 => "V",
        4 => "IV",
        1 => "I",   
    }
    result = ""

    if arabicNumber < 1 || arabicNumber > 3999
        raise RangeError 
    else
        roman_numerals = roman_numerals.invert()
        remainder = arabicNumber
        roman_numerals.each do |i|
        number, remainder = remainder.divmod(i[1])
        result << "#{i[0]*number}"
    end
end
    return result

end