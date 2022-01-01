aim = 0
hor = 0
ver = 0

with open('input', 'r') as f:
    while text := f.readline():
        direc, val = text.split(' ')
        if direc == 'down':
            aim += int(val)
        elif direc == 'up':
            aim -= int(val)
        elif direc == 'forward':
            hor += int(val)
            ver += int(val) * aim

print(f'Ver={ver} & Hor={hor}')
print(f'Mul={ver*hor}')
