def roman_num(number)
  number_converted = number.to_s.split('').map {|digit| digit.to_i}
  ones = {0=>"", 1=>"I", 2=>"II", 3=>"III", 4=>"IV", 5=>"V", 6=>"VI", 7=>"VII", 8=>"VIII", 9=>"IX"}
  tens = {0=>"", 1=>'X', 2=>"XX", 3=>"XXX", 4=>"XL", 5=>"L", 6=>"LX", 7=>"LXX", 8=>"LXXX", 9 =>"XC"}
  hund = {0=>"", 1=>'C', 2=>"CC", 3=>"CCC", 4=>"CD", 5=>"D", 6=>"DC", 7=>"DCC", 8=>"DCCC", 9 =>"CM"}
  thou = {0=>"", 1=>'M', 2=>"MM", 3=>"MMM"}
  num_length = number_converted.length

  if num_length == 1
    ones[number_converted[0]]
  elsif num_length == 2
    tens[number_converted[0]] + ones[number_converted[1]]
  elsif num_length == 3
    hund[number_converted[0]] + tens[number_converted[1]] + ones[number_converted[2]]
  elsif num_length == 4
    thou[number_converted[0]] + hund[number_converted[1]] + tens[number_converted[2]] + ones[number_converted[3]]
  end
end

def rev_roman_num(roman_num)
  roman_num_array = roman_num.split("")

  roman_vals = {"I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500, "M"=>1000}
  sub_vals = {["I", "V"] => -2, ["I", "X"] => -2, ["X", "L"] => -20, ["X", "C"]=>-20, ["C", "D"] => -200, ["C", "M"] => -200}
  sum =0
  sub_sum =0

  roman_num_array.each do |x|
    sum += roman_vals[x]
  end

  roman_num_array.each_cons(2) do |x|
    sub_vals.each do |y, z|
      if x == y
        sub_sum -= z
      end
    end
  end
  final_sum = sum - sub_sum
end
