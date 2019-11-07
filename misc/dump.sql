--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

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
-- Name: category; Type: TABLE; Schema: public; Owner: zf2_stud_news
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    category_key character varying(20) NOT NULL,
    category_name character varying(100) NOT NULL
);


ALTER TABLE public.category OWNER TO zf2_stud_news;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: zf2_stud_news
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO zf2_stud_news;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zf2_stud_news
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: zf2_stud_news
--

CREATE TABLE public.comment (
    id bigint NOT NULL,
    user_email character varying(50) NOT NULL,
    comment text NOT NULL,
    news bigint
);


ALTER TABLE public.comment OWNER TO zf2_stud_news;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: zf2_stud_news
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO zf2_stud_news;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zf2_stud_news
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: zf2_stud_news
--

CREATE TABLE public.news (
    id bigint NOT NULL,
    created timestamp(0) without time zone NOT NULL,
    updated timestamp(0) without time zone NOT NULL,
    title character varying(255) NOT NULL,
    preview_text text,
    full_text text NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    category bigint
);


ALTER TABLE public.news OWNER TO zf2_stud_news;

--
-- Name: news_category_seq; Type: SEQUENCE; Schema: public; Owner: zf2_stud_news
--

CREATE SEQUENCE public.news_category_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_category_seq OWNER TO zf2_stud_news;

--
-- Name: news_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zf2_stud_news
--

