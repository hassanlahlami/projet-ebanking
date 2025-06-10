--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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
-- Name: banque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banque (
    id bigint NOT NULL,
    commissioncrypto double precision NOT NULL,
    fraisvirement double precision NOT NULL,
    negatifmontantautorise double precision NOT NULL,
    plafondvirement double precision NOT NULL
);


ALTER TABLE public.banque OWNER TO postgres;

--
-- Name: banque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banque_id_seq OWNER TO postgres;

--
-- Name: banque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banque_id_seq OWNED BY public.banque.id;


--
-- Name: comptes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comptes (
    account_type character varying(31) NOT NULL,
    id bigint NOT NULL,
    createdat timestamp(6) without time zone,
    deletedat timestamp(6) without time zone,
    rib character varying(255),
    solde double precision NOT NULL,
    status character varying(255),
    updatedat timestamp(6) without time zone,
    dateinterets timestamp(6) without time zone,
    tauxinterets double precision,
    autorisepaiementenligne boolean,
    client_id bigint,
    CONSTRAINT comptes_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIF'::character varying, 'BLOQUE'::character varying, 'FERME'::character varying])::text[])))
);


ALTER TABLE public.comptes OWNER TO postgres;

--
-- Name: comptes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comptes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comptes_id_seq OWNER TO postgres;

--
-- Name: comptes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comptes_id_seq OWNED BY public.comptes.id;


--
-- Name: crypto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crypto (
    id bigint NOT NULL,
    namecrypto character varying(255),
    valueacheter double precision NOT NULL,
    valuevendre double precision NOT NULL,
    ccourant_id bigint
);


ALTER TABLE public.crypto OWNER TO postgres;

--
-- Name: crypto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crypto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crypto_id_seq OWNER TO postgres;

--
-- Name: crypto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crypto_id_seq OWNED BY public.crypto.id;


--
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    duedate timestamp(6) without time zone,
    paid boolean NOT NULL,
    paiddate timestamp(6) without time zone,
    provider character varying(255),
    referencenumber character varying(255),
    client_id bigint,
    compteid bigint
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoice_id_seq OWNER TO postgres;

--
-- Name: invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.id;


--
-- Name: maybeclients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maybeclients (
    id bigint NOT NULL,
    createdat timestamp(6) without time zone,
    deletedat timestamp(6) without time zone,
    email character varying(255),
    emailtoken character varying(255),
    emailtokenexpirationtime timestamp(6) without time zone,
    firstname character varying(255),
    isemailtokenverified boolean NOT NULL,
    isphonetokenverified boolean NOT NULL,
    isreadytobeclient boolean NOT NULL,
    lastname character varying(255),
    phone character varying(255),
    phonetoken character varying(255),
    updatedat timestamp(6) without time zone,
    username character varying(255)
);


ALTER TABLE public.maybeclients OWNER TO postgres;

--
-- Name: maybeclients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maybeclients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maybeclients_id_seq OWNER TO postgres;

--
-- Name: maybeclients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maybeclients_id_seq OWNED BY public.maybeclients.id;


--
-- Name: recharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recharge (
    id bigint NOT NULL,
    createdat timestamp(6) without time zone,
    montant integer NOT NULL,
    operateur character varying(255),
    phonenumber character varying(255),
    compte_id bigint
);


ALTER TABLE public.recharge OWNER TO postgres;

--
-- Name: recharge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recharge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recharge_id_seq OWNER TO postgres;

--
-- Name: recharge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recharge_id_seq OWNED BY public.recharge.id;


--
-- Name: tokenmail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokenmail (
    id bigint NOT NULL,
    token character varying(255),
    client_id bigint,
    createdat timestamp(6) without time zone,
    exprirydate timestamp(6) without time zone,
    used boolean NOT NULL
);


ALTER TABLE public.tokenmail OWNER TO postgres;

--
-- Name: tokenmail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokenmail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tokenmail_id_seq OWNER TO postgres;

--
-- Name: tokenmail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokenmail_id_seq OWNED BY public.tokenmail.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id bigint NOT NULL,
    createdat timestamp(6) without time zone,
    expired boolean NOT NULL,
    expiredat timestamp(6) without time zone,
    ipaddress character varying(255),
    lastusedat timestamp(6) without time zone,
    platform character varying(255),
    revoked boolean NOT NULL,
    token character varying(1000),
    tokentype smallint,
    useragent character varying(255),
    userid bigint,
    CONSTRAINT tokens_tokentype_check CHECK (((tokentype >= 0) AND (tokentype <= 1)))
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tokens_id_seq OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_type character varying(31) NOT NULL,
    id bigint NOT NULL,
    createdat timestamp(6) without time zone,
    deletedat timestamp(6) without time zone,
    email character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    password character varying(255),
    phone character varying(255),
    updatedat timestamp(6) without time zone,
    username character varying(255),
    role smallint,
    job character varying(255),
    valid boolean,
    recoverypasswordtoken character varying(255),
    recoverypasswordtokenexpirationtime timestamp(6) without time zone,
    code character varying(255),
    isrecoverypasswordtokenverified boolean DEFAULT false NOT NULL,
    CONSTRAINT users_role_check CHECK (((role >= 0) AND (role <= 2)))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: virement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.virement (
    id bigint NOT NULL,
    createdat timestamp(6) without time zone,
    montant double precision NOT NULL,
    type character varying(255),
    compte_emetteur_id bigint,
    compte_recepteur_id bigint,
    CONSTRAINT virement_type_check CHECK (((type)::text = ANY ((ARRAY['INSTANTANEE'::character varying, 'NORMAL'::character varying])::text[])))
);


ALTER TABLE public.virement OWNER TO postgres;

--
-- Name: virement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.virement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.virement_id_seq OWNER TO postgres;

--
-- Name: virement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.virement_id_seq OWNED BY public.virement.id;


--
-- Name: banque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banque ALTER COLUMN id SET DEFAULT nextval('public.banque_id_seq'::regclass);


--
-- Name: comptes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comptes ALTER COLUMN id SET DEFAULT nextval('public.comptes_id_seq'::regclass);


--
-- Name: crypto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crypto ALTER COLUMN id SET DEFAULT nextval('public.crypto_id_seq'::regclass);


--
-- Name: invoice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice ALTER COLUMN id SET DEFAULT nextval('public.invoice_id_seq'::regclass);


--
-- Name: maybeclients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maybeclients ALTER COLUMN id SET DEFAULT nextval('public.maybeclients_id_seq'::regclass);


--
-- Name: recharge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge ALTER COLUMN id SET DEFAULT nextval('public.recharge_id_seq'::regclass);


