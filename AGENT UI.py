import json
import tkinter as tk
import scrollFrame as sf


class Window:

    def __init__(self, root):
        self.root = root
        self.root.geometry("500x500")
        self.mainframe = tk.Frame(self.root)
        self.mainframe.pack()
        MainMenu(self.mainframe)


class MainMenu:

    def __init__(self, master):
        self.master = master
        self.widgets = []
        self.create_menu()

    def create_menu(self):
        frame = tk.Frame(self.master)
        operations = [lambda: self.butt_create_func(), lambda: self.butt_load_func(entry)]
        butt_create = tk.Button(frame, text="Create", command=operations[0], width=15, height=5)
        entry = tk.Entry(frame)
        entry.insert(0, "12345678")
        butt_load = tk.Button(frame, text="Load", command=operations[1], width=15, height=5)
        lbl_create = tk.Label(frame, text="Create A New Agent", width=20, height=5)
        lbl_load = tk.Label(frame, text="Enter Agent \nEmployee Number", width=20, height=5)

        self.widgets.append(frame)
        self.widgets.append(butt_create)
        self.widgets.append(butt_load)
        self.widgets.append(entry)
        self.widgets.append(lbl_load)
        self.widgets.append(lbl_create)

        frame.pack()
        lbl_create.grid(row=0, column=0, padx=5, pady=5)
        butt_create.grid(row=0, column=1, padx=5, pady=5)
        lbl_load.grid(row=1, column=0, padx=5, pady=5)
        butt_load.grid(row=1, column=1, padx=5, pady=5)
        entry.grid(row=1, column=2, padx=5, pady=5)

        frm_buttons = tk.Frame(self.master)
        butt_technique = tk.Button(frm_buttons, text="Techniques", command=lambda: self.butt_technique_func(), width=15)
        butt_technology = tk.Button(frm_buttons, text="Technologies", command=lambda: self.butt_technology_func(), width=15)
        butt_tools = tk.Button(frm_buttons, text="Tools", command=lambda: self.butt_tools_func(), width=15)

        self.widgets.extend([frm_buttons, butt_technique, butt_technology, butt_tools])

        frm_buttons.pack(pady=20)
        butt_technique.grid(row=0, column=0, padx=5, pady=5)
        butt_technology.grid(row=0, column=1, padx=5, pady=5)
        butt_tools.grid(row=0, column=2, padx=5, pady=5)

    def destroy_menu(self):
        for widget in self.widgets:
            widget.destroy()
        self.widgets = []

    def butt_create_func(self):
        self.destroy_menu()
        CreateAgentMenu(self.master, self)

    def butt_load_func(self, entry):
        enum = entry.get()
        if enum.isspace():
            print("Enum Blank")
            return
        if len(enum) != 8:
            print("Wrong Format")
            return
        if self.enum_exists(enum):
            self.destroy_menu()
            ## pass through subject id ##
            LoadAgentMenu(self.master, self, enum)
        else:
            print("Enum Doesn't Exist")
            return

    def enum_exists(self, enum):
        ## change to read db ##
        if enum == "12345678":
            return True
        else:
            return False

    def butt_technique_func(self):
        pass

    def butt_technology_func(self):
        pass

    def butt_tools_func(self):
        pass


class Techniques:

    def __init__(self, master, previous_menu):
        self.master = master
        self.previous_menu = previous_menu
        self.widgets = []
        self.create_menu()

    def create_menu(self):
        frame = tk.Frame(self.master)
        lbl_title = tk.Label(frame, text="Techniques")
        butt_add = tk.Button(frame, text="Add Technique")