ALTER SEQUENCE public.news_category_seq OWNED BY public.news.category;


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: zf2_stud_news
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO zf2_stud_news;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zf2_stud_news
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: news category; Type: DEFAULT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.news ALTER COLUMN category SET DEFAULT nextval('public.news_category_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: zf2_stud_news
--

INSERT INTO public.category VALUES (11, 'Категория 1', 'Категория 1');
INSERT INTO public.category VALUES (10, 'Категория 2', 'Категория 2');


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zf2_stud_news
--

SELECT pg_catalog.setval('public.category_id_seq', 13, true);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: zf2_stud_news
--



--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zf2_stud_news
--

SELECT pg_catalog.setval('public.comment_id_seq', 3, false);


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: zf2_stud_news
--

INSERT INTO public.news VALUES (2, '2019-11-05 21:07:55', '2019-11-05 21:07:59', 'title', 'preview_text', 'full_text', false, 11);
INSERT INTO public.news VALUES (4, '2019-11-05 10:03:32', '2019-11-06 10:05:47', 'title1', 'preview_text1', 'full_text1', true, 10);
INSERT INTO public.news VALUES (32, '2019-06-11 19:05:00', '2019-11-07 09:49:54', 'Тестовая новость 1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus suscipit elit lobortis, accumsan nulla in, dignissim sem. Aenean varius at erat ut semper. Cras ullamcorper sagittis gravida. Donec vitae orci at nibh tincidunt mattis. Cras blandit lectus ac ex dapibus, sit amet mattis neque mollis. Donec ante orci, placerat id feugiat vitae, mattis egestas sapien. Donec vel convallis augue. Vestibulum dapibus lectus est, a tincidunt leo aliquam volutpat. Praesent ut gravida ligula. Integer non luctus metus. Curabitur vel est tristique, eleifend nibh a, tristique quam. Praesent hendrerit finibus felis, a porta odio imperdiet at. Donec mattis congue risus ut malesuada. Duis nec mollis eros, et ultrices tortor. Nullam et dui bibendum, dictum massa in, porta odio.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus suscipit elit lobortis, accumsan nulla in, dignissim sem. Aenean varius at erat ut semper. Cras ullamcorper sagittis gravida. Donec vitae orci at nibh tincidunt mattis. Cras blandit lectus ac ex dapibus, sit amet mattis neque mollis. Donec ante orci, placerat id feugiat vitae, mattis egestas sapien. Donec vel convallis augue. Vestibulum dapibus lectus est, a tincidunt leo aliquam volutpat. Praesent ut gravida ligula. Integer non luctus metus. Curabitur vel est tristique, eleifend nibh a, tristique quam. Praesent hendrerit finibus felis, a porta odio imperdiet at. Donec mattis congue risus ut malesuada. Duis nec mollis eros, et ultrices tortor. Nullam et dui bibendum, dictum massa in, porta odio.</p>

<p>Phasellus nec arcu auctor, dignissim orci ut, mattis purus. Donec dolor mi, tincidunt in elementum nec, bibendum eu sapien. Fusce vel nibh at ipsum auctor egestas. Maecenas elementum lorem ullamcorper sapien sagittis consequat. Aliquam vel sollicitudin urna, in porttitor erat. Pellentesque tristique erat vitae elit feugiat lacinia. Maecenas fringilla consequat erat, at posuere nunc lacinia eu. Aenean egestas massa eget sodales pretium. Suspendisse feugiat turpis nec fringilla mollis. Quisque vitae finibus lorem. Donec nec pharetra mi. Donec laoreet a turpis sit amet commodo. Nam interdum in ex sit amet bibendum. Mauris quis diam a lectus suscipit convallis. Vivamus est justo, convallis vitae vestibulum eget, fringilla elementum tortor. Praesent interdum scelerisque elit, eu semper dui mattis non.</p>

<p>Mauris venenatis pellentesque velit. Donec mattis libero risus, sit amet cursus velit blandit quis. Pellentesque iaculis nec eros gravida luctus. Nullam venenatis, nulla quis fringilla efficitur, est ipsum hendrerit urna, et consectetur nisl tellus id purus. Morbi nec ligula vitae nulla scelerisque lobortis. Integer nulla eros, ultricies sed mollis quis, porttitor id diam. Integer dictum nisi at neque tincidunt tristique non sollicitudin augue. Quisque vehicula vel elit sit amet porttitor. Nullam metus nisl, porta ut dapibus mollis, aliquam non sem. Phasellus mattis, nibh quis gravida aliquam, mauris felis sagittis elit, nec varius velit leo nec est. Donec posuere, orci sed elementum feugiat, nisl purus blandit tellus, et hendrerit libero mauris iaculis neque. Nunc nec diam eros.</p>

<p>Aenean metus mi, eleifend posuere diam at, tempus consectetur orci. Donec quis sodales velit. Etiam rhoncus auctor quam sollicitudin consectetur. Nullam dignissim, erat vitae cursus varius, nisl odio faucibus lectus, venenatis eleifend risus tellus in lectus. Vestibulum tristique pretium lorem ac interdum. Mauris dapibus euismod ultrices. Proin faucibus rutrum accumsan. Phasellus massa lectus, luctus quis pharetra ut, dapibus id erat. Maecenas eget eros ut justo pellentesque rhoncus at quis orci. Aenean et nisi ornare, vestibulum diam nec, luctus quam. Nunc volutpat interdum magna eu lobortis. Mauris consequat, augue molestie mattis rhoncus, nunc nunc tempus ipsum, in elementum urna est in nisl. Fusce semper sodales dictum. Nunc semper tincidunt auctor. Pellentesque ultrices vitae nisi sed tincidunt.</p>

<p>Integer pretium blandit ligula, eget euismod enim pharetra in. Quisque ut enim nec magna convallis vestibulum. Quisque rhoncus sapien turpis, at accumsan urna volutpat porta. Praesent finibus blandit efficitur. Sed dictum lacus tortor, sit amet dignissim tortor aliquet sit amet. Nulla vulputate turpis non nibh bibendum, nec ultricies justo aliquam. Sed ligula nisl, maximus a convallis vel, ultrices ut odio. Proin interdum orci id ullamcorper tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin sit amet erat elit.</p>', true, 11);
INSERT INTO public.news VALUES (31, '2019-06-11 16:34:00', '2019-11-07 09:56:43', 'Тестовая новость 2', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus suscipit elit lobortis, accumsan nulla in, dignissim sem. Aenean varius at erat ut semper. Cras ullamcorper sagittis gravida. Donec vitae orci at nibh tincidunt mattis. Cras blandit lectus ac ex dapibus, sit amet mattis neque mollis. Donec ante orci, placerat id feugiat vitae, mattis egestas sapien. Donec vel convallis augue. Vestibulum dapibus lectus est, a tincidunt leo aliquam volutpat. Praesent ut gravida ligula. Integer non luctus metus. Curabitur vel est tristique, eleifend nibh a, tristique quam. Praesent hendrerit finibus felis, a porta odio imperdiet at. Donec mattis congue risus ut malesuada. Duis nec mollis eros, et ultrices tortor. Nullam et dui bibendum, dictum massa in, porta odio.</p>

<p>Phasellus nec arcu auctor, dignissim orci ut, mattis purus. Donec dolor mi, tincidunt in elementum nec, bibendum eu sapien. Fusce vel nibh at ipsum auctor egestas. Maecenas elementum lorem ullamcorper sapien sagittis consequat. Aliquam vel sollicitudin urna, in porttitor erat. Pellentesque tristique erat vitae elit feugiat lacinia. Maecenas fringilla consequat erat, at posuere nunc lacinia eu. Aenean egestas massa eget sodales pretium. Suspendisse feugiat turpis nec fringilla mollis. Quisque vitae finibus lorem. Donec nec pharetra mi. Donec laoreet a turpis sit amet commodo. Nam interdum in ex sit amet bibendum. Mauris quis diam a lectus suscipit convallis. Vivamus est justo, convallis vitae vestibulum eget, fringilla elementum tortor. Praesent interdum scelerisque elit, eu semper dui mattis non.</p>

<p>Mauris venenatis pellentesque velit. Donec mattis libero risus, sit amet cursus velit blandit quis. Pellentesque iaculis nec eros gravida luctus. Nullam venenatis, nulla quis fringilla efficitur, est ipsum hendrerit urna, et consectetur nisl tellus id purus. Morbi nec ligula vitae nulla scelerisque lobortis. Integer nulla eros, ultricies sed mollis quis, porttitor id diam. Integer dictum nisi at neque tincidunt tristique non sollicitudin augue. Quisque vehicula vel elit sit amet porttitor. Nullam metus nisl, porta ut dapibus mollis, aliquam non sem. Phasellus mattis, nibh quis gravida aliquam, mauris felis sagittis elit, nec varius velit leo nec est. Donec posuere, orci sed elementum feugiat, nisl purus blandit tellus, et hendrerit libero mauris iaculis neque. Nunc nec diam eros.</p>

<p>Aenean metus mi, eleifend posuere diam at, tempus consectetur orci. Donec quis sodales velit. Etiam rhoncus auctor quam sollicitudin consectetur. Nullam dignissim, erat vitae cursus varius, nisl odio faucibus lectus, venenatis eleifend risus tellus in lectus. Vestibulum tristique pretium lorem ac interdum. Mauris dapibus euismod ultrices. Proin faucibus rutrum accumsan. Phasellus massa lectus, luctus quis pharetra ut, dapibus id erat. Maecenas eget eros ut justo pellentesque rhoncus at quis orci. Aenean et nisi ornare, vestibulum diam nec, luctus quam. Nunc volutpat interdum magna eu lobortis. Mauris consequat, augue molestie mattis rhoncus, nunc nunc tempus ipsum, in elementum urna est in nisl. Fusce semper sodales dictum. Nunc semper tincidunt auctor. Pellentesque ultrices vitae nisi sed tincidunt.</p>

<p>Integer pretium blandit ligula, eget euismod enim pharetra in. Quisque ut enim nec magna convallis vestibulum. Quisque rhoncus sapien turpis, at accumsan urna volutpat porta. Praesent finibus blandit efficitur. Sed dictum lacus tortor, sit amet dignissim tortor aliquet sit amet. Nulla vulputate turpis non nibh bibendum, nec ultricies justo aliquam. Sed ligula nisl, maximus a convallis vel, ultrices ut odio. Proin interdum orci id ullamcorper tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin sit amet erat elit.</p>', true, 11);
INSERT INTO public.news VALUES (27, '2019-05-11 15:21:00', '2019-11-07 09:57:07', 'Тестовая новость 3', '<p>test</p>', '<p>test</p>', true, 10);
INSERT INTO public.news VALUES (26, '2019-06-11 15:21:00', '2019-11-07 09:57:29', 'Lorem Ipsum', '', '<h1>Lorem Ipsum</h1>', true, 11);
INSERT INTO public.news VALUES (21, '2019-06-11 14:51:00', '2019-11-07 09:57:57', 'Тестовая новость 4', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus suscipit elit lobortis, accumsan nulla in, dignissim sem. Aenean varius at erat ut semper. Cras ullamcorper sagittis gravida. Donec vitae orci at nibh tincidunt mattis. Cras blandit lectus ac ex dapibus, sit amet mattis neque mollis. Donec ante orci, placerat id feugiat vitae, mattis egestas sapien. Donec vel convallis augue. Vestibulum dapibus lectus est, a tincidunt leo aliquam volutpat. Praesent ut gravida ligula. Integer non luctus metus. Curabitur vel est tristique, eleifend nibh a, tristique quam. Praesent hendrerit finibus felis, a porta odio imperdiet at. Donec mattis congue risus ut malesuada. Duis nec mollis eros, et ultrices tortor. Nullam et dui bibendum, dictum massa in, porta odio.</p>', true, 10);


--
-- Name: news_category_seq; Type: SEQUENCE SET; Schema: public; Owner: zf2_stud_news
--

SELECT pg_catalog.setval('public.news_category_seq', 4, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zf2_stud_news
--

SELECT pg_catalog.setval('public.news_id_seq', 33, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: category_key; Type: INDEX; Schema: public; Owner: zf2_stud_news
--

CREATE UNIQUE INDEX category_key ON public.category USING btree (category_key);


--
-- Name: comment comment_news_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_news_fkey FOREIGN KEY (news) REFERENCES public.news(id);


--
-- Name: news news_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zf2_stud_news
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_category_fkey FOREIGN KEY (category) REFERENCES public.category(id);


--
-- PostgreSQL database dump complete
--

