--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.category (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    create_at timestamp(0) without time zone NOT NULL,
    update_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    product_id integer,
    _user_id integer,
    text text NOT NULL,
    create_at timestamp(0) without time zone NOT NULL,
    estimate integer NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.migration_versions (
    version character varying(14) NOT NULL,
    executed_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO postgres;

--
-- Name: COLUMN migration_versions.executed_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.migration_versions.executed_at IS '(DC2Type:datetime_immutable)';


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.product (
    id integer NOT NULL,
    category_id integer,
    title character varying(500) NOT NULL,
    text text NOT NULL,
    create_at timestamp(0) without time zone NOT NULL,
    update_at timestamp(0) without time zone NOT NULL,
    image character varying(255) NOT NULL,
    is_published boolean NOT NULL,
    _user_id integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, title, create_at, update_at) FROM stdin;
6	Ноутбуки	2020-06-03 21:09:23	2020-06-03 21:09:23
7	Зарубежный отдых	2020-06-18 13:12:45	2020-06-18 13:12:47
8	Мебельные магазины	2020-06-18 17:04:31	2020-06-18 17:04:33
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 10, true);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, product_id, _user_id, text, create_at, estimate) FROM stdin;
35	48	13	Отличный ноутбук!	2020-06-18 16:51:47	5
36	48	26	Сильно греется, только могу поставить 2...	2020-06-18 16:52:39	2
37	50	26	Как же хочется на море...	2020-06-18 16:53:01	5
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 38, true);