class CreateAgentMenu:

    def __init__(self, master, previous_menu):
        self.master = master
        self.previous_menu = previous_menu
        self.widgets = []
        self.create_menu()

    def create_menu(self):
        frame = tk.Frame(self.master)
        entries = []
        labels = []
        lbl_title = tk.Label(frame, text="Please Fill Out Fields\n Those Marked With (*) Are Required")
        butt_create = tk.Button(frame, text="Create", command=lambda: self.butt_create_func(entries, labels))
        butt_back = tk.Button(frame, text="Back", command=lambda: self.butt_back_func())

        self.widgets.extend([frame, lbl_title, butt_create, butt_back])
        frame.pack()
        lbl_title.grid(row=0, column=0, padx=5, pady=5, columnspan=2)
        butt_back.grid(row=8, column=0, padx=5, pady=5)
        butt_create.grid(row=8, column=1, padx=5, pady=5)

        ## fields labels and entries ##
        fields = ["First Name*", "Last Name*", "Employee Number*", "Location", "Security Classification",
                  "Email", "Phone Number"]
        for i in range(len(fields)):
            lbl_field = tk.Label(frame, text=fields[i], width=20, relief="sunken")
            ent_field = tk.Entry(frame)
            self.widgets.extend([lbl_field, ent_field])
            labels.append(lbl_field)
            entries.append(ent_field)
            lbl_field.grid(row=i + 1, column=0, padx=5, pady=5)
            ent_field.grid(row=i + 1, column=1, padx=5, pady=5)


    def destroy_menu(self):
        for widget in self.widgets:
            widget.destroy()
        self.widgets = []

    def enum_exists(self, enum):
        ## change to read db ##
        if enum == "12345678":
            return True
        else:
            return False

    def butt_create_func(self, entries, labels):
        for i in range(3):
            if entries[i].get().isspace() or entries[i].get() == "":
                print(labels[i].cget("text")[:-1], "Cannot Be Blank")
                return
        if self.enum_exists(entries[2].get()):
            print("Agent Already Exists")
        else:
            ## Create Agent in db ##
            print("Agent Created")
            ## Create all resopnse ##
            ## technique ##
            ## technology ##
            ## tools ##
            ## SFIA ##

    def butt_back_func(self):
        self.destroy_menu()
        self.previous_menu.create_menu()


class LoadAgentMenu:

    def __init__(self, master, previous_menu, agent_enum):
        ## change agent enum to node id ##
        self.master = master
        self.previous_menu = previous_menu
        self.agent_enum = agent_enum
        self.widgets = []
        self.create_menu()

    def create_menu(self):
        global root
        root.geometry("500x500")

        frame = tk.Frame(self.master)
        lbl_title = tk.Label(frame, text="Loaded")
        lbl_view = tk.Label(frame, text="View")
        butt_back = tk.Button(frame, text="Back", command=lambda: self.butt_back_func())

        self.widgets.extend([frame, lbl_title, butt_back])
        frame.pack()
        butt_back.grid(row=0, column=0, padx=5, pady=10)
        lbl_title.grid(row=0, column=1, padx=5, pady=10)
        lbl_view.grid(row=0, column=2, padx=5, pady=10)

        ## Fields ##
        fields, responses = self.get_agent()
        for i in range(len(fields)):
            text = fields[i] + ":"
            lbl_field = tk.Label(frame, text=text, anchor="e")
            lbl_response = tk.Label(frame, text=responses[i], anchor="w", relief="sunken")
            lbl_field.grid(row=i + 2, column=0, padx=7, pady=5, sticky="EW")
            lbl_response.grid(row=i + 2, column=1, padx=10, pady=5, sticky="EW")
            self.widgets.extend([lbl_field, lbl_response])

        ## Buttons ##
        button_text = ["Techniques", "Technology", "Tools", "SFIA", "KSB Coverage"]
        button_command = [lambda: self.butt_technique_func(), lambda: self.butt_technology_func(),
                          lambda: self.butt_tools_func(), lambda: self.butt_sfia_func(), lambda: self.butt_ksb_func()]
        for i in range(len(button_text)):
            button = tk.Button(frame, text=button_text[i], command=button_command[i], width=15)
            button.grid(row=i + 2, column=2, padx=5, pady=5)
            self.widgets.append(button)

    def destroy_menu(self):
        for widget in self.widgets:
            widget.destroy()
        self.widgets = []


    def butt_back_func(self):
        self.destroy_menu()
        self.previous_menu.create_menu()

    def get_agent(self):
        ## get data from db ##
        fields = ["First Name", "Last Name", "Employee Number", "Location", "Security Classification",
                  "Email", "Phone Number"]
        responses = ["Joe", "Bloggs", "12345678", "Luton", "Full", "joe.bloggs@leonardo.com", "07894782250"]
        return fields, responses

    def butt_technique_func(self):
        self.destroy_menu()
        TTTAgentMenu(self.master, self, self.agent_enum, "technique")

    def butt_technology_func(self):
        self.destroy_menu()
        TTTAgentMenu(self.master, self, self.agent_enum, "technology")

    def butt_tools_func(self):
        self.destroy_menu()
        TTTAgentMenu(self.master, self, self.agent_enum, "tools")

    def butt_sfia_func(self):
        self.destroy_menu()
        SFIAMenu(self.master, self, self.agent_enum)

    def butt_ksb_func(self):
        self.destroy_menu()
        KSBCoverage(self.master, self, self.agent_enum)


