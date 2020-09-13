--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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

ALTER TABLE ONLY public.projects DROP CONSTRAINT "projects_userId_fkey";
ALTER TABLE ONLY public.files DROP CONSTRAINT "files_projectId_fkey";
ALTER TABLE ONLY public.comments DROP CONSTRAINT "comments_userId_fkey";
ALTER TABLE ONLY public.comments DROP CONSTRAINT "comments_projectId_fkey";
ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.projects_id_seq;
DROP TABLE public.projects;
DROP SEQUENCE public.files_id_seq;
DROP TABLE public.files;
DROP SEQUENCE public.comments_id_seq;
DROP TABLE public.comments;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: codeadmin
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    content text,
    votes integer DEFAULT 0,
    favorited boolean DEFAULT false,
    "votedBy" integer[] DEFAULT ARRAY[]::integer[],
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "projectId" integer
);


ALTER TABLE public.comments OWNER TO codeadmin;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: codeadmin
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO codeadmin;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codeadmin
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: codeadmin
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    path character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "projectId" integer
);


ALTER TABLE public.files OWNER TO codeadmin;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: codeadmin
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO codeadmin;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codeadmin
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: codeadmin
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    "favoritedBy" integer[] DEFAULT ARRAY[]::integer[],
    "votedBy" integer[] DEFAULT ARRAY[]::integer[],
    votes integer DEFAULT 0,
    "forkedFrom" integer,
    solutions integer[] DEFAULT ARRAY[]::integer[],
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.projects OWNER TO codeadmin;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: codeadmin
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO codeadmin;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codeadmin
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: codeadmin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    email character varying(255),
    "firstName" character varying(255),
    "lastName" character varying(255),
    bio character varying(255) DEFAULT ''::character varying,
    points integer DEFAULT 0,
    "favoritedProjects" integer[] DEFAULT ARRAY[]::integer[],
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO codeadmin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: codeadmin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO codeadmin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codeadmin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: codeadmin
--

COPY public.comments (id, content, votes, favorited, "votedBy", "createdAt", "updatedAt", "userId", "projectId") FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: codeadmin
--

COPY public.files (id, name, type, path, "createdAt", "updatedAt", "projectId") FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: codeadmin
--

COPY public.projects (id, name, description, "favoritedBy", "votedBy", votes, "forkedFrom", solutions, "createdAt", "updatedAt", "userId") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: codeadmin
--

COPY public.users (id, username, password, email, "firstName", "lastName", bio, points, "favoritedProjects", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codeadmin
--

SELECT pg_catalog.setval('public.comments_id_seq', 10, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codeadmin
--

SELECT pg_catalog.setval('public.files_id_seq', 43, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codeadmin
--

SELECT pg_catalog.setval('public.projects_id_seq', 31, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codeadmin
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: comments comments_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: files files_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "files_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: projects projects_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: codeadmin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT "projects_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

