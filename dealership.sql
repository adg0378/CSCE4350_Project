--
-- PostgreSQL database dump
--

\restrict fOiGDjJ3thQRacmuUcYA6fggn1f9Wk8SI1kvyqof2gPCpVo7CF4qn2tKuob5bSn

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-04-30 19:04:11

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
-- TOC entry 224 (class 1259 OID 19517)
-- Name: bodystyle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bodystyle (
    body_style_id integer NOT NULL,
    description character varying(50)
);


ALTER TABLE public.bodystyle OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19516)
-- Name: bodystyle_body_style_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bodystyle_body_style_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bodystyle_body_style_id_seq OWNER TO postgres;

--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 223
-- Name: bodystyle_body_style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bodystyle_body_style_id_seq OWNED BY public.bodystyle.body_style_id;


--
-- TOC entry 220 (class 1259 OID 19493)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19492)
-- Name: brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_brand_id_seq OWNER TO postgres;

--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 219
-- Name: brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_brand_id_seq OWNED BY public.brand.brand_id;


--
-- TOC entry 226 (class 1259 OID 19525)
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color (
    color_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.color OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19524)
-- Name: color_color_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.color_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.color_color_id_seq OWNER TO postgres;

--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 225
-- Name: color_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.color_color_id_seq OWNED BY public.color.color_id;


--
-- TOC entry 235 (class 1259 OID 19588)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name character varying(100),
    address character varying(200),
    phone character varying(20),
    gender character(1),
    income numeric(12,2)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 19587)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 234
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- TOC entry 233 (class 1259 OID 19580)
-- Name: dealer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dealer (
    dealer_id integer NOT NULL,
    name character varying(100),
    address character varying(200),
    phone character varying(20)
);


ALTER TABLE public.dealer OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 19706)
-- Name: dealer_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dealer_brand (
    dealer_id integer NOT NULL,
    brand_id integer NOT NULL
);


ALTER TABLE public.dealer_brand OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 19579)
-- Name: dealer_dealer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dealer_dealer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dealer_dealer_id_seq OWNER TO postgres;

--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 232
-- Name: dealer_dealer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dealer_dealer_id_seq OWNED BY public.dealer.dealer_id;


--
-- TOC entry 228 (class 1259 OID 19533)
-- Name: engine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.engine (
    engine_id integer NOT NULL,
    type character varying(50)
);


ALTER TABLE public.engine OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19532)
-- Name: engine_engine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.engine_engine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.engine_engine_id_seq OWNER TO postgres;

--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 227
-- Name: engine_engine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.engine_engine_id_seq OWNED BY public.engine.engine_id;


--
-- TOC entry 237 (class 1259 OID 19596)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    vin character varying(17),
    dealer_id integer,
    status character varying(20),
    date_arrived date
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 19595)
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 236
-- Name: inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.inventory.inventory_id;


--
-- TOC entry 222 (class 1259 OID 19504)
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    model_id integer NOT NULL,
    brand_id integer,
    name character varying(50)
);


ALTER TABLE public.model OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19503)
-- Name: model_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.model_model_id_seq OWNER TO postgres;

--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 221
-- Name: model_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_model_id_seq OWNED BY public.model.model_id;


--
-- TOC entry 243 (class 1259 OID 19645)
-- Name: part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.part (
    part_id integer NOT NULL,
    part_type character varying(100)
);


ALTER TABLE public.part OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 19644)
-- Name: part_part_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.part_part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.part_part_id_seq OWNER TO postgres;

--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 242
-- Name: part_part_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.part_part_id_seq OWNED BY public.part.part_id;


--
-- TOC entry 246 (class 1259 OID 19676)
-- Name: plant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant (
    plant_id integer NOT NULL,
    name character varying(100),
    location character varying(100),
    type character varying(20)
);


ALTER TABLE public.plant OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 19683)
-- Name: plant_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_part (
    plant_id integer NOT NULL,
    part_id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.plant_part OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 19675)
