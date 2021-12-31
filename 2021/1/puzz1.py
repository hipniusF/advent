count = 0
with open('input', 'r') as f:
    prev = None
    while (text := f.readline()):
        num = int(text)
        if prev and num > prev:
            count += 1
        prev = int(text)

print(count)