--
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_versions (version, executed_at) FROM stdin;
20200507125721	2020-05-07 12:59:42
20200507205205	2020-05-07 20:53:37
20200522105742	2020-05-30 10:38:20
20200530103749	2020-05-30 10:38:20
20200530142601	2020-05-30 14:26:15
20200530165118	2020-05-30 16:51:28
20200530181831	2020-05-30 18:18:38
20200530182223	2020-05-30 18:22:29
20200530182955	2020-05-30 18:30:01
20200530211028	2020-05-30 21:10:35
20200601134819	2020-06-01 13:48:34
20200601135543	2020-06-01 13:55:49
20200602093221	2020-06-02 09:33:00
20200603180748	2020-06-03 18:07:58
20200618074746	2020-06-18 07:47:55
20200618075227	2020-06-18 07:52:42
20200618080837	2020-06-18 08:08:53
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, category_id, title, text, create_at, update_at, image, is_published, _user_id) FROM stdin;
48	6	Ультрабук ASUS VivoBook R424DA-EK391T	Ультрабук ASUS R424DA-EK391T компактен и весит всего 1,5 кг, поэтому модель удобно носить с собой. Корпус изготовлен из тонкого, но прочного пластика, устойчивого к механическим повреждениям. В конструкции есть три разъема USB для считывания карт памяти и подключения внешних устройств. Картридер совместим с накопителями распространенного стандарта microSD. Реалистичный звук воспроизводят динамики с системой SonicMaster.\r\n\r\nУльтрабук ASUS R424DA-EK391T имеет оперативную память объемом 4 ГБ. Это оптимально для работы в текстовых редакторах и интернет-браузере. Комфортные условия для эксплуатации обеспечивает операционная система Windows 10 с интуитивно понятным интерфейсом. В конструкции есть надежный двухъядерный процессор. Качественное изображение передает экран с разрешением 1920х1080 пикселей. Встроенный микрофон позволяет общаться посредством аудиосообщений.	2020-06-18 11:21:56	2020-06-18 11:21:56	d783a78e11a0ea759b12c1e3117cc933.jpeg	t	22
49	7	Отдых в Тунисе	В Тунис едут, чтобы расслабиться в первоклассных спа, поторговаться на восточном базаре, прокатиться на верблюде по самой большой пустыне мира и, конечно, замечательно отдохнуть в отелях на берегу моря. Отдых в Тунисе стал хорошей заменой отдыху на египетских курортах: туры сюда стоят недорого, сервис в отелях приличный, да и песка в Сахаре и древних развалин хватит на всех.	2020-06-18 13:15:16	2020-06-18 13:15:16	3b8c015ec2f448ae27ba93aa4df2cf56.jpeg	t	24
50	6	Отдых в Турции	Отдых в Турции – это лазурное море, бескрайние пляжи Анталийского побережья и отели на любой вкус, это шумные рынки Стамбула и чайки над Босфором, это сказочная Каппадокия и не знающий покоя Мармарис. Это медовая пахлава, румяные бублики, сладкий инжир и ароматная клубника, это обжигающий чай и крепкий кофе… Турция, кажется, вобрала в себя все краски и запахи Востока и Запада, смешала в их причудливый коктейль, попробовав который однажды, вы будете возвращаться в эту солнечную страну снова и снова.	2020-06-18 16:37:30	2020-06-18 16:37:30	5fa26f5bd46152f2d2790e6f4dac33bf.jpeg	t	24
\.


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 52, true);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, name) FROM stdin;
12	admin@mail.ru	["ROLE_ADMIN"]	$argon2id$v=19$m=65536,t=4,p=1$9O3McnXUU5ZxVqTEBu1iVg$N9scBU5pV6/ReNsfeq7OgZtUHyIwVVdh+bxtaL51zkU	Admin
13	user@mail.ru	["ROLE_USER"]	$argon2id$v=19$m=65536,t=4,p=1$x2ko+KoZajf09qmU3CYfUA$nVrS6DaoenqTq6ZnKtSiETfyMUVWyZT6+Zq+Ro4O3ok	User
21	artem@mail.ru	["ROLE_USER"]	$argon2id$v=19$m=65536,t=4,p=1$p2xxcIk/zKEbID2u/129vQ$/5JZHBOB4B+2RPoWEXvH7I4UyzYbouZ8JLtlVCF4enI	Artem
22	provider@mail.ru	["ROLE_PROVIDER"]	$argon2id$v=19$m=65536,t=4,p=1$IJk41ftYVjIoTNZ7a7JTgw$ZBqes4QzY5NORLrZyWTi/64ErfY4iGVGwkVQuZ54JPg	provider
24	prov@mail.ru	["ROLE_PROVIDER"]	$argon2id$v=19$m=65536,t=4,p=1$hkv78i4hUcVwxywDq6oO9Q$g9bgV3GxUY9l3t0cjpk8/qrX756OmX6c6jTZgGfZ4jE	prov
25	mebel48@mail.ru	["ROLE_PROVIDER"]	$argon2id$v=19$m=65536,t=4,p=1$1fQUc98zTp7+tE2OmtMNjg$47l/FIIyODf8IuwqxjaXvCBABwmOs4aM4TqsFNrZloA	Антон Деревяшкин
26	kira@mail.ru	["ROLE_USER"]	$argon2id$v=19$m=65536,t=4,p=1$WIzTCFNNgfJJiI+r0s2/sA$5ETyhykxPQTqXwYdjfgI3K6pQWAscKroBvOeovT9mx0	Kira
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 26, true);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_9474526c4584665a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_9474526c4584665a ON public.comment USING btree (product_id);


--
-- Name: idx_9474526cd32632e8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_9474526cd32632e8 ON public.comment USING btree (_user_id);


--
-- Name: idx_d34a04ad12469de2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_d34a04ad12469de2 ON public.product USING btree (category_id);


--
-- Name: idx_d34a04add32632e8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_d34a04add32632e8 ON public.product USING btree (_user_id);


--
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- Name: fk_9474526c4584665a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526c4584665a FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: fk_9474526cd32632e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526cd32632e8 FOREIGN KEY (_user_id) REFERENCES public."user"(id);


--
-- Name: fk_d34a04ad12469de2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_d34a04ad12469de2 FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: fk_d34a04add32632e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_d34a04add32632e8 FOREIGN KEY (_user_id) REFERENCES public."user"(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

