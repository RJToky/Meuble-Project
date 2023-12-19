--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22
-- Dumped by pg_dump version 10.22

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    id integer NOT NULL,
    nom character varying(50) NOT NULL
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- Name: categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorie_id_seq OWNER TO postgres;

--
-- Name: categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorie_id_seq OWNED BY public.categorie.id;


--
-- Name: fabricationmeuble; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fabricationmeuble (
    id integer NOT NULL,
    idmeuble integer,
    idtaille integer,
    idmatiere integer,
    quantite double precision
);


ALTER TABLE public.fabricationmeuble OWNER TO postgres;

--
-- Name: fabricationmeuble_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fabricationmeuble_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fabricationmeuble_id_seq OWNER TO postgres;

--
-- Name: fabricationmeuble_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fabricationmeuble_id_seq OWNED BY public.fabricationmeuble.id;


--
-- Name: matiere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matiere (
    id integer NOT NULL,
    nom character varying(50) NOT NULL
);


ALTER TABLE public.matiere OWNER TO postgres;

--
-- Name: matiere_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matiere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matiere_id_seq OWNER TO postgres;

--
-- Name: matiere_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matiere_id_seq OWNED BY public.matiere.id;


--
-- Name: matierestyle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matierestyle (
    id integer NOT NULL,
    idmatiere integer,
    idstyle integer
);


ALTER TABLE public.matierestyle OWNER TO postgres;

--
-- Name: matierestyle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matierestyle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matierestyle_id_seq OWNER TO postgres;

--
-- Name: matierestyle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matierestyle_id_seq OWNED BY public.matierestyle.id;


--
-- Name: meuble; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meuble (
    id integer NOT NULL,
    nom character varying(50) NOT NULL,
    idcategorie integer,
    idstyle integer
);


ALTER TABLE public.meuble OWNER TO postgres;

--
-- Name: meuble_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meuble_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meuble_id_seq OWNER TO postgres;

--
-- Name: meuble_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meuble_id_seq OWNED BY public.meuble.id;


--
-- Name: style; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.style (
    id integer NOT NULL,
    nom character varying(50) NOT NULL
);


ALTER TABLE public.style OWNER TO postgres;

--
-- Name: style_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.style_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.style_id_seq OWNER TO postgres;

--
-- Name: style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.style_id_seq OWNED BY public.style.id;


--
-- Name: taille; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taille (
    id integer NOT NULL,
    nom character varying(50) NOT NULL
);


ALTER TABLE public.taille OWNER TO postgres;

--
-- Name: taille_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taille_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taille_id_seq OWNER TO postgres;

--
-- Name: taille_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taille_id_seq OWNED BY public.taille.id;


--
-- Name: categorie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id SET DEFAULT nextval('public.categorie_id_seq'::regclass);


--
-- Name: fabricationmeuble id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricationmeuble ALTER COLUMN id SET DEFAULT nextval('public.fabricationmeuble_id_seq'::regclass);


--
-- Name: matiere id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matiere ALTER COLUMN id SET DEFAULT nextval('public.matiere_id_seq'::regclass);


--
-- Name: matierestyle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matierestyle ALTER COLUMN id SET DEFAULT nextval('public.matierestyle_id_seq'::regclass);


--
-- Name: meuble id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meuble ALTER COLUMN id SET DEFAULT nextval('public.meuble_id_seq'::regclass);


--
-- Name: style id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.style ALTER COLUMN id SET DEFAULT nextval('public.style_id_seq'::regclass);


--
-- Name: taille id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taille ALTER COLUMN id SET DEFAULT nextval('public.taille_id_seq'::regclass);


--
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (id, nom) FROM stdin;
1	Table
2	Chaise
\.


--
-- Data for Name: fabricationmeuble; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fabricationmeuble (id, idmeuble, idtaille, idmatiere, quantite) FROM stdin;
1	1	1	1	2
2	1	1	2	5
3	2	1	3	1
4	2	2	3	3
\.


--
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matiere (id, nom) FROM stdin;
1	Plastique
2	Tissu
3	Bois
\.


--
-- Data for Name: matierestyle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matierestyle (id, idmatiere, idstyle) FROM stdin;
1	1	1
2	2	1
3	3	2
\.


--
-- Data for Name: meuble; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meuble (id, nom, idcategorie, idstyle) FROM stdin;
1	Gigogne	1	1
2	Lago	1	2
\.


--
-- Data for Name: style; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.style (id, nom) FROM stdin;
1	Moderne
2	Royal
\.


--
-- Data for Name: taille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taille (id, nom) FROM stdin;
1	Petit
2	Grand
\.


--
-- Name: categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorie_id_seq', 2, true);


--
-- Name: fabricationmeuble_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fabricationmeuble_id_seq', 4, true);


--
-- Name: matiere_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matiere_id_seq', 3, true);


--
-- Name: matierestyle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matierestyle_id_seq', 3, true);


--
-- Name: meuble_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meuble_id_seq', 2, true);


--
-- Name: style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.style_id_seq', 2, true);


--
-- Name: taille_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taille_id_seq', 2, true);


--
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);


--
-- Name: fabricationmeuble fabricationmeuble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricationmeuble
    ADD CONSTRAINT fabricationmeuble_pkey PRIMARY KEY (id);


--
-- Name: matiere matiere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matiere
    ADD CONSTRAINT matiere_pkey PRIMARY KEY (id);


--
-- Name: matierestyle matierestyle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matierestyle
    ADD CONSTRAINT matierestyle_pkey PRIMARY KEY (id);


--
-- Name: meuble meuble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meuble
    ADD CONSTRAINT meuble_pkey PRIMARY KEY (id);


--
-- Name: style style_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.style
    ADD CONSTRAINT style_pkey PRIMARY KEY (id);


--
-- Name: taille taille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taille
    ADD CONSTRAINT taille_pkey PRIMARY KEY (id);


--
-- Name: fabricationmeuble fabricationmeuble_idmatiere_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricationmeuble
    ADD CONSTRAINT fabricationmeuble_idmatiere_fkey FOREIGN KEY (idmatiere) REFERENCES public.matiere(id);


--
-- Name: fabricationmeuble fabricationmeuble_idmeuble_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricationmeuble
    ADD CONSTRAINT fabricationmeuble_idmeuble_fkey FOREIGN KEY (idmeuble) REFERENCES public.meuble(id);


--
-- Name: fabricationmeuble fabricationmeuble_idtaille_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricationmeuble
    ADD CONSTRAINT fabricationmeuble_idtaille_fkey FOREIGN KEY (idtaille) REFERENCES public.taille(id);


--
-- Name: matierestyle matierestyle_idmatiere_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matierestyle
    ADD CONSTRAINT matierestyle_idmatiere_fkey FOREIGN KEY (idmatiere) REFERENCES public.matiere(id);


--
-- Name: matierestyle matierestyle_idstyle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matierestyle
    ADD CONSTRAINT matierestyle_idstyle_fkey FOREIGN KEY (idstyle) REFERENCES public.style(id);


--
-- Name: meuble meuble_idcategorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meuble
    ADD CONSTRAINT meuble_idcategorie_fkey FOREIGN KEY (idcategorie) REFERENCES public.categorie(id);


--
-- Name: meuble meuble_idstyle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meuble
    ADD CONSTRAINT meuble_idstyle_fkey FOREIGN KEY (idstyle) REFERENCES public.style(id);


--
-- PostgreSQL database dump complete
--