-- Name: plant_plant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plant_plant_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 245
-- Name: plant_plant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_plant_id_seq OWNED BY public.plant.plant_id;


--
-- TOC entry 239 (class 1259 OID 19614)
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    sale_id integer NOT NULL,
    vin character varying(17),
    dealer_id integer,
    customer_id integer,
    sale_date date,
    price numeric(10,2)
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 19613)
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_sale_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 238
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- TOC entry 241 (class 1259 OID 19637)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 19652)
-- Name: supplier_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_part (
    supplier_id integer NOT NULL,
    part_id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.supplier_part OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 19636)
-- Name: supplier_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 240
-- Name: supplier_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;


--
-- TOC entry 230 (class 1259 OID 19541)
-- Name: transmission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transmission (
    transmission_id integer NOT NULL,
    type character varying(50)
);


ALTER TABLE public.transmission OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 19540)
-- Name: transmission_transmission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transmission_transmission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transmission_transmission_id_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 229
-- Name: transmission_transmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transmission_transmission_id_seq OWNED BY public.transmission.transmission_id;


--
-- TOC entry 231 (class 1259 OID 19548)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    vin character varying(17) NOT NULL,
    model_id integer,
    body_style_id integer,
    color_id integer,
    engine_id integer,
    transmission_id integer,
    year integer
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 19723)
-- Name: vehicle_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_part (
    vin character varying(17) NOT NULL,
    part_id integer NOT NULL,
    supplier_id integer,
    plant_id integer,
    date_made date
);


ALTER TABLE public.vehicle_part OWNER TO postgres;

--
-- TOC entry 4837 (class 2604 OID 19520)
-- Name: bodystyle body_style_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodystyle ALTER COLUMN body_style_id SET DEFAULT nextval('public.bodystyle_body_style_id_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 19496)
-- Name: brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN brand_id SET DEFAULT nextval('public.brand_brand_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 19528)
-- Name: color color_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color ALTER COLUMN color_id SET DEFAULT nextval('public.color_color_id_seq'::regclass);


--
-- TOC entry 4842 (class 2604 OID 19591)
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 19583)
-- Name: dealer dealer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dealer ALTER COLUMN dealer_id SET DEFAULT nextval('public.dealer_dealer_id_seq'::regclass);


--
-- TOC entry 4839 (class 2604 OID 19536)
-- Name: engine engine_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine ALTER COLUMN engine_id SET DEFAULT nextval('public.engine_engine_id_seq'::regclass);


--
-- TOC entry 4843 (class 2604 OID 19599)
-- Name: inventory inventory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 19507)
-- Name: model model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN model_id SET DEFAULT nextval('public.model_model_id_seq'::regclass);


--
-- TOC entry 4846 (class 2604 OID 19648)
-- Name: part part_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.part ALTER COLUMN part_id SET DEFAULT nextval('public.part_part_id_seq'::regclass);


--
-- TOC entry 4847 (class 2604 OID 19679)
-- Name: plant plant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant ALTER COLUMN plant_id SET DEFAULT nextval('public.plant_plant_id_seq'::regclass);


--
-- TOC entry 4844 (class 2604 OID 19617)
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 19640)
-- Name: supplier supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_supplier_id_seq'::regclass);


--
-- TOC entry 4840 (class 2604 OID 19544)
-- Name: transmission transmission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transmission ALTER COLUMN transmission_id SET DEFAULT nextval('public.transmission_transmission_id_seq'::regclass);


--
-- TOC entry 5061 (class 0 OID 19517)
-- Dependencies: 224
-- Data for Name: bodystyle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bodystyle (body_style_id, description) FROM stdin;
1	Sedan
2	SUV
3	Truck
4	Coupe
5	Convertible
\.


