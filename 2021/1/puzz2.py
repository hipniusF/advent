measurements = []

with open('input', 'r') as f:
    while text := f.readline():
        measurements.append(int(text))

packs = zip(measurements, measurements[1:], measurements[2:])
sums = []
for i, el in enumerate(packs):
    sums.append(sum(el))

count = 0
for prev, _sum in zip(sums, sums[1:]):
    if (_sum > prev):
        count += 1
print(count)