class TTTAgentMenu:

    def __init__(self, master, previous_menu, agent_enum: str, graph: str):
        self.master = master
        self.previous_menu = previous_menu
        self.agent_enum = agent_enum
        self.graph = graph
        self.widgets = []
        self.response_id = None
        self.create_menu()

    def create_menu(self):
        fields = []
        responses = []
        match self.graph:
            case "technique":
                ## get techniques ##
                for i in range(100):
                    fields.append(f"tech_{i}")
                    responses.append(3)

            case "technology":
                ## get technology ##
                fields = ["techno1", "techno2", "techno3"]
                responses = [1, 1, 1]

            case "tools":
                ## get tools ##
                fields = ["tool1", "tool2", "tool3"]
                responses = [2, 3, 4]

        frame = tk.Frame(self.master)
        text = self.graph.title() + " " + self.agent_enum
        lbl_title = tk.Label(frame, text=text)
        butt_back = tk.Button(frame, text="Back", command=lambda: self.butt_back_func())
        response_list = []
        butt_save = tk.Button(frame, text="Save", command=lambda: self.butt_save_func(response_list))
        scroller = sf.VerticalScrolledFrame(frame)
        lbl_label = tk.Label(frame, text=self.graph.title())
        lbl_levels = tk.Label(frame, text="Levels")
        self.widgets.extend([frame, lbl_title, butt_back, butt_save, scroller, lbl_levels, lbl_label])

        frame.pack()
        lbl_title.grid(row=0, column=1, padx=5, pady=5)
        butt_back.grid(row=0, column=0, padx=5, pady=5)
        butt_save.grid(row=0, column=2, padx=5, pady=5)
        lbl_label.grid(row=1, column=0, padx=5, pady=5)
        lbl_levels.grid(row=1, column=2, padx=5, pady=5)
        scroller.grid(row=2, column=0, padx=5, pady=5, columnspan=3)

        for i in range(len(fields)):
            label = tk.Label(scroller.interior, text=fields[i])
            options = [0, 1, 2, 3, 4, 5, 6, 7]
            option_var = tk.StringVar()
            response_list.append(option_var)
            option_var.set(str(responses[i]))
            option_menu = tk.OptionMenu(scroller.interior, option_var, *options)
            self.widgets.extend([label, option_menu])
            label.grid(row=i, column=0, padx=5, pady=5, columnspan=2)
            option_menu.grid(row=i, column=2, padx=5, pady=5)

    def destroy_menu(self):
        for widget in self.widgets:
            widget.destroy()
        self.widgets = []

    def butt_back_func(self):
        self.destroy_menu()
        self.previous_menu.create_menu()

    def butt_save_func(self, response_list):
        ## save to payload db ##
        values = []
        for response in response_list:
            values.append(int(response.get()))
        print(values)