--
-- TOC entry 5057 (class 0 OID 19493)
-- Dependencies: 220
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (brand_id, name) FROM stdin;
1	Toyota
2	Honda
3	Ford
4	Chevrolet
5	Nissan
\.


--
-- TOC entry 5063 (class 0 OID 19525)
-- Dependencies: 226
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.color (color_id, name) FROM stdin;
1	Black
2	White
3	Silver
4	Blue
5	Red
\.


--
-- TOC entry 5072 (class 0 OID 19588)
-- Dependencies: 235
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, name, address, phone, gender, income) FROM stdin;
1	John Smith	100 Elm St, Plano, TX	972-555-1111	M	55000.00
2	Emily Davis	200 Oak St, Dallas, TX	972-555-2222	F	72000.00
3	Michael Johnson	300 Pine St, Frisco, TX	972-555-3333	M	45000.00
4	Sarah Wilson	400 Maple St, Allen, TX	972-555-4444	F	98000.00
5	David Brown	500 Cedar St, McKinney, TX	972-555-5555	M	130000.00
\.


--
-- TOC entry 5070 (class 0 OID 19580)
-- Dependencies: 233
-- Data for Name: dealer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dealer (dealer_id, name, address, phone) FROM stdin;
1	Northside Auto Mall	123 North St, Plano, TX	972-111-1111
2	Metro Motors	500 Main St, Dallas, TX	972-222-2222
3	Lone Star Cars	88 Texas Rd, Frisco, TX	972-333-3333
\.


--
-- TOC entry 5085 (class 0 OID 19706)
-- Dependencies: 248
-- Data for Name: dealer_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dealer_brand (dealer_id, brand_id) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 19533)
-- Dependencies: 228
-- Data for Name: engine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.engine (engine_id, type) FROM stdin;
1	I4
2	V6
3	V8
4	Hybrid
5	Electric
\.


--
-- TOC entry 5074 (class 0 OID 19596)
-- Dependencies: 237
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (inventory_id, vin, dealer_id, status, date_arrived) FROM stdin;
1	VIN00001	1	Available	2024-01-10
2	VIN00002	1	Available	2024-02-15
3	VIN00003	1	Sold	2024-01-05
4	VIN00004	1	Available	2024-03-01
5	VIN00005	2	Available	2024-01-20
6	VIN00006	2	Sold	2024-01-02
7	VIN00007	2	Available	2024-02-10
8	VIN00008	2	Available	2024-03-05
9	VIN00009	3	Available	2024-01-12
10	VIN00010	3	Sold	2024-01-03
11	VIN00011	3	Available	2024-02-18
12	VIN00012	3	Available	2024-03-07
13	VIN00013	1	Available	2024-01-25
14	VIN00014	1	Sold	2024-01-04
15	VIN00015	2	Available	2024-02-12
16	VIN00016	2	Available	2024-01-30
17	VIN00017	3	Available	2024-02-20
18	VIN00018	3	Sold	2024-01-06
19	VIN00019	1	Available	2024-03-10
20	VIN00020	2	Available	2024-03-12
21	VIN00021	1	Available	2024-03-12
22	VIN00022	1	Available	2024-03-15
23	VIN00023	1	Sold	2024-02-28
24	VIN00024	1	Available	2024-03-20
25	VIN00025	2	Available	2024-03-10
26	VIN00026	2	Sold	2024-02-25
27	VIN00027	2	Available	2024-03-18
28	VIN00028	2	Available	2024-03-22
29	VIN00029	3	Available	2024-03-05
30	VIN00030	3	Sold	2024-02-27
31	VIN00031	3	Available	2024-03-14
32	VIN00032	3	Available	2024-03-23
33	VIN00033	1	Available	2024-03-09
34	VIN00034	1	Sold	2024-02-26
35	VIN00035	1	Available	2024-03-17
36	VIN00036	2	Available	2024-03-11
37	VIN00037	2	Available	2024-03-19
38	VIN00038	2	Sold	2024-02-22
39	VIN00039	2	Available	2024-03-25
40	VIN00040	3	Available	2024-03-13
41	VIN00041	3	Available	2024-03-21
42	VIN00042	3	Sold	2024-02-24
43	VIN00043	3	Available	2024-03-24
44	VIN00044	1	Available	2024-03-16
45	VIN00045	1	Sold	2024-02-23
46	VIN00046	1	Available	2024-03-26
47	VIN00047	1	Available	2024-03-27
48	VIN00048	2	Available	2024-03-28
49	VIN00049	2	Sold	2024-02-20
50	VIN00050	2	Available	2024-03-29
51	VIN00051	3	Available	2024-03-30
52	VIN00052	3	Available	2024-03-31
53	VIN00053	3	Sold	2024-02-18
54	VIN00054	3	Available	2024-04-01
55	VIN00055	1	Available	2024-04-02
56	VIN00056	1	Available	2024-04-03
57	VIN00057	1	Sold	2024-02-17
58	VIN00058	1	Available	2024-04-04
59	VIN00059	1	Available	2024-04-05
60	VIN00060	1	Sold	2024-02-15
61	VIN00061	1	Available	2024-04-10
62	VIN00062	1	Sold	2024-04-05
63	VIN00063	2	Available	2024-04-12
64	VIN00064	2	Available	2024-04-14
65	VIN00065	3	Sold	2024-04-03
66	VIN00066	3	Available	2024-04-11
67	VIN00067	1	Available	2024-04-13
68	VIN00068	2	Sold	2024-04-02
69	VIN00069	3	Available	2024-04-15
70	VIN00070	1	Available	2024-04-16
\.


