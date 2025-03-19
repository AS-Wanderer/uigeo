--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: edge; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.edge (
    edgeid integer NOT NULL,
    edgetypeid bigint NOT NULL,
    headnodeid bigint NOT NULL,
    tailnodeid bigint NOT NULL
);


ALTER TABLE public.edge OWNER TO "pi-003";

--
-- Name: edges_edgeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.edges_edgeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.edges_edgeid_seq OWNER TO "pi-003";

--
-- Name: edges_edgeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.edges_edgeid_seq OWNED BY public.edge.edgeid;


--
-- Name: edgetype; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.edgetype (
    edgetypeid integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.edgetype OWNER TO "pi-003";

--
-- Name: edgetype_edgetypeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.edgetype_edgetypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.edgetype_edgetypeid_seq OWNER TO "pi-003";

--
-- Name: edgetype_edgetypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.edgetype_edgetypeid_seq OWNED BY public.edgetype.edgetypeid;


--
-- Name: graph; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.graph (
    graphid integer NOT NULL,
    name character varying(64) NOT NULL,
    graphtypeid bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.graph OWNER TO "pi-003";

--
-- Name: graph_graphid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.graph_graphid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.graph_graphid_seq OWNER TO "pi-003";

--
-- Name: graph_graphid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.graph_graphid_seq OWNED BY public.graph.graphid;


--
-- Name: graphtype; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.graphtype (
    graphtypeid integer NOT NULL,
    name character varying(128),
    template jsonb
);


ALTER TABLE public.graphtype OWNER TO "pi-003";

--
-- Name: graphtype_graphtypeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.graphtype_graphtypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.graphtype_graphtypeid_seq OWNER TO "pi-003";

--
-- Name: graphtype_graphtypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.graphtype_graphtypeid_seq OWNED BY public.graphtype.graphtypeid;


--
-- Name: node; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.node (
    nodeid integer NOT NULL,
    name character varying(64) NOT NULL,
    graphid bigint NOT NULL,
    nodetypeid bigint NOT NULL,
    classification bigint NOT NULL,
    copyrightowner character varying(128) NOT NULL,
    version character varying(32) NOT NULL,
    payload jsonb NOT NULL
);


ALTER TABLE public.node OWNER TO "pi-003";

--
-- Name: nodes_nodeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.nodes_nodeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nodes_nodeid_seq OWNER TO "pi-003";

--
-- Name: nodes_nodeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.nodes_nodeid_seq OWNED BY public.node.nodeid;


--
-- Name: nodetype; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.nodetype (
    nodetypeid integer NOT NULL,
    name character varying(64) NOT NULL,
    fields jsonb NOT NULL,
    settings jsonb NOT NULL
);


ALTER TABLE public.nodetype OWNER TO "pi-003";

--
-- Name: nodetype_nodetypeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.nodetype_nodetypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nodetype_nodetypeid_seq OWNER TO "pi-003";

--
-- Name: nodetype_nodetypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.nodetype_nodetypeid_seq OWNED BY public.nodetype.nodetypeid;


--
-- Name: edge edgeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge ALTER COLUMN edgeid SET DEFAULT nextval('public.edges_edgeid_seq'::regclass);


--
-- Name: edgetype edgetypeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edgetype ALTER COLUMN edgetypeid SET DEFAULT nextval('public.edgetype_edgetypeid_seq'::regclass);


--
-- Name: graph graphid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graph ALTER COLUMN graphid SET DEFAULT nextval('public.graph_graphid_seq'::regclass);


--
-- Name: graphtype graphtypeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graphtype ALTER COLUMN graphtypeid SET DEFAULT nextval('public.graphtype_graphtypeid_seq'::regclass);


--
-- Name: node nodeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node ALTER COLUMN nodeid SET DEFAULT nextval('public.nodes_nodeid_seq'::regclass);


--
-- Name: nodetype nodetypeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.nodetype ALTER COLUMN nodetypeid SET DEFAULT nextval('public.nodetype_nodetypeid_seq'::regclass);


--
-- Data for Name: edge; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.edge (edgeid, edgetypeid, headnodeid, tailnodeid) FROM stdin;
1	10	1	4
2	10	4	7
3	10	2	5
4	10	5	8
5	10	3	6
6	10	6	9
10	10	6	12
13	11	28	25
14	11	29	25
15	11	30	25
16	11	31	25
17	11	32	25
18	11	33	25
19	11	34	25
20	11	35	25
21	11	36	25
22	11	37	25
23	11	38	25
24	11	39	25
25	11	40	25
26	11	41	25
27	11	42	25
28	11	43	25
29	11	44	25
30	11	45	25
31	11	46	25
32	11	47	25
33	11	48	25
34	11	49	25
35	11	50	25
36	11	51	25
37	11	52	25
38	11	53	25
39	11	54	25
40	11	55	25
41	11	56	25
42	11	57	25
43	11	58	25
44	11	59	25
45	11	60	25
46	11	61	25
47	11	62	25
48	11	63	25
49	11	64	25
50	11	65	25
51	11	66	25
52	11	67	25
53	11	68	25
54	11	69	25
55	11	70	25
56	11	71	25
57	11	72	25
58	11	73	25
59	11	74	25
60	11	75	25
61	11	76	25
62	11	77	25
63	11	78	25
64	11	79	25
65	11	80	25
66	11	81	25
67	11	82	25
68	11	83	25
69	11	84	25
70	11	85	25
71	11	86	25
72	11	87	25
73	11	88	25
74	11	89	25
75	11	90	25
76	11	91	25
77	11	92	25
78	11	93	25
79	11	94	25
80	11	95	25
81	11	96	25
82	11	97	25
83	11	98	25
84	11	99	25
85	11	100	25
86	11	101	25
87	11	102	25
88	11	103	25
89	11	104	25
90	11	105	25
91	11	106	25
92	11	107	25
93	11	108	25
94	11	109	25
95	11	110	25
96	11	111	25
97	11	112	25
98	11	113	25
99	11	114	25
100	11	115	25
101	11	116	25
102	11	117	25
103	11	118	25
104	11	119	25
105	11	120	25
106	11	121	25
107	11	122	25
108	11	123	25
109	11	124	25
110	11	125	25
111	11	126	25
112	11	127	25
113	11	128	25
114	11	129	25
115	11	130	25
116	11	131	25
117	11	132	25
118	11	133	25
119	11	134	25
120	11	135	25
121	11	136	25
122	11	137	25
123	11	138	25
124	11	139	25
125	11	140	25
126	11	141	25
127	11	142	25
128	11	143	25
129	11	144	25
130	11	145	25
131	11	146	25
132	11	147	25
133	11	148	25
134	11	149	25
135	11	150	25
136	11	151	25
137	11	152	25
138	11	153	25
139	11	154	25
140	11	155	25
141	11	156	25
142	11	157	25
143	11	158	25
144	11	159	25
145	11	160	25
146	11	161	25
147	11	162	25
148	11	163	25
149	11	164	25
150	11	165	25
151	11	166	25
152	11	167	25
153	11	168	25
154	11	169	25
155	11	170	25
156	11	171	25
157	11	172	25
158	11	27	25
159	11	26	25
\.


--
-- Data for Name: edgetype; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.edgetype (edgetypeid, name) FROM stdin;
10	link
11	SFIA Edge
12	KSB Edge
\.


--
-- Data for Name: graph; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.graph (graphid, name, graphtypeid) FROM stdin;
3	DO-178C	1
9	DEV-787	1
11	DEV-786	1
12	DEV-785	1
17	API Test Graph	1
19	SFIA Process	1
20	test	1
21	Agent	3
\.


--
-- Data for Name: graphtype; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.graphtype (graphtypeid, name, template) FROM stdin;
1	Basic	{}
2	SFIA Template	{"Allowed Nodes": {"14": "SFIA Framework", "15": "SFIA Agent", "17": "SFIA Skill"}}
3	Agent Template	{"Avaliable Nodes": {"18": "KSB"}}
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.node (nodeid, name, graphid, nodetypeid, classification, copyrightowner, version, payload) FROM stdin;
1	Test Result 1	3	1	10	Bob	v1	{}
2	Test Result 2	3	1	10	Jim	v1	{}
3	Test Result 3	3	1	10	Foo	v1	{}
4	Test Procedure 1	3	2	10	Bob	v1	{}
5	Test Procedure 2	3	2	10	Jim	v1	{}
6	Test Procedure 3	3	2	10	Foo	v1	{}
7	Test Case 1	3	4	10	Bob	v1	{}
8	Test Case 2	3	4	10	Jim	v1	{}
9	Test Case 3	3	4	10	Foo	v1	{}
12	Test Case 4	3	4	10	Kim	v1	{}
17	testttt	3	1	0	string	string	"string"
219	KSB K47	21	18	1	KSB	v1	{"K47": "Concepts and approaches to cyber security assurance."}
25	SFIA test framework	19	14	1	SFIA	v1	{"Data": {"People and skills": {"People management": [["Performance management PEMT", 4, 6], ["Employee experience EEXP", 4, 6], ["Organisational facilitation OFCL", 4, 6], ["Professional development PDSV", 4, 6], ["Workforce planning WFPL", 4, 6], ["Resourcing RESC", 2, 6]], "Skills management": [["Learning and development management ETMG", 2, 7], ["Learning design and development TMCR", 2, 5], ["Learning delivery ETDL", 2, 5], ["Competency assessment LEDA", 2, 6], ["Certification scheme operation CSOP", 2, 6], ["Teaching TEAC", 2, 7], ["Subject formation SUBF", 4, 7]]}, "Delivery and operation": {"Security services": [["Identity and access management IAMT", 1, 6], ["Security operations SCAD", 1, 6], ["Vulnerability assessment VUAS", 2, 5], ["Digital forensics DGFS", 2, 6], ["Cybercrime investigation CRIM", 2, 6], ["Offensive cyber operations OCOP", 2, 6], ["Penetration testing PENT", 2, 6]], "Service management": [["Service level management SLMO", 2, 7], ["Service catalogue management SCMG", 2, 5], ["Availability management AVMT", 3, 6], ["Continuity management COPL", 2, 6], ["Capacity management CPMG", 2, 6], ["Incident management USUP", 1, 6], ["Problem management PBMG", 2, 5], ["Change control CHMG", 2, 6], ["Asset management ASMG", 2, 6], ["Service acceptance SEAC", 3, 6]], "Technology management": [["Technology service management ITMG", 5, 7], ["Application support ASUP", 2, 5], ["Infrastructure operations ITOP", 1, 5], ["System software administration SYSP", 2, 5], ["Network support NTAS", 1, 5], ["Systems installation and removal HSIN", 1, 5], ["Configuration management CFMG", 2, 6], ["Release management RELM", 2, 6], ["Deployment DEPL", 2, 6], ["Storage management STMG", 2, 6], ["Facilities management DCMA", 2, 6]], "Data and records operations": [["Records management RMGT", 1, 5], ["Analytical classification and coding ANCC", 2, 6], ["Database administration DBAD", 2, 5]]}, "Change and transformation": {"Change analysis": [["Business situation analysis BUSA", 2, 6], ["Feasibility assessment FEAS", 2, 6], ["Requirements definition and management REQM", 2, 6], ["Business modelling BSMO", 2, 6], ["User acceptance testing BPTS", 2, 6]], "Change planning": [["Business process improvement BPRE", 2, 7], ["Organisational capability development OCDV", 5, 7], ["Organisation design and implementation ORDI", 3, 7], ["Organisational change management CIPM", 2, 6], ["Job analysis and design JADN", 3, 5], ["Organisational change enablement OCEN", 4, 6]], "Change implementation": [["Portfolio management POMG", 5, 7], ["Programme management PGMG", 6, 7], ["Project management PRMG", 4, 7], ["Portfolio, programme and project support PROF", 2, 6], ["Delivery management DEMG", 3, 6]]}, "Strategy and architecture": {"Advice and guidance": [["Consultancy CNSL", 4, 7], ["Specialist advice TECH", 4, 6], ["Methods and tools METL", 2, 6]], "Security and privacy": [["Information security SCTY", 2, 7], ["Information assurance INAS", 2, 7], ["Information and data compliance PEDP", 4, 6], ["Vulnerability research VURE", 2, 6], ["Threat intelligence THIN", 2, 6]], "Strategy and planning": [["Strategic planning ITSP", 4, 7], ["Information systems coordination ISCO", 6, 7], ["Information management IRMG", 3, 7], ["Enterprise and business architecture STPL", 5, 7], ["Solution architecture ARCH", 4, 6], ["Innovation management INOV", 5, 7], ["Emerging technology monitoring EMRG", 4, 6], ["Formal research RSCH", 2, 6], ["Sustainability SUST", 4, 6]], "Financial and value management": [["Financial management FMIT", 4, 6], ["Investment appraisal INVA", 4, 6], ["Benefits management BENM", 3, 6], ["Budgeting and forecasting BUDF", 2, 6], ["Financial analysis FIAN", 2, 6], ["Cost management COMG", 2, 6], ["Demand management DEMM", 4, 6], ["Measurement MEAS", 2, 6]], "Governance, risk and compliance": [["Risk management BURM", 2, 7], ["Artificial intelligence (AI) and data ethics AIDE", 3, 6], ["Audit AUDT", 2, 7], ["Quality management QUMG", 2, 7], ["Quality assurance QUAS", 2, 6]]}, "Relationships and engagement": {"Marketing": [["Marketing management MKTG", 4, 7], ["Market research MRCH", 3, 6], ["Brand management BRMG", 4, 6], ["Customer engagement and loyalty CELO", 3, 6], ["Marketing campaign management MKCM", 3, 5], ["Digital marketing DIGM", 2, 5]], "Stakeholder management": [["Sourcing SORC", 2, 7], ["Supplier management SUPP", 2, 7], ["Contract management ITCM", 2, 7], ["Stakeholder relationship management RLMT", 4, 7], ["Customer service support CSMG", 1, 6], ["Business administration ADMN", 1, 6]], "Sales and bid management": [["Bid/proposal management BIDM", 3, 6], ["Selling SALE", 3, 6], ["Sales support SSUP", 1, 6]]}, "Development and implementation": {"Content management": [["Content design and authoring INCA", 1, 6], ["Content publishing ICPM", 1, 6], ["Knowledge management KNOW", 2, 7], ["Graphic design GRDN", 1, 5]], "Data and analytics": [["Data management DATM", 2, 6], ["Data modelling and design DTAN", 2, 5], ["Database design DBDS", 2, 5], ["Data analytics DAAN", 2, 7], ["Data science DATS", 2, 6], ["Machine learning MLNG", 2, 6], ["Business intelligence BINT", 2, 5], ["Data engineering DENG", 2, 6], ["Data visualisation VISL", 2, 5]], "Systems development": [["Product management PROD", 2, 6], ["Systems development management DLMG", 4, 7], ["Systems and software lifecycle engineering SLEN", 3, 7], ["Systems design DESN", 2, 6], ["Software design SWDN", 2, 6], ["Network design NTDS", 2, 6], ["Infrastructure design IFDN", 2, 6], ["Hardware design HWDE", 2, 6], ["Programming/software development PROG", 2, 6], ["Systems integration and build SINT", 2, 6], ["Functional testing TEST", 1, 6], ["Non-functional testing NFTS", 1, 6], ["Process testing PRTS", 1, 6], ["Software configuration PORT", 2, 6], ["Real-time/embedded systems development RESD", 2, 6], ["Safety engineering SFEN", 2, 6], ["Safety assessment SFAS", 4, 6], ["Radio frequency engineering RFEN", 2, 6], ["Animation development ADEV", 2, 6]], "User centred design": [["User research URCH", 2, 6], ["Customer experience CEXP", 2, 6], ["Accessibility and inclusion ACIN", 2, 6], ["User experience analysis UNAN", 2, 5], ["User experience design HCEV", 2, 6], ["User experience evaluation USEV", 2, 6]], "Computational science": [["Scientific modelling SCMO", 4, 7], ["Numerical analysis NUAN", 4, 7], ["High-performance computing HPCC", 4, 7]]}}, "Headers": ["Category", "Subcategory", "Skill", "Levels"], "Categories": ["Strategy and architecture", "Change and transformation", "Development and implementation", "Delivery and operation", "People and skills", "Relationships and engagement"], "Subcategories": [["Strategy and planning", "Financial and value management", "Security and privacy", "Governance, risk and compliance", "Advice and guidance"], ["Change implementation", "Change analysis", "Change planning"], ["Systems development", "Data and analytics", "User centred design", "Content management", "Computational science"], ["Technology management", "Service management", "Security services", "Data and records operations"], ["People management", "Skills management"], ["Stakeholder management", "Sales and bid management", "Marketing"]]}
27	ITSP	19	17	1	SFIA	v1	{"Skill": "Strategic planning ITSP", "Levels": [4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
28	ISCO	19	17	1	SFIA	v1	{"Skill": "Information systems coordination ISCO", "Levels": [6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
29	IRMG	19	17	1	SFIA	v1	{"Skill": "Information management IRMG", "Levels": [3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
30	STPL	19	17	1	SFIA	v1	{"Skill": "Enterprise and business architecture STPL", "Levels": [5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
31	ARCH	19	17	1	SFIA	v1	{"Skill": "Solution architecture ARCH", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
32	INOV	19	17	1	SFIA	v1	{"Skill": "Innovation management INOV", "Levels": [5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
33	EMRG	19	17	1	SFIA	v1	{"Skill": "Emerging technology monitoring EMRG", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
34	RSCH	19	17	1	SFIA	v1	{"Skill": "Formal research RSCH", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
35	SUST	19	17	1	SFIA	v1	{"Skill": "Sustainability SUST", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
36	FMIT	19	17	1	SFIA	v1	{"Skill": "Financial management FMIT", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
37	INVA	19	17	1	SFIA	v1	{"Skill": "Investment appraisal INVA", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
38	BENM	19	17	1	SFIA	v1	{"Skill": "Benefits management BENM", "Levels": [3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
39	BUDF	19	17	1	SFIA	v1	{"Skill": "Budgeting and forecasting BUDF", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
40	FIAN	19	17	1	SFIA	v1	{"Skill": "Financial analysis FIAN", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
41	COMG	19	17	1	SFIA	v1	{"Skill": "Cost management COMG", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
42	DEMM	19	17	1	SFIA	v1	{"Skill": "Demand management DEMM", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
43	MEAS	19	17	1	SFIA	v1	{"Skill": "Measurement MEAS", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
44	SCTY	19	17	1	SFIA	v1	{"Skill": "Information security SCTY", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
220	KSB K48	21	18	1	KSB	v1	{"K48": "Key legislative frameworks and the regulatory landscape for cyber security including Data Protection Act 2018 , Network Information System Directive 2018, Regulation of Investigatory Powers Act 2000, ISO 27001."}
221	KSB K49	21	18	1	KSB	v1	{"K49": "Approaches to incident response and management including escalation and investigation of cyber security breaches and their root cause."}
222	KSB K50	21	18	1	KSB	v1	{"K50": "Ethical principles and codes of good practice of at least one significant cyber security professional body and the ethical responsibilities of a cyber security professional."}
223	KSB K51	21	18	1	KSB	v1	{"K51": "Principles of common security architectures and methodologies."}
224	KSB K52	21	18	1	KSB	v1	{"K52": "Approaches to deployment of cyber security technology components in digital systems to provide security functionality. For example hardware and software to implement security controls."}
225	KSB K53	21	18	1	KSB	v1	{"K53": "The barriers that exist to effective data analysis between analysts and their stakeholders and how to avoid or resolve these."}
226	KSB K54	21	18	1	KSB	v1	{"K54": "How to critically analyse, interpret and evaluate complex information from diverse datasets."}
227	KSB K55	21	18	1	KSB	v1	{"K55": "Data formats, structures, architectures and data delivery methods including “unstructured” data."}
45	INAS	19	17	1	SFIA	v1	{"Skill": "Information assurance INAS", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
46	PEDP	19	17	1	SFIA	v1	{"Skill": "Information and data compliance PEDP", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
47	VURE	19	17	1	SFIA	v1	{"Skill": "Vulnerability research VURE", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
48	THIN	19	17	1	SFIA	v1	{"Skill": "Threat intelligence THIN", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
49	BURM	19	17	1	SFIA	v1	{"Skill": "Risk management BURM", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
50	AIDE	19	17	1	SFIA	v1	{"Skill": "Artificial intelligence (AI) and data ethics AIDE", "Levels": [3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
51	AUDT	19	17	1	SFIA	v1	{"Skill": "Audit AUDT", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
52	QUMG	19	17	1	SFIA	v1	{"Skill": "Quality management QUMG", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
53	QUAS	19	17	1	SFIA	v1	{"Skill": "Quality assurance QUAS", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
54	CNSL	19	17	1	SFIA	v1	{"Skill": "Consultancy CNSL", "Levels": [4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Advice and guidance"}
55	TECH	19	17	1	SFIA	v1	{"Skill": "Specialist advice TECH", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Advice and guidance"}
56	METL	19	17	1	SFIA	v1	{"Skill": "Methods and tools METL", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Advice and guidance"}
57	POMG	19	17	1	SFIA	v1	{"Skill": "Portfolio management POMG", "Levels": [5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
58	PGMG	19	17	1	SFIA	v1	{"Skill": "Programme management PGMG", "Levels": [6, 7], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
59	PRMG	19	17	1	SFIA	v1	{"Skill": "Project management PRMG", "Levels": [4, 5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
60	PROF	19	17	1	SFIA	v1	{"Skill": "Portfolio, programme and project support PROF", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
61	DEMG	19	17	1	SFIA	v1	{"Skill": "Delivery management DEMG", "Levels": [3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
62	BUSA	19	17	1	SFIA	v1	{"Skill": "Business situation analysis BUSA", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
63	FEAS	19	17	1	SFIA	v1	{"Skill": "Feasibility assessment FEAS", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
64	REQM	19	17	1	SFIA	v1	{"Skill": "Requirements definition and management REQM", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
65	BSMO	19	17	1	SFIA	v1	{"Skill": "Business modelling BSMO", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
66	BPTS	19	17	1	SFIA	v1	{"Skill": "User acceptance testing BPTS", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
67	BPRE	19	17	1	SFIA	v1	{"Skill": "Business process improvement BPRE", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change planning"}
68	OCDV	19	17	1	SFIA	v1	{"Skill": "Organisational capability development OCDV", "Levels": [5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change planning"}
69	ORDI	19	17	1	SFIA	v1	{"Skill": "Organisation design and implementation ORDI", "Levels": [3, 4, 5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change planning"}
70	CIPM	19	17	1	SFIA	v1	{"Skill": "Organisational change management CIPM", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change planning"}
71	JADN	19	17	1	SFIA	v1	{"Skill": "Job analysis and design JADN", "Levels": [3, 4, 5], "Category": "Change and transformation", "Subcatagory": "Change planning"}
72	OCEN	19	17	1	SFIA	v1	{"Skill": "Organisational change enablement OCEN", "Levels": [4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change planning"}
228	KSB K56	21	18	1	KSB	v1	{"K56": "Sources of data such as files, operational systems, databases, web services, open data, government data, news and social media."}
73	PROD	19	17	1	SFIA	v1	{"Skill": "Product management PROD", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
74	DLMG	19	17	1	SFIA	v1	{"Skill": "Systems development management DLMG", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Systems development"}
75	SLEN	19	17	1	SFIA	v1	{"Skill": "Systems and software lifecycle engineering SLEN", "Levels": [3, 4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Systems development"}
76	DESN	19	17	1	SFIA	v1	{"Skill": "Systems design DESN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
77	SWDN	19	17	1	SFIA	v1	{"Skill": "Software design SWDN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
78	NTDS	19	17	1	SFIA	v1	{"Skill": "Network design NTDS", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
79	IFDN	19	17	1	SFIA	v1	{"Skill": "Infrastructure design IFDN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
80	HWDE	19	17	1	SFIA	v1	{"Skill": "Hardware design HWDE", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
81	PROG	19	17	1	SFIA	v1	{"Skill": "Programming/software development PROG", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
82	SINT	19	17	1	SFIA	v1	{"Skill": "Systems integration and build SINT", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
83	TEST	19	17	1	SFIA	v1	{"Skill": "Functional testing TEST", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
84	NFTS	19	17	1	SFIA	v1	{"Skill": "Non-functional testing NFTS", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
85	PRTS	19	17	1	SFIA	v1	{"Skill": "Process testing PRTS", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
86	PORT	19	17	1	SFIA	v1	{"Skill": "Software configuration PORT", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
87	RESD	19	17	1	SFIA	v1	{"Skill": "Real-time/embedded systems development RESD", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
88	SFEN	19	17	1	SFIA	v1	{"Skill": "Safety engineering SFEN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
89	SFAS	19	17	1	SFIA	v1	{"Skill": "Safety assessment SFAS", "Levels": [4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
90	RFEN	19	17	1	SFIA	v1	{"Skill": "Radio frequency engineering RFEN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
91	ADEV	19	17	1	SFIA	v1	{"Skill": "Animation development ADEV", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
92	DATM	19	17	1	SFIA	v1	{"Skill": "Data management DATM", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
93	DTAN	19	17	1	SFIA	v1	{"Skill": "Data modelling and design DTAN", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
94	DBDS	19	17	1	SFIA	v1	{"Skill": "Database design DBDS", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
95	DAAN	19	17	1	SFIA	v1	{"Skill": "Data analytics DAAN", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
96	DATS	19	17	1	SFIA	v1	{"Skill": "Data science DATS", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
97	MLNG	19	17	1	SFIA	v1	{"Skill": "Machine learning MLNG", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
98	BINT	19	17	1	SFIA	v1	{"Skill": "Business intelligence BINT", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
99	DENG	19	17	1	SFIA	v1	{"Skill": "Data engineering DENG", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
100	VISL	19	17	1	SFIA	v1	{"Skill": "Data visualisation VISL", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
101	URCH	19	17	1	SFIA	v1	{"Skill": "User research URCH", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
102	CEXP	19	17	1	SFIA	v1	{"Skill": "Customer experience CEXP", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
103	ACIN	19	17	1	SFIA	v1	{"Skill": "Accessibility and inclusion ACIN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
104	UNAN	19	17	1	SFIA	v1	{"Skill": "User experience analysis UNAN", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "User centred design"}
105	HCEV	19	17	1	SFIA	v1	{"Skill": "User experience design HCEV", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
106	USEV	19	17	1	SFIA	v1	{"Skill": "User experience evaluation USEV", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
107	INCA	19	17	1	SFIA	v1	{"Skill": "Content design and authoring INCA", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Content management"}
108	ICPM	19	17	1	SFIA	v1	{"Skill": "Content publishing ICPM", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Content management"}
109	KNOW	19	17	1	SFIA	v1	{"Skill": "Knowledge management KNOW", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Content management"}
110	GRDN	19	17	1	SFIA	v1	{"Skill": "Graphic design GRDN", "Levels": [1, 2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Content management"}
111	SCMO	19	17	1	SFIA	v1	{"Skill": "Scientific modelling SCMO", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Computational science"}
112	NUAN	19	17	1	SFIA	v1	{"Skill": "Numerical analysis NUAN", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Computational science"}
113	HPCC	19	17	1	SFIA	v1	{"Skill": "High-performance computing HPCC", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Computational science"}
114	ITMG	19	17	1	SFIA	v1	{"Skill": "Technology service management ITMG", "Levels": [5, 6, 7], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
115	ASUP	19	17	1	SFIA	v1	{"Skill": "Application support ASUP", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
116	ITOP	19	17	1	SFIA	v1	{"Skill": "Infrastructure operations ITOP", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
117	SYSP	19	17	1	SFIA	v1	{"Skill": "System software administration SYSP", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
118	NTAS	19	17	1	SFIA	v1	{"Skill": "Network support NTAS", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
119	HSIN	19	17	1	SFIA	v1	{"Skill": "Systems installation and removal HSIN", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
120	CFMG	19	17	1	SFIA	v1	{"Skill": "Configuration management CFMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
121	RELM	19	17	1	SFIA	v1	{"Skill": "Release management RELM", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
122	DEPL	19	17	1	SFIA	v1	{"Skill": "Deployment DEPL", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
123	STMG	19	17	1	SFIA	v1	{"Skill": "Storage management STMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
124	DCMA	19	17	1	SFIA	v1	{"Skill": "Facilities management DCMA", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
125	SLMO	19	17	1	SFIA	v1	{"Skill": "Service level management SLMO", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Delivery and operation", "Subcatagory": "Service management"}
126	SCMG	19	17	1	SFIA	v1	{"Skill": "Service catalogue management SCMG", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Service management"}
127	AVMT	19	17	1	SFIA	v1	{"Skill": "Availability management AVMT", "Levels": [3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
128	COPL	19	17	1	SFIA	v1	{"Skill": "Continuity management COPL", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
129	CPMG	19	17	1	SFIA	v1	{"Skill": "Capacity management CPMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
130	USUP	19	17	1	SFIA	v1	{"Skill": "Incident management USUP", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
131	PBMG	19	17	1	SFIA	v1	{"Skill": "Problem management PBMG", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Service management"}
132	CHMG	19	17	1	SFIA	v1	{"Skill": "Change control CHMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
133	ASMG	19	17	1	SFIA	v1	{"Skill": "Asset management ASMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
134	SEAC	19	17	1	SFIA	v1	{"Skill": "Service acceptance SEAC", "Levels": [3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
135	IAMT	19	17	1	SFIA	v1	{"Skill": "Identity and access management IAMT", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
136	SCAD	19	17	1	SFIA	v1	{"Skill": "Security operations SCAD", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
137	VUAS	19	17	1	SFIA	v1	{"Skill": "Vulnerability assessment VUAS", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Security services"}
138	DGFS	19	17	1	SFIA	v1	{"Skill": "Digital forensics DGFS", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
139	CRIM	19	17	1	SFIA	v1	{"Skill": "Cybercrime investigation CRIM", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
140	OCOP	19	17	1	SFIA	v1	{"Skill": "Offensive cyber operations OCOP", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
141	PENT	19	17	1	SFIA	v1	{"Skill": "Penetration testing PENT", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
142	RMGT	19	17	1	SFIA	v1	{"Skill": "Records management RMGT", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Data and records operations"}
143	ANCC	19	17	1	SFIA	v1	{"Skill": "Analytical classification and coding ANCC", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Data and records operations"}
144	DBAD	19	17	1	SFIA	v1	{"Skill": "Database administration DBAD", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Data and records operations"}
145	PEMT	19	17	1	SFIA	v1	{"Skill": "Performance management PEMT", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
146	EEXP	19	17	1	SFIA	v1	{"Skill": "Employee experience EEXP", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
147	OFCL	19	17	1	SFIA	v1	{"Skill": "Organisational facilitation OFCL", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
148	PDSV	19	17	1	SFIA	v1	{"Skill": "Professional development PDSV", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
149	WFPL	19	17	1	SFIA	v1	{"Skill": "Workforce planning WFPL", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
150	RESC	19	17	1	SFIA	v1	{"Skill": "Resourcing RESC", "Levels": [2, 3, 4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
151	ETMG	19	17	1	SFIA	v1	{"Skill": "Learning and development management ETMG", "Levels": [2, 3, 4, 5, 6, 7], "Category": "People and skills", "Subcatagory": "Skills management"}
152	TMCR	19	17	1	SFIA	v1	{"Skill": "Learning design and development TMCR", "Levels": [2, 3, 4, 5], "Category": "People and skills", "Subcatagory": "Skills management"}
153	ETDL	19	17	1	SFIA	v1	{"Skill": "Learning delivery ETDL", "Levels": [2, 3, 4, 5], "Category": "People and skills", "Subcatagory": "Skills management"}
154	LEDA	19	17	1	SFIA	v1	{"Skill": "Competency assessment LEDA", "Levels": [2, 3, 4, 5, 6], "Category": "People and skills", "Subcatagory": "Skills management"}
155	CSOP	19	17	1	SFIA	v1	{"Skill": "Certification scheme operation CSOP", "Levels": [2, 3, 4, 5, 6], "Category": "People and skills", "Subcatagory": "Skills management"}
156	TEAC	19	17	1	SFIA	v1	{"Skill": "Teaching TEAC", "Levels": [2, 3, 4, 5, 6, 7], "Category": "People and skills", "Subcatagory": "Skills management"}
157	SUBF	19	17	1	SFIA	v1	{"Skill": "Subject formation SUBF", "Levels": [4, 5, 6, 7], "Category": "People and skills", "Subcatagory": "Skills management"}
158	SORC	19	17	1	SFIA	v1	{"Skill": "Sourcing SORC", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
159	SUPP	19	17	1	SFIA	v1	{"Skill": "Supplier management SUPP", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
160	ITCM	19	17	1	SFIA	v1	{"Skill": "Contract management ITCM", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
161	RLMT	19	17	1	SFIA	v1	{"Skill": "Stakeholder relationship management RLMT", "Levels": [4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
162	CSMG	19	17	1	SFIA	v1	{"Skill": "Customer service support CSMG", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
163	ADMN	19	17	1	SFIA	v1	{"Skill": "Business administration ADMN", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
164	BIDM	19	17	1	SFIA	v1	{"Skill": "Bid/proposal management BIDM", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Sales and bid management"}
165	SALE	19	17	1	SFIA	v1	{"Skill": "Selling SALE", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Sales and bid management"}
166	SSUP	19	17	1	SFIA	v1	{"Skill": "Sales support SSUP", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Sales and bid management"}
167	MKTG	19	17	1	SFIA	v1	{"Skill": "Marketing management MKTG", "Levels": [4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
168	MRCH	19	17	1	SFIA	v1	{"Skill": "Market research MRCH", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
169	BRMG	19	17	1	SFIA	v1	{"Skill": "Brand management BRMG", "Levels": [4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
170	CELO	19	17	1	SFIA	v1	{"Skill": "Customer engagement and loyalty CELO", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
171	MKCM	19	17	1	SFIA	v1	{"Skill": "Marketing campaign management MKCM", "Levels": [3, 4, 5], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
172	DIGM	19	17	1	SFIA	v1	{"Skill": "Digital marketing DIGM", "Levels": [2, 3, 4, 5], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
26	SFIA 00000001	19	15	1	00000001	v1	{"Results": [7, 7, 7, 7, 6, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}
173	KSB K1	21	18	1	KSB	v1	{"K1": "How organisations adapt and exploit digital technology solutions to gain a competitive advantage."}
174	KSB K2	21	18	1	KSB	v1	{"K2": "The principles of strategic decision making concerning the acquisition or development of digital and technology solutions. For example business architecture approaches such as capability models and target operating models."}
175	KSB K3	21	18	1	KSB	v1	{"K3": "Principles of estimating the risks and opportunities of digital and technology solutions."}
176	KSB K4	21	18	1	KSB	v1	{"K4": "Techniques and approaches involved in creating a business case for new digital and technology solutions. For example journey, product and capability mapping and value chains."}
177	KSB K5	21	18	1	KSB	v1	{"K5": "A range of digital technology solution development techniques and tools."}
178	KSB K6	21	18	1	KSB	v1	{"K6": "The approaches and techniques used throughout the digital and technology solution lifecycle and their applicability to an organisation’s standards and pre-existing tools."}
179	KSB K7	21	18	1	KSB	v1	{"K7": "The roles, functions and activities within digital technology solutions within an organisation."}
180	KSB K8	21	18	1	KSB	v1	{"K8": "How teams work effectively to produce digital and technology solutions."}
181	KSB K9	21	18	1	KSB	v1	{"K9": "The concepts and principles of leadership."}
295	KSB S55	21	18	1	KSB	v1	{"S55": "Analyse in detail large data sets, using a range of industry standard tools and data analysis methods."}
182	KSB K10	21	18	1	KSB	v1	{"K10": "Management techniques and theories. For example, effective decision making, delegation and planning methods, time management and change management."}
183	KSB K11	21	18	1	KSB	v1	{"K11": "The nature and scope of common vulnerabilities in digital and technology solutions. For example, the risks of unsecure coding and unprotected networks. Back to Duty"}
184	KSB K12	21	18	1	KSB	v1	{"K12": "The role of data management systems within Digital and Technology Solutions."}
185	KSB K13	21	18	1	KSB	v1	{"K13": "Principles of data analysis for digital and technology solutions."}
186	KSB K14	21	18	1	KSB	v1	{"K14": "A range of quantitative and qualitative data gathering methods and how to appraise and select the appropriate method."}
187	KSB K15	21	18	1	KSB	v1	{"K15": "Principles of estimating cost, and time resource constraints within digital and technology solutions activities."}
188	KSB K16	21	18	1	KSB	v1	{"K16": "Fundamental computer networking concepts in relation to digital and technology solutions. For example, structure, cloud architecture, components, quality of service."}
189	KSB K17	21	18	1	KSB	v1	{"K17": "Reporting techniques, including how to synthesise information and present concisely, as appropriate to the target audience."}
190	KSB K18	21	18	1	KSB	v1	{"K18": "Techniques of robust research and evaluation for the justification of digital and technology solutions."}
191	KSB K19	21	18	1	KSB	v1	{"K19": "Relevant legal, ethical, social and professional standards to a digital and technology solution. For example, Diversity, Accessibility, Intellectual Property, Data Protection Acts, Codes of Practice, Regulatory and Compliance frameworks."}
192	KSB K20	21	18	1	KSB	v1	{"K20": "Sustainable development approaches as applied to digital and technology solutions such as green computing."}
193	KSB K21	21	18	1	KSB	v1	{"K21": "How to operate at all stages of the software development life cycle and how each stage is applied in a range of contexts. For example, requirements analysis, design, development, testing, implementation."}
194	KSB K22	21	18	1	KSB	v1	{"K22": "Principles of a range of development techniques, for each stage of the software development cycle that produce artefacts and the contexts in which they can be applied. For example UML, unit testing, programming, debugging, frameworks, architectures."}
195	KSB K23	21	18	1	KSB	v1	{"K23": "Principles of a range of development methods and approaches and the contexts in which they can be applied. For example Scrum, Extreme Programming, Waterfall, Prince2, TDD."}
196	KSB K24	21	18	1	KSB	v1	{"K24": "How to interpret and implement a design, compliant with functional, non-functional and security requirements including principles and approaches to addressing legacy software development issues from a technical and socio-technical perspective. For example architectures, languages, operating systems, hardware, business change."}
197	KSB K25	21	18	1	KSB	v1	{"K25": "The factors affecting product quality and approaches for how to control them throughout the development process. For example security, code quality, coding standards."}
198	KSB K26	21	18	1	KSB	v1	{"K26": "How to select and apply a range of software tools used in Software Engineering."}
199	KSB K27	21	18	1	KSB	v1	{"K27": "Approaches to the interpretation and use of artefacts. For example UML, unit tests, architecture."}
200	KSB K28	21	18	1	KSB	v1	{"K28": "Approaches to effective team work and the range of software development tools supporting effective teamwork. For example, configuration management, version control and release management."}
201	KSB K29	21	18	1	KSB	v1	{"K29": "Principles of different consulting methodologies. For example issue-based, and hypothesis based."}
202	KSB K30	21	18	1	KSB	v1	{"K30": "How consulting interfaces with project management, business analysis and business management."}
203	KSB K31	21	18	1	KSB	v1	{"K31": "Principles of change management within organisations."}
204	KSB K32	21	18	1	KSB	v1	{"K32": "The barriers to solving digital and technology problems or maximising opportunities."}
205	KSB K33	21	18	1	KSB	v1	{"K33": "Approaches to presenting recommendations to stakeholders and influencing action."}
206	KSB K34	21	18	1	KSB	v1	{"K34": "Approaches to analytical and critical thinking to define business problems objectively and create value for the client."}
207	KSB K35	21	18	1	KSB	v1	{"K35": "Questioning strategies and active listening to ensure all requirements are gathered."}
208	KSB K36	21	18	1	KSB	v1	{"K36": "The ethical and legal requirements in client and provider relationships."}
209	KSB K37	21	18	1	KSB	v1	{"K37": "Elicitation and Collaboration approaches, including how to prepare for and conduct elicitation activities and confirm the results."}
210	KSB K38	21	18	1	KSB	v1	{"K38": "Approaches to Requirements Life Cycle Management including how to manage and maintain requirements and design information from inception to retirement of a product."}
211	KSB K39	21	18	1	KSB	v1	{"K39": "Principles of Strategy Analysis, including how to identify the business need, address that need, and align the change strategy within the organisation."}
212	KSB K40	21	18	1	KSB	v1	{"K40": "Solution Evaluation, including how to assess the performance of and value delivered by a solution and to recommend improvements on increasing values."}
213	KSB K41	21	18	1	KSB	v1	{"K41": "Legislation and industry standards relevant to Business Analysis in the organisation and sector."}
214	KSB K42	21	18	1	KSB	v1	{"K42": "The purpose and value of quality assurance techniques."}
215	KSB K43	21	18	1	KSB	v1	{"K43": "A range of Business Analysis investigative techniques."}
216	KSB K44	21	18	1	KSB	v1	{"K44": "Approaches to change control and requirements management."}
217	KSB K45	21	18	1	KSB	v1	{"K45": "Principles of cyber security tools and techniques."}
218	KSB K46	21	18	1	KSB	v1	{"K46": "Principles of quantitative and qualitative risk management theory including the role of risk stakeholders."}
229	KSB K57	21	18	1	KSB	v1	{"K57": "Approaches to data processing and storage, database systems, data warehousing and online analytical processing, data-driven decision making and the good use of evidence and analytics in making choices and decisions."}
230	KSB K58	21	18	1	KSB	v1	{"K58": "How Data Analytics operates within the context of data governance, data security, and communications."}
231	KSB K59	21	18	1	KSB	v1	{"K59": "How Data Analytics can be applied to improve an organisation’s processes, operations and outputs."}
232	KSB K60	21	18	1	KSB	v1	{"K60": "How data and analysis may exhibit biases and prejudice. How ethics and compliance affect Data Analytics work, and the impact of international regulations. For example, General Data Protection Regulation, Data Protection Act 2018."}
233	KSB K61	21	18	1	KSB	v1	{"K61": "The role and function of virtual or physical network components and functions and typical topologies and service architectures."}
234	KSB K62	21	18	1	KSB	v1	{"K62": "The main network protocols in use, their purpose, features and relationship to each other. For example, Ethernet, IP (Internet Protocol), TCP (Transmission Control Protocol), OSPF (Open Shortest Path First)."}
235	KSB K63	21	18	1	KSB	v1	{"K63": "The benefits and risks of cloud computing and the common integration deployments (private, public, hybrid). Including the benefits and risks of virtualisation as a concept; key features of virtualisation and current cloud platforms available."}
236	KSB K64	21	18	1	KSB	v1	{"K64": "The main factors that affect network performance, and how to mitigate these on network performance by implementing changes to QoS. For example, Traffic Shaping, Policing, Queuing, Topology (physical and logical), and Network Policy (Traffic Analysis, DPI (Deep Packet Inspection)."}
237	KSB K65	21	18	1	KSB	v1	{"K65": "Principles of failure modes in protocols. For example, why a protocol may ‘hang’ and the effect of data communication errors and approaches to addressing failures to optimise network performance."}
238	KSB K66	21	18	1	KSB	v1	{"K66": "Key security concepts. For example threats, vulnerabilities, exploits, detection and mitigation techniques, and security program elements such as user awareness, physical access control, multi-layer defence models."}
239	KSB K67	21	18	1	KSB	v1	{"K67": "SDN (Software Defined Networking) and Network Function Virtualisation Core Principles. For example, Control Plane Separation, flexibility, overlay networks, disassociation of software and hardware layers."}
240	KSB K68	21	18	1	KSB	v1	{"K68": "Key elements of mobile networks. For example RAN (Radio Access Network), EPC (Evolved Packet Core), IMS (IP Multimedia Subsystem) including some specific key functions such as S/P/U-Gateways and the concepts in communicating over free-space media such as interference, ground bounce, encryption and in mobile endpoint platforms such as tracking user location and roaming."}
241	KSB S1	21	18	1	KSB	v1	{"S1": "Analyse a business problem to identify the role of digital and technology solutions."}
242	KSB S2	21	18	1	KSB	v1	{"S2": "Identify risks, determine mitigation strategies and opportunities for improvement in a digital and technology solutions project."}
243	KSB S3	21	18	1	KSB	v1	{"S3": "Analyse a business problem in order to specify an appropriate digital and technology solution."}
244	KSB S4	21	18	1	KSB	v1	{"S4": "Initiate, design, code, test and debug a software component for a digital and technology solution."}
245	KSB S5	21	18	1	KSB	v1	{"S5": "Apply relevant standard processes, methods, techniques and tools. For example, ISO Standards, Waterfall, Agile in a digital and technology solution project."}
246	KSB S6	21	18	1	KSB	v1	{"S6": "Manage digital and technology solutions projects. For example, identifying and resolving deviations from specification, applying appropriate Project Management methodologies."}
247	KSB S7	21	18	1	KSB	v1	{"S7": "Work effectively within teams, leading on appropriate digital technology solution activities."}
248	KSB S8	21	18	1	KSB	v1	{"S8": "Apply relevant organisational theories. For example, change management principles, marketing approaches, strategic practice, and IT service management to a digital and technology solutions project."}
249	KSB S9	21	18	1	KSB	v1	{"S9": "Apply relevant security and resilience techniques to a digital and technology solution. For example, risk assessments, mitigation strategies."}
250	KSB S10	21	18	1	KSB	v1	{"S10": "Initiate, design, implement and debug a data product for a digital and technology solution."}
251	KSB S11	21	18	1	KSB	v1	{"S11": "Determine and use appropriate data analysis techniques. For example, Text, Statistical, Diagnostic or Predictive Analysis to assess a digital and technology solutions."}
252	KSB S12	21	18	1	KSB	v1	{"S12": "Plan, design and manage simple computer networks with an overall focus on the services and capabilities that network infrastructure solutions enable in an organisational context."}
253	KSB S13	21	18	1	KSB	v1	{"S13": "Report effectively to colleagues and stakeholders using the appropriate language and style, to meet the needs of the audience concerned."}
254	KSB S14	21	18	1	KSB	v1	{"S14": "Research, investigate, and evaluate innovative technologies or approaches in the development of a digital and technology solution."}
255	KSB S15	21	18	1	KSB	v1	{"S15": "Apply relevant legal, ethical, social and professional standards to a digital and technology solution."}
256	KSB S16	21	18	1	KSB	v1	{"S16": "Identify and define software engineering problems that are non-routine and incompletely specified."}
257	KSB S17	21	18	1	KSB	v1	{"S17": "Provide recommendations as to the most appropriate software engineering solution."}
258	KSB S18	21	18	1	KSB	v1	{"S18": "Use appropriate analysis methods, approaches and techniques in software engineering projects to deliver an outcome that meets requirements."}
259	KSB S19	21	18	1	KSB	v1	{"S19": "Implement software engineering projects using appropriate software engineering methods, approaches and techniques."}
296	KSB S56	21	18	1	KSB	v1	{"S56": "Identify and collate stakeholder needs in relation to computer network requirements, plans and designs."}
260	KSB S20	21	18	1	KSB	v1	{"S20": "Respond to changing priorities and problems arising within software engineering projects by making revised recommendations, and adapting plans as necessary, to fit the scenario being investigated."}
261	KSB S21	21	18	1	KSB	v1	{"S21": "Determine, refine, adapt and use appropriate software engineering methods, approaches and techniques to evaluate software engineering project outcomes."}
262	KSB S22	21	18	1	KSB	v1	{"S22": "Evaluate learning points arising from software engineering work undertaken on a project including use of methods, analysis undertaken, selection of approach and the outcome achieved, in order to identify both lessons learnt and recommendations for improvements to future projects."}
263	KSB S23	21	18	1	KSB	v1	{"S23": "Extend and update software development knowledge with evidence from professional and academic sources by undertaking appropriate research to inform best practice and lead improvements in the organisation."}
264	KSB S24	21	18	1	KSB	v1	{"S24": "Analyse client needs and determine how to advise them strategically through improved business processes, new ideas, or technology solutions."}
265	KSB S25	21	18	1	KSB	v1	{"S25": "Effectively communicate value add to the client through a variety of media. For example, presentations, written reports, Storytelling in a professional setting through performing socio-technical process improvements in a range of environments."}
266	KSB S26	21	18	1	KSB	v1	{"S26": "Make evidence based recommendations taking into account risks, costs, and benefits."}
267	KSB S27	21	18	1	KSB	v1	{"S27": "Participate in walk-throughs for Information Technologies, to identify, document and evaluate key risks within a client’s organisation."}
268	KSB S28	21	18	1	KSB	v1	{"S28": "Perform stakeholder analysis to identify, determine and deepen understanding of system requirements and develop client relationships."}
269	KSB S29	21	18	1	KSB	v1	{"S29": "Effect change within an organisation through evaluation of a new system, process or initiative."}
270	KSB S30	21	18	1	KSB	v1	{"S30": "Ensure legal and ethical requirements are accommodated in the development of digital and technology solutions."}
271	KSB S31	21	18	1	KSB	v1	{"S31": "Evaluate the success of new systems, processes, or initiatives."}
272	KSB S32	21	18	1	KSB	v1	{"S32": "Use requirements elicitation, analysis and documentation to produce an acceptable solution for business problems or further opportunities."}
273	KSB S33	21	18	1	KSB	v1	{"S33": "Conduct Process Analysis, Definition, Mapping and Modelling within a business situation without supervision."}
274	KSB S34	21	18	1	KSB	v1	{"S34": "Produce Use Cases which are of value to all stakeholders of a system."}
275	KSB S35	21	18	1	KSB	v1	{"S35": "Use tools and benchmarking to support modelling and requirements gathering and recommend approaches to team members as required."}
276	KSB S36	21	18	1	KSB	v1	{"S36": "Produce a business case to scope a proposed project including business benefits and recommendations."}
277	KSB S37	21	18	1	KSB	v1	{"S37": "Use products of analysis in the design and development of a system."}
278	KSB S38	21	18	1	KSB	v1	{"S38": "Evaluate the impacts of model selection and how they inter-relate with each other when generating business analytics."}
279	KSB S39	21	18	1	KSB	v1	{"S39": "Recommend and use appropriate software tools to implement Business Analysis tasks and outcomes."}
280	KSB S40	21	18	1	KSB	v1	{"S40": "Discover, identify and analyse security threats, attack techniques and vulnerabilities and recommend mitigation and security controls."}
281	KSB S41	21	18	1	KSB	v1	{"S41": "Undertake security risk assessments for complex systems without direct supervision and propose a remediation strategy relevant to the context of the organisation."}
282	KSB S42	21	18	1	KSB	v1	{"S42": "Recommend improvements to the cyber security approaches of an organisation based on research into future potential cyber threats and considering threat trends."}
283	KSB S43	21	18	1	KSB	v1	{"S43": "Manage cyber security risk."}
284	KSB S44	21	18	1	KSB	v1	{"S44": "Use appropriate cyber security technology, tools and techniques in relation to the risks identified."}
285	KSB S45	21	18	1	KSB	v1	{"S45": "Lead cyber security awareness campaigns and evaluate their effectiveness."}
286	KSB S46	21	18	1	KSB	v1	{"S46": "Analyse cyber security requirements against other design requirements for systems or products, identify conflicting requirements and recommend appropriate solutions with clear explanation of costs and benefits."}
287	KSB S47	21	18	1	KSB	v1	{"S47": "Lead the design and build of systems in accordance with a security case to address organisational challenges."}
288	KSB S48	21	18	1	KSB	v1	{"S48": "Define Data Requirements and perform Data Collection, Data Processing and Data Cleansing."}
289	KSB S49	21	18	1	KSB	v1	{"S49": "Apply different types of Data Analysis, as appropriate, to drive improvements for specific business problems."}
290	KSB S50	21	18	1	KSB	v1	{"S50": "Find, present, communicate and disseminate data analysis outputs effectively and with high impact through creative storytelling, tailoring the message for the audience. Visualise data to tell compelling and actionable narratives by using the best medium for each audience, such as charts, graphs and dashboards."}
291	KSB S51	21	18	1	KSB	v1	{"S51": "Identify barriers to effective analysis encountered both by analysts and their stakeholders within data analysis projects."}
292	KSB S52	21	18	1	KSB	v1	{"S52": "Apply a range of techniques for analysing quantitative data such as data mining, time series forecasting, algorithms, statistics and modelling techniques to identify and predict trends and patterns in data."}
293	KSB S53	21	18	1	KSB	v1	{"S53": "Apply exploratory or confirmatory approaches to analysing data. Validate and and test stability of the results."}
294	KSB S54	21	18	1	KSB	v1	{"S54": "Extract data from a range of sources. For example, databases, web services, open data."}
297	KSB S57	21	18	1	KSB	v1	{"S57": "Plan, design, document, and develop the relevant elements of a computer network within an organisation or between organisations, taking into account customer requirements (performance, scale), constraints (budget, equipment availability), and define policies for their use."}
298	KSB S58	21	18	1	KSB	v1	{"S58": "Monitor performance and ensure networks are configured correctly and perform as expected by designers or architects. Undertake capacity management and audit of IP addressing and hosted devices."}
299	KSB S59	21	18	1	KSB	v1	{"S59": "Investigate, troubleshoot and resolve data network faults in local and wide area environments, using information from multiple sources, Physically or Remotely by console connection. Recommend and implement short term fixes to restore service and, or, quality of experience and recommend longer term changes to prevent recurrence or reduce impact of future occurrences."}
300	KSB S60	21	18	1	KSB	v1	{"S60": "Implement computer networks from a design including testing and validation. This includes populating variables in configurations, for example, IP addresses and subsequent application of configuration to equipment such as routers, switches, firewalls."}
301	KSB S61	21	18	1	KSB	v1	{"S61": "Secure network systems by establishing and enforcing policies, and defining and monitoring access. Support and administer firewall environments in line with IT security policy."}
302	KSB S62	21	18	1	KSB	v1	{"S62": "Research and evaluate emerging network technologies and assess relevance to current network requirements. Provide an objective opinion on how new features and technologies may be incorporated as required by the organisation."}
303	KSB S63	21	18	1	KSB	v1	{"S63": "Investigate security concerns or attacks. For example, Distributed Denial of Service (DDOS), port scanning, assessing key metrics and indicators, evidencing the chosen steps to mitigate."}
304	KSB B1	21	18	1	KSB	v1	{"B1": "Has a strong work ethic and commitment in order to meet the standards required."}
305	KSB B2	21	18	1	KSB	v1	{"B2": "Reliable, objective and capable of both independent and team working."}
306	KSB B3	21	18	1	KSB	v1	{"B3": "Acts with integrity with respect to ethical, legal and regulatory requirements ensuring the protection of personal data, safety and security."}
307	KSB B4	21	18	1	KSB	v1	{"B4": "Commits to continuous professional development; maintaining their knowledge and skills in relation to developments in digital and technology solutions that influence their work."}
308	KSB B5	21	18	1	KSB	v1	{"B5": "Interacts professionally with people from technical and non-technical backgrounds. Presents data and conclusions in an evidently truthful, concise and appropriate manner."}
309	KSB B6	21	18	1	KSB	v1	{"B6": "Participates in and shares best practice in their organisation, and the wider community for aspects relevant to digital and technology solutions."}
310	KSB B7	21	18	1	KSB	v1	{"B7": "Maintains awareness of trends and innovations in the subject area, utilising a range of academic literature, online sources, community interaction, conference attendance and other methods which can deliver business value."}
311	KSB B8	21	18	1	KSB	v1	{"B8": "Champions diversity and inclusion in their work ensuring that digital technology solutions are accessible."}
\.


--
-- Data for Name: nodetype; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.nodetype (nodetypeid, name, fields, settings) FROM stdin;
1	Test Results	{}	{}
2	Test Procedures	{}	{}
4	Test Cases	{}	{}
5	Source Code	{}	{}
7	System Requirments Allocated to Software	{}	{}
8	Software High Level Requirments	{}	{}
9	Software Low Level Requirments	{}	{}
10	Software Architecture	{}	{}
11	Executable Object Code	{}	{}
12	Jira Ticket	{}	{}
13	API Test Nodetype 1	{"1": "Test"}	{"1": "Test"}
14	SFIA Framework	{}	{}
15	SFIA Agent	{}	{}
17	SFIA Skill	{}	{}
18	KSB	{}	{}
\.


--
-- Name: edges_edgeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.edges_edgeid_seq', 159, true);


--
-- Name: edgetype_edgetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.edgetype_edgetypeid_seq', 12, true);


--
-- Name: graph_graphid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.graph_graphid_seq', 21, true);


--
-- Name: graphtype_graphtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.graphtype_graphtypeid_seq', 3, true);


--
-- Name: nodes_nodeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.nodes_nodeid_seq', 311, true);


--
-- Name: nodetype_nodetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.nodetype_nodetypeid_seq', 18, true);


--
-- Name: edge edges_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_pkey PRIMARY KEY (edgeid);


--
-- Name: edgetype edgetype_name_unique; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edgetype
    ADD CONSTRAINT edgetype_name_unique UNIQUE (name);


--
-- Name: edgetype edgetype_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edgetype
    ADD CONSTRAINT edgetype_pkey PRIMARY KEY (edgetypeid);


--
-- Name: graph graph_pkey1; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graph
    ADD CONSTRAINT graph_pkey1 PRIMARY KEY (graphid);


--
-- Name: graphtype graphtype_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graphtype
    ADD CONSTRAINT graphtype_pkey PRIMARY KEY (graphtypeid);


--
-- Name: node nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (nodeid);


--
-- Name: nodetype nodetype_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.nodetype
    ADD CONSTRAINT nodetype_pkey PRIMARY KEY (nodetypeid);


--
-- Name: graph unique_graph_name; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graph
    ADD CONSTRAINT unique_graph_name UNIQUE (name);


--
-- Name: nodetype unique_nodetype_name; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.nodetype
    ADD CONSTRAINT unique_nodetype_name UNIQUE (name);


--
-- Name: graphtype uniquename; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graphtype
    ADD CONSTRAINT uniquename UNIQUE (name);


--
-- Name: edge edges_edgetypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_edgetypeid_foreign FOREIGN KEY (edgetypeid) REFERENCES public.edgetype(edgetypeid);


--
-- Name: edge edges_head_nodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_head_nodeid_foreign FOREIGN KEY (headnodeid) REFERENCES public.node(nodeid);


--
-- Name: edge edges_tail_nodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_tail_nodeid_foreign FOREIGN KEY (tailnodeid) REFERENCES public.node(nodeid);


--
-- Name: node nodes_graphid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT nodes_graphid_foreign FOREIGN KEY (graphid) REFERENCES public.graph(graphid);


--
-- Name: node nodes_nodetype_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT nodes_nodetype_foreign FOREIGN KEY (nodetypeid) REFERENCES public.nodetype(nodetypeid);


--
-- PostgreSQL database dump complete
--

