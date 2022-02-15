nums = []

def complement(numb):
    return [1-x for x in numb]


def joinWithBase(arr, base=2):
    joined = ''.join([str(x) for x in arr])
    return int(joined, base)


with open('input', 'r') as f:
    while text := f.readline():
        nums.append(text.strip())

gamm_acc = [0] * len(nums[0])
for num in nums:
    for i, bit in enumerate(num):
        gamm_acc[i] += int(bit)

gamm_rate = [round(x/len(nums)) for x in gamm_acc]
eps_rate = joinWithBase(complement(gamm_rate))
gamm_rate = joinWithBase(gamm_rate)
print(f'Gamma={gamm_rate} Epsilon={eps_rate}')
print(f'MUL={gamm_rate*eps_rate}')