--
-- Name: tokenmail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokenmail ALTER COLUMN id SET DEFAULT nextval('public.tokenmail_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: virement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virement ALTER COLUMN id SET DEFAULT nextval('public.virement_id_seq'::regclass);


--
-- Data for Name: banque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banque (id, commissioncrypto, fraisvirement, negatifmontantautorise, plafondvirement) FROM stdin;
\.


--
-- Data for Name: comptes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comptes (account_type, id, createdat, deletedat, rib, solde, status, updatedat, dateinterets, tauxinterets, autorisepaiementenligne, client_id) FROM stdin;
CCOURANT	2	2025-05-29 20:37:00.405148	\N	010101000000000000000201	560	BLOQUE	2025-05-29 20:37:00.405148	\N	\N	f	2
CCOURANT	4	2025-05-29 20:42:37.653194	\N	010101000000000000000401	7545.99	ACTIF	2025-05-29 20:42:37.653194	\N	\N	t	4
CEPARGNE	7	2025-05-29 21:00:15.719198	\N	010101000000000000000701	500	BLOQUE	2025-05-29 21:00:15.719198	2025-02-28 12:00:00	0.5	\N	2
CEPARGNE	8	2025-05-29 21:03:16.333365	\N	010101000000000000000801	15000	ACTIF	2025-05-29 21:03:16.333365	2025-05-14 12:00:00	2	\N	3
CEPARGNE	9	2025-05-29 21:09:11.648635	\N	010101000000000000000901	100	FERME	2025-05-29 21:09:11.648635	2024-05-29 12:00:00	0	\N	4
CEPARGNE	10	2025-05-29 21:09:21.723972	\N	010101000000000000001001	3200.25	ACTIF	2025-05-29 21:09:21.723972	2025-05-15 12:00:00	1.2	\N	5
CEPARGNE	6	2025-05-29 20:59:56.10191	\N	010101000000000000000601	8000	BLOQUE	2025-05-29 20:59:56.10191	2025-04-29 12:00:00	1.5	\N	1
CCOURANT	1	2025-05-29 20:23:20.03427	\N	010101000000000000000101	37930.7625	ACTIF	2025-06-10 07:18:57.93961	\N	\N	t	1
CCOURANT	3	2025-05-29 20:41:32.536301	\N	010101000000000000000301	9069.99	ACTIF	2025-06-10 15:12:19.287616	\N	\N	t	3
CCOURANT	11	2025-06-10 15:09:59.362955	\N	010101000000000000001101	6.9091168	ACTIF	2025-06-10 15:14:49.770751	\N	\N	t	19
CCOURANT	5	2025-05-29 20:46:00.213705	\N	010101000000000000000501	9295.75	ACTIF	2025-06-03 05:03:02.182371	\N	\N	t	5
\.


--
-- Data for Name: crypto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crypto (id, namecrypto, valueacheter, valuevendre, ccourant_id) FROM stdin;
1	BTCUSDT	0	5290.047500000001	1
2	BTCUSDT	1.0908832000000002	0	11
\.


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice (id, amount, duedate, paid, paiddate, provider, referencenumber, client_id, compteid) FROM stdin;
2	89.3	2025-06-25 23:59:59	t	2025-06-01 14:30:00	INWI	INWI-INV-2001	1	\N
3	2000	2025-07-10 23:59:59	f	\N	DGI	DGI-INV-3001	1	\N
4	145.6	2025-06-22 23:59:59	t	2025-06-03 10:00:00	RADEEF	RADEEF-INV-4001	1	\N
5	800	2025-06-30 23:59:59	f	\N	CNSS	CNSS-INV-5001	1	\N
6	112.6	2025-06-26 23:59:59	f	\N	AMENDIS	AMENDIS-INV-3005	1	\N
7	98.25	2025-07-02 23:59:59	t	2025-06-05 10:00:00	RADEEL	RADEEL-INV-3006	1	\N
8	103.75	2025-06-28 23:59:59	f	\N	RADEET	RADEET-INV-3007	1	\N
9	87.9	2025-07-03 23:59:59	t	2025-06-04 14:10:00	RADEETA	RADEETA-INV-3008	1	\N
10	78	2025-06-30 23:59:59	f	\N	RAK	RAK-INV-3009	1	\N
11	65.1	2025-07-01 23:59:59	t	2025-06-03 08:45:00	SRM	SRM-INV-3010	1	\N
12	285.4	2025-07-10 23:59:59	f	\N	ANCFCC	ANCFCC-INV-3011	1	\N
13	312.8	2025-07-13 23:59:59	t	2025-06-02 13:50:00	ANP	ANP-INV-3012	1	\N
14	850	2025-07-18 23:59:59	f	\N	CNSS	CNSS-INV-3013	1	\N
15	2050	2025-07-19 23:59:59	t	2025-06-05 09:00:00	DGI	DGI-INV-3014	1	\N
16	180.3	2025-07-04 23:59:59	f	\N	OMPIC	OMPIC-INV-3015	1	\N
17	290	2025-07-06 23:59:59	t	2025-06-01 15:00:00	ONSSA	ONSSA-INV-3016	1	\N
18	470.75	2025-07-08 23:59:59	f	\N	TGR	TGR-INV-3017	1	\N
19	635	2025-07-09 23:59:59	t	2025-06-04 17:45:00	PORTNET	PORTNET-INV-3018	1	\N
20	88.6	2025-06-23 23:59:59	f	\N	INWI	INWI-INV-3019	1	\N
21	97.25	2025-06-24 23:59:59	t	2025-06-03 19:15:00	MAROCTELECOM	MT-INV-3020	1	\N
22	91.4	2025-06-29 23:59:59	f	\N	ORANGE	ORANGE-INV-3021	1	\N
23	149.75	2025-07-02 23:59:59	t	2025-06-05 11:00:00	RADEEF	RADEEF-INV-3022	1	\N
24	123.45	2025-07-03 23:59:59	f	\N	ONEE	ONEE-INV-3023	1	\N
25	107.8	2025-07-05 23:59:59	t	2025-06-02 16:40:00	AMENDIS	AMENDIS-INV-3024	1	\N
26	95.8	2025-07-06 23:59:59	f	\N	RADEEL	RADEEL-INV-4001	1	\N
27	79.3	2025-07-08 23:59:59	f	\N	RAK	RAK-INV-4002	1	\N
28	101	2025-07-04 23:59:59	f	\N	RADEETA	RADEETA-INV-4003	1	\N
29	97.5	2025-07-10 23:59:59	f	\N	RADEET	RADEET-INV-4004	1	\N
30	132.4	2025-07-12 23:59:59	f	\N	RADEEF	RADEEF-INV-4005	1	\N
31	63.9	2025-07-15 23:59:59	f	\N	SRM	SRM-INV-4006	1	\N
32	280	2025-07-16 23:59:59	f	\N	ANCFCC	ANCFCC-INV-4007	1	\N
33	305.75	2025-07-18 23:59:59	f	\N	ANP	ANP-INV-4008	1	\N
34	799.5	2025-07-20 23:59:59	f	\N	CNSS	CNSS-INV-4009	1	\N
35	1920	2025-07-25 23:59:59	f	\N	DGI	DGI-INV-4010	1	\N
36	160	2025-07-14 23:59:59	f	\N	OMPIC	OMPIC-INV-4011	1	\N
37	275.45	2025-07-17 23:59:59	f	\N	ONSSA	ONSSA-INV-4012	1	\N
38	510	2025-07-19 23:59:59	f	\N	TGR	TGR-INV-4013	1	\N
39	615.8	2025-07-21 23:59:59	f	\N	PORTNET	PORTNET-INV-4014	1	\N
40	84.99	2025-07-11 23:59:59	f	\N	INWI	INWI-INV-4015	1	\N
41	96.2	2025-07-13 23:59:59	f	\N	MAROCTELECOM	MT-INV-4016	1	\N
42	89.45	2025-07-09 23:59:59	f	\N	ORANGE	ORANGE-INV-4017	1	\N
43	108	2025-07-22 23:59:59	f	\N	AMENDIS	AMENDIS-INV-4018	1	\N
44	117.6	2025-07-23 23:59:59	f	\N	ONEE	ONEE-INV-4019	1	\N
45	102.2	2025-07-24 23:59:59	f	\N	RADEETA	RADEETA-INV-4020	1	\N
1	120.75	2025-06-20 23:59:59	t	2025-06-05 18:56:58.83751	ONEE	ONEE-INV-1001	1	\N
\.


--
-- Data for Name: maybeclients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maybeclients (id, createdat, deletedat, email, emailtoken, emailtokenexpirationtime, firstname, isemailtokenverified, isphonetokenverified, isreadytobeclient, lastname, phone, phonetoken, updatedat, username) FROM stdin;
1	2025-06-10 15:00:37.972532	\N	lahlamihassan57@gmail.com	$2a$12$NatvE6aemGh8a.tb8ckgZO75grWyPPtj./hPFYyvLkx0cXSDDUurS	2025-06-10 15:10:37.838211	hassan	t	f	t	lahlami	\N	\N	2025-06-10 15:02:43.971741	\N
\.


--
-- Data for Name: recharge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recharge (id, createdat, montant, operateur, phonenumber, compte_id) FROM stdin;
3	2025-06-05 19:06:09.904042	20	Orange	0628383782	1
4	2025-06-10 15:11:46.508274	10	Orange	0628383782	11
\.


--
-- Data for Name: tokenmail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokenmail (id, token, client_id, createdat, exprirydate, used) FROM stdin;
1	117154	19	2025-06-10 15:10:42.048837	2025-06-10 15:13:41.842553	t
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, createdat, expired, expiredat, ipaddress, lastusedat, platform, revoked, token, tokentype, useragent, userid) FROM stdin;
1	2025-06-08 13:02:50.569	f	2025-06-08 13:04:50.569	0:0:0:0:0:0:0:1	2025-06-08 13:02:50.569	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg0MTcwNTY5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjA1OTU1ZjAzLWI1OTEtNDA4OC04NjZkLThjYTg0NDVjZTRkMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg0MTcwLCJleHAiOjE3NDkzODQyOTB9.RS6bPA5PRcxc2OGCb14iQbD8KPQg-mU-HG5dFKIEzNQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
2	2025-06-08 13:08:51.855	f	2025-06-08 13:10:51.855	0:0:0:0:0:0:0:1	2025-06-08 13:08:51.855	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg0NTMxODU1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjQxYzdjMzU3LTk0ZWEtNGNjNy1hNWNmLWIwMjNkNDU0ZmI4NyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg0NTMxLCJleHAiOjE3NDkzODQ2NTF9.d_H7ISFANE14xoZ-5mz4NlvuJ3S3ZRpiU23lQasRRpI	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
3	2025-06-08 13:09:10.201	f	2025-06-08 13:11:10.201	0:0:0:0:0:0:0:1	2025-06-08 13:09:10.201	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg0NTUwMjAxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjQxYzdjMzU3LTk0ZWEtNGNjNy1hNWNmLWIwMjNkNDU0ZmI4NyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg0NTUwLCJleHAiOjE3NDkzODQ2NzB9.apZPUeFtS-JH95OshDtPzPEL_ZRO22-W9hj4dw-ttwY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
4	2025-06-08 13:10:13.21	f	2025-06-08 13:12:13.21	0:0:0:0:0:0:0:1	2025-06-08 13:10:13.21	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg0NjEzMjEwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjQxYzdjMzU3LTk0ZWEtNGNjNy1hNWNmLWIwMjNkNDU0ZmI4NyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg0NjEzLCJleHAiOjE3NDkzODQ3MzN9.ld3gOJrtRDJw9wwFA3TjzTyIHBR_v59VX-rQ4rZGPyE	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
5	2025-06-08 13:12:56.096	f	2025-06-08 13:14:56.096	0:0:0:0:0:0:0:1	2025-06-08 13:12:56.096	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg0Nzc2MDk2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjQxYzdjMzU3LTk0ZWEtNGNjNy1hNWNmLWIwMjNkNDU0ZmI4NyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg0Nzc2LCJleHAiOjE3NDkzODQ4OTZ9.NdVaPVZK_M4rU8s5GmmwTmCUid2MBhDcx2fHtWnBI6M	1	PostmanRuntime/7.44.0	6
6	2025-06-08 13:18:55.94	f	2025-06-08 13:20:55.94	0:0:0:0:0:0:0:1	2025-06-08 13:18:55.94	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg1MTM1OTQwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg1MTM1LCJleHAiOjE3NDkzODUyNTV9.GMp63ncFGgamFpmNGBAAZV0wHgOsYyUov13wvcUwS_c	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
7	2025-06-08 13:19:13.816	f	2025-06-08 13:21:13.816	0:0:0:0:0:0:0:1	2025-06-08 13:19:13.816	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg1MTUzODE2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg1MTUzLCJleHAiOjE3NDkzODUyNzN9.hmiFZ0og5jz7i9Bk0nrhsOZS1tf0L0q-dzpkPTkGDW8	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
8	2025-06-08 13:19:25.311	f	2025-06-08 13:21:25.311	0:0:0:0:0:0:0:1	2025-06-08 13:19:25.311	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg1MTY1MzExLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg1MTY1LCJleHAiOjE3NDkzODUyODV9.5YscUOFSa3bDkH366unSZaUxrb8WWLS_6QQrXNN_p5Q	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
9	2025-06-08 13:20:06.885	f	2025-06-08 13:22:06.885	0:0:0:0:0:0:0:1	2025-06-08 13:20:06.885	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5Mzg1MjA2ODg1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5Mzg1MjA2LCJleHAiOjE3NDkzODUzMjZ9.pEttOok93xx1HIik5vsu4qJAEl_hztKQ0y9bEMd_Pkc	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
10	2025-06-08 14:50:19.883	f	2025-06-08 14:52:19.883	0:0:0:0:0:0:0:1	2025-06-08 14:50:19.883	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5MzkwNjE5ODgzLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5MzkwNjE5LCJleHAiOjE3NDkzOTA3Mzl9.-buQjJSB-G6RJrVXDabLA1DZW7iPCX_zmCd4yuOPoKQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
11	2025-06-08 14:57:08.394	f	2025-06-08 14:59:08.394	0:0:0:0:0:0:0:1	2025-06-08 14:57:08.394	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5MzkxMDI4Mzk0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5MzkxMDI4LCJleHAiOjE3NDkzOTExNDh9.KMnu35tPs_HJMJkVD_OSfCsVvchfLa20AMHyZIebIAg	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
12	2025-06-08 14:59:57.915	f	2025-06-08 15:01:57.915	0:0:0:0:0:0:0:1	2025-06-08 14:59:57.915	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5MzkxMTk3OTE1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5MzkxMTk3LCJleHAiOjE3NDkzOTEzMTd9.qIcT5-lrpGXZ8wtmhYVgGWhgpYTgOADGs_OM77ES4I8	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
13	2025-06-08 15:02:36.239	f	2025-06-08 15:04:36.239	0:0:0:0:0:0:0:1	2025-06-08 15:02:36.239	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5MzkxMzU2MjM5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijg2YzIwZTM0LTQ2MjctNGQzMS05NzgwLWVjM2I3NjIyMTllNCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5MzkxMzU2LCJleHAiOjE3NDkzOTE0NzZ9.5PoXDtr61Ul6ANcbyfShy4yx4lC07Se3pmUzufUdz14	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
14	2025-06-08 17:53:22.946	f	2025-06-08 17:55:22.946	0:0:0:0:0:0:0:1	2025-06-08 17:53:22.946	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDAxNjAyOTQ2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImZlODZiNTMyLWZlNzYtNDllMy1iMGVmLTU4YzI5ZDViNDA1YSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDAxNjAyLCJleHAiOjE3NDk0MDE3MjJ9.vWWVGrdiCu3hGaIxlfnfJep_mZIS_l4tM4Oh_5RxRJw	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
15	2025-06-08 17:53:24.42	f	2025-06-08 17:55:24.42	0:0:0:0:0:0:0:1	2025-06-08 17:53:24.42	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDAxNjA0NDIwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImZlODZiNTMyLWZlNzYtNDllMy1iMGVmLTU4YzI5ZDViNDA1YSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDAxNjA0LCJleHAiOjE3NDk0MDE3MjR9.gVmoAB16YG0PrSe4JiRcUhIwMGfD9DXl3ZgeLr78RJY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
16	2025-06-08 17:54:47.846	f	2025-06-08 17:56:47.846	0:0:0:0:0:0:0:1	2025-06-08 17:54:47.846	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDAxNjg3ODQ2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImZlODZiNTMyLWZlNzYtNDllMy1iMGVmLTU4YzI5ZDViNDA1YSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDAxNjg3LCJleHAiOjE3NDk0MDE4MDd9.MyuW1mU5tgOQZ_CSMu-IZhZ02S-dFFvsinejeA3c1UI	1	PostmanRuntime/7.44.0	6
17	2025-06-08 17:55:23.932	f	2025-06-08 17:57:23.932	0:0:0:0:0:0:0:1	2025-06-08 17:55:23.932	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDAxNzIzOTMyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImZlODZiNTMyLWZlNzYtNDllMy1iMGVmLTU4YzI5ZDViNDA1YSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDAxNzIzLCJleHAiOjE3NDk0MDE4NDN9.kL-9AVyg_YFG1cLfYNiWFKarg9INd6-SW_IBB5Z_uYk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
18	2025-06-08 17:55:40.405	f	2025-06-08 17:57:40.405	0:0:0:0:0:0:0:1	2025-06-08 17:55:40.405	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDAxNzQwNDA1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImZlODZiNTMyLWZlNzYtNDllMy1iMGVmLTU4YzI5ZDViNDA1YSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDAxNzQwLCJleHAiOjE3NDk0MDE4NjB9.eW99C8ei4BJf_856Ywk-hfNMr-C8WAr59d5NxKwPe-8	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
19	2025-06-08 17:59:17.852	t	2025-06-08 18:01:17.852	0:0:0:0:0:0:0:1	2025-06-08 17:59:17.852	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDAxOTU3ODUyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDAxOTU3LCJleHAiOjE3NDk0MDIwNzd9.6rUGF-oT6CXGA6wdccAUVWfmKPod5957NpxpZdT3jps	1	PostmanRuntime/7.44.0	6
20	2025-06-08 18:00:46.024	t	2025-06-08 18:02:46.024	0:0:0:0:0:0:0:1	2025-06-08 18:00:46.024	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDAyMDQ2MDI0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDAyMDQ2LCJleHAiOjE3NDk0MDIxNjZ9.1blq4PwxEO4_N0HKoSR8egeXB1DG-tIhWPYW59YePKM	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
21	2025-06-08 19:25:11.157	f	2025-06-08 19:27:11.157	0:0:0:0:0:0:0:1	2025-06-08 19:25:11.157	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA3MTExMTU3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA3MTExLCJleHAiOjE3NDk0MDcyMzF9.zMMWkno-OPagZyBPPbV8wg26xPl5aoYOf9ZxNbqRaoE	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
22	2025-06-08 19:28:15.641	f	2025-06-08 19:30:15.641	0:0:0:0:0:0:0:1	2025-06-08 19:28:15.641	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA3Mjk1NjQxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA3Mjk1LCJleHAiOjE3NDk0MDc0MTV9.o3Hc1dOVRPCiYrrkYTyrUDqrDYhoGr72jb6JTfNrjPQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
23	2025-06-08 19:34:25.241	f	2025-06-08 19:36:25.241	0:0:0:0:0:0:0:1	2025-06-08 19:34:25.241	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA3NjY1MjQxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA3NjY1LCJleHAiOjE3NDk0MDc3ODV9.M7MQSZ6WYqKIvtDioxhII0ER5CKa17AW3Y1kcdcmBjs	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
24	2025-06-08 19:43:42.132	f	2025-06-08 19:45:42.132	0:0:0:0:0:0:0:1	2025-06-08 19:43:42.132	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA4MjIyMTMyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA4MjIyLCJleHAiOjE3NDk0MDgzNDJ9.fklS9LBY4Rk2jlyXS5Xi13oaIn8Mw17zd96-MMjBRLY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
25	2025-06-08 19:47:11.656	t	2025-06-08 19:49:11.656	0:0:0:0:0:0:0:1	2025-06-08 19:47:11.656	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA4NDMxNjU2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA4NDMxLCJleHAiOjE3NDk0MDg1NTF9.0fqNtkbqPyiWCHRKdjDRNCFXSZ8TVJM1cyCBUBN6Y34	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
26	2025-06-08 19:48:20.714	t	2025-06-08 19:50:20.714	0:0:0:0:0:0:0:1	2025-06-08 19:48:20.714	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA4NTAwNzE0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA4NTAwLCJleHAiOjE3NDk0MDg2MjB9.ZLBaThS3qagfc8-vdTAt5IKE50dlXEVSUd1lAuPJHOA	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
27	2025-06-08 19:49:28.73	f	2025-06-08 19:51:28.73	0:0:0:0:0:0:0:1	2025-06-08 19:49:28.73	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA4NTY4NzMwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA4NTY4LCJleHAiOjE3NDk0MDg2ODh9.0rAMr-nwWQsstNwkg-QZciKafQKNPh-OyRdfuOIowfc	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
28	2025-06-08 19:55:25.054	f	2025-06-08 19:57:25.054	0:0:0:0:0:0:0:1	2025-06-08 19:55:25.054	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDA4OTI1MDU0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImRhMzBlMzhiLWY5ZTgtNGMwZi1hNjJmLWI2YTZlOThkNmI2ZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDA4OTI1LCJleHAiOjE3NDk0MDkwNDV9.-zmJ0Z7HebVmkXv1_zo4GdShDuRA5HMS1n2dD-Qzmtk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
29	2025-06-08 20:49:35.652	f	2025-06-08 20:51:35.652	0:0:0:0:0:0:0:1	2025-06-08 20:49:35.652	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDEyMTc1NjUyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDEyMTc1LCJleHAiOjE3NDk0MTIyOTV9.TRseUspiSHJj-Zz4sGEW8jSzNALfrcmdtKACi6S3H1Q	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
30	2025-06-08 20:49:36	t	2025-06-08 20:51:36	0:0:0:0:0:0:0:1	2025-06-08 20:49:36	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDEyMTc2MDAwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDEyMTc2LCJleHAiOjE3NDk0MTIyOTZ9.IYK5DK7htBaeS-eLOxCfWyvypQh6-Fusktm8r8kbS48	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
31	2025-06-08 20:49:55.279	f	2025-06-08 20:51:55.279	0:0:0:0:0:0:0:1	2025-06-08 20:49:55.279	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDEyMTk1Mjc5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDEyMTk1LCJleHAiOjE3NDk0MTIzMTV9.ZXWZtO1huPjjUcgn2itSbXh05Y0vtBSYL9JMOH1_6tU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
32	2025-06-08 20:53:26.78	f	2025-06-08 20:55:26.78	0:0:0:0:0:0:0:1	2025-06-08 20:53:26.78	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDEyNDA2NzgwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDEyNDA2LCJleHAiOjE3NDk0MTI1MjZ9.fYfJxbX4k0utlRfPep4rqQe6LMgRJBts3sltD8p1rwI	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
33	2025-06-08 20:53:28.143	f	2025-06-08 20:55:28.143	0:0:0:0:0:0:0:1	2025-06-08 20:53:28.143	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDEyNDA4MTQzLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDEyNDA4LCJleHAiOjE3NDk0MTI1Mjh9.gIp5uqzjZNFBhhHpVwXj847SMfVrnK3cyvIq4mF_QiY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
34	2025-06-08 21:32:29.468	f	2025-06-08 21:34:29.468	0:0:0:0:0:0:0:1	2025-06-08 21:32:29.468	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE0NzQ5NDY4LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE0NzQ5LCJleHAiOjE3NDk0MTQ4Njl9.dfc3235O2tNGQjmC2vR1GLeMfO97kpejogI1Cn5W1BM	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
35	2025-06-08 21:35:51.386	f	2025-06-08 21:37:51.386	0:0:0:0:0:0:0:1	2025-06-08 21:35:51.386	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE0OTUxMzg2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE0OTUxLCJleHAiOjE3NDk0MTUwNzF9.rQlET-I2FqgDBiUcP14kQIWDXrSUHYkKS2XMj65KZwo	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
36	2025-06-08 21:35:52.766	f	2025-06-08 21:37:52.766	0:0:0:0:0:0:0:1	2025-06-08 21:35:52.766	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE0OTUyNzY2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE0OTUyLCJleHAiOjE3NDk0MTUwNzJ9.F7QYg2ClqvcBOcQa3pC31aJPzl_yzj8J6sFl-p1MLrU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
37	2025-06-08 21:49:53.817	f	2025-06-08 21:51:53.817	0:0:0:0:0:0:0:1	2025-06-08 21:49:53.817	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE1NzkzODE3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE1NzkzLCJleHAiOjE3NDk0MTU5MTN9.UdnsW9AS2_lM2xtitilF96wv9MCZQ8RIqlejBoDD2hI	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
38	2025-06-08 21:52:29.373	f	2025-06-08 21:54:29.373	0:0:0:0:0:0:0:1	2025-06-08 21:52:29.373	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE1OTQ5MzczLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE1OTQ5LCJleHAiOjE3NDk0MTYwNjl9.BpcnD5sBtP9FpLgG-i7gbKRnZsma7av_4JH1meRudgQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
39	2025-06-08 22:24:46.712	t	2025-06-08 22:26:46.712	0:0:0:0:0:0:0:1	2025-06-08 22:24:46.712	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE3ODg2NzEyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE3ODg2LCJleHAiOjE3NDk0MTgwMDZ9.7-ejex3VbTUtsN43i-1cM1v7IWAhdGDiKW8WeDGYUq0	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
40	2025-06-08 22:25:14.901	f	2025-06-08 22:27:14.901	0:0:0:0:0:0:0:1	2025-06-08 22:25:14.901	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE3OTE0OTAxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE3OTE0LCJleHAiOjE3NDk0MTgwMzR9.WBmcgnRixoEVet6s-UrpXv3OnSspfpOj_-7MK_mqf1s	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
41	2025-06-08 22:34:05.387	f	2025-06-08 22:36:05.387	0:0:0:0:0:0:0:1	2025-06-08 22:34:05.387	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE4NDQ1Mzg3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE4NDQ1LCJleHAiOjE3NDk0MTg1NjV9.NoXRHD7FnAzxgmQkHfKGNqaU4NZbo2i-_csaZRcHN3E	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
42	2025-06-08 22:34:06.889	f	2025-06-08 22:36:06.889	0:0:0:0:0:0:0:1	2025-06-08 22:34:06.889	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDE4NDQ2ODg5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjIzYWYxM2ViLWE3N2MtNGViYS04OGNiLWQ3MzRiZGE5MjM2ZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDE4NDQ2LCJleHAiOjE3NDk0MTg1NjZ9.f1_zavlxPiaxwYZBzgNUso3-qKau7Qx5CIPQWKoUL0E	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
43	2025-06-09 00:31:13.062	f	2025-06-09 00:33:13.062	0:0:0:0:0:0:0:1	2025-06-09 00:31:13.062	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI1NDczMDYyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI1NDczLCJleHAiOjE3NDk0MjU1OTN9.-N-vwDNw_Ylqe10QU-ZdbQeBMCBGsnbH-olRSZQ4R5w	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
44	2025-06-09 00:31:13.144	f	2025-06-09 00:33:13.144	0:0:0:0:0:0:0:1	2025-06-09 00:31:13.144	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI1NDczMTQ0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI1NDczLCJleHAiOjE3NDk0MjU1OTN9.7XeFTV9-2UoWJSaaZpEWeNXxCaxFdMOvPxpMDDkl8qk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
45	2025-06-09 00:40:54.556	f	2025-06-09 00:42:54.556	0:0:0:0:0:0:0:1	2025-06-09 00:40:54.556	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI2MDU0NTU2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI2MDU0LCJleHAiOjE3NDk0MjYxNzR9.zVOMdSs6M9yDMXLX_AIO1NpJyjc4-i2GZg6pdNKwtUY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
46	2025-06-09 00:43:38.751	f	2025-06-09 00:45:38.751	0:0:0:0:0:0:0:1	2025-06-09 00:43:38.751	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI2MjE4NzUxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI2MjE4LCJleHAiOjE3NDk0MjYzMzh9.qUdXQjHdKzDKwiXhPJ18DazcU71wI67-r7LaH1xQhqA	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
47	2025-06-09 00:46:07.311	f	2025-06-09 00:48:07.311	0:0:0:0:0:0:0:1	2025-06-09 00:46:07.311	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI2MzY3MzExLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI2MzY3LCJleHAiOjE3NDk0MjY0ODd9.ixwdY4kCiP7EAoCREyUshwW8Zc0toFJ6m623DwJ0gz8	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
48	2025-06-09 00:48:44.274	f	2025-06-09 00:50:44.274	0:0:0:0:0:0:0:1	2025-06-09 00:48:44.274	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI2NTI0Mjc0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI2NTI0LCJleHAiOjE3NDk0MjY2NDR9.bOhh5TAk3Rb0DAaLgK1bwPZPiqHB6Rl-1qwXGytexC8	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
49	2025-06-09 00:51:17.406	f	2025-06-09 00:53:17.406	0:0:0:0:0:0:0:1	2025-06-09 00:51:17.406	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI2Njc3NDA2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI2Njc3LCJleHAiOjE3NDk0MjY3OTd9.xmMEUiJWxN4cencXm8SM8hA_PmS5BH4WFGlgKzuwCus	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
50	2025-06-09 00:53:38.065	f	2025-06-09 00:55:38.065	0:0:0:0:0:0:0:1	2025-06-09 00:53:38.065	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI2ODE4MDY1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI2ODE4LCJleHAiOjE3NDk0MjY5Mzh9.jNsna3HHhgbaI3kIxAfsInoA3PazMYwelroqb_-tQO0	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
51	2025-06-09 00:53:38.742	f	2025-06-09 00:55:38.742	0:0:0:0:0:0:0:1	2025-06-09 00:53:38.742	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI2ODE4NzQyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI2ODE4LCJleHAiOjE3NDk0MjY5Mzh9.PhBKEwQc5KvLdK9GiOptv6nRT_iGER428La6wuxq2-M	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
52	2025-06-09 00:59:40.473	f	2025-06-09 01:01:40.473	0:0:0:0:0:0:0:1	2025-06-09 00:59:40.473	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI3MTgwNDczLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI3MTgwLCJleHAiOjE3NDk0MjczMDB9.JduHLKLkuuNvh9aNE3ItTSU7rYwRH6-81RG-YhJYrJY	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
53	2025-06-09 01:02:17.553	f	2025-06-09 01:04:17.553	0:0:0:0:0:0:0:1	2025-06-09 01:02:17.553	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI3MzM3NTUzLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI3MzM3LCJleHAiOjE3NDk0Mjc0NTd9.7pGZKR69ZVPyJtqYjdVc0yIwkn_jutZAztfk0mznVb0	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
54	2025-06-09 01:09:18.229	f	2025-06-09 01:11:18.229	0:0:0:0:0:0:0:1	2025-06-09 01:09:18.229	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI3NzU4MjI5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI3NzU4LCJleHAiOjE3NDk0Mjc4Nzh9.8zmVvbidVyB4nPyQsK8pfeHGy72CI8pVzznMQW_YdRI	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
55	2025-06-09 01:40:03.975	f	2025-06-09 01:42:03.975	0:0:0:0:0:0:0:1	2025-06-09 01:40:03.975	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI5NjAzOTc1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI5NjAzLCJleHAiOjE3NDk0Mjk3MjN9.UvMTQCuQhREvyJisyirrMPfyxehF1cVIiXqEbekYGEQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
56	2025-06-09 01:40:04.989	f	2025-06-09 01:42:04.989	0:0:0:0:0:0:0:1	2025-06-09 01:40:04.989	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDI5NjA0OTg5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImUzZWJiMGJhLTliYjEtNDY2YS04NjdiLTY5MWQ2MjM4MTI1NiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDI5NjA0LCJleHAiOjE3NDk0Mjk3MjR9.FScCBj2PNvygfdMnkfyFOr5HCJsCaBvK1XQaxuH3tbk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
57	2025-06-09 02:52:56.951	f	2025-06-09 02:54:56.951	0:0:0:0:0:0:0:1	2025-06-09 02:52:56.951	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDMzOTc2OTUxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjZkZjQ5YjRlLThhOTEtNDQzZi04OTY0LTcyNTU1YWQ5YzA5NSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDMzOTc2LCJleHAiOjE3NDk0MzQwOTZ9.7zm2pif1HBNvjnpxzxO7TC0ZCGAJf7oceOveEXt7Btk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
58	2025-06-09 02:52:57.976	f	2025-06-09 02:54:57.976	0:0:0:0:0:0:0:1	2025-06-09 02:52:57.976	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDMzOTc3OTc2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjZkZjQ5YjRlLThhOTEtNDQzZi04OTY0LTcyNTU1YWQ5YzA5NSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDMzOTc3LCJleHAiOjE3NDk0MzQwOTd9.qclMhtO2lSfG2WHWshsH-bmpRVAaO4IL7pbboTxd4A4	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
59	2025-06-09 03:00:04.394	f	2025-06-09 03:02:04.394	0:0:0:0:0:0:0:1	2025-06-09 03:00:04.394	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM0NDA0Mzk0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImFkYWViZjFkLTdiM2MtNGViOC05YWY5LWQ2MzI4MDU1YTYxMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM0NDA0LCJleHAiOjE3NDk0MzQ1MjR9.1HHNF49fKiKEk07ZqFyF9fP2I3dI9NTSKPZH49d5eec	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
60	2025-06-09 03:02:16.736	f	2025-06-09 03:04:16.736	0:0:0:0:0:0:0:1	2025-06-09 03:02:16.736	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM0NTM2NzM2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImQzZWZmYzIzLWE4MTAtNGIwZC1hOTMyLWFmMDU0MDQzMmMyOSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM0NTM2LCJleHAiOjE3NDk0MzQ2NTZ9.9d1SnBExjEEY2DqD8Lzm_JvmX6ZgsanwlKiGRCD6vow	1	PostmanRuntime/7.44.0	6
61	2025-06-09 03:03:16.29	f	2025-06-09 03:05:16.29	0:0:0:0:0:0:0:1	2025-06-09 03:03:16.29	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM0NTk2MjkwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6ImQzZWZmYzIzLWE4MTAtNGIwZC1hOTMyLWFmMDU0MDQzMmMyOSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM0NTk2LCJleHAiOjE3NDk0MzQ3MTZ9.yZApdAZH7-WaLTNe0-tsLMYMf9navjIMtrD7gPXL2oU	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
62	2025-06-09 03:04:46.062	f	2025-06-09 03:06:46.062	0:0:0:0:0:0:0:1	2025-06-09 03:04:46.062	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM0Njg2MDYyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImQzZWZmYzIzLWE4MTAtNGIwZC1hOTMyLWFmMDU0MDQzMmMyOSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM0Njg2LCJleHAiOjE3NDk0MzQ4MDZ9.OKPkE8AQYC6fN4TnHRaRh9rWSxQp4UYR_uMDPqndDjU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
63	2025-06-09 03:06:50.169	f	2025-06-09 03:08:50.169	0:0:0:0:0:0:0:1	2025-06-09 03:06:50.169	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM0ODEwMTY5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImMxMGJlMGI3LTAyNTgtNGNhNC05ZWRkLWEyYjIyNzNmNmYzZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM0ODEwLCJleHAiOjE3NDk0MzQ5MzB9.Pbx-Y4dyohN_Nq3uKDHieebVcNPQ-HaxvcQlWhXXXN4	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
64	2025-06-09 03:18:18.311	f	2025-06-09 03:20:18.311	0:0:0:0:0:0:0:1	2025-06-09 03:18:18.311	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM1NDk4MzExLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjQyNWU1NjE3LTBkMWUtNDIyZi1hZWYwLTNmOTRmYzNjYTQ1YyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM1NDk4LCJleHAiOjE3NDk0MzU2MTh9.MGXtOIxJKLlZo0R1boRfg_DH_F07sWplXS5zR2OfWBQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
65	2025-06-09 03:21:02.534	f	2025-06-09 03:23:02.534	0:0:0:0:0:0:0:1	2025-06-09 03:21:02.534	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM1NjYyNTM0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjQyNWU1NjE3LTBkMWUtNDIyZi1hZWYwLTNmOTRmYzNjYTQ1YyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM1NjYyLCJleHAiOjE3NDk0MzU3ODJ9.OuoTs1L0784UUNIkv2BfHoicsKDR1Hp1Wp0a7lm5_6E	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
66	2025-06-09 03:24:50.726	f	2025-06-09 03:26:50.726	0:0:0:0:0:0:0:1	2025-06-09 03:24:50.726	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM1ODkwNzI2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjQyNWU1NjE3LTBkMWUtNDIyZi1hZWYwLTNmOTRmYzNjYTQ1YyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM1ODkwLCJleHAiOjE3NDk0MzYwMTB9.0qFRrAyfDR3neulRJKNnX8DIlVOOqEeRLdn3FhuGT6g	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
67	2025-06-09 03:30:26.865	f	2025-06-09 03:32:26.865	0:0:0:0:0:0:0:1	2025-06-09 03:30:26.865	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM2MjI2ODY1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjQyNWU1NjE3LTBkMWUtNDIyZi1hZWYwLTNmOTRmYzNjYTQ1YyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM2MjI2LCJleHAiOjE3NDk0MzYzNDZ9.-aG7NowtH0d1CU2jPhyScA0rAJrorBvTKQ2-poy21pI	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
68	2025-06-09 03:33:05.516	f	2025-06-09 03:35:05.516	0:0:0:0:0:0:0:1	2025-06-09 03:33:05.516	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDM2Mzg1NTE2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjQyNWU1NjE3LTBkMWUtNDIyZi1hZWYwLTNmOTRmYzNjYTQ1YyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDM2Mzg1LCJleHAiOjE3NDk0MzY1MDV9.K8BNxohFsyUdv_5NDmHPetVANVyt_T01sOGzczdRSKc	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
69	2025-06-09 09:44:38.801	f	2025-06-09 09:46:38.801	0:0:0:0:0:0:0:1	2025-06-09 09:44:38.801	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU4Njc4ODAxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk5NmFiMGFjLTdmM2QtNDdjYi1iOGJjLTExMDFiYmJmZWY3NSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU4Njc4LCJleHAiOjE3NDk0NTg3OTh9.SHqI3WPX38lE9g_yKND2DRxApBU7SJWVbGvfJVLzXyc	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
70	2025-06-09 09:49:06.706	f	2025-06-09 09:51:06.706	0:0:0:0:0:0:0:1	2025-06-09 09:49:06.706	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU4OTQ2NzA2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjhmODAzNzc1LTY1OGMtNDUwNC05ODk2LWY4NWE2ZGFkY2YzMCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU4OTQ2LCJleHAiOjE3NDk0NTkwNjZ9.4dNYZN1Zjty4D8ldF6tBbTDNqOog5gzlLmBCLZM9KpE	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
71	2025-06-09 09:52:35.947	f	2025-06-09 09:54:35.947	0:0:0:0:0:0:0:1	2025-06-09 09:52:35.947	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5MTU1OTQ3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjhmODAzNzc1LTY1OGMtNDUwNC05ODk2LWY4NWE2ZGFkY2YzMCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5MTU1LCJleHAiOjE3NDk0NTkyNzV9.nh9W9kX1s47oJ-Vltz6sLw7eh3LkMMs27zT6j24E4s0	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
72	2025-06-09 09:58:01.649	f	2025-06-09 10:00:01.649	0:0:0:0:0:0:0:1	2025-06-09 09:58:01.649	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5NDgxNjQ5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjhmODAzNzc1LTY1OGMtNDUwNC05ODk2LWY4NWE2ZGFkY2YzMCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5NDgxLCJleHAiOjE3NDk0NTk2MDF9.S0YWMIiS9kWBJExlZiXKG_kKS_whBlng3a99InTEJBc	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
73	2025-06-09 10:00:08.637	f	2025-06-09 10:02:08.637	0:0:0:0:0:0:0:1	2025-06-09 10:00:08.637	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5NjA4NjM3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjYyMjY2N2QwLTZlMzYtNDZjNC04YjcxLTY5OGM5YzFlZjYzMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5NjA4LCJleHAiOjE3NDk0NTk3Mjh9.8sb2wfF5ytAfMwJxZXdGGpT5S04Ptd1_LrLa1nlwuHI	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
74	2025-06-09 10:00:09.706	f	2025-06-09 10:02:09.706	0:0:0:0:0:0:0:1	2025-06-09 10:00:09.706	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5NjA5NzA2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjYyMjY2N2QwLTZlMzYtNDZjNC04YjcxLTY5OGM5YzFlZjYzMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5NjA5LCJleHAiOjE3NDk0NTk3Mjl9.K60Tgeay1Qej9g1sy_e7pGYixy3Jy-zVrgifVptfNio	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
75	2025-06-09 10:02:08.797	f	2025-06-09 10:04:08.797	0:0:0:0:0:0:0:1	2025-06-09 10:02:08.797	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5NzI4Nzk3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjYyMjY2N2QwLTZlMzYtNDZjNC04YjcxLTY5OGM5YzFlZjYzMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5NzI4LCJleHAiOjE3NDk0NTk4NDh9.qTW0TfIur3_0JRIsz2BoccXOqbIa73ZCj97bCchO7D4	1	PostmanRuntime/7.44.0	6
76	2025-06-09 10:05:30.091	f	2025-06-09 10:07:30.091	0:0:0:0:0:0:0:1	2025-06-09 10:05:30.091	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5OTMwMDkxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjlmMzBhMDRhLTE4YWEtNGVmZS04NjBiLTg5ZTNjOTk2OGVkZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5OTMwLCJleHAiOjE3NDk0NjAwNTB9.3SGD35DxBREw3IT-vBf5wKwXlPUIC5rEOFZC4cQ30Lg	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
77	2025-06-09 10:05:30.091	f	2025-06-09 10:07:30.091	0:0:0:0:0:0:0:1	2025-06-09 10:05:30.091	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5OTMwMDkxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjlmMzBhMDRhLTE4YWEtNGVmZS04NjBiLTg5ZTNjOTk2OGVkZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5OTMwLCJleHAiOjE3NDk0NjAwNTB9.3SGD35DxBREw3IT-vBf5wKwXlPUIC5rEOFZC4cQ30Lg	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
78	2025-06-09 10:05:36.105	f	2025-06-09 10:07:36.105	0:0:0:0:0:0:0:1	2025-06-09 10:05:36.105	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDU5OTM2MTA1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6IjlmMzBhMDRhLTE4YWEtNGVmZS04NjBiLTg5ZTNjOTk2OGVkZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDU5OTM2LCJleHAiOjE3NDk0NjAwNTZ9.j-w92Zht1jFoqtLEgE-zbG7to5RLIVmwOFSCHo0brWg	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
79	2025-06-09 10:20:15.978	f	2025-06-09 10:22:15.978	0:0:0:0:0:0:0:1	2025-06-09 10:20:15.978	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDYwODE1OTc4LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjlmMzBhMDRhLTE4YWEtNGVmZS04NjBiLTg5ZTNjOTk2OGVkZiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDYwODE1LCJleHAiOjE3NDk0NjA5MzV9.6qHdI2a4jCT3sp7TZnDFRWGqgt0vgiWgZiTV3pDUjuw	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
80	2025-06-09 10:23:03.604	f	2025-06-09 10:25:03.604	0:0:0:0:0:0:0:1	2025-06-09 10:23:03.604	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDYwOTgzNjA0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjNlODlkZjUxLWYzN2MtNDA1OS1iZGU3LWIwMjQwYzU5NGJhZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDYwOTgzLCJleHAiOjE3NDk0NjExMDN9.GpW4vQAv4qbjFfZJOYBkYQ1fQmQAzT54XPb6xKeeG2g	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
81	2025-06-09 10:56:11.377	f	2025-06-09 10:58:11.377	0:0:0:0:0:0:0:1	2025-06-09 10:56:11.377	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDYyOTcxMzc3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDYyOTcxLCJleHAiOjE3NDk0NjMwOTF9.EoVjtAWfkciwDhhZJHjkd7DW32eEYzSd4zZl4fc108g	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
82	2025-06-09 11:03:15.471	f	2025-06-09 11:05:15.471	0:0:0:0:0:0:0:1	2025-06-09 11:03:15.471	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDYzMzk1NDcxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDYzMzk1LCJleHAiOjE3NDk0NjM1MTV9.VUDMGg1ecPqiIJ3YkG_dHLVS1Jg9tf2V9ZfdPQg0tjo	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
83	2025-06-09 11:07:16.651	f	2025-06-09 11:09:16.651	0:0:0:0:0:0:0:1	2025-06-09 11:07:16.651	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDYzNjM2NjUxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDYzNjM2LCJleHAiOjE3NDk0NjM3NTZ9.OtkIPrwiias7C2xhyRrspzTw3Z_6AmCqrMic0MwCDYg	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
84	2025-06-09 11:15:08.642	f	2025-06-09 11:17:08.642	0:0:0:0:0:0:0:1	2025-06-09 11:15:08.642	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY0MTA4NjQyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY0MTA4LCJleHAiOjE3NDk0NjQyMjh9.dozpmQ_tuZSHU1Cw4gMYvBE5XHW2uWik9szguS8bb34	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
85	2025-06-09 11:15:10.131	f	2025-06-09 11:17:10.131	0:0:0:0:0:0:0:1	2025-06-09 11:15:10.131	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY0MTEwMTMxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY0MTEwLCJleHAiOjE3NDk0NjQyMzB9.zJ_AxP7McuKMKX_pEGePVQEMY_zdV0Y24KzGURDTcB4	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
86	2025-06-09 11:17:32.007	f	2025-06-09 11:19:32.007	0:0:0:0:0:0:0:1	2025-06-09 11:17:32.007	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY0MjUyMDA3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY0MjUyLCJleHAiOjE3NDk0NjQzNzJ9.c60mV51u1ykiBQAsYyql8_zrIRnL_Er9YhACrzMHT0A	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
87	2025-06-09 11:19:27.499	f	2025-06-09 11:21:27.499	0:0:0:0:0:0:0:1	2025-06-09 11:19:27.499	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY0MzY3NDk5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY0MzY3LCJleHAiOjE3NDk0NjQ0ODd9.PJE4ZsmImf2z8FXJRzVgYlPgKxljWLu8jWcWUad46EA	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
88	2025-06-09 11:23:25.275	f	2025-06-09 11:25:25.275	0:0:0:0:0:0:0:1	2025-06-09 11:23:25.275	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY0NjA1Mjc1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY0NjA1LCJleHAiOjE3NDk0NjQ3MjV9.PpDAv3UgpdleXd8xYU3jntOja5ZfQ8plkaoqwqFOVfU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
89	2025-06-09 11:26:40.267	f	2025-06-09 11:28:40.267	0:0:0:0:0:0:0:1	2025-06-09 11:26:40.267	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY0ODAwMjY3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY0ODAwLCJleHAiOjE3NDk0NjQ5MjB9.Tfo-3u6_u5pDuG38htTaIkeiAAZrcktUFz3U5qpzvNY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
90	2025-06-09 11:28:55.554	f	2025-06-09 11:30:55.554	0:0:0:0:0:0:0:1	2025-06-09 11:28:55.554	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY0OTM1NTU0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY0OTM1LCJleHAiOjE3NDk0NjUwNTV9.SI6Dymx_vWxgYTZzHolsPjMYZRbS1GQBe9dIpqIYDGk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
91	2025-06-09 11:31:22.056	t	2025-06-09 11:33:22.056	0:0:0:0:0:0:0:1	2025-06-09 11:31:22.056	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDY1MDgyMDU2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImYzYjNmYTQwLWY4YjktNDBiOC05ZmQyLWZkMTI4ZjRhNGIwNiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDY1MDgyLCJleHAiOjE3NDk0NjUyMDJ9.Ry-A3cbhItsr67bir3zrvOle28df_xKh8iIPVzSHCWo	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
92	2025-06-09 14:41:20.787	f	2025-06-09 14:43:20.787	0:0:0:0:0:0:0:1	2025-06-09 14:41:20.787	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDc2NDgwNzg3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk2MmZhNzliLTY0NGMtNGJiYi1hNjQ2LTRjZTgzODZjZDc3ZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDc2NDgwLCJleHAiOjE3NDk0NzY2MDB9.0_BxzLMLyHuDc-aNCC-XxSBY2oSoPpxfOvvwVMkeTF0	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
93	2025-06-09 14:58:07.106	f	2025-06-09 15:00:07.106	0:0:0:0:0:0:0:1	2025-06-09 14:58:07.106	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDc3NDg3MTA2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk2MmZhNzliLTY0NGMtNGJiYi1hNjQ2LTRjZTgzODZjZDc3ZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDc3NDg3LCJleHAiOjE3NDk0Nzc2MDd9.VNCgHtCgt0MOPDRsMDrMLWBMOfyP54_WIuGN4Z6lZwQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
94	2025-06-09 15:01:05.717	f	2025-06-09 15:03:05.717	0:0:0:0:0:0:0:1	2025-06-09 15:01:05.717	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDc3NjY1NzE3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk2MmZhNzliLTY0NGMtNGJiYi1hNjQ2LTRjZTgzODZjZDc3ZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDc3NjY1LCJleHAiOjE3NDk0Nzc3ODV9._pvabheCyWd9HuWGEu941PDMU-LIYSQNySZ4V3nB4YU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
95	2025-06-09 15:07:28.204	f	2025-06-09 15:09:28.204	0:0:0:0:0:0:0:1	2025-06-09 15:07:28.204	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDc4MDQ4MjA0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk2MmZhNzliLTY0NGMtNGJiYi1hNjQ2LTRjZTgzODZjZDc3ZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDc4MDQ4LCJleHAiOjE3NDk0NzgxNjh9.6RmcTYUE5j_RVJ1KsmydYrFmDKFVtoSRdEjwu32jKMs	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
96	2025-06-09 16:42:04.269	f	2025-06-09 16:44:04.269	0:0:0:0:0:0:0:1	2025-06-09 16:42:04.269	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDgzNzI0MjY5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk2MmZhNzliLTY0NGMtNGJiYi1hNjQ2LTRjZTgzODZjZDc3ZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDgzNzI0LCJleHAiOjE3NDk0ODM4NDR9.fOOqBZXTr5a2sYzQ6IcPgyBGHkgtD38Gv2z8RjMjegA	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
97	2025-06-09 16:52:16.701	f	2025-06-09 16:54:16.701	0:0:0:0:0:0:0:1	2025-06-09 16:52:16.701	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg0MzM2NzAxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk2MmZhNzliLTY0NGMtNGJiYi1hNjQ2LTRjZTgzODZjZDc3ZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg0MzM2LCJleHAiOjE3NDk0ODQ0NTZ9.Q82ZSPuMBZN7OPt-UClcMXP0scozmgVCnrLwPc2t_Zk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
98	2025-06-09 17:20:57.633	f	2025-06-09 17:22:57.633	0:0:0:0:0:0:0:1	2025-06-09 17:20:57.633	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg2MDU3NjMzLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk2MmZhNzliLTY0NGMtNGJiYi1hNjQ2LTRjZTgzODZjZDc3ZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg2MDU3LCJleHAiOjE3NDk0ODYxNzd9.ZbD0H9o_aHFi26v2xAE4RGy6ZzLU9GzYrmnzVEa5Rgc	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
99	2025-06-09 17:25:21.015	f	2025-06-09 17:27:21.015	0:0:0:0:0:0:0:1	2025-06-09 17:25:21.015	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg2MzIxMDE1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6ImNmNGVhYjk2LWMwMmEtNDVmMi1iZDFhLTY2OTcyNzFhMmNlNSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg2MzIxLCJleHAiOjE3NDk0ODY0NDF9.2diX0MLjFd1zuXPcUEGBMjjYFF3cpJWfpyo2OSaPvcI	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
100	2025-06-09 17:25:21.3	f	2025-06-09 17:27:21.3	0:0:0:0:0:0:0:1	2025-06-09 17:25:21.3	IOS	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg2MzIxMzAwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoaVBob25lOyBDUFUgaVBob25lIE9TIDE2XzYgbGlrZSBNYWMgT1MgWCkgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE2LjYgTW9iaWxlLzE1RTE0OCBTYWZhcmkvNjA0LjEiLCJwbGF0Zm9ybSI6IklPUyIsImp0aSI6ImNmNGVhYjk2LWMwMmEtNDVmMi1iZDFhLTY2OTcyNzFhMmNlNSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg2MzIxLCJleHAiOjE3NDk0ODY0NDF9.cUoTdPRPpYMxHhOWNOevTT6sSYAtYWyz7JeCY_VP7Vw	1	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	6
101	2025-06-09 17:27:33.955	f	2025-06-09 17:29:33.955	0:0:0:0:0:0:0:1	2025-06-09 17:27:33.955	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg2NDUzOTU1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImNmNGVhYjk2LWMwMmEtNDVmMi1iZDFhLTY2OTcyNzFhMmNlNSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg2NDUzLCJleHAiOjE3NDk0ODY1NzN9.JT03k_Tv9Onb6I7lNvQFQvxLNiaZCNoSQeMbGPPErnI	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
102	2025-06-09 17:36:35.235	f	2025-06-09 17:38:35.235	0:0:0:0:0:0:0:1	2025-06-09 17:36:35.235	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg2OTk1MjM1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImNmNGVhYjk2LWMwMmEtNDVmMi1iZDFhLTY2OTcyNzFhMmNlNSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg2OTk1LCJleHAiOjE3NDk0ODcxMTV9.gZNN72jVmMcvS4fxRTp-5GltslNqeLTtXQ5VXoo0Y08	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
103	2025-06-09 17:36:36.495	f	2025-06-09 17:38:36.495	0:0:0:0:0:0:0:1	2025-06-09 17:36:36.495	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg2OTk2NDk1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImNmNGVhYjk2LWMwMmEtNDVmMi1iZDFhLTY2OTcyNzFhMmNlNSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg2OTk2LCJleHAiOjE3NDk0ODcxMTZ9.wtAfIUMGoe6hQX0h-kyhq2Oz85Kwyw0sDduV73MzvqU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
104	2025-06-09 17:39:09.524	f	2025-06-09 17:41:09.524	0:0:0:0:0:0:0:1	2025-06-09 17:39:09.524	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg3MTQ5NTI0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjBkNWUzY2Q1LTUxZjQtNGI2MS1iOGU2LTI4OTI0ZDkxM2FjMCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg3MTQ5LCJleHAiOjE3NDk0ODcyNjl9.kZnBJHIP1mihBuZmOikRW7MGQmw0wkmgZQvxcMXqMOc	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
105	2025-06-09 17:42:10.821	f	2025-06-09 17:44:10.821	0:0:0:0:0:0:0:1	2025-06-09 17:42:10.821	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg3MzMwODIxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjBkNWUzY2Q1LTUxZjQtNGI2MS1iOGU2LTI4OTI0ZDkxM2FjMCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg3MzMwLCJleHAiOjE3NDk0ODc0NTB9.2BDV4QqwsZ3cukIf38YWvV7Z9hmdwPl2-wDtFeDxges	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
106	2025-06-09 17:46:30.938	f	2025-06-09 17:48:30.938	0:0:0:0:0:0:0:1	2025-06-09 17:46:30.938	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg3NTkwOTM4LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjBkNWUzY2Q1LTUxZjQtNGI2MS1iOGU2LTI4OTI0ZDkxM2FjMCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg3NTkwLCJleHAiOjE3NDk0ODc3MTB9.M3vJtcAQDDHX38hHDUTkrE6Hgy9OjSpFnaap3Qc35No	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
107	2025-06-09 17:54:36.996	f	2025-06-09 17:56:36.996	0:0:0:0:0:0:0:1	2025-06-09 17:54:36.996	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg4MDc2OTk2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjY0ZDgzY2Q1LWZhZjktNGZhNy1hNjMzLTZlYWU2YjIwZDRhZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg4MDc2LCJleHAiOjE3NDk0ODgxOTZ9.ThPcAvYIobTGIDDj5DYvLkol2jCyg3R5r9-aalvjwWk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
108	2025-06-09 17:54:37.092	f	2025-06-09 17:56:37.092	0:0:0:0:0:0:0:1	2025-06-09 17:54:37.092	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg4MDc3MDkyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjY0ZDgzY2Q1LWZhZjktNGZhNy1hNjMzLTZlYWU2YjIwZDRhZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg4MDc3LCJleHAiOjE3NDk0ODgxOTd9.aUpNEb3rYaNN8ETqh-ZSRYms0Gj03UcdnCrecCieO7o	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
109	2025-06-09 17:57:07.674	f	2025-06-09 17:59:07.674	0:0:0:0:0:0:0:1	2025-06-09 17:57:07.674	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg4MjI3Njc0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjY0ZDgzY2Q1LWZhZjktNGZhNy1hNjMzLTZlYWU2YjIwZDRhZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg4MjI3LCJleHAiOjE3NDk0ODgzNDd9.FbkcErYFi9KPldfYhdgpdHiWP-MyXS1XWGHbjJs2LZY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
110	2025-06-09 17:59:14.644	f	2025-06-09 18:01:14.644	0:0:0:0:0:0:0:1	2025-06-09 17:59:14.644	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg4MzU0NjQ0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjY0ZDgzY2Q1LWZhZjktNGZhNy1hNjMzLTZlYWU2YjIwZDRhZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg4MzU0LCJleHAiOjE3NDk0ODg0NzR9.vHR3ONE0zhJ6lLTFzcCBkhlS8abGWTc27XE_S30S1UA	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
111	2025-06-09 18:02:04.385	f	2025-06-09 18:04:04.385	0:0:0:0:0:0:0:1	2025-06-09 18:02:04.385	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg4NTI0Mzg1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjY0ZDgzY2Q1LWZhZjktNGZhNy1hNjMzLTZlYWU2YjIwZDRhZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg4NTI0LCJleHAiOjE3NDk0ODg2NDR9.G6YZYi02xtImVPzpOHyUrjUbjPV1KyRXSbGexSEdlIA	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
112	2025-06-09 18:06:30.622	t	2025-06-10 18:06:30.622	0:0:0:0:0:0:0:1	2025-06-09 18:06:30.622	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDg4NzkwNjIyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjU1NzY3MzdhLWM1MmEtNGQ3Zi1iNjFjLWQzOTVkYTE3YjEzYSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDg4NzkwLCJleHAiOjE3NDk1NzUxOTB9.4nSpceSU1EBg92hBHEw5nbHgbQePICNVJU7rqOjfAkk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
113	2025-06-09 18:36:12.88	t	2025-06-10 18:36:12.88	0:0:0:0:0:0:0:1	2025-06-09 18:36:12.88	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDkwNTcyODgwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjU1NzY3MzdhLWM1MmEtNGQ3Zi1iNjFjLWQzOTVkYTE3YjEzYSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDkwNTcyLCJleHAiOjE3NDk1NzY5NzJ9.MEJoJOwqinNjiod0hIqgjnPNDK8Xt0B9AcN_qL_XjhY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
115	2025-06-09 22:10:36.861	t	2025-06-10 22:10:36.861	0:0:0:0:0:0:0:1	2025-06-09 22:10:36.861	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTAzNDM2ODYxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImFmOTYzYTgzLWY2ZGQtNGNmOC1iYjY0LWIzM2I1ZTg3ODg3YyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTAzNDM2LCJleHAiOjE3NDk1ODk4MzZ9.LoZjzytZKcNNQ_5qZVVv3BhrRjfkH_KEtXCxye1v0JU	1	PostmanRuntime/7.44.0	6
116	2025-06-09 22:12:40.011	t	2025-06-10 22:12:40.011	0:0:0:0:0:0:0:1	2025-06-09 22:12:40.011	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTAzNTYwMDExLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImFmOTYzYTgzLWY2ZGQtNGNmOC1iYjY0LWIzM2I1ZTg3ODg3YyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWluMUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTUwMzU2MCwiZXhwIjoxNzQ5NTg5OTYwfQ.EEf_0kWEhXr85O-QLzrPsxupzs2KThQsPRY77VyXxIk	1	PostmanRuntime/7.44.0	7
117	2025-06-09 22:22:10.266	f	2025-06-10 22:22:10.266	0:0:0:0:0:0:0:1	2025-06-09 22:22:10.266	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTA0MTMwMjY2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjJkMjUwMjNlLTYyZDItNDYwZC04YjM1LTFlZWZiMjI5OTBhOCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWluMUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTUwNDEzMCwiZXhwIjoxNzQ5NTkwNTMwfQ.VQMQnbARZtTchAZ-hcewVmsZBBjhfN1I3MkFSTFMBiU	1	PostmanRuntime/7.44.0	7
118	2025-06-09 22:22:47.61	f	2025-06-10 22:22:47.61	0:0:0:0:0:0:0:1	2025-06-09 22:22:47.61	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTA0MTY3NjEwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjJkMjUwMjNlLTYyZDItNDYwZC04YjM1LTFlZWZiMjI5OTBhOCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTA0MTY3LCJleHAiOjE3NDk1OTA1Njd9.nbKwHD_4--3oIgCZquTc7pGqH6YJ3itLQTNdBnEDK9k	1	PostmanRuntime/7.44.0	6
119	2025-06-09 22:23:22.249	f	2025-06-10 22:23:22.249	0:0:0:0:0:0:0:1	2025-06-09 22:23:22.249	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTA0MjAyMjQ5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjJkMjUwMjNlLTYyZDItNDYwZC04YjM1LTFlZWZiMjI5OTBhOCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWluMUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTUwNDIwMiwiZXhwIjoxNzQ5NTkwNjAyfQ.Lz7x8epKLY3dM7gnTn2ueOkl1Xc_Uh_vBUY7jOcrkQ4	1	PostmanRuntime/7.44.0	7
120	2025-06-09 22:35:54.851	f	2025-06-10 22:35:54.851	0:0:0:0:0:0:0:1	2025-06-09 22:35:54.851	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTA0OTU0ODUxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjA0MzQyOWFjLWU5ODctNGYyMi1hNTU4LTFmZjg5ZWVlMDliYyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTA0OTU0LCJleHAiOjE3NDk1OTEzNTR9.AexZd6JT4lZ7Mpg-L2aHm3Qe27pluRGcZ4qpf916NTU	1	PostmanRuntime/7.44.0	6
114	2025-06-09 20:14:18.013	t	2025-06-10 20:14:18.013	0:0:0:0:0:0:0:1	2025-06-09 20:14:18.013	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NDk2NDU4MDEzLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjljZWRlMDZlLTQ2N2MtNGRkYi1hMWExLTYxM2ZmZTYwMmZjZSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NDk2NDU4LCJleHAiOjE3NDk1ODI4NTh9.IqwRFxe-DqCH7BwGFsb_jiG6ZHgTVUvF47ynQpBsf2E	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
121	2025-06-09 23:41:53.541	f	2025-06-10 23:41:53.541	0:0:0:0:0:0:0:1	2025-06-09 23:41:53.541	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTA4OTEzNTQxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk0OGY0N2NmLTEwYTMtNGNlYS05NDM5LWVmYTY2YjA1OTRhYSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTA4OTEzLCJleHAiOjE3NDk1OTUzMTN9.R7oMwPnewEGf_RNGLZcxkj6sF_iP4AXHpZcHTyGBsfQ	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
123	2025-06-09 23:42:41.69	f	2025-06-10 23:42:41.69	0:0:0:0:0:0:0:1	2025-06-09 23:42:41.69	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTA4OTYxNjkwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJQb3N0bWFuUnVudGltZS83LjQ0LjAiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk0OGY0N2NmLTEwYTMtNGNlYS05NDM5LWVmYTY2YjA1OTRhYSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTA4OTYxLCJleHAiOjE3NDk1OTUzNjF9.zmq0o8cecCXCWyGLWPllUsnvqmEUMPXRO5SlQocpjUk	1	PostmanRuntime/7.44.0	6
122	2025-06-09 23:42:08.355	t	2025-06-10 23:42:08.355	0:0:0:0:0:0:0:1	2025-06-09 23:42:08.355	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTA4OTI4MzU1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijk0OGY0N2NmLTEwYTMtNGNlYS05NDM5LWVmYTY2YjA1OTRhYSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTA4OTI4LCJleHAiOjE3NDk1OTUzMjh9.gvsClft9p7e0dDwW_0oJoDFDGNLN9XMH6WxSKpK5CEo	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
124	2025-06-10 01:23:50.799	t	2025-06-11 01:23:50.799	0:0:0:0:0:0:0:1	2025-06-10 01:23:50.799	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE1MDMwNzk5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWluMUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTUxNTAzMCwiZXhwIjoxNzQ5NjAxNDMwfQ.-fhHBWEz7e5OcglNkStZvrQ8TFVDY7LoHFL7COIi4vo	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	7
125	2025-06-10 01:29:01.215	t	2025-06-11 01:29:01.215	0:0:0:0:0:0:0:1	2025-06-10 01:29:01.215	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE1MzQxMjE1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTE1MzQxLCJleHAiOjE3NDk2MDE3NDF9.fzj-89rEFz2XgKDYzh85tbYLTgl-c7s5yCDeC9Hr0dw	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
126	2025-06-10 01:43:25.366	t	2025-06-11 01:43:25.366	0:0:0:0:0:0:0:1	2025-06-10 01:43:25.366	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE2MjA1MzY2LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWluMUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTUxNjIwNSwiZXhwIjoxNzQ5NjAyNjA1fQ.guoFXddoOmAIW6sZFQSe5M60jba7TKVH7XKOGC6KS-s	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	7
127	2025-06-10 01:44:01.479	t	2025-06-11 01:44:01.479	0:0:0:0:0:0:0:1	2025-06-10 01:44:01.479	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE2MjQxNDc5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTE2MjQxLCJleHAiOjE3NDk2MDI2NDF9.Hds-pk8SrZnZZwCb5Oc-NP29cHiEGHHWqeF0czOlcKY	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
128	2025-06-10 02:01:34.979	t	2025-06-11 02:01:34.979	0:0:0:0:0:0:0:1	2025-06-10 02:01:34.979	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE3Mjk0OTc5LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTE3Mjk0LCJleHAiOjE3NDk2MDM2OTR9.4pvGGtvRnQLvmAP29ULIXa53eGc7YzvDsWt37dczugk	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
129	2025-06-10 02:03:24.953	t	2025-06-11 02:03:24.953	0:0:0:0:0:0:0:1	2025-06-10 02:03:24.953	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE3NDA0OTUzLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWluMUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTUxNzQwNCwiZXhwIjoxNzQ5NjAzODA0fQ.hlxZ7TavVSACTYKlw4d5DJweUu4zCcMl9lW-5QEtzcU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	7
130	2025-06-10 02:06:37.472	t	2025-06-11 02:06:37.472	0:0:0:0:0:0:0:1	2025-06-10 02:06:37.472	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE3NTk3NDcyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTE3NTk3LCJleHAiOjE3NDk2MDM5OTd9.y24lorhmiI1HcjqxoFBZ9U0zbjFnzocWOM2smVFNYmU	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
131	2025-06-10 02:16:11.857	t	2025-06-11 02:16:11.857	0:0:0:0:0:0:0:1	2025-06-10 02:16:11.857	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE4MTcxODU3LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTE4MTcxLCJleHAiOjE3NDk2MDQ1NzF9.nv0SmvUtdscfzQfWv3vVfTK-ObnKauS4IorMGqTTeIE	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
132	2025-06-10 02:31:14.905	t	2025-06-11 02:31:14.905	0:0:0:0:0:0:0:1	2025-06-10 02:31:14.905	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTE5MDc0OTA1LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6ImU1ZmI0NGJjLWQ4ZTQtNDNjMC1hYTkxLTFmMDFhYWQ5MjRhMSIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTE5MDc0LCJleHAiOjE3NDk2MDU0NzR9.zx7h73Ry2i-AXPMCxt9Dj3dy12rySQxSiONG1n0jx_c	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
133	2025-06-10 07:12:16.08	t	2025-06-11 07:12:16.08	0:0:0:0:0:0:0:1	2025-06-10 07:12:16.08	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTM1OTM2MDgwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijc2ZWRmZWQ0LWFmZTctNGNiNy04ODgzLWI2Zjg4YTM0MjMwZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWluMUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTUzNTkzNiwiZXhwIjoxNzQ5NjIyMzM2fQ.Qyu85UVnNrAiETR4fua_I-7Sp6F9KtXjd5cjPSnm_f4	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	7
134	2025-06-10 07:12:41.93	t	2025-06-11 07:12:41.93	0:0:0:0:0:0:0:1	2025-06-10 07:12:41.93	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTM1OTYxOTMwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijc2ZWRmZWQ0LWFmZTctNGNiNy04ODgzLWI2Zjg4YTM0MjMwZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTM1OTYxLCJleHAiOjE3NDk2MjIzNjF9.8dsVUeymdSrnbQzUQ6NMSvqUjnOBVI2OzjA3Nny4LTA	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
135	2025-06-10 10:06:46.658	t	2025-06-11 10:06:46.658	0:0:0:0:0:0:0:1	2025-06-10 10:06:46.658	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTQ2NDA2NjU4LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijc2ZWRmZWQ0LWFmZTctNGNiNy04ODgzLWI2Zjg4YTM0MjMwZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImFkbWludGVzdEBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTU0NjQwNiwiZXhwIjoxNzQ5NjMyODA2fQ.GMny9FfJHw-qUrigo2M8rAZmClbYHWxMfuAalcfVQ28	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	16
136	2025-06-10 10:07:16.404	f	2025-06-11 10:07:16.404	0:0:0:0:0:0:0:1	2025-06-10 10:07:16.404	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTQ2NDM2NDA0LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6Ijc2ZWRmZWQ0LWFmZTctNGNiNy04ODgzLWI2Zjg4YTM0MjMwZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTQ2NDM2LCJleHAiOjE3NDk2MzI4MzZ9.OC9291RkWVmXDB_CO5xO2gDJ2rKZiDPT8cfi8Jchg2g	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
137	2025-06-10 15:09:59.09	t	2025-06-11 15:09:59.09	0:0:0:0:0:0:0:1	2025-06-10 15:09:59.09	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTY0NTk5MDkwLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjAwMDc2YzliLWRmZjQtNGU2ZS1iOWEyLTY4MTBjMDdmOTg3YiIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImxhaGxhbWloYXNzYW41N0BnbWFpbC5jb20iLCJpYXQiOjE3NDk1NjQ1OTksImV4cCI6MTc0OTY1MDk5OX0.gEREDAQyl8LsekdPtEgqBeNjlQiUhW6XhppdeH1WB00	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	19
138	2025-06-10 15:44:47.972	t	2025-06-11 15:44:47.972	0:0:0:0:0:0:0:1	2025-06-10 15:44:47.972	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTY2Njg3OTcyLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjJhOWFkNDdhLTNhNGYtNDEwOC1iMzc4LTg4MTA5NTZlMDY3MCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImxhaGxhbWloYXNzYW41N0BnbWFpbC5jb20iLCJpYXQiOjE3NDk1NjY2ODcsImV4cCI6MTc0OTY1MzA4N30.hwvcFtNjFUlHapR2DwDnsoRzzYZbzZTMKAvnoNRAtS4	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	19
139	2025-06-10 15:48:23.088	t	2025-06-11 15:48:23.088	0:0:0:0:0:0:0:1	2025-06-10 15:48:23.088	WEB	t	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTY2OTAzMDg4LCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjJhOWFkNDdhLTNhNGYtNDEwOC1iMzc4LTg4MTA5NTZlMDY3MCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6InN1cGVyYWRtaW4xQGV4YW1wbGUuY29tIiwiaWF0IjoxNzQ5NTY2OTAzLCJleHAiOjE3NDk2NTMzMDN9.YwWCs2vIZ6G7YdoL6Sm_MHKkftdPu_iIqpqoM28Z4Z0	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	6
140	2025-06-10 15:49:40.871	f	2025-06-11 15:49:40.871	0:0:0:0:0:0:0:1	2025-06-10 15:49:40.871	WEB	f	eyJhbGciOiJIUzI1NiJ9.eyJsYXN0VXNlZEF0IjoxNzQ5NTY2OTgwODcxLCJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJ1c2VyQWdlbnQiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTM3LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJwbGF0Zm9ybSI6IldFQiIsImp0aSI6IjJhOWFkNDdhLTNhNGYtNDEwOC1iMzc4LTg4MTA5NTZlMDY3MCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCIsInN1YiI6ImxhaGxhbWloYXNzYW41N0BnbWFpbC5jb20iLCJpYXQiOjE3NDk1NjY5ODAsImV4cCI6MTc0OTY1MzM4MH0.ywKfqv6FnDVVHsiWyvq012PdMM4TA3wCrQLukAdtr1Q	1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	19
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_type, id, createdat, deletedat, email, firstname, lastname, password, phone, updatedat, username, role, job, valid, recoverypasswordtoken, recoverypasswordtokenexpirationtime, code, isrecoverypasswordtokenverified) FROM stdin;
EMPLOYEE	6	2025-06-08 12:34:34.8651	\N	superadmin1@example.com	John	Doe	$2a$12$bBFBtBbni6bmybXA1gL9/e2AtFDDlptVhDbk..A/M8QMXFyU1dA1G	+1000000001	2025-06-08 12:34:34.8651	superadmin1	0	\N	\N	\N	\N	\N	f
EMPLOYEE	7	2025-06-08 12:34:35.476535	\N	admin1@example.com	Jane	Smith	$2a$12$vaYj85i7i0yUaXOMEPBbfuQCD4aWpwTEEQ12Wow/DssKnM7c737vu	+1000000002	2025-06-08 12:34:35.476535	admin1	1	\N	\N	\N	\N	\N	f
EMPLOYEE	8	2025-06-08 12:34:35.873421	\N	agent1@example.com	Alice	Johnson	$2a$12$s3gBp4EzZxlTQQOfst.q1eB6u6JNV/gne07PNMLUaahPDBm9XNQd2	+1000000003	2025-06-08 12:34:35.873421	agent1	2	\N	\N	\N	\N	\N	f
EMPLOYEE	9	2025-06-08 12:34:36.405458	\N	superadmin2@example.com	Bob	Williams	$2a$12$8v/ZHc/ri3AaPV0K1R7s.er0pQClerNVzGP3AFCuYa65Nd.71QNFa	+1000000004	2025-06-08 12:34:36.405458	superadmin2	0	\N	\N	\N	\N	\N	f
EMPLOYEE	10	2025-06-08 12:34:36.798689	\N	admin2@example.com	Emma	Brown	$2a$12$bUxsKZl1q5c/X0GIzrP6gupOQ29fS20WKaQi1P5N5ZNEHW8d0aH7W	+1000000005	2025-06-08 12:34:36.798689	admin2	1	\N	\N	\N	\N	\N	f
EMPLOYEE	11	2025-06-08 12:34:37.328437	\N	agent2@example.com	Liam	Davis	$2a$12$YloddzEnCoL7MuYCLOpVPOEwuZ9rW6zJ04WaEH2Jf07VbVaNAkKAO	+1000000006	2025-06-08 12:34:37.328437	agent2	2	\N	\N	\N	\N	\N	f
EMPLOYEE	12	2025-06-08 12:34:37.856485	\N	superadmin3@example.com	Olivia	Miller	$2a$12$CTG9wFmxD3l3i2MJWYmQJ.yqIENAZyjy9Hzr4vOwSi18DwKBnfWYC	+1000000007	2025-06-08 12:34:37.856485	superadmin3	0	\N	\N	\N	\N	\N	f
EMPLOYEE	13	2025-06-08 12:34:38.247907	\N	admin3@example.com	Noah	Wilson	$2a$12$7vKzQNZJZNEakeUN0CLrjO1xLrd0VUeN66RinoQcLFz62EL0r.PLi	+1000000008	2025-06-08 12:34:38.247907	admin3	1	\N	\N	\N	\N	\N	f
EMPLOYEE	14	2025-06-08 12:34:38.642483	\N	agent3@example.com	Ava	Moore	$2a$12$0zlYF9F0KgHW0ytwdQSPZunxef5TZAnAYynDB2IQwSiPguojRfsAG	+1000000009	2025-06-08 12:34:38.642483	agent3	2	\N	\N	\N	\N	\N	f
EMPLOYEE	15	2025-06-08 12:34:39.131024	\N	admin4@example.com	William	Taylor	$2a$12$lr4olbqYpuU8wYBQCbImXOtd5fNBGa5MHRqNLNWVO64wMdOuouISy	+1000000010	2025-06-08 12:34:39.131024	admin4	1	\N	\N	\N	\N	\N	f
EMPLOYEE	16	2025-06-10 07:30:39.356866	\N	admintest@example.com	test	admin	$2a$12$9LCJTNa1Ko.CiRZ6jD2XKO/uMfVvCorXMub14m3QOjQFvW.L8LCw2	1234567890	2025-06-10 07:30:39.356866	\N	0	\N	\N	\N	\N	\N	f
EMPLOYEE	18	2025-06-10 07:48:18.216153	\N	adminhassan@example.com	hassan	admin	$2a$12$TDgtcmC.4eUqn85AEMcDY.d4mE6iApJt9IfABC54QFWYL4aKpbPlG	1234567890	2025-06-10 07:48:18.216153	\N	0	\N	\N	\N	\N	\N	f
CLIENT	19	2025-06-10 15:09:58.931544	\N	lahlamihassan57@gmail.com	hassan	lahlami	$2a$12$vp2giWg4v.pbHO41lBSoZO7zjpR5UDrysH4Rg6Vc62PR.ufyrtp6a	0628383782	2025-06-10 15:44:47.411016	hassanKing	\N	Etudiant	f		2025-06-10 15:52:57.521104	$2a$10$jx.a5P7nokrJUvwAPTDgI.tq1Xhu/4toQ6JahyrzFnQC5OIqMNmBK	f
CLIENT	4	2025-05-29 19:58:19.078162	\N	sophie.martin@example.com	Sophie	Martin	riskmgt2024	+33123459876	2025-05-29 19:58:19.078162	sophie.martin	\N	Risk Manager	f	\N	\N	\N	f
CLIENT	5	2025-05-29 19:58:42.196461	\N	carla.diaz@example.com	Carla	Diaz	finance789	+33123456789	2025-05-29 19:58:42.196461	carla.diaz	\N	Financial Analyst	f	\N	\N	\N	f
CLIENT	2	2025-05-29 19:51:41.935679	\N	amina.elkhoury@example.com	Amina	El Khoury	biinsights2025	+33145678901	2025-06-09 23:20:03.503953	amina.elkhoury	\N	Business Intelligence Analyst	t	\N	\N	\N	f
CLIENT	3	2025-05-29 19:52:41.935679	\N	julien.roche@example.com	Julien	Roche	investsafe456	+33167890123	2025-06-09 23:27:32.497775	julien.roche	\N	Investment Advisor	t	\N	\N	\N	f
CLIENT	1	2025-05-29 19:48:05.553946	\N	thomas.bertrand@example.com	Thomas	Bertrand	data1234	+33198765432	2025-06-09 23:37:03.236225	thomas.bertrand	\N	Data Engineer	t	\N	\N	\N	f
\.


