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

--
-- Name: esq1; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA esq1;


ALTER SCHEMA esq1 OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tabla1; Type: TABLE; Schema: esq1; Owner: postgres
--

CREATE TABLE esq1.tabla1 (
    dni integer NOT NULL,
    nombre character varying(20),
    edad integer,
    CONSTRAINT tabla1_edad_check CHECK (((edad >= 0) AND (edad <= 99)))
);


ALTER TABLE esq1.tabla1 OWNER TO postgres;

--
-- Name: tabla2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tabla2 (
    id integer NOT NULL,
    dni integer,
    precio numeric(8,4)
);


ALTER TABLE public.tabla2 OWNER TO postgres;

--
-- Name: tabla2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tabla2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tabla2_id_seq OWNER TO postgres;

--
-- Name: tabla2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tabla2_id_seq OWNED BY public.tabla2.id;


--
-- Name: tabla2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla2 ALTER COLUMN id SET DEFAULT nextval('public.tabla2_id_seq'::regclass);


--
-- Data for Name: tabla1; Type: TABLE DATA; Schema: esq1; Owner: postgres
--

COPY esq1.tabla1 (dni, nombre, edad) FROM stdin;
\.


--
-- Data for Name: tabla2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tabla2 (id, dni, precio) FROM stdin;
\.


--
-- Name: tabla2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabla2_id_seq', 1, false);


--
-- Name: tabla1 tabla1_dni_key; Type: CONSTRAINT; Schema: esq1; Owner: postgres
--

ALTER TABLE ONLY esq1.tabla1
    ADD CONSTRAINT tabla1_dni_key UNIQUE (dni);


--
-- Name: tabla2 tabla2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla2
    ADD CONSTRAINT tabla2_pkey PRIMARY KEY (id);


--
-- Name: tabla2 tabla2_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla2
    ADD CONSTRAINT tabla2_dni_fkey FOREIGN KEY (dni) REFERENCES esq1.tabla1(dni);


--
-- PostgreSQL database dump complete
--

