import json
from prettytable import PrettyTable

file_path = "SFIA framework.json"
x = open(file_path, 'r')
y = json.load(x)

headers = y["Headers"]
cats = y["Categories"]
subcats = y["Subcategories"]
data = y["Data"]

rows = []

col1 = ''
col2 = ''
for i in range(len(cats)):
    for j in range(len(subcats[i])):
        skill_arr = data[cats[i]][subcats[i][j]]
        for k in range(len(skill_arr)):
            if j == 0 and k == 0:
                col1 = cats[i]
            else:
                col1 = ""
            if k == 0:
                col2 = subcats[i][j]
            else:
                col2 = ""
            col4 = []
            for l in range(skill_arr[k][1], skill_arr[k][2] + 1):
                col4.append(l)
            rows.append([col1, col2, skill_arr[k][0], f"{col4}"])

myTable = PrettyTable(["c", "sc", "sk", "l"])
for row in rows:
    myTable.add_row(row)
print(myTable)
