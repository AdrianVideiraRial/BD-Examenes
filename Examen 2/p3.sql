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
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    dni character varying(9) NOT NULL,
    nombre text,
    primer_apellido text,
    segundo_apellido text
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- Name: asignatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignatura (
    id_asignatura integer NOT NULL,
    nombre_asignatura text
);


ALTER TABLE public.asignatura OWNER TO postgres;

--
-- Name: asignatura_id_asignatura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asignatura_id_asignatura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asignatura_id_asignatura_seq OWNER TO postgres;

--
-- Name: asignatura_id_asignatura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignatura_id_asignatura_seq OWNED BY public.asignatura.id_asignatura;


--
-- Name: matricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matricula (
    dni character varying(9),
    id_asignatura integer NOT NULL
);


ALTER TABLE public.matricula OWNER TO postgres;

--
-- Name: matricula_id_asignatura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matricula_id_asignatura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matricula_id_asignatura_seq OWNER TO postgres;

--
-- Name: matricula_id_asignatura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matricula_id_asignatura_seq OWNED BY public.matricula.id_asignatura;


--
-- Name: asignatura id_asignatura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura ALTER COLUMN id_asignatura SET DEFAULT nextval('public.asignatura_id_asignatura_seq'::regclass);


--
-- Name: matricula id_asignatura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula ALTER COLUMN id_asignatura SET DEFAULT nextval('public.matricula_id_asignatura_seq'::regclass);


--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno (dni, nombre, primer_apellido, segundo_apellido) FROM stdin;
\.


--
-- Data for Name: asignatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asignatura (id_asignatura, nombre_asignatura) FROM stdin;
\.


--
-- Data for Name: matricula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matricula (dni, id_asignatura) FROM stdin;
\.


--
-- Name: asignatura_id_asignatura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignatura_id_asignatura_seq', 1, false);


--
-- Name: matricula_id_asignatura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matricula_id_asignatura_seq', 1, false);


--
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (dni);


--
-- Name: asignatura asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (id_asignatura);


--
-- Name: matricula matricula_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_dni_fkey FOREIGN KEY (dni) REFERENCES public.alumno(dni);


--
-- Name: matricula matricula_id_asignatura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_id_asignatura_fkey FOREIGN KEY (id_asignatura) REFERENCES public.asignatura(id_asignatura);


--
-- PostgreSQL database dump complete
--

