--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.games (game_id, user_id, guesses) FROM stdin;
1	3	138
2	3	695
3	4	781
4	4	303
5	3	572
6	3	351
7	3	210
8	5	52
9	5	208
10	6	106
11	6	926
12	5	150
13	5	662
14	5	733
15	7	500
16	7	827
17	8	77
18	8	663
19	7	27
20	7	81
21	7	508
22	9	638
23	9	949
24	10	766
25	10	761
26	9	402
27	9	97
28	9	36
29	11	304
30	11	86
31	12	358
32	12	276
33	11	665
34	11	904
35	11	123
36	13	296
37	13	768
38	14	434
39	14	459
40	13	69
41	13	149
42	13	56
43	15	159
44	15	136
45	16	300
46	16	86
47	15	397
48	15	419
49	15	981
50	17	964
51	17	465
52	18	518
53	18	793
54	17	854
55	17	875
56	17	277
57	19	642
58	19	100
59	20	403
60	20	443
61	19	438
62	19	414
63	19	624
64	21	146
65	21	684
66	22	743
67	22	42
68	21	226
69	21	872
70	21	724
71	23	303
72	23	837
73	24	285
74	24	257
75	23	37
76	23	910
77	23	678
78	25	175
79	25	804
80	26	482
81	26	976
82	25	324
83	25	110
84	25	5
85	27	561
86	27	79
87	28	259
88	28	644
89	27	838
90	27	576
91	27	395
92	29	818
93	29	861
94	30	945
95	30	804
96	29	88
97	29	803
98	29	871
99	31	40
100	31	714
101	32	247
102	32	581
103	31	889
104	31	116
105	31	450
106	33	660
107	33	41
108	34	282
109	34	226
110	33	932
111	33	111
112	33	61
113	35	9
114	35	804
115	36	70
116	36	396
117	35	356
118	35	926
119	35	56
120	37	911
121	37	701
122	38	321
123	38	324
124	37	180
125	37	575
126	37	644
127	39	692
128	39	980
129	40	515
130	40	813
131	39	194
132	39	300
133	39	22
134	42	442
135	42	393
136	43	956
137	43	844
138	42	239
139	42	357
140	42	561
141	44	849
142	44	377
143	45	352
144	45	134
145	44	379
146	44	80
147	44	559
148	46	945
149	46	2
150	47	36
151	47	45
152	46	434
153	46	297
154	46	497
155	48	15
156	48	638
157	49	3
158	49	325
159	48	503
160	48	455
161	48	668
162	50	294
163	50	581
164	51	595
165	51	589
166	50	943
167	50	375
168	50	359
169	52	390
170	52	772
171	53	269
172	53	704
173	52	166
174	52	364
175	52	720
176	54	748
177	54	688
178	55	881
179	55	298
180	54	528
181	54	440
182	54	85
183	56	945
184	56	399
185	57	357
186	57	642
187	56	245
188	56	333
189	56	745
190	58	466
191	58	394
192	59	658
193	59	788
194	58	260
195	58	603
196	58	956
197	60	118
198	60	386
199	61	105
200	61	941
201	60	605
202	60	616
203	60	667
204	62	821
205	62	995
206	63	264
207	63	206
208	62	928
209	62	859
210	62	360
211	65	13
212	65	968
213	66	150
214	66	595
215	65	89
216	65	757
217	65	635
218	67	971
219	67	329
220	68	382
221	68	512
222	67	380
223	67	216
224	67	637
225	69	880
226	69	680
227	70	589
228	70	220
229	69	189
230	69	406
231	69	386
232	1	5
233	73	580
234	73	71
235	74	971
236	74	288
237	73	992
238	73	63
239	73	9
240	75	599
241	75	284
242	76	316
243	76	770
244	75	954
245	75	282
246	75	616
247	77	772
248	77	838
249	78	307
250	78	306
251	77	241
252	77	978
253	77	884
254	79	195
255	79	984
256	80	518
257	80	839
258	79	62
259	79	113
260	79	78
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, username) FROM stdin;
1	
2	camper123
3	user_1764656956607
4	user_1764656956606
5	user_1764656996842
6	user_1764656996841
7	user_1764657109001
8	user_1764657109000
9	user_1764657215305
10	user_1764657215304
11	user_1764657294118
12	user_1764657294117
13	user_1764657380385
14	user_1764657380384
15	user_1764657513851
16	user_1764657513850
17	user_1764657600891
18	user_1764657600890
19	user_1764657683212
20	user_1764657683211
21	user_1764657762089
22	user_1764657762088
23	user_1764657816850
24	user_1764657816849
25	user_1764657886598
26	user_1764657886597
27	user_1764657901009
28	user_1764657901008
29	user_1764657980889
30	user_1764657980888
31	user_1764658036392
32	user_1764658036391
33	user_1764658088557
34	user_1764658088556
35	user_1764658124079
36	user_1764658124078
37	user_1764658510224
38	user_1764658510223
39	user_1764658543736
40	user_1764658543735
41	camper124
42	user_1764658611911
43	user_1764658611910
44	user_1764658653996
45	user_1764658653995
46	user_1764658752271
47	user_1764658752270
48	user_1764658964073
49	user_1764658964072
50	user_1764659172385
51	user_1764659172384
52	user_1764659372889
53	user_1764659372888
54	user_1764659418027
55	user_1764659418026
56	user_1764659515577
57	user_1764659515576
58	user_1764659638473
59	user_1764659638472
60	user_1764659790657
61	user_1764659790656
62	user_1764660036044
63	user_1764660036043
64	camper245
65	user_1764660522868
66	user_1764660522867
67	user_1764660614550
68	user_1764660614549
69	user_1764660660481
70	user_1764660660480
71	camper4544
72	camper232
73	user_1764662150921
74	user_1764662150920
75	user_1764662257738
76	user_1764662257737
77	user_1764662377895
78	user_1764662377894
79	user_1764662624367
80	user_1764662624366
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.games_game_id_seq', 260, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 80, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

