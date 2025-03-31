
## variables required ##
subject_nodetype_id = 0
agent_graph_id = 0
technique_framework_id = 0
technology_framework_id = 0
tools_framework_id = 0
sfia_framework_id = 0


def enum_exists(enum: str):
    query = f"""SELECT nodeid FROM node 
    WHERE nodetypeid={subject_nodetype_id} AND payload @> '{{"Employee Number": "{enum}"}}'"""

    access.cursor.execute(query)
    row = access.cursor.fetchall()
    if len(row) == 0:
        return -1
    else:
        return row[0][0]


def create_agent(values):
    ## values -> first name, last name, employee number, Location, Security Classification, Email, Phone Number
    name = f"Agent {values[2]}"
    graphid = agent_graph_id
    nodetypeid = subject_nodetype_id
    classification = 1
    copyrightowner = "Agent Subject"
    version = "v1"
    payload = f"""{{
        "First Name": {values[0]},
        "Last Name": {values[1]},
        "Employee Number": {values[2]},
        "Location": {values[3]},
        "Security Classification": {values[4]},
        "Email": {values[5]},
        "Phone Number": {values[6]}
    }}"""
    access.add_row_node(name, graphid, nodetypeid, classification, copyrightowner, version, payload)

    ## create responses ##


def get_agent_data(subjectid):
    query = f"SELECT payload FROM node WHERE nodeid={subjectid}"
    access.cursor.execute(query)
    payload = access.cursor.fetchall()
    return payload


def get_technique():
    query = f"SElECT payload FROM node WHERE nodeid={technique_framework_id}"
    access.cursor.execute(query)
    payload = access.cursor.fetchall()
    return payload


def get_technology():
    query = f"SElECT payload FROM node WHERE nodeid={technology_framework_id}"
    access.cursor.execute(query)
    payload = access.cursor.fetchall()
    return payload


def get_tools():
    query = f"SElECT payload FROM node WHERE nodeid={tools_framework_id}"
    access.cursor.execute(query)
    payload = access.cursor.fetchall()
    return payload


def save_response(values, response_id):
    payload = {}
    query = f"UPDATE node SET payload={payload} WHERE nodeid={response_id}"
    access.cursor.execute(query)
    access.conn.commit()


def sfia_payload():
    query = f"SELECT payload FROM node WHERE nodeid={sfia_framework_id}"


def save_sfia_response(values, response_id):
    payload = {}
    query = f"UPDATE node SET payload={payload} WHERE nodeid={response_id}"
    access.cursor.execute(query)
    access.conn.commit()


def get_sfia_response(enum):
    query = f"SELECT payload FROM node WHERE name='SFIA_{enum}'"
    access.cursor.execute(query)
    payload = access.cursor.fetchall()
    return payload
