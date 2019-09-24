from os import listdir

# print(listdir('./'))
for l in listdir('./'):
    low = l.lower()
    nex_num = 1
    if low.startswith('day'):
        for l in low:
            if l.isnumeric():
                nex_num = int(l) + 1
    print(nex_num)