--
-- Data for Name: virement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.virement (id, createdat, montant, type, compte_emetteur_id, compte_recepteur_id) FROM stdin;
9	2025-06-03 05:01:23.808785	500	INSTANTANEE	1	3
10	2025-06-03 05:01:36.66703	500	INSTANTANEE	3	1
11	2025-06-03 05:01:47.050192	9912	INSTANTANEE	3	1
12	2025-06-03 05:02:12.682588	4500	INSTANTANEE	1	3
13	2025-06-03 05:02:35.540475	10450	INSTANTANEE	1	5
14	2025-06-03 05:03:02.1664	1500	INSTANTANEE	5	1
15	2025-06-03 07:26:30.514911	1500	INSTANTANEE	1	3
16	2025-06-03 07:26:58.574359	13	INSTANTANEE	1	3
17	2025-06-03 07:31:33.544911	12	NORMAL	1	3
18	2025-06-03 07:34:54.211202	12	NORMAL	1	3
19	2025-06-03 07:38:06.877221	1000	INSTANTANEE	1	3
20	2025-06-03 07:53:56.231553	200	INSTANTANEE	1	3
21	2025-06-03 08:04:03.767215	500	NORMAL	1	3
22	2025-06-03 08:18:51.213875	150	INSTANTANEE	1	3
23	2025-06-03 09:02:51.820702	14	INSTANTANEE	1	3
24	2025-06-05 14:28:22.439089	20	INSTANTANEE	1	3
25	2025-06-09 21:10:44.369274	10	NORMAL	1	3
26	2025-06-09 21:11:20.5204	20	INSTANTANEE	1	3
27	2025-06-09 21:27:45.472429	19	INSTANTANEE	1	3
28	2025-06-10 07:18:57.611383	10	NORMAL	1	3
29	2025-06-10 15:12:18.890807	2	INSTANTANEE	11	3
\.