--
-- TOC entry 5059 (class 0 OID 19504)
-- Dependencies: 222
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model (model_id, brand_id, name) FROM stdin;
1	1	Camry
2	1	Corolla
3	1	RAV4
4	2	Civic
5	2	Accord
6	2	CR-V
7	3	F-150
8	3	Escape
9	3	Mustang
10	4	Silverado
11	4	Malibu
12	4	Equinox
13	5	Altima
14	5	Sentra
15	5	Rogue
16	3	Mustang Convertible
17	4	Camaro Convertible
18	2	Accord Convertible
19	1	Corolla Convertible
20	2	MX-5 Miata
21	3	BMW Z4
22	4	Porsche Boxster
23	5	Audi A5 Cabriolet
\.


--
-- TOC entry 5080 (class 0 OID 19645)
-- Dependencies: 243
-- Data for Name: part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.part (part_id, part_type) FROM stdin;
1	Tire
2	Transmission
3	Window
4	Seat
\.


--
-- TOC entry 5083 (class 0 OID 19676)
-- Dependencies: 246
-- Data for Name: plant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant (plant_id, name, location, type) FROM stdin;
1	Arlington Plant	Arlington, TX	Part Manufacture
2	Chicago Plant	Chicago, IL	Assembler
3	Detroit Plant	Detroit, MI	Both
\.


--
-- TOC entry 5084 (class 0 OID 19683)
-- Dependencies: 247
-- Data for Name: plant_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_part (plant_id, part_id, model_id) FROM stdin;
1	4	8
3	1	17
1	3	8
2	1	23
1	1	10
2	3	20
1	3	22
2	1	22
3	3	19
3	4	8
2	3	23
2	4	1
2	3	5
2	3	9
2	3	13
3	1	11
1	1	8
1	1	22
2	4	15
3	1	14
\.