class SFIAMenu:

    def __init__(self, master, previous_menu, agent_enum):
        self.master = master
        self.previous_menu = previous_menu
        self.agent_enum = agent_enum
        self.widgets = []
        self.create_menu()

    def create_menu(self):
        global root
        root.geometry("800x500")

        frame = tk.Frame(self.master)
        lbl_title = tk.Label(frame, text=f"SFIA: {self.agent_enum}")
        butt_back = tk.Button(frame, text="Back", command=lambda: self.butt_back_func())
        response_list = []
        butt_save = tk.Button(frame, text="Save", command=lambda: self.butt_save_func(response_list))
        scroller = sf.VerticalScrolledFrame(frame)
        self.widgets.extend([frame, lbl_title, butt_back, butt_save, scroller])

        headers = ["Categories", "Subcategories", "Skills", "Levels"]
        for i in range(len(headers)):
            label = tk.Label(frame, text=headers[i])
            self.widgets.append(label)
            label.grid(row=1, column=i, padx=5, pady=5)

        frame.pack()
        lbl_title.grid(row=0, column=1, padx=5, pady=5, columnspan=2)
        butt_back.grid(row=0, column=0, padx=5, pady=5)
        butt_save.grid(row=0, column=3, padx=5, pady=5)
        scroller.grid(row=2, column=0, padx=5, pady=5, columnspan=4)

        rows = self.sfia_reader()
        responses = self.get_responses()
        for i in range(len(rows)):
            lbl_cat = tk.Label(scroller.interior, text=rows[i][0])
            lbl_subcat = tk.Label(scroller.interior, text=rows[i][1])
            lbl_skill = tk.Label(scroller.interior, text=rows[i][2])
            options = rows[4]
            option_var = tk.StringVar()
            response_list.append(option_var)
            option_var.set(str(responses[i]))
            option_menu = tk.OptionMenu(scroller.interior, option_var, *options)
            self.widgets.extend([lbl_cat, lbl_subcat, lbl_skill, option_menu])
            lbl_cat.grid(row=i, column=0, padx=5, pady=5)
            lbl_subcat.grid(row=i, column=1, padx=5, pady=5)
            lbl_skill.grid(row=i, column=2, padx=5, pady=5)
            option_menu.grid(row=i, column=3, padx=5, pady=5)

    def destroy_menu(self):
        for widget in self.widgets:
            widget.destroy()
        self.widgets = []

    def butt_back_func(self):
        self.destroy_menu()
        self.previous_menu.create_menu()

    def butt_save_func(self, response_list):
        ## save to payload db ##
        values = []
        for response in response_list:
            values.append(int(response.get()))
        print(values)

    def sfia_reader(self):
        ## read from payload ##
        file_path = "SFIA framework.json"
        x = open(file_path, 'r')
        y = json.load(x)

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
                    col4 = [0]
                    for l in range(skill_arr[k][1], skill_arr[k][2] + 1):
                        col4.append(l)
                    # rows.append([col1, col2, skill_arr[k][0], col4])
                    rows.append([cats[i], subcats[i][j] , skill_arr[k][0], col4])
        return rows

    def get_responses(self):
        ## responses from db ##
        responses = []
        for i in range(147):
            responses.append(0)
        return responses


class KSBCoverage:

    def __init__(self, master, previous_menu, agent_enum):
        self.master = master
        self.previous_menu = previous_menu
        self.agent_enum = agent_enum
        self.widgets = []
        self.create_menu()

    def create_menu(self):
        frame = tk.Frame(self.master)
        lbl_title = tk.Label(frame, text=f"KSB Coverage: {self.agent_enum}")
        butt_back = tk.Button(frame, text="Back", command=lambda: self.butt_back_func())
        response_list = []
        scroller = sf.VerticalScrolledFrame(frame)
        self.widgets.extend([frame, lbl_title, butt_back, scroller])

        headers = ["KSB", "Technique Mapped"]
        for i in range(len(headers)):
            label = tk.Label(frame, text=headers[i])
            self.widgets.append(label)
            label.grid(row=1, column=i, padx=5, pady=5)

        frame.pack()
        lbl_title.grid(row=0, column=1, padx=5, pady=5)
        butt_back.grid(row=0, column=0, padx=5, pady=5)
        scroller.grid(row=2, column=0, padx=5, pady=5, columnspan=2)

        rows = self.get_ksbs()
        for i in range(len(rows)):
            lbl_ksb = tk.Label(scroller.interior, text=rows[i][0])
            lbl_mapping = tk.Label(scroller.interior, text=rows[i][1])
            self.widgets.extend([lbl_ksb, lbl_mapping])
            lbl_ksb.grid(row=i, column=0, padx=5, pady=5)
            lbl_mapping.grid(row=i, column=1, padx=5, pady=5)


    def destroy_menu(self):
        for widget in self.widgets:
            widget.destroy()
        self.widgets = []

    def butt_back_func(self):
        self.destroy_menu()
        self.previous_menu.create_menu()

    def get_ksbs(self):
        rows = []
        for i in range(20):
            rows.append([f"KSB K{i}", f"technique_{i}"])
        return rows


global root
root = tk.Tk()
root.title("Agent and TTT")
Window(root)
root.mainloop()