--
-- Name: banque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banque_id_seq', 1, false);


--
-- Name: comptes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comptes_id_seq', 11, true);


--
-- Name: crypto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crypto_id_seq', 2, true);


--
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_id_seq', 45, true);


--
-- Name: maybeclients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maybeclients_id_seq', 1, true);


--
-- Name: recharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recharge_id_seq', 4, true);


--
-- Name: tokenmail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokenmail_id_seq', 1, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 140, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: virement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.virement_id_seq', 29, true);


--
-- Name: banque banque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banque
    ADD CONSTRAINT banque_pkey PRIMARY KEY (id);


--
-- Name: comptes comptes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comptes
    ADD CONSTRAINT comptes_pkey PRIMARY KEY (id);


--
-- Name: crypto crypto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crypto
    ADD CONSTRAINT crypto_pkey PRIMARY KEY (id);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: maybeclients maybeclients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maybeclients
    ADD CONSTRAINT maybeclients_pkey PRIMARY KEY (id);


--
-- Name: recharge recharge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge
    ADD CONSTRAINT recharge_pkey PRIMARY KEY (id);


--
-- Name: tokenmail tokenmail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokenmail
    ADD CONSTRAINT tokenmail_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: tokenmail uk_9og80w6m4xr0o58eqochvupto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokenmail
    ADD CONSTRAINT uk_9og80w6m4xr0o58eqochvupto UNIQUE (client_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: virement virement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virement
    ADD CONSTRAINT virement_pkey PRIMARY KEY (id);


--
-- Name: invoice fk4wnetg6job6a7acm01uc4kplg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fk4wnetg6job6a7acm01uc4kplg FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- Name: recharge fk6lw3tloryec61n91a8jeg1v64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recharge
    ADD CONSTRAINT fk6lw3tloryec61n91a8jeg1v64 FOREIGN KEY (compte_id) REFERENCES public.comptes(id);


--
-- Name: virement fka7rccrs78bi8oaxmhewg9pv73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virement
    ADD CONSTRAINT fka7rccrs78bi8oaxmhewg9pv73 FOREIGN KEY (compte_emetteur_id) REFERENCES public.comptes(id);


--
-- Name: virement fkagfsmvhof6rx8neaou48crw1c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virement
    ADD CONSTRAINT fkagfsmvhof6rx8neaou48crw1c FOREIGN KEY (compte_recepteur_id) REFERENCES public.comptes(id);


--
-- Name: crypto fkgvsaoqtu2p1v3sgjku335nptu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crypto
    ADD CONSTRAINT fkgvsaoqtu2p1v3sgjku335nptu FOREIGN KEY (ccourant_id) REFERENCES public.comptes(id);


--
-- Name: tokenmail fki7l460u1pgpfnmip9vqt2ig0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokenmail
    ADD CONSTRAINT fki7l460u1pgpfnmip9vqt2ig0 FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- Name: comptes fkk9afirrkoeqke9l9ltne30uem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comptes
    ADD CONSTRAINT fkk9afirrkoeqke9l9ltne30uem FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