--
-- TOC entry 5076 (class 0 OID 19614)
-- Dependencies: 239
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (sale_id, vin, dealer_id, customer_id, sale_date, price) FROM stdin;
1	VIN00003	1	1	2024-02-01	24000.00
2	VIN00006	2	2	2024-02-10	27000.00
3	VIN00010	3	3	2024-02-15	52000.00
4	VIN00014	1	4	2024-03-01	21000.00
5	VIN00018	3	5	2024-03-05	33000.00
6	VIN00023	1	2	2024-03-05	23000.00
7	VIN00026	2	3	2024-03-08	26000.00
8	VIN00030	3	1	2024-03-10	51000.00
9	VIN00034	1	4	2024-03-12	20000.00
10	VIN00038	2	5	2024-03-14	32000.00
11	VIN00042	3	2	2024-03-16	27000.00
12	VIN00045	1	3	2024-03-18	48000.00
13	VIN00049	2	4	2024-03-20	21000.00
14	VIN00053	3	5	2024-03-22	29000.00
15	VIN00057	1	1	2024-03-24	34000.00
16	VIN00060	1	2	2024-03-26	31000.00
17	VIN00006	2	5	2024-03-28	27500.00
18	VIN00062	1	3	2024-04-08	47000.00
19	VIN00065	3	2	2024-04-06	32000.00
20	VIN00068	2	5	2024-04-09	54000.00
\.


--
-- TOC entry 5078 (class 0 OID 19637)
-- Dependencies: 241
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplier_id, name) FROM stdin;
1	PartsMKR
2	Getrag
\.


--
-- TOC entry 5081 (class 0 OID 19652)
-- Dependencies: 244
-- Data for Name: supplier_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier_part (supplier_id, part_id, model_id) FROM stdin;
1	2	1
1	2	4
1	2	7
1	2	10
2	3	2
2	3	5
2	3	8
2	3	11
\.


--
-- TOC entry 5067 (class 0 OID 19541)
-- Dependencies: 230
-- Data for Name: transmission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transmission (transmission_id, type) FROM stdin;
1	Automatic
2	Manual
3	CVT
\.


--
-- TOC entry 5068 (class 0 OID 19548)
-- Dependencies: 231
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (vin, model_id, body_style_id, color_id, engine_id, transmission_id, year) FROM stdin;
VIN00001	1	1	1	1	1	2022
VIN00002	1	1	2	1	1	2023
VIN00003	2	1	3	4	1	2021
VIN00004	3	2	4	2	1	2024
VIN00005	4	1	1	1	1	2022
VIN00006	4	1	2	1	1	2023
VIN00007	5	1	3	4	1	2021
VIN00008	6	2	4	2	1	2024
VIN00009	7	3	1	3	1	2022
VIN00010	7	3	2	3	1	2023
VIN00011	8	2	3	1	1	2021
VIN00012	9	4	4	3	2	2024
VIN00013	10	3	1	3	1	2022
VIN00014	11	1	2	1	1	2023
VIN00015	12	2	3	4	1	2021
VIN00016	13	1	1	1	1	2022
VIN00017	13	1	2	1	1	2023
VIN00018	14	1	3	4	1	2021
VIN00019	15	2	4	2	1	2024
VIN00020	15	2	5	2	1	2023
VIN00021	1	1	1	1	1	2022
VIN00022	1	1	3	4	1	2023
VIN00023	2	1	2	1	1	2021
VIN00024	3	2	5	2	1	2024
VIN00025	4	1	4	1	1	2022
VIN00026	4	1	1	1	1	2023
VIN00027	5	1	5	4	1	2021
VIN00028	6	2	3	2	1	2024
VIN00029	7	3	2	3	1	2022
VIN00030	7	3	4	3	1	2023
VIN00031	8	2	1	1	1	2021
VIN00032	9	4	5	3	2	2024
VIN00033	10	3	3	3	1	2022
VIN00034	11	1	5	1	1	2023
VIN00035	12	2	2	4	1	2021
VIN00036	13	1	4	1	1	2022
VIN00037	13	1	1	1	1	2023
VIN00038	14	1	3	4	1	2021
VIN00039	15	2	5	2	1	2024
VIN00040	2	1	4	1	1	2023
VIN00041	3	2	1	2	1	2022
VIN00042	5	1	2	4	1	2024
VIN00043	6	2	5	2	1	2021
VIN00044	8	2	4	1	1	2023
VIN00045	9	4	1	3	2	2022
VIN00046	10	3	5	3	1	2024
VIN00047	11	1	3	1	1	2021
VIN00048	12	2	4	4	1	2023
VIN00049	14	1	2	4	1	2022
VIN00050	15	2	1	2	1	2024
VIN00051	1	1	5	1	1	2023
VIN00052	3	2	2	2	1	2022
VIN00053	4	1	3	1	1	2024
VIN00054	7	3	5	3	1	2021
VIN00055	8	2	2	1	1	2023
VIN00056	10	3	4	3	1	2022
VIN00057	12	2	1	4	1	2024
VIN00058	13	1	3	1	1	2021
VIN00059	14	1	5	4	1	2023
VIN00060	15	2	2	2	1	2022
VIN00061	16	5	1	3	1	2024
VIN00062	17	5	2	3	1	2023
VIN00063	18	5	3	2	1	2022
VIN00064	19	5	4	1	1	2024
VIN00065	20	5	5	4	1	2023
VIN00066	21	5	1	3	2	2024
VIN00067	22	5	2	3	1	2023
VIN00068	23	5	3	2	1	2022
VIN00069	16	5	4	3	1	2024
VIN00070	20	5	5	4	1	2023
\.


