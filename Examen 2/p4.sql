--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: foto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foto (
    idfoto integer NOT NULL,
    titulo_foto text,
    fecha date,
    idmonumento integer NOT NULL
);


ALTER TABLE public.foto OWNER TO postgres;

--
-- Name: foto_idfoto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foto_idfoto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foto_idfoto_seq OWNER TO postgres;

--
-- Name: foto_idfoto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foto_idfoto_seq OWNED BY public.foto.idfoto;


--
-- Name: foto_idmonumento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foto_idmonumento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foto_idmonumento_seq OWNER TO postgres;

--
-- Name: foto_idmonumento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foto_idmonumento_seq OWNED BY public.foto.idmonumento;


--
-- Name: monumento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monumento (
    idmonumento integer NOT NULL,
    monumento text,
    antiguedad_monumento date,
    ciudad text
);


ALTER TABLE public.monumento OWNER TO postgres;

--
-- Name: monumento_idmonumento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monumento_idmonumento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monumento_idmonumento_seq OWNER TO postgres;

--
-- Name: monumento_idmonumento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monumento_idmonumento_seq OWNED BY public.monumento.idmonumento;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    idpersona integer NOT NULL,
    nombre text,
    dni character varying(9)
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- Name: persona_idpersona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_idpersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_idpersona_seq OWNER TO postgres;

--
-- Name: persona_idpersona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_idpersona_seq OWNED BY public.persona.idpersona;


--
-- Name: recuerdos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recuerdos (
    idfoto integer NOT NULL,
    idpersona integer NOT NULL
);


ALTER TABLE public.recuerdos OWNER TO postgres;

--
-- Name: recuerdos_idfoto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recuerdos_idfoto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recuerdos_idfoto_seq OWNER TO postgres;

--
-- Name: recuerdos_idfoto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recuerdos_idfoto_seq OWNED BY public.recuerdos.idfoto;


--
-- Name: recuerdos_idpersona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recuerdos_idpersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recuerdos_idpersona_seq OWNER TO postgres;

--
-- Name: recuerdos_idpersona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recuerdos_idpersona_seq OWNED BY public.recuerdos.idpersona;


--
-- Name: foto idfoto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto ALTER COLUMN idfoto SET DEFAULT nextval('public.foto_idfoto_seq'::regclass);


--
-- Name: foto idmonumento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto ALTER COLUMN idmonumento SET DEFAULT nextval('public.foto_idmonumento_seq'::regclass);


--
-- Name: monumento idmonumento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monumento ALTER COLUMN idmonumento SET DEFAULT nextval('public.monumento_idmonumento_seq'::regclass);


--
-- Name: persona idpersona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN idpersona SET DEFAULT nextval('public.persona_idpersona_seq'::regclass);


--
-- Name: recuerdos idfoto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recuerdos ALTER COLUMN idfoto SET DEFAULT nextval('public.recuerdos_idfoto_seq'::regclass);


--
-- Name: recuerdos idpersona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recuerdos ALTER COLUMN idpersona SET DEFAULT nextval('public.recuerdos_idpersona_seq'::regclass);


--
-- Data for Name: foto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foto (idfoto, titulo_foto, fecha, idmonumento) FROM stdin;
\.


--
-- Data for Name: monumento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.monumento (idmonumento, monumento, antiguedad_monumento, ciudad) FROM stdin;
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (idpersona, nombre, dni) FROM stdin;
\.


--
-- Data for Name: recuerdos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recuerdos (idfoto, idpersona) FROM stdin;
\.


--
-- Name: foto_idfoto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foto_idfoto_seq', 1, false);


--
-- Name: foto_idmonumento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foto_idmonumento_seq', 1, false);


--
-- Name: monumento_idmonumento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monumento_idmonumento_seq', 1, false);


--
-- Name: persona_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_idpersona_seq', 1, false);


--
-- Name: recuerdos_idfoto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recuerdos_idfoto_seq', 1, false);


--
-- Name: recuerdos_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recuerdos_idpersona_seq', 1, false);


--
-- Name: foto foto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT foto_pkey PRIMARY KEY (idfoto);


--
-- Name: monumento monumento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monumento
    ADD CONSTRAINT monumento_pkey PRIMARY KEY (idmonumento);


--
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (idpersona);


--
-- Name: foto foto_idmonumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT foto_idmonumento_fkey FOREIGN KEY (idmonumento) REFERENCES public.monumento(idmonumento);


--
-- Name: recuerdos recuerdos_idfoto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recuerdos
    ADD CONSTRAINT recuerdos_idfoto_fkey FOREIGN KEY (idfoto) REFERENCES public.foto(idfoto);


--
-- Name: recuerdos recuerdos_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recuerdos
    ADD CONSTRAINT recuerdos_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES public.persona(idpersona);


--
-- PostgreSQL database dump complete
--

