--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO abi83;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO abi83;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO abi83;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO abi83;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO abi83;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO abi83;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO abi83;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO abi83;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO abi83;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO abi83;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO abi83;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO abi83;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO abi83;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO abi83;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO abi83;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO abi83;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO abi83;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.django_flatpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO abi83;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.django_flatpage_id_seq OWNED BY public.django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO abi83;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.django_flatpage_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO abi83;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.django_flatpage_sites_id_seq OWNED BY public.django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO abi83;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO abi83;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO abi83;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO abi83;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO abi83;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: posts_comment; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.posts_comment (
    id integer NOT NULL,
    text text NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    author_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.posts_comment OWNER TO abi83;

--
-- Name: posts_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.posts_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_comment_id_seq OWNER TO abi83;

--
-- Name: posts_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.posts_comment_id_seq OWNED BY public.posts_comment.id;


--
-- Name: posts_follow; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.posts_follow (
    id integer NOT NULL,
    author_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.posts_follow OWNER TO abi83;

--
-- Name: posts_follow_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.posts_follow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_follow_id_seq OWNER TO abi83;

--
-- Name: posts_follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.posts_follow_id_seq OWNED BY public.posts_follow.id;


--
-- Name: posts_group; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.posts_group (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(20) NOT NULL,
    description text NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.posts_group OWNER TO abi83;

--
-- Name: posts_group_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.posts_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_group_id_seq OWNER TO abi83;

--
-- Name: posts_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.posts_group_id_seq OWNED BY public.posts_group.id;


--
-- Name: posts_post; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.posts_post (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    image character varying(100),
    active boolean NOT NULL,
    author_id integer NOT NULL,
    group_id integer
);


ALTER TABLE public.posts_post OWNER TO abi83;

--
-- Name: posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: abi83
--

CREATE SEQUENCE public.posts_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_post_id_seq OWNER TO abi83;

--
-- Name: posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abi83
--

ALTER SEQUENCE public.posts_post_id_seq OWNED BY public.posts_post.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: abi83
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO abi83;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_flatpage id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_flatpage ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_id_seq'::regclass);


--
-- Name: django_flatpage_sites id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_sites_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: posts_comment id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_comment ALTER COLUMN id SET DEFAULT nextval('public.posts_comment_id_seq'::regclass);


--
-- Name: posts_follow id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_follow ALTER COLUMN id SET DEFAULT nextval('public.posts_follow_id_seq'::regclass);


--
-- Name: posts_group id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_group ALTER COLUMN id SET DEFAULT nextval('public.posts_group_id_seq'::regclass);


--
-- Name: posts_post id; Type: DEFAULT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_post ALTER COLUMN id SET DEFAULT nextval('public.posts_post_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add Группа	1	add_group
2	Can change Группа	1	change_group
3	Can delete Группа	1	delete_group
4	Can view Группа	1	view_group
5	Can add Пост	2	add_post
6	Can change Пост	2	change_post
7	Can delete Пост	2	delete_post
8	Can view Пост	2	view_post
9	Can add Подписка	3	add_follow
10	Can change Подписка	3	change_follow
11	Can delete Подписка	3	delete_follow
12	Can view Подписка	3	view_follow
13	Can add Комментарий	4	add_comment
14	Can change Комментарий	4	change_comment
15	Can delete Комментарий	4	delete_comment
16	Can view Комментарий	4	view_comment
17	Can add log entry	5	add_logentry
18	Can change log entry	5	change_logentry
19	Can delete log entry	5	delete_logentry
20	Can view log entry	5	view_logentry
21	Can add permission	6	add_permission
22	Can change permission	6	change_permission
23	Can delete permission	6	delete_permission
24	Can view permission	6	view_permission
25	Can add group	7	add_group
26	Can change group	7	change_group
27	Can delete group	7	delete_group
28	Can view group	7	view_group
29	Can add user	8	add_user
30	Can change user	8	change_user
31	Can delete user	8	delete_user
32	Can view user	8	view_user
33	Can add content type	9	add_contenttype
34	Can change content type	9	change_contenttype
35	Can delete content type	9	delete_contenttype
36	Can view content type	9	view_contenttype
37	Can add session	10	add_session
38	Can change session	10	change_session
39	Can delete session	10	delete_session
40	Can view session	10	view_session
41	Can add site	11	add_site
42	Can change site	11	change_site
43	Can delete site	11	delete_site
44	Can view site	11	view_site
45	Can add flat page	12	add_flatpage
46	Can change flat page	12	change_flatpage
47	Can delete flat page	12	delete_flatpage
48	Can view flat page	12	view_flatpage
49	Can add kv store	13	add_kvstore
50	Can change kv store	13	change_kvstore
51	Can delete kv store	13	delete_kvstore
52	Can view kv store	13	view_kvstore
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$lvZiZVkD5zL2$Pw0DP6qbbSbgWa3KJ8pdm5N8OYIUVW83HVy51QcZWYk=	2020-11-16 10:12:55+01	t	abi83	Владимир	Кромм	vkromm@gmail.com	t	t	2020-11-16 09:57:09+01
2	pbkdf2_sha256$150000$DawXn0AYEfn5$98XOo+hbezt0ZtHkk3i5KlJRhrzPlY6xjYu+/qdH7rQ=	2020-11-16 11:06:27.921687+01	f	Gipsy	Павел	Бажов	pavelro1@ya.ru	f	t	2020-11-16 11:06:24.109284+01
3	pbkdf2_sha256$150000$MrZ7nNNwkavZ$clo7YDXkiiv/uaSYevlTxWqFc1CJeY5TvO6HkqB8rvw=	\N	f	testmail	тест	почты	vladimir@r-o.ru	f	t	2020-11-16 11:06:28.945283+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-11-16 10:14:27.605021+01	1	Python	1	[{"added": {}}]	1	1
2	2020-11-16 10:34:25.373748+01	1	abi83	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	8	1
3	2020-11-16 10:44:25.607047+01	2	Пост "Технологии" от 16.11.2020.	2	[{"changed": {"fields": ["title"]}}]	2	1
4	2020-11-16 10:44:42.345298+01	1	Пост "Как я провел эту осень" от 16.11.2020.	2	[{"changed": {"fields": ["title"]}}]	2	1
5	2020-11-16 10:46:54.279649+01	1	krommclub.ru	2	[{"changed": {"fields": ["domain", "name"]}}]	11	1
6	2020-11-16 10:49:08.561148+01	1	/about-spec/ -- Технологии	1	[{"added": {}}]	12	1
7	2020-11-16 10:52:42.52755+01	1	/about-spec/ -- Технологии	2	[{"changed": {"fields": ["content"]}}]	12	1
8	2020-11-16 11:00:54.634728+01	2	/about-author/ -- Об авторе	1	[{"added": {}}]	12	1
9	2020-11-16 11:01:14.331668+01	2	/about-author/ -- Об авторе	2	[{"changed": {"fields": ["content"]}}]	12	1
10	2020-11-16 11:01:53.526074+01	1	/about-spec/ -- Технологии	2	[{"changed": {"fields": ["content"]}}]	12	1
11	2020-11-16 11:09:14.534443+01	1	/about-spec/ -- Технологии	2	[{"changed": {"fields": ["content"]}}]	12	1
12	2020-11-17 10:28:08.955373+01	4	Пост "https://fornex.com/c/fitfr2/ Партнерские ссылочки? )..." от 17.11.2020.	3		2	1
13	2020-11-17 10:28:38.656546+01	2	/about-author/ -- Об авторе	2	[{"changed": {"fields": ["content"]}}]	12	1
14	2020-11-17 10:30:54.046213+01	2	/about-author/ -- Об авторе	2	[{"changed": {"fields": ["content"]}}]	12	1
15	2020-11-17 10:31:32.687786+01	2	/about-author/ -- Об авторе	2	[{"changed": {"fields": ["content"]}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	posts	group
2	posts	post
3	posts	follow
4	posts	comment
5	admin	logentry
6	auth	permission
7	auth	group
8	auth	user
9	contenttypes	contenttype
10	sessions	session
11	sites	site
12	flatpages	flatpage
13	thumbnail	kvstore
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
1	/about-spec/	Технологии	<ul>\r\n<li> django 2.2 - фреймворк</li>\r\n<li>postgresql - движок БД</li>\r\n<li>bootstrap - стили и оформление</li>\r\n<li>pycharm - среда разработки</li>\r\n<li>git - система контроля версий</li>\r\n<li>Ubuntu 18 - операционная система</li>\r\n<li>nginx - веб сервер</li>\r\n<li>uwsgi - сервер веб приложний.</li>\r\n<li>Яндекс.Практикум - курс Python разработчик ))</li>\r\n</ul>	f		f
2	/about-author/	Об авторе	<p align="justify">Данный проект был написан 37ми летним продажником, реламщиком и отцом трех детей в промежутках между сменой подгузников, выгуливанием собаки, содержанием огромного дома и попытках заработать на бензин для пятилитровой инфинити, которая мне теперь явно не по карману.</p>\r\n\r\n<p align="justify">Свою первую программу на python <code>print('Hello world')</code> я написал чуть больше двух месяцев назад.</p>	f		f
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-11-15 08:43:33.761492+01
2	auth	0001_initial	2020-11-15 08:43:33.794531+01
3	admin	0001_initial	2020-11-15 08:43:33.836861+01
4	admin	0002_logentry_remove_auto_add	2020-11-15 08:43:33.851332+01
5	admin	0003_logentry_add_action_flag_choices	2020-11-15 08:43:33.859238+01
6	contenttypes	0002_remove_content_type_name	2020-11-15 08:43:33.877168+01
7	auth	0002_alter_permission_name_max_length	2020-11-15 08:43:33.882749+01
8	auth	0003_alter_user_email_max_length	2020-11-15 08:43:33.890307+01
9	auth	0004_alter_user_username_opts	2020-11-15 08:43:33.897402+01
10	auth	0005_alter_user_last_login_null	2020-11-15 08:43:33.904749+01
11	auth	0006_require_contenttypes_0002	2020-11-15 08:43:33.906765+01
12	auth	0007_alter_validators_add_error_messages	2020-11-15 08:43:33.91394+01
13	auth	0008_alter_user_username_max_length	2020-11-15 08:43:33.924604+01
14	auth	0009_alter_user_last_name_max_length	2020-11-15 08:43:33.932968+01
15	auth	0010_alter_group_name_max_length	2020-11-15 08:43:33.94109+01
16	auth	0011_update_proxy_permissions	2020-11-15 08:43:33.951013+01
17	sites	0001_initial	2020-11-15 08:43:33.956855+01
18	flatpages	0001_initial	2020-11-15 08:43:33.967425+01
19	posts	0001_initial	2020-11-15 08:43:34.022064+01
20	sessions	0001_initial	2020-11-15 08:43:34.043251+01
21	sites	0002_alter_domain_unique	2020-11-15 08:43:34.054583+01
22	thumbnail	0001_initial	2020-11-15 08:43:34.063015+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
w6p17369wlhe3dgmf82mtasg3m4fwjqn	OTU2ZWVkOGQ3ZTIyZTE3ZDcyMTE3Y2VlN2E5ZDNkYjY2ZTE1OTEwYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNjBkNTVjZTAwZmZmYmE3ODEyOGU1ZDVjYzNmYmE1MTMxNzMzMGFkIn0=	2020-11-30 10:12:55.414471+01
bl97rzpp38ua05tbolqo5dipkakdzo4u	ZmMxZTNlMjIxMGIwOTU0ZDAwODgyMjVmYWJmYTE2Y2FjYTE5ZGU0ODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjgyNGQ3MmJhZGZjZTc3OTZlMTQ0MDYyYzI4NTQyNjg1YjZkOWNhIn0=	2020-11-30 11:06:27.925106+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.django_site (id, domain, name) FROM stdin;
1	krommclub.ru	krommclub.ru
\.


--
-- Data for Name: posts_comment; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.posts_comment (id, text, created, active, author_id, post_id) FROM stdin;
1	(с) Данте	2020-11-16 11:10:53.908577+01	t	2	3
\.


--
-- Data for Name: posts_follow; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.posts_follow (id, author_id, user_id) FROM stdin;
1	2	1
2	1	2
\.


--
-- Data for Name: posts_group; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.posts_group (id, title, slug, description, active) FROM stdin;
1	Python	python	Группа про программирование на python и всякие приколы с этим связанные	t
\.


--
-- Data for Name: posts_post; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.posts_post (id, title, text, pub_date, image, active, author_id, group_id) FROM stdin;
2	Технологии	Самую малость об использованных технологиях:\r\n- django 2.2 - фреймворк\r\n- postgresql - движок БД\r\n- pycharm - среда разработки\r\n- git - система контроля версий\r\n- bootstrap - стили и оформление\r\n- ubuntu 18 - операционная система\r\n- nginx - веб сервер\r\n- uwsgi - сервер веб приложний.\r\n- Яндекс.Практикум - курс Python разработчик ))	2020-11-16 10:40:14.474494+01	posts/1_KwSbyYyqaukruQVofd1HTQ.jpeg	t	1	1
5	Очень интересно выходит. Каждая...	Очень интересно выходит. Каждая новая итерация дает больше каких-то непонятных знаний с которыми непонятно что делать. Осознал тут, что сервак надо перенастраивать достаточно серьезно. Сижу вот и думаю по какому пути пойти: переустановить ubuntu и начать все с чистого листа? Но надо бекап базы данных делать. Или попытаться на текущей операционной системе что-то воткнуть? Очень инетерсно короче )	2020-11-17 10:51:36.879287+01		t	1	1
1	Как я провел эту осень	20 сентября поднял я этот сервачок. Хотел сделать тут свой бложик и небольшой проект ads_generator. И даже пару постов написал. Но у жизни на всё свои планы и мои наработки по блогу оказались откровенным говнокодом. Как проект прошел проверку, решил старый проект спрятать под стол (пока никто не увидел), и конечно столь масштабный рефакторинг кода похоронил все настройки базы данных, uwsgi и всё легло, но в этот раз пооднять сервачок смог за пару часиков. Не буду загадывать про судьбу этого "проекта", может какие фичи и допишу. Время-время.... Где взять 26 часов в сутках, хотяб\r\n\r\n2be continued....	2020-11-16 10:32:41.231692+01	posts/python-dictionary.png	t	1	1
3	«Pарe Satan, рарe Satan...	«Pарe Satan, рарe Satan aleppe!»  —\r\nХриплоголосый Плутос закричал.\r\nХотя бы он и вдвое был свирепей, —\r\nМеня мудрец, все знавший, ободрял, —\r\nНе поддавайся страху: что могло бы\r\nНам помешать спуститься с этих скал?»\r\nИ этой роже, вздувшейся от злобы,\r\nОн молвил так: «Молчи, проклятый волк!\r\nСгинь в клокотаньи собственной утробы!	2020-11-16 11:10:25.179075+01	posts/22.jpg	t	2	1
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: abi83
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||bae0e2f5c6b513eb036e82d2bb3898fc	{"name": "posts/python-dictionary.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1540, 540]}
sorl-thumbnail||image||64f14c51b8b0376d4fe3b095f90f519e	{"name": "cache/b4/4b/b44bf5f29794260e054d357b23629acc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 339]}
sorl-thumbnail||thumbnails||bae0e2f5c6b513eb036e82d2bb3898fc	["64f14c51b8b0376d4fe3b095f90f519e"]
sorl-thumbnail||image||ff7b8cc407a0381c3bc0489435d1a3a4	{"name": "posts/1_KwSbyYyqaukruQVofd1HTQ.jpeg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 1080]}
sorl-thumbnail||image||a57b4cd87f751a3b07934a2078719e57	{"name": "cache/cf/ac/cfac0708e728b2543e1e878755a92712.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 339]}
sorl-thumbnail||thumbnails||ff7b8cc407a0381c3bc0489435d1a3a4	["a57b4cd87f751a3b07934a2078719e57"]
sorl-thumbnail||image||fba0470f2ce4ae8bb039aba3a225505e	{"name": "posts/22.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 240]}
sorl-thumbnail||image||3bfe184f4e7e1b7b9fae68999fb0f723	{"name": "cache/e6/3c/e63c6b7b8a282a3600308a833e164d7d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 339]}
sorl-thumbnail||thumbnails||fba0470f2ce4ae8bb039aba3a225505e	["3bfe184f4e7e1b7b9fae68999fb0f723"]
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 15, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.django_flatpage_id_seq', 2, true);


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.django_flatpage_sites_id_seq', 2, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: posts_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.posts_comment_id_seq', 1, true);


--
-- Name: posts_follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.posts_follow_id_seq', 2, true);


--
-- Name: posts_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.posts_group_id_seq', 1, true);


--
-- Name: posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abi83
--

SELECT pg_catalog.setval('public.posts_post_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: posts_comment posts_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_comment
    ADD CONSTRAINT posts_comment_pkey PRIMARY KEY (id);


--
-- Name: posts_follow posts_follow_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_follow
    ADD CONSTRAINT posts_follow_pkey PRIMARY KEY (id);


--
-- Name: posts_group posts_group_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_group
    ADD CONSTRAINT posts_group_pkey PRIMARY KEY (id);


--
-- Name: posts_group posts_group_slug_key; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_group
    ADD CONSTRAINT posts_group_slug_key UNIQUE (slug);


--
-- Name: posts_post posts_post_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: posts_follow twice_follow_impossible; Type: CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_follow
    ADD CONSTRAINT twice_follow_impossible UNIQUE (user_id, author_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_sites_flatpage_id_078bbc8b; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_flatpage_sites_flatpage_id_078bbc8b ON public.django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id_bfd8ea84; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_flatpage_sites_site_id_bfd8ea84 ON public.django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url_41612362; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_flatpage_url_41612362 ON public.django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_flatpage_url_41612362_like ON public.django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: posts_comment_author_id_795e4d12; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX posts_comment_author_id_795e4d12 ON public.posts_comment USING btree (author_id);


--
-- Name: posts_comment_post_id_e81436d7; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX posts_comment_post_id_e81436d7 ON public.posts_comment USING btree (post_id);


--
-- Name: posts_follow_author_id_07282e68; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX posts_follow_author_id_07282e68 ON public.posts_follow USING btree (author_id);


--
-- Name: posts_follow_user_id_0b8e2703; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX posts_follow_user_id_0b8e2703 ON public.posts_follow USING btree (user_id);


--
-- Name: posts_group_slug_838831b4_like; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX posts_group_slug_838831b4_like ON public.posts_group USING btree (slug varchar_pattern_ops);


--
-- Name: posts_post_author_id_fe5487bf; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX posts_post_author_id_fe5487bf ON public.posts_post USING btree (author_id);


--
-- Name: posts_post_group_id_c91a8485; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX posts_post_group_id_c91a8485 ON public.posts_post USING btree (group_id);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: abi83
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl FOREIGN KEY (flatpage_id) REFERENCES public.django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_comment posts_comment_author_id_795e4d12_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_comment
    ADD CONSTRAINT posts_comment_author_id_795e4d12_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_comment posts_comment_post_id_e81436d7_fk_posts_post_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_comment
    ADD CONSTRAINT posts_comment_post_id_e81436d7_fk_posts_post_id FOREIGN KEY (post_id) REFERENCES public.posts_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_follow posts_follow_author_id_07282e68_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_follow
    ADD CONSTRAINT posts_follow_author_id_07282e68_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_follow posts_follow_user_id_0b8e2703_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_follow
    ADD CONSTRAINT posts_follow_user_id_0b8e2703_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_post posts_post_author_id_fe5487bf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_author_id_fe5487bf_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_post posts_post_group_id_c91a8485_fk_posts_group_id; Type: FK CONSTRAINT; Schema: public; Owner: abi83
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_group_id_c91a8485_fk_posts_group_id FOREIGN KEY (group_id) REFERENCES public.posts_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