--
-- TOC entry 5086 (class 0 OID 19723)
-- Dependencies: 249
-- Data for Name: vehicle_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_part (vin, part_id, supplier_id, plant_id, date_made) FROM stdin;
VIN00021	1	1	\N	2023-01-17
VIN00022	1	\N	3	2020-10-10
VIN00023	1	1	\N	2022-01-15
VIN00024	1	1	\N	2024-11-19
VIN00025	2	1	\N	2024-07-06
VIN00026	2	2	\N	2021-09-06
VIN00027	2	1	\N	2022-09-15
VIN00028	2	1	\N	2020-01-13
VIN00029	3	\N	1	2020-01-05
VIN00030	3	2	\N	2021-10-09
VIN00031	3	2	\N	2024-10-08
VIN00032	3	\N	2	2024-06-22
VIN00033	1	1	\N	2024-01-21
VIN00034	1	2	\N	2022-06-10
VIN00035	1	1	\N	2023-01-24
VIN00062	2	1	\N	2022-04-03
VIN00037	2	\N	1	2021-03-22
VIN00038	2	\N	1	2023-02-28
VIN00039	2	1	\N	2021-12-04
VIN00040	3	2	\N	2020-08-22
VIN00041	3	1	\N	2022-08-02
VIN00042	3	2	\N	2024-12-10
VIN00043	3	1	\N	2023-04-14
VIN00044	1	2	\N	2022-03-11
VIN00045	1	1	\N	2020-10-22
VIN00046	1	2	\N	2023-07-06
VIN00047	1	\N	3	2020-05-16
VIN00048	2	2	\N	2024-02-23
VIN00049	2	\N	2	2022-12-18
VIN00050	2	1	\N	2020-12-02
VIN00051	3	\N	3	2021-07-26
VIN00052	3	2	\N	2023-02-01
VIN00053	3	2	\N	2021-09-22
VIN00054	3	\N	1	2020-06-09
VIN00055	1	2	\N	2022-01-20
VIN00056	1	2	\N	2020-07-07
VIN00057	1	1	\N	2023-11-01
VIN00058	1	1	\N	2020-01-08
VIN00059	1	\N	2	2022-03-27
VIN00060	1	2	\N	2023-08-03
\.


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 223
-- Name: bodystyle_body_style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bodystyle_body_style_id_seq', 5, true);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 219
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 5, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 225
-- Name: color_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_color_id_seq', 5, true);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 234
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 5, true);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 232
-- Name: dealer_dealer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dealer_dealer_id_seq', 3, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 227
-- Name: engine_engine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.engine_engine_id_seq', 5, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 236
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 70, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 221
-- Name: model_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_model_id_seq', 23, true);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 242
-- Name: part_part_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.part_part_id_seq', 4, true);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 245
-- Name: plant_plant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_plant_id_seq', 3, true);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 238
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 20, true);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 240
-- Name: supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 2, true);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 229
-- Name: transmission_transmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transmission_transmission_id_seq', 3, true);


