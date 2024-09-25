# Caesar's Cipher
This is a cryptography technique where a series of alphabets are shifted to the right or left, i.e if the shift value is 5 to the right then A will become E, B will become F etc.

## Solution: 
For any string input we can convert each character in the string to its ASCII value by using the `#bytes` method. This will return an array of numbers where each number is the corresponding character's ASCII value.
```ruby
def caesar_cipher(input_str,shift_val)
  byte_nums = input_str.bytes.map { |byte| shifted(byte,shift_val) }
  new_str = byte_nums.map { |byte| byte.chr }.join("")
  return new_str;
end
```
What the `shifted(nums, shift_val)` is adds the `shift_val` to the `nums` parameter, but first we have to treat base cases. Special characters are between numbers 32 and 64 including numbers, 91 to 96 and above 122.  

If `nums` is in between those ranges we return the nums. However if `nums` is between 65 and 90 or between 97 and 122 we start our shifting. To make sure that when converting the letter 'z' to the letter 'a' or 'Z' to 'A', we have to check if the shifted value, `new_num` is equal to itself when using the modulo operator for the corresponding value of 'Z' or 'z'.

if it is not, then that means `new_nums` is greater than 90 or 122 and thus we have to use the value returned from the modulo operation and add it with the corresponding value of 64 or 96 which are the numbers that start right before 'A' or 'a'.

```ruby
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
```