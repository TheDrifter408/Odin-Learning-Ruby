def shifted(nums, shift_val)
  if nums >= 32  and nums <= 64 || nums >= 91 and nums <= 96 || nums >= 123
    return nums
  end
  new_num = nums + shift_val;
  if nums >= 65 and nums <= 90
    if (new_num % 90) == new_num
      return new_num
    else 
      new_num = new_num % 90 + 64
    end
  elsif nums >= 97 and nums <= 122
    if (new_num % 122) == new_num
      return new_num
    else 
      new_num = new_num % 122 + 96
    end
  end
  return new_num
end

def caesar_cipher(input_str,shift_val)
  byte_nums = input_str.bytes.map { |byte| shifted(byte,shift_val) }
  new_str = byte_nums.map { |byte| byte.chr }.join("")
  return new_str;
end

puts caesar_cipher("What a string!",5)