--
-- TOC entry 4855 (class 2606 OID 19523)
-- Name: bodystyle bodystyle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodystyle
    ADD CONSTRAINT bodystyle_pkey PRIMARY KEY (body_style_id);


--
-- TOC entry 4849 (class 2606 OID 19502)
-- Name: brand brand_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_name_key UNIQUE (name);


--
-- TOC entry 4851 (class 2606 OID 19500)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_id);


--
-- TOC entry 4857 (class 2606 OID 19531)
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (color_id);


--
-- TOC entry 4867 (class 2606 OID 19594)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4883 (class 2606 OID 19712)
-- Name: dealer_brand dealer_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dealer_brand
    ADD CONSTRAINT dealer_brand_pkey PRIMARY KEY (dealer_id, brand_id);


--
-- TOC entry 4865 (class 2606 OID 19586)
-- Name: dealer dealer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dealer
    ADD CONSTRAINT dealer_pkey PRIMARY KEY (dealer_id);


--
-- TOC entry 4859 (class 2606 OID 19539)
-- Name: engine engine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine
    ADD CONSTRAINT engine_pkey PRIMARY KEY (engine_id);


--
-- TOC entry 4869 (class 2606 OID 19602)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 4853 (class 2606 OID 19510)
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (model_id);


--
-- TOC entry 4875 (class 2606 OID 19651)
-- Name: part part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.part
    ADD CONSTRAINT part_pkey PRIMARY KEY (part_id);


--
-- TOC entry 4881 (class 2606 OID 19690)
-- Name: plant_part plant_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_part
    ADD CONSTRAINT plant_part_pkey PRIMARY KEY (plant_id, part_id, model_id);


--
-- TOC entry 4879 (class 2606 OID 19682)
-- Name: plant plant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_pkey PRIMARY KEY (plant_id);


--
-- TOC entry 4871 (class 2606 OID 19620)
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 4877 (class 2606 OID 19659)
-- Name: supplier_part supplier_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_part
    ADD CONSTRAINT supplier_part_pkey PRIMARY KEY (supplier_id, part_id, model_id);


--
-- TOC entry 4873 (class 2606 OID 19643)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 4861 (class 2606 OID 19547)
-- Name: transmission transmission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transmission
    ADD CONSTRAINT transmission_pkey PRIMARY KEY (transmission_id);


--
-- TOC entry 4885 (class 2606 OID 19729)
-- Name: vehicle_part vehicle_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_part
    ADD CONSTRAINT vehicle_part_pkey PRIMARY KEY (vin, part_id);


--
-- TOC entry 4863 (class 2606 OID 19553)
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (vin);


--
-- TOC entry 4903 (class 2606 OID 19718)
-- Name: dealer_brand dealer_brand_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dealer_brand
    ADD CONSTRAINT dealer_brand_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(brand_id);


--
-- TOC entry 4904 (class 2606 OID 19713)
-- Name: dealer_brand dealer_brand_dealer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dealer_brand
    ADD CONSTRAINT dealer_brand_dealer_id_fkey FOREIGN KEY (dealer_id) REFERENCES public.dealer(dealer_id);


--
-- TOC entry 4892 (class 2606 OID 19608)
-- Name: inventory inventory_dealer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_dealer_id_fkey FOREIGN KEY (dealer_id) REFERENCES public.dealer(dealer_id);


--
-- TOC entry 4893 (class 2606 OID 19603)
-- Name: inventory inventory_vin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_vin_fkey FOREIGN KEY (vin) REFERENCES public.vehicle(vin);


