import tkinter as tk
import tkinter.ttk as ttk
import json
import scrollFrame as sf


class Window:

    def __init__(self, master):
        self.master = master
        self.frame = tk.Frame(self.master)
        main_menu = SFIA_Menu(self.frame)
        self.frame.pack()


class SFIA_Menu:

    def __init__(self, window):
        self.window = window
        self.frame = tk.Frame(window)
        self.lbl_menu = tk.Label(self.frame)
        self.butt_pem = tk.Button(self.frame, text="PEM", command=lambda: self.pem_func())
        self.butt_agent = tk.Button(self.frame, text="Agent", command=lambda: self.agent_func())
        self.var_enum = tk.StringVar()
        self.entry_enum = tk.Entry(self.frame, textvariable=self.var_enum)
        self.butt_submit = tk.Button(self.frame, text="submit", command=lambda: self.submit_func_test())
        self.create_menu()

    def create_menu(self):
        self.butt_pem.pack(side=tk.LEFT)
        self.butt_agent.pack(side=tk.LEFT)
        self.frame.pack()

    def pem_func(self):
        pass
        #load_pem()

    def agent_func(self):
        slaves = self.frame.slaves()
        for slave in slaves:
            slave.pack_forget()
        self.lbl_menu.pack()
        self.entry_enum.pack()
        self.butt_submit.pack()

    def check_enum(self):
        global access
        enum = self.var_enum.get()
        query = f"SELECT nodeid FROM node WHERE name=SFIA {enum}"
        access.cursor.execute(query)
        row = access.cursor.fetchall()
        if not row:
            return -1
        else:
            return row

    def load_agent(self, agentid):
        global access
        query = f"SELECT payload FROM node WHERE nodeid={agentid}"
        access.cursor.execute(query)
        row = access.cursor.fetchall()
        return row[0][0]

    def create_agent(self):
        global access
        enum = self.var_enum.get()
        vals = []
        for i in range(147):
            vals.append(0)
        payload = {"Results": vals}
        agentid = access.add_row_node(f"SFIA {enum}", 19, 15, 1, enum, 'v1', payload)
        return payload, agentid

    def submit_func(self):
        enum = self.var_enum.get()
        payload = None
        agentid = 0
        if enum.isdigit() and len(enum) == 8:
            agent = self.check_enum()
            if agent != -1:
                payload = self.load_agent(agent)
                agentid = agent
            else:
                payload, agentid = self.create_agent()

            slaves = self.window.slaves()
            for slave in slaves:
                slave.pack_forget()
            SFIA_Agent(self.window, payload, agentid)


    def submit_func_test(self):
        slaves = self.window.slaves()
        for slave in slaves:
            slave.pack_forget()
        vals = []
        for i in range(147):
            vals.append(0)
        payload = {"Results": vals}
        SFIA_Agent(self.window, payload)



class SFIA_Reader:

    def __init__(self):
        self.payload = self.get_payload_test()
        self.headers, self.rows = self.read(self.payload)

    def get_payload(self):
        query = "SELECT payload FROM node WHERE nodetypeid=14"
        access.cursor.execute(query)
        row = access.cursor.fetchall()
        return row[0][0]

    def get_payload_test(self):
        file_path = "SFIA framework.json"
        x = open(file_path, 'r')
        return json.load(x)

    def read(self, payload):
        headers = payload["Headers"]
        cats = payload["Categories"]
        subcats = payload["Subcategories"]
        data = payload["Data"]

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

        return headers, rows


class SFIA_Agent():

    def __init__(self, window, payload, agentid):
        self.framework_reader = SFIA_Reader()
        self.window = window
        self.agentid = agentid
        self.scrollframe = sf.VerticalScrolledFrame(window)
        self.scrollframe.pack(expand=True, fill=tk.BOTH)
        self.frame = tk.Frame(self.scrollframe.interior)
        self.entries = []
        self.values = []
        self.payload = payload
        self.make_table(self.frame)

    def make_table(self, master):
        for i in range(len(self.framework_reader.headers)):
            label = tk.Label(master, text=self.framework_reader.headers[i], width=40)
            label.grid(row=1, column=i)
        for i in range(len(self.framework_reader.rows)):
            for j in range(len(self.framework_reader.rows[i])):
                label = tk.Label(master, text=self.framework_reader.rows[i][j], width=40)
                label.grid(row=i+2, column=j)
        for i in range(len(self.framework_reader.rows)):
            options = [0]
            for x in self.framework_reader.rows[i][3]:
                if x.isdigit():
                    options.append(x)
            option_var = tk.StringVar()
            self.values.append(option_var)
            option_var.set(self.payload["Results"][i])
            option_menu = tk.OptionMenu(master, option_var, *options)
            option_menu.grid(row=i+2, column=4)
            self.entries.append(option_menu)

        butt_save = tk.Button(master, text="Save", command=lambda: self.save_func())
        butt_save.grid(row=0, column=4)

        master.pack(expand=True, fill=tk.BOTH)
        self.scrollframe.canvas.config(width=500, height=600)

    def save_func(self):
        vals = []
        for x in self.values:
            vals.append(x.get())
        self.payload = {"Results": vals}

        global access
        query = f"UPDATE node SET payload = {self.payload} WHERE nodeid={self.agentid}"
        access.cursor.execute(query)
        access.conn.commit()


root = tk.Tk()
root.geometry("1500x1000")
window = Window(root)
root.mainloop()
