with open('input', 'r') as f:
   nums = f.read().split('\n')[:-1]

def extract_num(nums, criteria):
   i = 0
   while len(nums) > 1:
      ones = 0
      zeros = 0
      for num in nums:
         if num[i] == '1':
            ones += 1
         else:
            zeros += 1

      if (zeros > ones and criteria == 'most') or (zeros <= ones and criteria == 'least'):
         nums = [num for num in filter(lambda num: num[i] == '0', nums)]
      else:
         nums = [num for num in filter(lambda num: num[i] == '1', nums)]
      i += 1

   return nums[0]

oxy_num = extract_num(nums, 'most')
co2_num = extract_num(nums, 'least')
print(oxy_num, co2_num)
print(f'Oxy={int(oxy_num, 2)} CO2={int(co2_num, 2)}')
print(f'MUL={int(oxy_num, 2)*int(co2_num, 2)}')