--
-- TOC entry 4886 (class 2606 OID 19511)
-- Name: model model_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(brand_id);


--
-- TOC entry 4900 (class 2606 OID 19701)
-- Name: plant_part plant_part_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_part
    ADD CONSTRAINT plant_part_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(model_id);


--
-- TOC entry 4901 (class 2606 OID 19696)
-- Name: plant_part plant_part_part_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_part
    ADD CONSTRAINT plant_part_part_id_fkey FOREIGN KEY (part_id) REFERENCES public.part(part_id);


--
-- TOC entry 4902 (class 2606 OID 19691)
-- Name: plant_part plant_part_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_part
    ADD CONSTRAINT plant_part_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plant(plant_id);


--
-- TOC entry 4894 (class 2606 OID 19631)
-- Name: sales sales_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 4895 (class 2606 OID 19626)
-- Name: sales sales_dealer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_dealer_id_fkey FOREIGN KEY (dealer_id) REFERENCES public.dealer(dealer_id);


--
-- TOC entry 4896 (class 2606 OID 19621)
-- Name: sales sales_vin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_vin_fkey FOREIGN KEY (vin) REFERENCES public.vehicle(vin);


--
-- TOC entry 4897 (class 2606 OID 19670)
-- Name: supplier_part supplier_part_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_part
    ADD CONSTRAINT supplier_part_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(model_id);


--
-- TOC entry 4898 (class 2606 OID 19665)
-- Name: supplier_part supplier_part_part_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_part
    ADD CONSTRAINT supplier_part_part_id_fkey FOREIGN KEY (part_id) REFERENCES public.part(part_id);


--
-- TOC entry 4899 (class 2606 OID 19660)
-- Name: supplier_part supplier_part_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_part
    ADD CONSTRAINT supplier_part_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


--
-- TOC entry 4887 (class 2606 OID 19559)
-- Name: vehicle vehicle_body_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_body_style_id_fkey FOREIGN KEY (body_style_id) REFERENCES public.bodystyle(body_style_id);


--
-- TOC entry 4888 (class 2606 OID 19564)
-- Name: vehicle vehicle_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.color(color_id);


--
-- TOC entry 4889 (class 2606 OID 19569)
-- Name: vehicle vehicle_engine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_engine_id_fkey FOREIGN KEY (engine_id) REFERENCES public.engine(engine_id);


--
-- TOC entry 4890 (class 2606 OID 19554)
-- Name: vehicle vehicle_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(model_id);


--
-- TOC entry 4905 (class 2606 OID 19735)
-- Name: vehicle_part vehicle_part_part_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_part
    ADD CONSTRAINT vehicle_part_part_id_fkey FOREIGN KEY (part_id) REFERENCES public.part(part_id);


--
-- TOC entry 4906 (class 2606 OID 19745)
-- Name: vehicle_part vehicle_part_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_part
    ADD CONSTRAINT vehicle_part_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plant(plant_id);


--
-- TOC entry 4907 (class 2606 OID 19740)
-- Name: vehicle_part vehicle_part_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_part
    ADD CONSTRAINT vehicle_part_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


--
-- TOC entry 4908 (class 2606 OID 19730)
-- Name: vehicle_part vehicle_part_vin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_part
    ADD CONSTRAINT vehicle_part_vin_fkey FOREIGN KEY (vin) REFERENCES public.vehicle(vin);


--
-- TOC entry 4891 (class 2606 OID 19574)
-- Name: vehicle vehicle_transmission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_transmission_id_fkey FOREIGN KEY (transmission_id) REFERENCES public.transmission(transmission_id);


-- Completed on 2026-04-30 19:04:11

--
-- PostgreSQL database dump complete
--

\unrestrict fOiGDjJ3thQRacmuUcYA6fggn1f9Wk8SI1kvyqof2gPCpVo7CF4qn2tKuob5bSn

