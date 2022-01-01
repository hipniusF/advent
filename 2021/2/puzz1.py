movs = {
    'forward': 0,
    'down': 0,
    'up': 0
}

with open('input', 'r') as f:
    while text := f.readline():
        direc, val = text.split(' ')
        movs[direc] += int(val)

hor = movs['forward']
ver = movs['down'] - movs['up']
print(f'Ver={ver} & Hor={hor}')
print(f'Mul={ver*hor}')
