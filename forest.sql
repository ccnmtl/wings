--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ccnmtl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ccnmtl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_group_id_seq', 48, true);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ccnmtl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ccnmtl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO ccnmtl;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO ccnmtl;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_message_id_seq', 4, true);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ccnmtl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ccnmtl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_permission_id_seq', 123, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ccnmtl;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ccnmtl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ccnmtl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 66, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ccnmtl;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_user_id_seq', 16, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ccnmtl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ccnmtl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: careermapblock_basemap; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE careermapblock_basemap (
    id integer NOT NULL,
    cmap_id integer NOT NULL,
    name character varying(256) NOT NULL,
    image character varying(100) NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.careermapblock_basemap OWNER TO ccnmtl;

--
-- Name: careermapblock_basemap_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE careermapblock_basemap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.careermapblock_basemap_id_seq OWNER TO ccnmtl;

--
-- Name: careermapblock_basemap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE careermapblock_basemap_id_seq OWNED BY careermapblock_basemap.id;


--
-- Name: careermapblock_basemap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('careermapblock_basemap_id_seq', 5, true);


--
-- Name: careermapblock_careermap; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE careermapblock_careermap (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.careermapblock_careermap OWNER TO ccnmtl;

--
-- Name: careermapblock_careermap_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE careermapblock_careermap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.careermapblock_careermap_id_seq OWNER TO ccnmtl;

--
-- Name: careermapblock_careermap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE careermapblock_careermap_id_seq OWNED BY careermapblock_careermap.id;


--
-- Name: careermapblock_careermap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('careermapblock_careermap_id_seq', 1, true);


--
-- Name: careermapblock_layer; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE careermapblock_layer (
    id integer NOT NULL,
    cmap_id integer NOT NULL,
    name character varying(256) NOT NULL,
    color character varying(16) NOT NULL,
    image character varying(100) NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.careermapblock_layer OWNER TO ccnmtl;

--
-- Name: careermapblock_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE careermapblock_layer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.careermapblock_layer_id_seq OWNER TO ccnmtl;

--
-- Name: careermapblock_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE careermapblock_layer_id_seq OWNED BY careermapblock_layer.id;


--
-- Name: careermapblock_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('careermapblock_layer_id_seq', 5, true);


--
-- Name: careermapblock_question; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE careermapblock_question (
    id integer NOT NULL,
    cmap_id integer NOT NULL,
    text text,
    _order integer NOT NULL
);


ALTER TABLE public.careermapblock_question OWNER TO ccnmtl;

--
-- Name: careermapblock_question_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE careermapblock_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.careermapblock_question_id_seq OWNER TO ccnmtl;

--
-- Name: careermapblock_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE careermapblock_question_id_seq OWNED BY careermapblock_question.id;


--
-- Name: careermapblock_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('careermapblock_question_id_seq', 3, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ccnmtl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ccnmtl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ccnmtl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ccnmtl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_content_type_id_seq', 41, true);


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO ccnmtl;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_flatpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO ccnmtl;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_flatpage_id_seq OWNED BY django_flatpage.id;


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_flatpage_id_seq', 1, false);


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO ccnmtl;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO ccnmtl;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_flatpage_sites_id_seq OWNED BY django_flatpage_sites.id;


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 1, false);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ccnmtl;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO ccnmtl;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO ccnmtl;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: fridgeblock_category; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE fridgeblock_category (
    id integer NOT NULL,
    fridgeblock_id integer NOT NULL,
    label character varying(256) NOT NULL,
    image character varying(100) NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.fridgeblock_category OWNER TO ccnmtl;

--
-- Name: fridgeblock_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE fridgeblock_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fridgeblock_category_id_seq OWNER TO ccnmtl;

--
-- Name: fridgeblock_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE fridgeblock_category_id_seq OWNED BY fridgeblock_category.id;


--
-- Name: fridgeblock_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('fridgeblock_category_id_seq', 4, true);


--
-- Name: fridgeblock_fridgeblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE fridgeblock_fridgeblock (
    id integer NOT NULL
);


ALTER TABLE public.fridgeblock_fridgeblock OWNER TO ccnmtl;

--
-- Name: fridgeblock_fridgeblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE fridgeblock_fridgeblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fridgeblock_fridgeblock_id_seq OWNER TO ccnmtl;

--
-- Name: fridgeblock_fridgeblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE fridgeblock_fridgeblock_id_seq OWNED BY fridgeblock_fridgeblock.id;


--
-- Name: fridgeblock_fridgeblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('fridgeblock_fridgeblock_id_seq', 1, true);


--
-- Name: fridgeblock_item; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE fridgeblock_item (
    id integer NOT NULL,
    label character varying(256) NOT NULL,
    category_id integer NOT NULL,
    description text NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.fridgeblock_item OWNER TO ccnmtl;

--
-- Name: fridgeblock_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE fridgeblock_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fridgeblock_item_id_seq OWNER TO ccnmtl;

--
-- Name: fridgeblock_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE fridgeblock_item_id_seq OWNED BY fridgeblock_item.id;


--
-- Name: fridgeblock_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('fridgeblock_item_id_seq', 8, true);


--
-- Name: fridgeblock_magnet; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE fridgeblock_magnet (
    id integer NOT NULL,
    session_id integer NOT NULL,
    item_id integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL
);


ALTER TABLE public.fridgeblock_magnet OWNER TO ccnmtl;

--
-- Name: fridgeblock_magnet_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE fridgeblock_magnet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fridgeblock_magnet_id_seq OWNER TO ccnmtl;

--
-- Name: fridgeblock_magnet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE fridgeblock_magnet_id_seq OWNED BY fridgeblock_magnet.id;


--
-- Name: fridgeblock_magnet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('fridgeblock_magnet_id_seq', 4, true);


--
-- Name: fridgeblock_session; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE fridgeblock_session (
    id integer NOT NULL,
    fridgeblock_id integer NOT NULL,
    user_id integer NOT NULL,
    saved timestamp with time zone NOT NULL
);


ALTER TABLE public.fridgeblock_session OWNER TO ccnmtl;

--
-- Name: fridgeblock_session_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE fridgeblock_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fridgeblock_session_id_seq OWNER TO ccnmtl;

--
-- Name: fridgeblock_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE fridgeblock_session_id_seq OWNED BY fridgeblock_session.id;


--
-- Name: fridgeblock_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('fridgeblock_session_id_seq', 4, true);


--
-- Name: main_stand; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE main_stand (
    id integer NOT NULL,
    title character varying(256),
    hostname character varying(256) NOT NULL,
    created timestamp with time zone NOT NULL,
    css text,
    description text,
    access character varying(256) DEFAULT 'open'::character varying NOT NULL
);


ALTER TABLE public.main_stand OWNER TO ccnmtl;

--
-- Name: main_stand_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE main_stand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_stand_id_seq OWNER TO ccnmtl;

--
-- Name: main_stand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE main_stand_id_seq OWNED BY main_stand.id;


--
-- Name: main_stand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('main_stand_id_seq', 8, true);


--
-- Name: main_standavailablepageblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE main_standavailablepageblock (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    block character varying(256) NOT NULL
);


ALTER TABLE public.main_standavailablepageblock OWNER TO ccnmtl;

--
-- Name: main_standavailablepageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE main_standavailablepageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_standavailablepageblock_id_seq OWNER TO ccnmtl;

--
-- Name: main_standavailablepageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE main_standavailablepageblock_id_seq OWNED BY main_standavailablepageblock.id;


--
-- Name: main_standavailablepageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('main_standavailablepageblock_id_seq', 33, true);


--
-- Name: main_standgroup; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE main_standgroup (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    group_id integer NOT NULL,
    access character varying(16) NOT NULL
);


ALTER TABLE public.main_standgroup OWNER TO ccnmtl;

--
-- Name: main_standgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE main_standgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_standgroup_id_seq OWNER TO ccnmtl;

--
-- Name: main_standgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE main_standgroup_id_seq OWNED BY main_standgroup.id;


--
-- Name: main_standgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('main_standgroup_id_seq', 1, false);


--
-- Name: main_standsetting; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE main_standsetting (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    name character varying(256) NOT NULL,
    value character varying(256) NOT NULL
);


ALTER TABLE public.main_standsetting OWNER TO ccnmtl;

--
-- Name: main_standsetting_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE main_standsetting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_standsetting_id_seq OWNER TO ccnmtl;

--
-- Name: main_standsetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE main_standsetting_id_seq OWNED BY main_standsetting.id;


--
-- Name: main_standsetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('main_standsetting_id_seq', 1, false);


--
-- Name: main_standuser; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE main_standuser (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    user_id integer NOT NULL,
    access character varying(16) NOT NULL
);


ALTER TABLE public.main_standuser OWNER TO ccnmtl;

--
-- Name: main_standuser_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE main_standuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_standuser_id_seq OWNER TO ccnmtl;

--
-- Name: main_standuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE main_standuser_id_seq OWNED BY main_standuser.id;


--
-- Name: main_standuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('main_standuser_id_seq', 27, true);


--
-- Name: munin_test; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE munin_test (
    id integer NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE public.munin_test OWNER TO ccnmtl;

--
-- Name: munin_test_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE munin_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.munin_test_id_seq OWNER TO ccnmtl;

--
-- Name: munin_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE munin_test_id_seq OWNED BY munin_test.id;


--
-- Name: munin_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('munin_test_id_seq', 90129, true);


--
-- Name: pageblocks_htmlblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_htmlblock (
    id integer NOT NULL,
    html text NOT NULL
);


ALTER TABLE public.pageblocks_htmlblock OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_htmlblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_htmlblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_htmlblock_id_seq OWNED BY pageblocks_htmlblock.id;


--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_htmlblock_id_seq', 27, true);


--
-- Name: pageblocks_htmlblockwysiwyg; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_htmlblockwysiwyg (
    id integer NOT NULL,
    wysiwyg_html text NOT NULL
);


ALTER TABLE public.pageblocks_htmlblockwysiwyg OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_htmlblockwysiwyg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_htmlblockwysiwyg_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_htmlblockwysiwyg_id_seq OWNED BY pageblocks_htmlblockwysiwyg.id;


--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_htmlblockwysiwyg_id_seq', 1, false);


--
-- Name: pageblocks_imageblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_imageblock (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    caption text NOT NULL,
    alt character varying(100)
);


ALTER TABLE public.pageblocks_imageblock OWNER TO ccnmtl;

--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_imageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_imageblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_imageblock_id_seq OWNED BY pageblocks_imageblock.id;


--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_imageblock_id_seq', 6, true);


--
-- Name: pageblocks_imagepullquoteblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_imagepullquoteblock (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    caption text NOT NULL,
    alt character varying(100)
);


ALTER TABLE public.pageblocks_imagepullquoteblock OWNER TO ccnmtl;

--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_imagepullquoteblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_imagepullquoteblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_imagepullquoteblock_id_seq OWNED BY pageblocks_imagepullquoteblock.id;


--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_imagepullquoteblock_id_seq', 1, false);


--
-- Name: pageblocks_pullquoteblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_pullquoteblock (
    id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.pageblocks_pullquoteblock OWNER TO ccnmtl;

--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_pullquoteblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_pullquoteblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_pullquoteblock_id_seq OWNED BY pageblocks_pullquoteblock.id;


--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_pullquoteblock_id_seq', 1, false);


--
-- Name: pageblocks_textblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pageblocks_textblock (
    id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.pageblocks_textblock OWNER TO ccnmtl;

--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pageblocks_textblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pageblocks_textblock_id_seq OWNER TO ccnmtl;

--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pageblocks_textblock_id_seq OWNED BY pageblocks_textblock.id;


--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pageblocks_textblock_id_seq', 49, true);


--
-- Name: pagetree_hierarchy; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_hierarchy (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    base_url character varying(256) NOT NULL
);


ALTER TABLE public.pagetree_hierarchy OWNER TO ccnmtl;

--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_hierarchy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_hierarchy_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_hierarchy_id_seq OWNED BY pagetree_hierarchy.id;


--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_hierarchy_id_seq', 11, true);


--
-- Name: pagetree_pageblock; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_pageblock (
    id integer NOT NULL,
    section_id integer NOT NULL,
    ordinality integer NOT NULL,
    label character varying(256),
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT pagetree_pageblock_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT pagetree_pageblock_ordinality_check CHECK ((ordinality >= 0))
);


ALTER TABLE public.pagetree_pageblock OWNER TO ccnmtl;

--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_pageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_pageblock_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_pageblock_id_seq OWNED BY pagetree_pageblock.id;


--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_pageblock_id_seq', 149, true);


--
-- Name: pagetree_section; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE pagetree_section (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    label character varying(256) NOT NULL,
    slug character varying(50) NOT NULL,
    hierarchy_id integer NOT NULL,
    CONSTRAINT pagetree_section_depth_check CHECK ((depth >= 0)),
    CONSTRAINT pagetree_section_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.pagetree_section OWNER TO ccnmtl;

--
-- Name: pagetree_section_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE pagetree_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagetree_section_id_seq OWNER TO ccnmtl;

--
-- Name: pagetree_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE pagetree_section_id_seq OWNED BY pagetree_section.id;


--
-- Name: pagetree_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('pagetree_section_id_seq', 126, true);


--
-- Name: quizblock_answer; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_answer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    value character varying(256) NOT NULL,
    label text NOT NULL,
    correct boolean NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.quizblock_answer OWNER TO ccnmtl;

--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_answer_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_answer_id_seq OWNED BY quizblock_answer.id;


--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_answer_id_seq', 447, true);


--
-- Name: quizblock_question; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_question (
    id integer NOT NULL,
    quiz_id integer NOT NULL,
    text text NOT NULL,
    question_type character varying(256) NOT NULL,
    explanation text NOT NULL,
    intro_text text NOT NULL,
    _order integer NOT NULL
);


ALTER TABLE public.quizblock_question OWNER TO ccnmtl;

--
-- Name: quizblock_question_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_question_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_question_id_seq OWNED BY quizblock_question.id;


--
-- Name: quizblock_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_question_id_seq', 169, true);


--
-- Name: quizblock_quiz; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_quiz (
    id integer NOT NULL,
    description text NOT NULL,
    rhetorical boolean NOT NULL,
    allow_redo boolean DEFAULT true
);


ALTER TABLE public.quizblock_quiz OWNER TO ccnmtl;

--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_quiz_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_quiz_id_seq OWNED BY quizblock_quiz.id;


--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_quiz_id_seq', 65, true);


--
-- Name: quizblock_response; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_response (
    id integer NOT NULL,
    question_id integer NOT NULL,
    submission_id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.quizblock_response OWNER TO ccnmtl;

--
-- Name: quizblock_response_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_response_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_response_id_seq OWNED BY quizblock_response.id;


--
-- Name: quizblock_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_response_id_seq', 28, true);


--
-- Name: quizblock_submission; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE quizblock_submission (
    id integer NOT NULL,
    quiz_id integer NOT NULL,
    user_id integer NOT NULL,
    submitted timestamp with time zone NOT NULL
);


ALTER TABLE public.quizblock_submission OWNER TO ccnmtl;

--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE quizblock_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizblock_submission_id_seq OWNER TO ccnmtl;

--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE quizblock_submission_id_seq OWNED BY quizblock_submission.id;


--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('quizblock_submission_id_seq', 11, true);


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO ccnmtl;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO ccnmtl;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 7, true);


--
-- Name: tagging_tag; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE tagging_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tagging_tag OWNER TO ccnmtl;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE tagging_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagging_tag_id_seq OWNER TO ccnmtl;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE tagging_tag_id_seq OWNED BY tagging_tag.id;


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('tagging_tag_id_seq', 1, false);


--
-- Name: tagging_taggeditem; Type: TABLE; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE TABLE tagging_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT tagging_taggeditem_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.tagging_taggeditem OWNER TO ccnmtl;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: ccnmtl
--

CREATE SEQUENCE tagging_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagging_taggeditem_id_seq OWNER TO ccnmtl;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ccnmtl
--

ALTER SEQUENCE tagging_taggeditem_id_seq OWNED BY tagging_taggeditem.id;


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ccnmtl
--

SELECT pg_catalog.setval('tagging_taggeditem_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE careermapblock_basemap ALTER COLUMN id SET DEFAULT nextval('careermapblock_basemap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE careermapblock_careermap ALTER COLUMN id SET DEFAULT nextval('careermapblock_careermap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE careermapblock_layer ALTER COLUMN id SET DEFAULT nextval('careermapblock_layer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE careermapblock_question ALTER COLUMN id SET DEFAULT nextval('careermapblock_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE django_flatpage ALTER COLUMN id SET DEFAULT nextval('django_flatpage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('django_flatpage_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE fridgeblock_category ALTER COLUMN id SET DEFAULT nextval('fridgeblock_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE fridgeblock_fridgeblock ALTER COLUMN id SET DEFAULT nextval('fridgeblock_fridgeblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE fridgeblock_item ALTER COLUMN id SET DEFAULT nextval('fridgeblock_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE fridgeblock_magnet ALTER COLUMN id SET DEFAULT nextval('fridgeblock_magnet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE fridgeblock_session ALTER COLUMN id SET DEFAULT nextval('fridgeblock_session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE main_stand ALTER COLUMN id SET DEFAULT nextval('main_stand_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE main_standavailablepageblock ALTER COLUMN id SET DEFAULT nextval('main_standavailablepageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE main_standgroup ALTER COLUMN id SET DEFAULT nextval('main_standgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE main_standsetting ALTER COLUMN id SET DEFAULT nextval('main_standsetting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE main_standuser ALTER COLUMN id SET DEFAULT nextval('main_standuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE munin_test ALTER COLUMN id SET DEFAULT nextval('munin_test_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pageblocks_htmlblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_htmlblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pageblocks_htmlblockwysiwyg ALTER COLUMN id SET DEFAULT nextval('pageblocks_htmlblockwysiwyg_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pageblocks_imageblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_imageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pageblocks_imagepullquoteblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_imagepullquoteblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pageblocks_pullquoteblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_pullquoteblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pageblocks_textblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_textblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pagetree_hierarchy ALTER COLUMN id SET DEFAULT nextval('pagetree_hierarchy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pagetree_pageblock ALTER COLUMN id SET DEFAULT nextval('pagetree_pageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE pagetree_section ALTER COLUMN id SET DEFAULT nextval('pagetree_section_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE quizblock_answer ALTER COLUMN id SET DEFAULT nextval('quizblock_answer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE quizblock_question ALTER COLUMN id SET DEFAULT nextval('quizblock_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE quizblock_quiz ALTER COLUMN id SET DEFAULT nextval('quizblock_quiz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE quizblock_response ALTER COLUMN id SET DEFAULT nextval('quizblock_response_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE quizblock_submission ALTER COLUMN id SET DEFAULT nextval('quizblock_submission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE tagging_tag ALTER COLUMN id SET DEFAULT nextval('tagging_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ccnmtl
--

ALTER TABLE tagging_taggeditem ALTER COLUMN id SET DEFAULT nextval('tagging_taggeditem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_group (id, name) FROM stdin;
1	staff.cunix.local:columbia.edu
2	tlc.cunix.local:columbia.edu
3	tlcxml.cunix.local:columbia.edu
4	ALL_CU
5	t1.y2011.s001.cy4199.a&hh.st.course:columbia.edu
6	t1.y2008.s002.cy5010.a&h.st.course:columbia.edu
7	t3.y2008.s001.ca4469.arch.st.course:columbia.edu
8	t3.y2010.s001.ca4642.arch.st.course:columbia.edu
9	t1.y2010.s001.cb8210.buec.st.course:columbia.edu
10	t1.y2006.s001.cf2010.coll.st.course:columbia.edu
11	t3.y2006.s001.cu8793.inaf.st.course:columbia.edu
12	t3.y2006.s016.cj6010.jour.st.course:columbia.edu
13	t3.y2008.s001.cj6019.jour.st.course:columbia.edu
14	t3.y2007.s001.cj8040.jour.st.course:columbia.edu
15	t3.y2009.s001.cj9042.jour.st.course:columbia.edu
16	t1.y2009.s001.cj9055.jour.st.course:columbia.edu
17	t1.y2005.s001.cl9325.law.st.course:columbia.edu
18	t1.y2010.s007.cy4901.mstu.st.course:columbia.edu
19	t1.y2008.s005.cy6901.mstu.st.course:columbia.edu
20	t1.y2011.s001.ck4220.nmed.st.course:columbia.edu
21	t3.y2007.s001.co6023.nwsg.st.course:columbia.edu
22	t1.y2009.s001.co2206.nyug.st.course:columbia.edu
23	t3.y2010.s001.cg4010.ohma.st.course:columbia.edu
24	t1.y2008.s001.cg8247.pols.st.course:columbia.edu
25	t3.y2011.s001.cj0001.regi.st.course:columbia.edu
26	t3.y2009.s001.cj0002.resi.st.course:columbia.edu
27	t1.y2010.s001.cj0002.resi.st.course:columbia.edu
28	t3.y2010.s001.cj0002.resi.st.course:columbia.edu
29	t1.y2011.s001.cj0002.resi.st.course:columbia.edu
30	t3.y2009.s001.cg8200.soci.st.course:columbia.edu
31	t1.y2010.s001.ck4030.nmed.st.course:columbia.edu
32	t3.y2009.s001.ck4100.nmed.st.course:columbia.edu
33	t1.y2011.s001.ck4110.nmed.st.course:columbia.edu
34	t1.y2011.s001.ck4111.nmed.st.course:columbia.edu
35	t3.y2010.s001.ck4990.nmed.st.course:columbia.edu
36	t3.y2011.s002.cj9900.jour.st.course:columbia.edu
37	t3.y2011.s001.cy5045.ccpx.st.course:columbia.edu
38	t3.y2011.s002.co2012.nyug.st.course:columbia.edu
39	t3.y2010.s005.cu6500.sipa.st.course:columbia.edu
40	t1.y2011.s002.cu6501.sipa.st.course:columbia.edu
41	t3.y2010.s001.ct8002.socw.st.course:columbia.edu
42	t3.y2010.s002.ct8004.socw.st.course:columbia.edu
43	t3.y2010.s001.ct8202.socw.st.course:columbia.edu
44	t1.y2011.s001.ct8203.socw.st.course:columbia.edu
45	t1.y2011.s001.ct8507.socw.st.course:columbia.edu
46	t3.y2010.s001.ct8509.socw.st.course:columbia.edu
47	t1.y2011.s001.ct8510.socw.st.course:columbia.edu
48	t3.y2010.s001.ct8801.socw.st.course:columbia.edu
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add message	4	add_message
11	Can change message	4	change_message
12	Can delete message	4	delete_message
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add flat page	8	add_flatpage
23	Can change flat page	8	change_flatpage
24	Can delete flat page	8	delete_flatpage
25	Can add log entry	9	add_logentry
26	Can change log entry	9	change_logentry
27	Can delete log entry	9	delete_logentry
28	Can add tag	10	add_tag
29	Can change tag	10	change_tag
30	Can delete tag	10	delete_tag
31	Can add tagged item	11	add_taggeditem
32	Can change tagged item	11	change_taggeditem
33	Can delete tagged item	11	delete_taggeditem
34	Can add test	12	add_test
35	Can change test	12	change_test
36	Can delete test	12	delete_test
37	Can add hierarchy	13	add_hierarchy
38	Can change hierarchy	13	change_hierarchy
39	Can delete hierarchy	13	delete_hierarchy
40	Can add section	14	add_section
41	Can change section	14	change_section
42	Can delete section	14	delete_section
43	Can add page block	15	add_pageblock
44	Can change page block	15	change_pageblock
45	Can delete page block	15	delete_pageblock
46	Can add text block	16	add_textblock
47	Can change text block	16	change_textblock
48	Can delete text block	16	delete_textblock
49	Can add html block	17	add_htmlblock
50	Can change html block	17	change_htmlblock
51	Can delete html block	17	delete_htmlblock
52	Can add pull quote block	18	add_pullquoteblock
53	Can change pull quote block	18	change_pullquoteblock
54	Can delete pull quote block	18	delete_pullquoteblock
55	Can add image block	19	add_imageblock
56	Can change image block	19	change_imageblock
57	Can delete image block	19	delete_imageblock
58	Can add image pull quote block	20	add_imagepullquoteblock
59	Can change image pull quote block	20	change_imagepullquoteblock
60	Can delete image pull quote block	20	delete_imagepullquoteblock
61	Can add html block wysiwyg	21	add_htmlblockwysiwyg
62	Can change html block wysiwyg	21	change_htmlblockwysiwyg
63	Can delete html block wysiwyg	21	delete_htmlblockwysiwyg
64	Can add stand	22	add_stand
65	Can change stand	22	change_stand
66	Can delete stand	22	delete_stand
67	Can add stand user	23	add_standuser
68	Can change stand user	23	change_standuser
69	Can delete stand user	23	delete_standuser
70	Can add stand setting	24	add_standsetting
71	Can change stand setting	24	change_standsetting
72	Can delete stand setting	24	delete_standsetting
73	Can add stand group	25	add_standgroup
74	Can change stand group	25	change_standgroup
75	Can delete stand group	25	delete_standgroup
76	Can add quiz	26	add_quiz
77	Can change quiz	26	change_quiz
78	Can delete quiz	26	delete_quiz
79	Can add question	27	add_question
80	Can change question	27	change_question
81	Can delete question	27	delete_question
82	Can add answer	28	add_answer
83	Can change answer	28	change_answer
84	Can delete answer	28	delete_answer
85	Can add submission	29	add_submission
86	Can change submission	29	change_submission
87	Can delete submission	29	delete_submission
88	Can add response	30	add_response
89	Can change response	30	change_response
90	Can delete response	30	delete_response
91	Can add stand available page block	31	add_standavailablepageblock
92	Can change stand available page block	31	change_standavailablepageblock
93	Can delete stand available page block	31	delete_standavailablepageblock
94	Can add career map	32	add_careermap
95	Can change career map	32	change_careermap
96	Can delete career map	32	delete_careermap
97	Can add base map	33	add_basemap
98	Can change base map	33	change_basemap
99	Can delete base map	33	delete_basemap
100	Can add layer	34	add_layer
101	Can change layer	34	change_layer
102	Can delete layer	34	delete_layer
103	Can add question	35	add_question
104	Can change question	35	change_question
105	Can delete question	35	delete_question
106	Can add fridge block	36	add_fridgeblock
107	Can change fridge block	36	change_fridgeblock
108	Can delete fridge block	36	delete_fridgeblock
109	Can add category	37	add_category
110	Can change category	37	change_category
111	Can delete category	37	delete_category
112	Can add item	38	add_item
113	Can change item	38	change_item
114	Can delete item	38	delete_item
115	Can add session	39	add_session
116	Can change session	39	change_session
117	Can delete session	39	delete_session
118	Can add magnet	40	add_magnet
119	Can change magnet	40	change_magnet
120	Can delete magnet	40	delete_magnet
121	Can add migration history	41	add_migrationhistory
122	Can change migration history	41	change_migrationhistory
123	Can delete migration history	41	delete_migrationhistory
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
3	sbd12	Schuyler	Duveen	sbd12@columbia.edu	!	f	t	f	2011-06-02 15:12:50.799859-04	2011-06-02 15:12:50.799871-04
4	zm4	Zarina	Mustapha	zm4@columbia.edu	!	f	t	f	2011-06-02 15:21:46.02636-04	2011-06-02 15:21:46.026372-04
6	amm8	A.	Matiz	amm8@columbia.edu	!	f	t	f	2011-06-02 15:22:30.926288-04	2011-06-02 15:22:30.926301-04
9	mar227	Marc	Raymond	mar227@columbia.edu	!	f	t	f	2011-06-02 15:23:00.029295-04	2011-06-02 15:23:00.029307-04
10	sld2131	Susan	Dreher	sld2131@columbia.edu	!	f	t	f	2011-06-02 15:23:17.279174-04	2011-06-02 15:23:17.279188-04
14	lg123	Louisa	Gilbert	lg123@columbia.edu	!	f	t	f	2011-10-17 11:43:30.561116-04	2011-10-17 11:43:30.561128-04
16	dg2121	Dawn	Goddard-Eckrich	dg2121@columbia.edu	!	f	t	f	2011-10-17 11:44:00.292812-04	2011-10-17 11:44:00.292828-04
7	ej2223	Ethan	Jucovy	ej2223@columbia.edu	!	t	t	t	2011-06-28 11:55:46.658858-04	2011-06-02 15:22:41.332687-04
15	sas2268	Stacey	Shaw	sas2268@columbia.edu	!	f	t	f	2011-10-17 12:56:56.268183-04	2011-10-17 11:43:47.944542-04
12	jl3562	June	Levine	jl3562@columbia.edu	!	f	t	f	2011-07-20 15:04:51.859021-04	2011-07-20 15:04:51.831345-04
11	cks2120	Cindy	Smalletz	cks2120@columbia.edu	!	t	t	f	2011-08-25 18:01:26.073388-04	2011-06-20 15:02:19.998826-04
5	egr2107	Edward	Rubeiz	egr2107@columbia.edu	!	t	t	t	2011-10-19 15:36:19.649734-04	2011-06-02 15:22:04.4714-04
13	jr2502	Jessica	Rowe	jr2502@columbia.edu	!	t	t	f	2011-10-20 08:47:49.665888-04	2011-10-11 11:39:54.28686-04
2	jb2410	Jonah	Bossewitch	jb2410@columbia.edu	!	t	t	t	2011-09-15 17:53:14.469942-04	2011-06-01 14:35:19.53697-04
1	anp8	Anders	Pearson	anp8@columbia.edu	!	t	t	t	2011-10-24 11:37:17.52734-04	2011-05-18 15:57:36.886786-04
8	ed2198	Elizabeth	Day	ed2198@columbia.edu	!	t	t	t	2011-09-15 17:58:04.768569-04	2011-06-02 15:22:48.818126-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	1
6	2	2
7	2	3
8	2	5
9	2	6
10	2	7
11	2	8
12	2	9
13	2	10
14	2	11
15	2	12
16	2	13
17	2	14
18	2	15
19	2	16
20	2	17
21	2	18
22	2	19
23	2	20
24	2	21
25	2	22
26	2	23
27	2	24
28	2	25
29	2	26
30	2	27
31	2	28
32	2	29
33	2	30
34	2	4
35	7	2
36	7	3
37	7	4
38	11	2
39	11	31
40	11	32
41	11	33
42	11	34
43	11	35
44	11	4
45	12	4
46	8	2
47	8	4
48	2	36
49	5	2
50	5	3
51	5	4
52	13	2
53	13	4
54	15	37
55	15	38
56	15	39
57	15	40
58	15	41
59	15	42
60	15	43
61	15	44
62	15	45
63	15	46
64	15	47
65	15	48
66	15	4
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: careermapblock_basemap; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY careermapblock_basemap (id, cmap_id, name, image, _order) FROM stdin;
1	1	base	images/careermapblock/base_maps/2011/08/02/map_base.jpg	0
2	1	drought/flood	images/careermapblock/base_maps/2011/08/02/map_base_droughtflood.jpg	1
3	1	ethnic groups	images/careermapblock/base_maps/2011/08/02/map_base_ethnicgroups.jpg	2
4	1	population	images/careermapblock/base_maps/2011/08/02/map_base_population.jpg	3
5	1	rainfall	images/careermapblock/base_maps/2011/08/02/map_base_rainfall.jpg	4
\.


--
-- Data for Name: careermapblock_careermap; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY careermapblock_careermap (id, description) FROM stdin;
1	This is what they'll look like.
\.


--
-- Data for Name: careermapblock_layer; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY careermapblock_layer (id, cmap_id, name, color, image, _order) FROM stdin;
1	1	conflict	#ff0000	images/careermapblock/layers/2011/08/02/map_layer_basicconflict.png	0
2	1	camps	orange	images/careermapblock/layers/2011/08/02/map_layer_camps.png	1
3	1	cholera	purple	images/careermapblock/layers/2011/08/02/map_layer_cholera.png	2
4	1	labels	black	images/careermapblock/layers/2011/08/02/map_layer_labels.png	3
5	1	parks	green	images/careermapblock/layers/2011/08/02/map_layer_parks.png	4
\.


--
-- Data for Name: careermapblock_question; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY careermapblock_question (id, cmap_id, text, _order) FROM stdin;
1	1	Questions go in here too. Do you like it?	0
2	1	What about this question?	1
3	1	Or this one?	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2011-05-20 16:24:21.348149-04	1	13	2	main	3	
2	2011-06-07 10:29:01.4952-04	1	13	3	www.sciencedirect.com	3	
3	2011-06-22 15:13:12.135274-04	1	13	6	www.sciencedirect.com	3	
4	2011-07-26 17:26:45.594041-04	8	14	23	Social Work	2	Changed label and slug.
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	message	auth	message
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	flat page	flatpages	flatpage
9	log entry	admin	logentry
10	tag	tagging	tag
11	tagged item	tagging	taggeditem
12	test	munin	test
13	hierarchy	pagetree	hierarchy
14	section	pagetree	section
15	page block	pagetree	pageblock
16	text block	pageblocks	textblock
17	html block	pageblocks	htmlblock
18	pull quote block	pageblocks	pullquoteblock
19	image block	pageblocks	imageblock
20	image pull quote block	pageblocks	imagepullquoteblock
21	html block wysiwyg	pageblocks	htmlblockwysiwyg
22	stand	main	stand
23	stand user	main	standuser
24	stand setting	main	standsetting
25	stand group	main	standgroup
26	quiz	quizblock	quiz
27	question	quizblock	question
28	answer	quizblock	answer
29	submission	quizblock	submission
30	response	quizblock	response
31	stand available page block	main	standavailablepageblock
32	career map	careermapblock	careermap
33	base map	careermapblock	basemap
34	layer	careermapblock	layer
35	question	careermapblock	question
36	fridge block	fridgeblock	fridgeblock
37	category	fridgeblock	category
38	item	fridgeblock	item
39	session	fridgeblock	session
40	magnet	fridgeblock	magnet
41	migration history	south	migrationhistory
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
710a91e0f6c9c80db2ecc0f257701bc7	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEBdS5iMTZkNWZi\nM2RkODMzOGU4MzUyYzdiOGU3ZWU2MmNlNg==\n	2011-06-01 15:57:37.070408-04
d2a3e93291c21541f97c7e3e02cffa8b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:16.577289-04
3c066a43cfc0ab1e17bacc15c11fb8a6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:16.705911-04
a5e7d85ebeb2007a62332d2aa9942b3e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:21.534911-04
e6f3d6bb33c9d37bd9b57af8352a82f6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:21.662815-04
7e7a54465c7d6b96fdc12e9cfe1397be	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:21.884428-04
2eb207bb7d5c84edee8ca2180e733756	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:22.012467-04
8af3bfafddf4275b03f12ac5abfd1a6e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:22.237935-04
3ff6de57859d9fe305d0d358b55cd4cc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:22.365857-04
6d1f238d5a820fd30ca877c5cd252d2c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:22.587586-04
2bb1d1aad8f55d7d6e4f3dda22faa1e9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:22.714141-04
6958630fb31fcb0c2c634c0070e994e7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:22.935424-04
8c0ee11388f3a414ca28b63cee1e0c55	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:23.060438-04
a04b7af8290c3292deb25af30ce6b212	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:23.288-04
bf84fb5ec908aee8d5ad2c99dc91cf7a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:23.435458-04
6553760049f628fed0fdc02f0706204c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:23.659924-04
4ed8b2b1cd1b92551e42efdec391a10d	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 01:05:23.78765-04
ff3fafe1feb94e3d8ac70e3db97c786a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-15 14:35:10.592223-04
36f32e2613bd3f7b311877aa05e7d5da	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigECdS5mYjhmNTBj\nOGI0OWJhODBmNjU3YTIzOWM2ZGM1MmFkYg==\n	2011-06-15 14:35:19.870677-04
f0d1559462e8eb04fce6fc4aa8b6ae59	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwd1Ljc2YmMwMjdk\nYWMyMWI3YzcyNjJlZjQ5MDk2Mzk2ZGVi\n	2011-06-30 11:23:02.313203-04
1c9b870bb7b062e518871eca0bafd541	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-20 19:30:31.949773-04
df928e6d9b88adf84c6a4a1a2d785de6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-20 19:30:32.409033-04
fe3568bbbab24db0199e7192d3be3da8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-06-20 19:30:32.653096-04
2a9e76b5c98c70775b4fd49f43920d85	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-07-03 12:09:15.630446-04
360884a9605db3d17f38eccb4ab33206	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-06-21 10:07:09.353032-04
4bc21e6e0f93d05ccacc61b75d3b1f9b	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-06-21 10:08:03.824733-04
5656ac8f664c13a0cbd1a0d80cdb5bda	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-06-21 10:23:04.035481-04
6541bf598f02ee1fc677030bcb6b9175	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-07-04 14:45:04.282722-04
a9c249d0c6e828dcc5d3d3439fbd9a80	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-07-04 15:02:36.146746-04
d502276d24cc4af920a33e1254a13349	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwt1LmU2NGMyNGQw\nYTJjZjM2OWRjODBmZWEzYTU0ZmVjZmRk\n	2011-07-04 15:49:04.229705-04
2800c23fce5d663154cfbac15e390d4c	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-07-06 15:12:41.269696-04
a30161caee8d625c13447ab0a45db6f2	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwJ1LmY4YTRkM2Uy\nNTVjMzU0ZjFkOTc1YzlhY2FlNmZiMGVm\n	2011-07-07 15:40:15.420222-04
dcafcdc201b6214f320435a37e2b2618	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-07-08 00:07:15.555203-04
17d398cdb5f6a7738472f625380673fe	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwd1Ljc2YmMwMjdk\nYWMyMWI3YzcyNjJlZjQ5MDk2Mzk2ZGVi\n	2011-07-12 11:55:46.673488-04
60bd1b710f7338aa0b66f215861019fe	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwt1LmU2NGMyNGQw\nYTJjZjM2OWRjODBmZWEzYTU0ZmVjZmRk\n	2011-07-28 15:19:28.004374-04
cb464a33af3df4ff5c6d67b85e558a3f	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFigEMdS4wOGY0NGY3\nNjc3ODA2YTBlMDViMTJmM2E3ODk0ZjU0MQ==\n	2011-08-03 15:04:51.879696-04
17d89d51f76e24278b35bbd2f724a21f	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-08-04 15:07:46.978509-04
c0d702c0e1b97c1b47f4e1c187589bba	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-08-05 12:13:44.42778-04
68651f00b876c9d0149aa8d0d0516963	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwh1LjUwY2ZmYWEx\nZWU4NGFkN2Y1YWI3MWFlYzJjNzU0MTQx\n	2011-08-09 15:18:37.600385-04
a1ac269f9bf0633538c59a67eb625fd3	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwh1LjUwY2ZmYWEx\nZWU4NGFkN2Y1YWI3MWFlYzJjNzU0MTQx\n	2011-08-09 15:38:35.103977-04
545f25c18214da0cc30afeb8bb4c75f5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-08-10 11:23:29.951638-04
0cadb5e67223b079f51bb6eae5e95a86	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-08-10 12:15:36.317565-04
f5895caced11b7bee2dfa5186372a0d9	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwJ1LmY4YTRkM2Uy\nNTVjMzU0ZjFkOTc1YzlhY2FlNmZiMGVm\n	2011-08-16 13:19:09.955765-04
c65f60b098db33da1c85e15e1e3f567e	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-08-19 16:34:33.366125-04
fb47e062e2513c8909e44a30ef80a3a7	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwJ1LmY4YTRkM2Uy\nNTVjMzU0ZjFkOTc1YzlhY2FlNmZiMGVm\n	2011-09-29 17:53:14.483043-04
61dc19d14ca8a965eb0476b7c564663a	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-08-23 11:11:58.280597-04
ba2cce33f2d133d849a836055ccb1600	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwJ1LmY4YTRkM2Uy\nNTVjMzU0ZjFkOTc1YzlhY2FlNmZiMGVm\n	2011-08-23 13:03:49.246696-04
08a93b1b34b8ec470419e0877e6ba7e7	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwt1LmU2NGMyNGQw\nYTJjZjM2OWRjODBmZWEzYTU0ZmVjZmRk\n	2011-08-23 16:47:17.034514-04
933da5c181bd43b023abca0575375e74	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-09-01 13:35:26.544631-04
01ea8a97df7198f67d556023582fada0	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwt1LmU2NGMyNGQw\nYTJjZjM2OWRjODBmZWEzYTU0ZmVjZmRk\n	2011-09-01 14:51:54.766763-04
69dbb9c06a95f55ee2c3fb6798f1cdb1	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwt1LmU2NGMyNGQw\nYTJjZjM2OWRjODBmZWEzYTU0ZmVjZmRk\n	2011-09-08 18:01:26.086431-04
323adb82c29bba0b00d64c9caafd7d30	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-09-14 13:56:00.378967-04
06d2813caa50d83aa1b85495d4dc1240	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-09-15 14:39:14.928382-04
cac3ba6f329623b710a98e9ec673af39	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwh1LjUwY2ZmYWEx\nZWU4NGFkN2Y1YWI3MWFlYzJjNzU0MTQx\n	2011-09-29 17:58:04.781859-04
1b7c57077e3d7c43c64f20c47498a35a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-10-18 21:37:09.324811-04
d06f7f63c4a24247753c18e08cbd21e1	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-10-25 10:52:35.469688-04
e989ce72f826335e32ba69648df28ca0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-10-25 10:53:40.659237-04
0f6c6e5e884fe4f3e003d4d8513166c1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-10-25 10:54:22.879245-04
16a7eff94cd612b4116c7d7ce52fd917	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwV1LjY0Nzk2ZDdk\nN2I3MjU1OTY1MmQ2MGQyZWNlYWIzOGNl\n	2011-10-25 11:11:33.57728-04
f3e2f0ea744b9ae223fc3f39e0815bc1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.459446-04
5d04a42164c9d3f8e453f76b0bb7c793	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSw11LjFlZTJlYzE0\nYTQxNjZkYTVkMGUwNmQwZWU5ODM2Y2Vj\n	2011-10-31 11:40:53.609036-04
f13814add09ef683c6dadbaab3a5f933	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSw91LmM4YTY1NTk4\nMzIwZTlmNmNiNjFjOGFiNWM3MGEyZWVm\n	2011-10-31 12:56:56.282636-04
94a3de1ff0b924b57e4e7c0375e97094	gAJ9cQEuMGE0ZDY0NzljMWFhODE2ODFhMjJjYjk2MDAxMzZjYzM=\n	2011-11-01 15:28:18.041625-04
49cc16ebcc04ebefa75d11da9599c7f4	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSw11LjFlZTJlYzE0\nYTQxNjZkYTVkMGUwNmQwZWU5ODM2Y2Vj\n	2011-10-31 11:47:59.730306-04
aa2f2baae094d2ecd12d9c5c788de2a6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.550715-04
de6e1f509d8e2fcec67f0f95db17a5eb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:23.170016-04
b00e3e489c2fc7805a6b7a60dfa921b7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:23.301413-04
b09f1107ff71b03217a9681a9d8520f1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.186667-04
577c8c493041ea2a9e549b2bd2ce37fb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.307012-04
bd5133049e004df876847f0cd2733584	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.39964-04
2374113da0676696ea879ce1f8b04ac2	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.609373-04
144afab790e8527af9705d612fe883ad	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.701345-04
0f52c2f7d3bf059e43cd8d97b15c9248	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.760543-04
6959c98cf3c582e0354a01fd4b663ac4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.861436-04
4efbcd7fb251d3c676c635b88d4f0dd8	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:25.93213-04
8aea2b1e3e23eaa7c42f3c16d9143b0f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:26.025346-04
31071c362e01217f8f4362b637a50ddb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:26.084394-04
9c57845bef9d6dd27d31afd4817545d5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:26.177308-04
164a7cbc653834e2202ce2b99c8a3c3a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-02 03:52:26.237782-04
e903955b1f603c9d243bab9112b472e2	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSw11LjFlZTJlYzE0\nYTQxNjZkYTVkMGUwNmQwZWU5ODM2Y2Vj\n	2011-11-02 11:01:08.12026-04
a90ba737d999d5eb3f42c8253af7366f	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwV1LjY0Nzk2ZDdk\nN2I3MjU1OTY1MmQ2MGQyZWNlYWIzOGNl\n	2011-11-02 15:36:19.662899-04
9fb061d690b0c8c9487eed07513b7018	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSw11LjFlZTJlYzE0\nYTQxNjZkYTVkMGUwNmQwZWU5ODM2Y2Vj\n	2011-11-02 16:02:40.964806-04
f8cff5cfd246b8f899eafd1930ca24d9	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSw11LjFlZTJlYzE0\nYTQxNjZkYTVkMGUwNmQwZWU5ODM2Y2Vj\n	2011-11-03 08:47:49.678976-04
099121bb629a5f895e796e1df0594706	gAJ9cQEoVRFlZHUuY29sdW1iaWEud2luZHECiFUSX2F1dGhfdXNlcl9iYWNrZW5kcQNVH2RqYW5n\nb3dpbmQuYXV0aC5XaW5kQXV0aEJhY2tlbmRxBFUNX2F1dGhfdXNlcl9pZHEFSwF1LjA4NWVhNzQ2\nOTUyN2ZmNmU0MWRlMWEwYWY1MDI5NTNm\n	2011-11-07 11:37:17.540437-05
0d7764fc59b5cfb2c5f8cb0479e2884b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjRkOTg3MjQwMDBiOTA2YjliY2YyOWFmYzZm\nZTJjMzVm\n	2011-11-07 11:39:12.90186-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: fridgeblock_category; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY fridgeblock_category (id, fridgeblock_id, label, image, _order) FROM stdin;
1	1	Get Fit!	images/fridge/categories/2011/08/05/icon_getfit.png	0
2	1	Eat Smart!	images/fridge/categories/2011/08/05/icon_eatsmart.png	1
3	1	Look Sharp!	images/fridge/categories/2011/08/05/icon_looksharp.png	2
4	1	Think Positive!	images/fridge/categories/2011/08/05/icon_thinkpositive.png	3
\.


--
-- Data for Name: fridgeblock_fridgeblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY fridgeblock_fridgeblock (id) FROM stdin;
1
\.


--
-- Data for Name: fridgeblock_item; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY fridgeblock_item (id, label, category_id, description, _order) FROM stdin;
1	Run	1		0
2	Walk	1		1
3	Do Yoga	1		2
4	watch less TV	1		3
5	fruit	2		0
6	vegetables	2		1
7	grains	2		2
8	styrofoam	2		3
\.


--
-- Data for Name: fridgeblock_magnet; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY fridgeblock_magnet (id, session_id, item_id, x, y) FROM stdin;
1	1	1	62	64
4	1	6	40	148
3	1	2	103	231
2	1	3	65	335
\.


--
-- Data for Name: fridgeblock_session; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY fridgeblock_session (id, fridgeblock_id, user_id, saved) FROM stdin;
1	1	1	2011-08-05 16:37:34.29947-04
2	1	2	2011-08-09 13:03:49.407189-04
3	1	5	2011-10-11 11:33:01.329277-04
4	1	13	2011-10-17 11:40:54.462247-04
\.


--
-- Data for Name: main_stand; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY main_stand (id, title, hostname, created, css, description, access) FROM stdin;
1	Forest	forest.ccnmtl.columbia.edu	2011-05-23 16:43:08.902207-04	#content table {width: 90%;}\r\n#content table textarea {width: 95%;}		open
2	www.sciencedirect.com	www.sciencedirect.com	2011-05-24 04:28:11.440115-04			open
3	Awesome	awesome.forest.ccnmtl.columbia.edu	2011-06-07 10:07:39.395617-04			open
4	new one	newsite.forest.ccnmtl.columbia.edu	2011-06-07 10:20:14.195109-04			open
5	PASS	pass.ccnmtl.columbia.edu	2011-06-17 16:01:49.22484-04			open
7	Forest	ejtest.forest.ccnmtl.columbia.edu	2011-06-28 11:55:39.258464-04	#content table {width: 90%;}\r\n#content table textarea {width: 95%;}		open
6	MATCH	match.ccnmtl.columbia.edu	2011-07-26 17:48:37.510592-04	#primarynav ul.globalnav {\r\n\r\nmargin: 144px 0 0 1px;\r\nfloat: none;\r\noverflow: hidden;\r\n}\r\n\r\n#primarynav ul.globalnav li a {\r\n\r\nbackground-color: transparent;\r\n}\r\n\r\n\r\n#standardnav {\r\n    display: none;\r\n}\r\n\r\n#header {\r\n    background: #fff;\r\n    height: 92px;\r\n \r\n}\r\n\r\nh1#logo_project {\r\nheight: 80px;\r\nwidth: 485px;\r\nborder: none;\r\nbackground: url("http://ccnmtl.columbia.edu/draft/lizday/oral_health/match_logo.png") no-repeat scroll left top transparent;\r\nmargin: 0;\r\n\r\n}\r\n\r\nh4#logo_ccnmtl {\r\nheight: 47px;\r\nwidth: 151px;\r\nborder: none;\r\nbackground: url("http://ccnmtl.columbia.edu/draft/lizday/oral_health/uncharted_logo.png") no-repeat scroll left top transparent;\r\nfloat: right;\r\n}\r\n\r\n#primarynav {\r\n    overflow: auto;\r\n    height: auto;\r\nbackground: url("http://ccnmtl.columbia.edu/draft/lizday/oral_health/social_work_header.png") no-repeat scroll left top transparent;\r\nheight: 188px;\r\n\r\n\r\n}\r\n\r\n#primarynav ul {\r\n    background-color: transparent;\r\n}\r\n\r\n#primarynav #usernav {\r\n    color: black;\r\n    left: 57%;\r\n    margin: 0 6px 0 0;\r\n    position: absolute;\r\n    top: 66px;\r\n}		open
8	wings	wings.forest.ccnmtl.columbia.edu	2011-10-11 11:23:29.816906-04		Here's where we'll start collecting info for the new Wings project. This may or may not evolve into the production site.	open
\.


--
-- Data for Name: main_standavailablepageblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY main_standavailablepageblock (id, stand_id, block) FROM stdin;
1	4	pageblocks.TextBlock
2	4	pageblocks.ImageBlock
3	4	quizblock.Quiz
4	5	pageblocks.TextBlock
7	5	pageblocks.ImageBlock
9	5	quizblock.Quiz
10	6	pageblocks.TextBlock
11	6	pageblocks.HTMLBlock
12	6	pageblocks.PullQuoteBlock
13	6	pageblocks.ImageBlock
14	6	pageblocks.ImagePullQuoteBlock
15	6	quizblock.Quiz
16	6	careermapblock.CareerMap
17	5	careermapblock.CareerMap
18	1	pageblocks.TextBlock
19	1	pageblocks.HTMLBlock
20	1	pageblocks.PullQuoteBlock
21	1	pageblocks.ImageBlock
22	1	pageblocks.ImagePullQuoteBlock
23	1	quizblock.Quiz
24	1	careermapblock.CareerMap
25	1	fridgeblock.FridgeBlock
26	8	pageblocks.TextBlock
27	8	pageblocks.HTMLBlock
28	8	pageblocks.PullQuoteBlock
29	8	pageblocks.ImageBlock
30	8	pageblocks.ImagePullQuoteBlock
31	8	quizblock.Quiz
32	8	careermapblock.CareerMap
33	8	fridgeblock.FridgeBlock
\.


--
-- Data for Name: main_standgroup; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY main_standgroup (id, stand_id, group_id, access) FROM stdin;
\.


--
-- Data for Name: main_standsetting; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY main_standsetting (id, stand_id, name, value) FROM stdin;
\.


--
-- Data for Name: main_standuser; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY main_standuser (id, stand_id, user_id, access) FROM stdin;
1	1	1	admin
2	1	3	admin
3	1	2	instructor
4	1	4	instructor
5	1	5	instructor
6	1	6	student
7	1	7	student
8	1	8	student
9	1	9	student
10	1	10	student
11	3	1	admin
12	4	1	admin
13	5	1	admin
14	6	1	admin
15	5	11	admin
16	6	11	admin
17	7	7	admin
18	6	8	admin
19	8	5	admin
20	8	13	admin
21	8	12	admin
22	8	1	admin
23	8	9	admin
24	8	2	admin
25	8	14	student
26	8	15	student
27	8	16	student
\.


--
-- Data for Name: munin_test; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY munin_test (id, name) FROM stdin;
\.


--
-- Data for Name: pageblocks_htmlblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_htmlblock (id, html) FROM stdin;
5	<strong>Social service employees, caseworkers, case managers, and volunteers are "social workers".</strong>\r\n<ul>\r\n<li>A social worker is a trained professional who has a bachelor's, master's or doctoral degree in social work</li>\r\n<li>All states license or otherwise regulate social work practice</li>\r\n<li>A social service employee, caseworker, case manager or community volunteer is NOT a social worker unless he / she has a social work degree</li>\r\n</ul>\r\n\r\n<strong>For therapy or counseling you need to go to a psychologist or psychiatrist.</strong>\r\n<ul>\r\n<li>Professional social workers provide most of America's mental health services</li>\r\n<li>Professional social workers are often the only mental health providers serving residents of poor, rural communities</li>\r\n<li>Many insurance providers will only reimburse (pay) for mental health services provided by a Licensed Clinical Social Worker or medical doctor</li>\r\n</ul>\r\n\r\n<strong>Most social workers are employed in public welfare or child welfare, "giving welfare" or "taking people's children".</strong>\r\n<ul>\r\n<li>Only a fourth of all child welfare cases are handled by professional social workers</li>\r\n<li>Professional social workers practice in many settings; family service agencies, mental health centers, schools, hospitals, private industry, courts, police departments, child advocacy centers, foster care / adoption agencies, family counseling centers, shelters and private practices</li>\r\n<li>People who determine eligibility for "welfare" are most often not social workers</li>\r\n<li>Professional social workers would only remove children whose life or safety was in danger, as a last resort</li>\r\n<li>More than 200 professional social workers hold elective office, including one U.S. Senator and four Representatives</li>\r\n</ul>\r\n\r\n<strong>Most social workers work for the government.</strong>\r\n<ul>\r\n<li>Fewer than 3 percent of all professional social workers work for the federal government</li>\r\n<li>Only about a third of all professional social workers are employed by federal, state or local governments</li>\r\n</ul>
6	<em>NOTE to cindy: content seems incomplete from the document I used - make sure to go back and revise.</em><br><br>\r\n<strong>1. Patient Recruitment via Community Awareness</strong>\r\n<p>Social workers often visit community centers, soup kitchens, schools, gyms, etc. to present information in an interactive and engaging manner. They can provide psychoeducational workshops to parents and children in the community to explain the importance of oral health and maintaining good dental hygiene. By modeling healthy oral health practices with parents and children, families are more likely to develop self-efficacy and continue healthy behavior.</p>\r\n \r\n<p>Interfacing with a social worker to conduct psychoeducational groups can provide valuable patient referrals from underserved, high-need communities.</p>\r\n<strong>2. Better Patient Health Outcomes</strong>\r\n<p>Social workers can identify any additional services families may need and work with them to access these services, as well as make follow-up phone calls to monitor treatment progress and general well-being.</p>\r\n<p>Social workers identify and ameliorate potential psychosocial and practical barriers to treatment such as issues of transportation, childcare, cultural values, sentiment of distrust or shame/embarrassment to going to dentist, or mental health issues such as depression, anxiety, drug/alcohol addiction etc., in the family.</p>\r\n<p>Work with patient family to explore barriers and prioritize oral health through open conversations with parents. Assist clients to apply, re-apply, or renew Medicaid or other government benefits such as food stamps, or WIC: to encourage healthy nutrition to prevent caries.</p>\r\n<p>Provide support and expertise in challenging situations, such as in suspected cases of child abuse or neglect, or domestic violence and working with family to draw up a safety plan. \r\n</p>\r\n<strong>3. Help take on challenging new cases</strong>\r\n<p>Social workers can reduce fear and anxiety, enhance cooperation, and effect treatment when working with anxious or very young children or children with special needs. Their knowledge and training of mental health disorders allows them to recognize characteristics of behavior and work with family to calm a child.</p>\r\n<strong>4. Early intervention, removing barriers,..........</strong>\r\n<p> where did the content go?</p>\r\n<strong>5. Managing challenging patient situations in office</strong>\r\n<p>Social workers are trained to respect and remain open to various cultural attitudes and practice sensitivity towards this. Additionally, many have competency in a second language.</p>\r\n<p>Work appropriately with patients or families who are living with mentally, physically disabled and/or developmentally delayed conditions</p>\r\n<p>Trained to work with families of these patients and remain open and sensitive to the unique challenges to returning for visits that these families may face</p>\r\n<strong>6. Staff capacity building </strong>\r\n<p>Cultural sensitivity training, PDD and autism training, challenging situations management training, etc. </p>\r\n<strong>7. Patient Retention</strong>\r\n<p>All these ways in which social work can benefit dental practices as well better patient outcomes contribute to patient loyalty, satisfaction and rate of return.</p>\r\n<p>Engage parents in waiting room to discuss importance of oral health to improve patient retention and set up an individualized treatment plan for every child that identifies strengths and challenges to dental care.</p>
7	<strong>School/County Social Worker: </strong>\r\n<p>The Social Worker can function as a case manager, helping the mother understand the importance of professional dental care and regular dental visits.  The social worker can help the family navigate the social and financial barriers to accessing dental services and help with enrolling in Medicaid or CHIP dental programs, locate a low cost childcare facility to take care of the baby and help find convenient transportation to the dental office.</p>\r\n<strong>Social Worker as health educator:</strong>\r\n<p>An office-based social worker who understands the social and economic hardships faced by the family may be able to help the mother better understand the importance of dental care both professional and at home for the children and adults in the family as well as the role of nutrition, fluoride and oral health behaviors in disease management.</p>
2	<p>You are one of the Volunteer dentists that NY State requires all schools to have to provide oral examinations for school-age children.  You receive a call from your local school stating that a child, John, came to school with oral pain and could not participate in school activities, asking you to see the child on an emergency basis.</p>\r\n<p>On examining John, who comes to the office with his mother, four siblings and one cousin, you realize that in addition to the painful tooth, he  has carious lesions on #x, y, z, f, g, generalized plaque and significant gingivitis.  You take care of the emergency,  and develop a treatment plan that includes restorative care for xxxxxxx and dental health education for John and the family.</p>\r\n<p>When you approach Mum about John’s dental history, you find out that the family has not seen a dentist in three years because Mum is working and dad is out of town, so there is nobody to watch the baby during dental visits, and they also don’t have dental insurance. She says she is happy to help him brush and maybe floss, but cannot come back for follow up visits because of difficulty getting time off work and school as well as childcare for the other children. You know that if John does not make follow-up visits he will develop abscesses and painful aching.</p>
9	<p>Thirteen year old Emma, whom you have been treating since she was four, comes in for her six-month visit. You notice that she is not her usual, energetic, self, and does not automatically begin giving you an update on her life at home and school since you last met. You put it down to being a teen, which requires overt and covert revulsion of all adults.  When you update Emma’s health history, she tells you that her teeth have been sensitive to cold liquids lately; on clinical examination, you notice that there is enamel erosion on the lingual surfaces of #5, 6, 7,8,9 and 10.  You also notice that she has some new carious lesions and seems to be nervous and fidgety. You are beginning to suspect an eating disorder, but are not sure how to bring it up with Emma or if you should speak with her family.</p>\r\n<p>If you speak with Emma, you may alienate her, and risk losing the opportunity to help her work through the larger issues that are clearly manifesting in the mouth.   You are also unsure about the legal ramifications of speaking with Emma about her health and healthcare without involving her parents.</p>\r\n<p>If you speak directly with the family, they may walk away from your practice if they are in denial, or if they confront Emma inappropriately, you risk losing her trust in you.  A referral to her physician is not an option without the family’s consent.</p>
10	<strong>Incomplete</strong>\r\n<p>Social workers can help the dentist manage difficult behavior problems, especially in families where the poor behavior is stemming from poor family dynamics.  Need Sara’s help in fleshing this out…</p>\r\n<strong>In-office social worker:</strong>\r\n<p>Can help with immediate be behavior modification and help the family understand how they may be feeding into the situation.  She/he can also help calm the other patients and their families while you deal with the disruptive child.</p>
11	<strong>Social worker whom you know</strong>\r\n<p>If you have a friend or colleague who is a social worker that the dentist can consult, you can develop a course of action on how to approach Emma and her family to discuss the issue.</p>  \r\n<strong>Multidisciplinary approach</strong>\r\n<p>Once the dentist and the social worker have developed a plan on how to approach the family, Emma and her family may need a multidisciplinary approach to care, including the dentist, physician, nutritionist and social worker, who in this case could function as a case manager and child and family counselor.</p>
12	<p>Kate, a patient you have seen twice requires extensive dental work that will best be accomplished in an OR.  She has been accompanied by her father, Dan, at the previous two office visits.  While Dan seemed a little overwhelmed by Kate and her dental needs, he was quick to understand why Kate’s needs would best be addressed in the OR, and readily agreed to it.  Your office team ensures that the OR, anesthesiologist and hospital team are pre-booked for the day of surgery.</p>\r\n\r\n<p>On the appointed day, you arrive at the hospital with your office team, and see that Kate is at the hospital with Dan, and a woman. Both adults are arguing loudly and you quickly realize that the woman is Kate’s mother, who is separated from Dan, and is complaining that she was not consulted before the appointment was set up, and that she will not allow her child to be “put under just” for dental treatment.</p>\r\n<p>You need to resolve the issue – you are paying for hospital and your staff time as well as the fact that you have blocked off your own time for Kate’s surgical case.</p>
8	<p>You are in treatment bay #1, doing a pulpotomy on #xx, when you hear screaming, interspersed with a female voice saying, “it will be ok, mommy will go with you, don’t be afraid,” another voice saying, “stop being a sissy” and your dental assistant trying to greet people. You begin to worry because you know that Little Joey is in treatment bay #2 getting his teeth cleaned and there are two additional patients in the waiting room.</p>\r\n<p>The screaming gets worse and you hear a chair being thrown. As you get up to investigate, you hear the child, whom  you have not treated before, say, “ I will kill you if you make me go to the dentist” as he runs around the waiting room away from his father’s grasp.</p>\r\n<p>Your hygienist and assistant are watching from the treatment bays and two children in the waiting room are trying to hide behind their parents. You are not sure whether you should ask the family to leave your office immediately, or try to find out if they are here for an emergency situation, which you should get under control. You do however,  want to make sure that the four children and families already in the office are safe and not afraid to stay in the office to complete their visits.</p>  
13	<p>In this case, the Dentist may want to engage a Hospital Social Worker to help the couple to both resolve the dispute and allow the case to be completed, and help them understand the importance of continued dental care for their daughter’s health and well-being.</p>
19	<p>You are one of the Volunteer dentists that NY State requires all schools to have to provide oral examinations for school-age children.  You receive a call from your local school stating that a child, John, came to school with oral pain and could not participate in school activities, asking you to see the child on an emergency basis.</p>\r\n<p>On examining John, who comes to the office with his mother, four siblings and one cousin, you realize that in addition to the painful tooth, he  has carious lesions on #x, y, z, f, g, generalized plaque and significant gingivitis.  You take care of the emergency,  and develop a treatment plan that includes restorative care for xxxxxxx and dental health education for John and the family.</p>\r\n<p>When you approach Mum about John’s dental history, you find out that the family has not seen a dentist in three years because Mum is working and dad is out of town, so there is nobody to watch the baby during dental visits, and they also don’t have dental insurance. She says she is happy to help him brush and maybe floss, but cannot come back for follow up visits because of difficulty getting time off work and school as well as childcare for the other children. You know that if John does not make follow-up visits he will develop abscesses and painful aching.</p>
15	<p>The emergency room in city xx calls you one evening to take care of an emergency on a Saturday evening.  The patient at the ER, 16-year old Natasha, is complaining of pain in her right lower jaw.  On clinical examination, there is an abscess at the mesio-bucco-cervical aspect of #30, a large mesio-occlusal amalgam that looks like it may be fractured, and on quick examination, you notice a number of other teeth that need restoration.  Natasha explains that the filling on #30 broke while she was at the movies with her friend Johnson, eating popcorn.  She thought nothing of it at the time, but there was a throbbing pain the next day, and now she is in a lot of pain, has a bad taste in her mouth and cannot drink her cold Coca-Cola and is having difficulty opening her mouth completely.  You decide that the best course of treatment would be to drain the abscess, prescribe pain killers and antibiotics and ask Natasha to see her dentist the following week to have her amalgam redone and also take care of the other carious teeth.</p>\r\n\r\n<p>You ask to meet Natasha’s parents for consent for treatment, and are told that she is under the legal care of her grandmother, Joyce, because her mother passed away two years ago and her father is incarcerated. Joyce, a lovely woman tells you that Natasha does not have a dentist because the family has no dental insurance, they cannot find a dentist close to home and school and there is nobody to watch the baby she is holding.  While Joyce is a young grandmother, you are convinced that she cannot be the mother of a child that looks to be no more than 24 months old.    As Joyce is telling you the rest of Natasha’s social history, baby, Joe begins to cry and Joyce pulls out a bottle filled with a pink liquid which quiets him immediately.  On enquiring, Joyce tells you that the pink stuff is “Yuhoo strawberry milk” which she thinks is a healthy choice for the baby since it combines milk and strawberries.  Natasha tells Joyce that she does not want Joe drinking Yahoo, but plain milk as Yahoo has sugar which is not good for him.  As you listen to them, you quickly realize that Joe is Natasha’s son and Joyce’s great-grandson.  You also notice that Joe has what looks like Early Childhood Caries.  You ask if Joe has a dentist and Natasha says that there is no need for him to see a dentist as he has not lost his “baby’ teeth yet.</p>\r\n\r\n<p>Joyce signs consent for Natasha’s treatment and you are able to get her out of immediate pain. Since Natasha has no dentist of record, you ask if she would come to your office.  Joyce asks if there is a bus line by the office, if you open on Saturday and what the charges will be.  You aren’t sure about the bus line but ask if the family has Medicaid (whatever the name is in City/State X).  Joyce indicates that they have Medicaid but no dental insurance.</p>
16	<ul>\r\n<li>Professional social workers assist individuals, groups, or communities to restore or enhance their capacity for social functioning, creating societal conditions favorable to their goals. It requires knowledge of human development and behavior, social, economic and cultural institutions and systems, and the interaction of all these factors.</li>\r\n<li>Social workers are highly trained and experienced professionals. Professional social workers are only those who have earned social work degrees at the bachelor’s, master’s or doctoral levels, and completed a minimum number of hours in supervised fieldwork.</li>\r\n<li>Professional social workers are found in every facet of community life—in schools, hospitals, mental health clinics, senior centers, elected office, private practices, prisons, military, corporations, and in numerous public and private agencies that serve individuals and families in need.</li>\r\n</ul>
17	<strong>Licensed Master Social Worker (LMSW)</strong>\r\n<ul>\r\n<li>Must possess a master’s degree from a social work program accredited by the Council of Social Work Education (CSWE)</li>\r\n<li>Complete coursework or training in the identification and reporting of child abuse offered by a New York State approved provider</li>\r\n<li>Pass exam administered by Association of Social Work Boards (ASWB)</li>\r\n</ul>\r\n\r\n<strong>Licensed Clinical Social Worker (LCSW)</strong>\r\n<ul>\r\n<li>Must possess a master’s degree from a social work program accredited by the Council of Social Work Education (CSWE) with at least 12 credit hours of approved clinical coursework</li>\r\n<li>Complete coursework or training in the identification and reporting of child abuse offered by a New York State approved provider</li>\r\n<li>Must also have at least 3 years of approved post M.S.W. supervised experience in diagnosis, psychotherapy and assessment-based treatment planning</li>\r\n<li>Pass exam administered by Association of Social Work Boards (ASWB)</li>\r\n</ul>
18	<strong>Social service employees, caseworkers, case managers, and volunteers are "social workers".</strong>\r\n<ul>\r\n<li>A social worker is a trained professional who has a bachelor's, master's or doctoral degree in social work</li>\r\n<li>All states license or otherwise regulate social work practice</li>\r\n<li>A social service employee, caseworker, case manager or community volunteer is NOT a social worker unless he / she has a social work degree</li>\r\n</ul>\r\n\r\n<strong>For therapy or counseling you need to go to a psychologist or psychiatrist.</strong>\r\n<ul>\r\n<li>Professional social workers provide most of America's mental health services</li>\r\n<li>Professional social workers are often the only mental health providers serving residents of poor, rural communities</li>\r\n<li>Many insurance providers will only reimburse (pay) for mental health services provided by a Licensed Clinical Social Worker or medical doctor</li>\r\n</ul>\r\n\r\n<strong>Most social workers are employed in public welfare or child welfare, "giving welfare" or "taking people's children".</strong>\r\n<ul>\r\n<li>Only a fourth of all child welfare cases are handled by professional social workers</li>\r\n<li>Professional social workers practice in many settings; family service agencies, mental health centers, schools, hospitals, private industry, courts, police departments, child advocacy centers, foster care / adoption agencies, family counseling centers, shelters and private practices</li>\r\n<li>People who determine eligibility for "welfare" are most often not social workers</li>\r\n<li>Professional social workers would only remove children whose life or safety was in danger, as a last resort</li>\r\n<li>More than 200 professional social workers hold elective office, including one U.S. Senator and four Representatives</li>\r\n</ul>\r\n\r\n<strong>Most social workers work for the government.</strong>\r\n<ul>\r\n<li>Fewer than 3 percent of all professional social workers work for the federal government</li>\r\n<li>Only about a third of all professional social workers are employed by federal, state or local governments</li>\r\n</ul>
20	<strong>School/County Social Worker: </strong>\r\n<p>The Social Worker can function as a case manager, helping the mother understand the importance of professional dental care and regular dental visits.  The social worker can help the family navigate the social and financial barriers to accessing dental services and help with enrolling in Medicaid or CHIP dental programs, locate a low cost childcare facility to take care of the baby and help find convenient transportation to the dental office.</p>\r\n<strong>Social Worker as health educator:</strong>\r\n<p>An office-based social worker who understands the social and economic hardships faced by the family may be able to help the mother better understand the importance of dental care both professional and at home for the children and adults in the family as well as the role of nutrition, fluoride and oral health behaviors in disease management.</p>
21	<p>You are in treatment bay #1, doing a pulpotomy on #xx, when you hear screaming, interspersed with a female voice saying, “it will be ok, mommy will go with you, don’t be afraid,” another voice saying, “stop being a sissy” and your dental assistant trying to greet people. You begin to worry because you know that Little Joey is in treatment bay #2 getting his teeth cleaned and there are two additional patients in the waiting room.</p>\r\n<p>The screaming gets worse and you hear a chair being thrown. As you get up to investigate, you hear the child, whom  you have not treated before, say, “ I will kill you if you make me go to the dentist” as he runs around the waiting room away from his father’s grasp.</p>\r\n<p>Your hygienist and assistant are watching from the treatment bays and two children in the waiting room are trying to hide behind their parents. You are not sure whether you should ask the family to leave your office immediately, or try to find out if they are here for an emergency situation, which you should get under control. You do however,  want to make sure that the four children and families already in the office are safe and not afraid to stay in the office to complete their visits.</p>  
22	<strong>Incomplete</strong>\r\n<p>Social workers can help the dentist manage difficult behavior problems, especially in families where the poor behavior is stemming from poor family dynamics.  Need Sara’s help in fleshing this out…</p>\r\n<strong>In-office social worker:</strong>\r\n<p>Can help with immediate be behavior modification and help the family understand how they may be feeding into the situation.  She/he can also help calm the other patients and their families while you deal with the disruptive child.</p>
23	<p>Thirteen year old Emma, whom you have been treating since she was four, comes in for her six-month visit. You notice that she is not her usual, energetic, self, and does not automatically begin giving you an update on her life at home and school since you last met. You put it down to being a teen, which requires overt and covert revulsion of all adults.  When you update Emma’s health history, she tells you that her teeth have been sensitive to cold liquids lately; on clinical examination, you notice that there is enamel erosion on the lingual surfaces of #5, 6, 7,8,9 and 10.  You also notice that she has some new carious lesions and seems to be nervous and fidgety. You are beginning to suspect an eating disorder, but are not sure how to bring it up with Emma or if you should speak with her family.</p>\r\n<p>If you speak with Emma, you may alienate her, and risk losing the opportunity to help her work through the larger issues that are clearly manifesting in the mouth.   You are also unsure about the legal ramifications of speaking with Emma about her health and healthcare without involving her parents.</p>\r\n<p>If you speak directly with the family, they may walk away from your practice if they are in denial, or if they confront Emma inappropriately, you risk losing her trust in you.  A referral to her physician is not an option without the family’s consent.</p>
24	<strong>Social worker whom you know</strong>\r\n<p>If you have a friend or colleague who is a social worker that the dentist can consult, you can develop a course of action on how to approach Emma and her family to discuss the issue.</p>  \r\n<strong>Multidisciplinary approach</strong>\r\n<p>Once the dentist and the social worker have developed a plan on how to approach the family, Emma and her family may need a multidisciplinary approach to care, including the dentist, physician, nutritionist and social worker, who in this case could function as a case manager and child and family counselor.</p>
25	<p>Kate, a patient you have seen twice requires extensive dental work that will best be accomplished in an OR.  She has been accompanied by her father, Dan, at the previous two office visits.  While Dan seemed a little overwhelmed by Kate and her dental needs, he was quick to understand why Kate’s needs would best be addressed in the OR, and readily agreed to it.  Your office team ensures that the OR, anesthesiologist and hospital team are pre-booked for the day of surgery.</p>\r\n\r\n<p>On the appointed day, you arrive at the hospital with your office team, and see that Kate is at the hospital with Dan, and a woman. Both adults are arguing loudly and you quickly realize that the woman is Kate’s mother, who is separated from Dan, and is complaining that she was not consulted before the appointment was set up, and that she will not allow her child to be “put under just” for dental treatment.</p>\r\n<p>You need to resolve the issue – you are paying for hospital and your staff time as well as the fact that you have blocked off your own time for Kate’s surgical case.</p>
26	<p>In this case, the Dentist may want to engage a Hospital Social Worker to help the couple to both resolve the dispute and allow the case to be completed, and help them understand the importance of continued dental care for their daughter’s health and well-being.</p>
27	<p>The emergency room in city xx calls you one evening to take care of an emergency on a Saturday evening.  The patient at the ER, 16-year old Natasha, is complaining of pain in her right lower jaw.  On clinical examination, there is an abscess at the mesio-bucco-cervical aspect of #30, a large mesio-occlusal amalgam that looks like it may be fractured, and on quick examination, you notice a number of other teeth that need restoration.  Natasha explains that the filling on #30 broke while she was at the movies with her friend Johnson, eating popcorn.  She thought nothing of it at the time, but there was a throbbing pain the next day, and now she is in a lot of pain, has a bad taste in her mouth and cannot drink her cold Coca-Cola and is having difficulty opening her mouth completely.  You decide that the best course of treatment would be to drain the abscess, prescribe pain killers and antibiotics and ask Natasha to see her dentist the following week to have her amalgam redone and also take care of the other carious teeth.</p>\r\n\r\n<p>You ask to meet Natasha’s parents for consent for treatment, and are told that she is under the legal care of her grandmother, Joyce, because her mother passed away two years ago and her father is incarcerated. Joyce, a lovely woman tells you that Natasha does not have a dentist because the family has no dental insurance, they cannot find a dentist close to home and school and there is nobody to watch the baby she is holding.  While Joyce is a young grandmother, you are convinced that she cannot be the mother of a child that looks to be no more than 24 months old.    As Joyce is telling you the rest of Natasha’s social history, baby, Joe begins to cry and Joyce pulls out a bottle filled with a pink liquid which quiets him immediately.  On enquiring, Joyce tells you that the pink stuff is “Yuhoo strawberry milk” which she thinks is a healthy choice for the baby since it combines milk and strawberries.  Natasha tells Joyce that she does not want Joe drinking Yahoo, but plain milk as Yahoo has sugar which is not good for him.  As you listen to them, you quickly realize that Joe is Natasha’s son and Joyce’s great-grandson.  You also notice that Joe has what looks like Early Childhood Caries.  You ask if Joe has a dentist and Natasha says that there is no need for him to see a dentist as he has not lost his “baby’ teeth yet.</p>\r\n\r\n<p>Joyce signs consent for Natasha’s treatment and you are able to get her out of immediate pain. Since Natasha has no dentist of record, you ask if she would come to your office.  Joyce asks if there is a bus line by the office, if you open on Saturday and what the charges will be.  You aren’t sure about the bus line but ask if the family has Medicaid (whatever the name is in City/State X).  Joyce indicates that they have Medicaid but no dental insurance.</p>
\.


--
-- Data for Name: pageblocks_htmlblockwysiwyg; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_htmlblockwysiwyg (id, wysiwyg_html) FROM stdin;
\.


--
-- Data for Name: pageblocks_imageblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_imageblock (id, image, caption, alt) FROM stdin;
1	images/2011/05/18/04.jpg	Look! you can upload pictures!	a forest
2	images/2011/06/07/04.jpg	tree!	
3	images/2011/06/28/pageblocks1-04.jpg	Look! you can upload pictures!	\N
5	images/2011/10/14/powerandcontrol-phsy.jpg	Emotional abuse, can also include stalking or very controlling behaviors by an intimate partner (e.g. calling frequently to check where you are, follows you to see where you are going, being told what to wear, who to talk to, where you can go, take’s control over your money etc.) Abuse may also occur when one partner tries to control the other partner by such behaviors as threatening to call ACS regarding her children, threatening to report her for immigration violations, or threatening to report her to the police for criminal activity. 	
6	images/2011/10/14/cycleofviolence.jpg	This chart shows what many women experience when in abusive relationships. First, tension builds and the partner becomes more controlling. Then, the partner may feel he or she loses control and an abusive incident occurs. Afterward, the partner apologizes and promises to change. Often in a situation like this the woman has mixed feelings, and may feel that she is walking on eggshells around the partner.  	cycle of violence diagram
\.


--
-- Data for Name: pageblocks_imagepullquoteblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_imagepullquoteblock (id, image, caption, alt) FROM stdin;
\.


--
-- Data for Name: pageblocks_pullquoteblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_pullquoteblock (id, body) FROM stdin;
\.


--
-- Data for Name: pageblocks_textblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pageblocks_textblock (id, body) FROM stdin;
1	Welcome to CCNMTL Forest. You can make pagetree sites here. It should be easy. Currently, it's not really done. But stay tuned.
2	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non mollis enim. Vestibulum est massa, gravida ut bibendum eget, porttitor vitae odio. Pellentesque mattis facilisis enim nec consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam in erat justo, eu varius velit. Nullam nec risus eget arcu mattis pulvinar eget sed augue. Cras hendrerit dolor ut magna iaculis ac accumsan diam pulvinar. Morbi hendrerit ligula ac ligula tempus vulputate. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sollicitudin libero, sed venenatis dolor condimentum ut. Vestibulum lobortis nibh id libero eleifend non blandit ipsum mattis.\r\n\r\nFusce ut velit scelerisque est elementum viverra eget id lectus. Etiam lacinia pretium quam id semper. In tempor laoreet justo sed tincidunt. Ut blandit lobortis scelerisque. Donec viverra mattis lacus a tristique. Integer eu lorem eget libero adipiscing ornare. Vivamus suscipit lacinia auctor. Sed in quam massa. Cras venenatis venenatis nibh porta consequat. Vivamus ac mauris felis. Morbi gravida purus quis ante iaculis malesuada. Proin mollis enim ac nulla dignissim aliquam sed sed purus. Nullam quis dapibus quam. Duis arcu risus, rutrum quis tristique sed, imperdiet et mi.\r\n\r\nVestibulum lobortis adipiscing semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur placerat nisi a dolor porttitor malesuada. Quisque commodo consectetur augue, sit amet vulputate dui scelerisque sit amet. Nulla facilisi. Vestibulum risus mi, aliquet vitae vestibulum eu, gravida eget est. Mauris id consequat nunc. Nunc cursus facilisis dolor sed aliquet. Duis in mauris arcu, non rhoncus diam. Fusce blandit sollicitudin sodales. Ut quis ullamcorper nulla. Aenean sagittis pharetra ante, sed dignissim nibh facilisis ut. Praesent viverra feugiat accumsan. Duis id arcu vel lectus commodo feugiat nec eget elit. Sed convallis porttitor mauris, eu pellentesque enim rhoncus ac. Sed vitae ante non arcu elementum consequat ut a velit. Nam mollis nunc a enim volutpat tincidunt sed vel libero. Cras et ipsum eu justo euismod posuere. Nullam ac congue diam. Proin vitae orci sit amet diam pellentesque dapibus vitae sit amet neque.\r\n\r\nMorbi vel mi nec tortor sollicitudin laoreet vitae vitae arcu. Quisque fermentum, massa in euismod posuere, magna purus molestie risus, quis commodo lorem nunc vitae orci. In nec orci eget mauris pretium cursus. Integer nisl sapien, pellentesque vitae sollicitudin eu, semper at eros. Sed in sem sem, quis sodales ligula. Phasellus ac ligula ante, et aliquet sem. Nam justo nunc, fermentum a interdum in, placerat non magna. Vestibulum ullamcorper, nulla eu iaculis varius, enim lorem suscipit metus, at pretium elit ipsum mattis elit. Vivamus consequat ligula a augue volutpat semper. Curabitur nec euismod nunc. Maecenas vel orci enim. Phasellus vel urna sed nisi suscipit adipiscing in at libero. Aliquam sed nibh urna. Aliquam id dolor lorem, quis lobortis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur pretium cursus pellentesque. In auctor tempor viverra. Nulla facilisi. Duis elit nibh, eleifend a tempor id, suscipit sit amet felis. Pellentesque augue nisi, ultricies sodales viverra nec, ornare sed lectus. Donec non quam fermentum elit lobortis venenatis. Ut molestie, nulla sed rutrum eleifend, arcu orci imperdiet augue, id venenatis arcu leo sit amet leo. In hac habitasse platea dictumst. Phasellus fermentum commodo magna. Nulla facilisi.\r\n
3	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non mollis enim. Vestibulum est massa, gravida ut bibendum eget, porttitor vitae odio. Pellentesque mattis facilisis enim nec consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam in erat justo, eu varius velit. Nullam nec risus eget arcu mattis pulvinar eget sed augue. Cras hendrerit dolor ut magna iaculis ac accumsan diam pulvinar. Morbi hendrerit ligula ac ligula tempus vulputate. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sollicitudin libero, sed venenatis dolor condimentum ut. Vestibulum lobortis nibh id libero eleifend non blandit ipsum mattis.\r\n\r\nFusce ut velit scelerisque est elementum viverra eget id lectus. Etiam lacinia pretium quam id semper. In tempor laoreet justo sed tincidunt. Ut blandit lobortis scelerisque. Donec viverra mattis lacus a tristique. Integer eu lorem eget libero adipiscing ornare. Vivamus suscipit lacinia auctor. Sed in quam massa. Cras venenatis venenatis nibh porta consequat. Vivamus ac mauris felis. Morbi gravida purus quis ante iaculis malesuada. Proin mollis enim ac nulla dignissim aliquam sed sed purus. Nullam quis dapibus quam. Duis arcu risus, rutrum quis tristique sed, imperdiet et mi.\r\n\r\nVestibulum lobortis adipiscing semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur placerat nisi a dolor porttitor malesuada. Quisque commodo consectetur augue, sit amet vulputate dui scelerisque sit amet. Nulla facilisi. Vestibulum risus mi, aliquet vitae vestibulum eu, gravida eget est. Mauris id consequat nunc. Nunc cursus facilisis dolor sed aliquet. Duis in mauris arcu, non rhoncus diam. Fusce blandit sollicitudin sodales. Ut quis ullamcorper nulla. Aenean sagittis pharetra ante, sed dignissim nibh facilisis ut. Praesent viverra feugiat accumsan. Duis id arcu vel lectus commodo feugiat nec eget elit. Sed convallis porttitor mauris, eu pellentesque enim rhoncus ac. Sed vitae ante non arcu elementum consequat ut a velit. Nam mollis nunc a enim volutpat tincidunt sed vel libero. Cras et ipsum eu justo euismod posuere. Nullam ac congue diam. Proin vitae orci sit amet diam pellentesque dapibus vitae sit amet neque.\r\n\r\nMorbi vel mi nec tortor sollicitudin laoreet vitae vitae arcu. Quisque fermentum, massa in euismod posuere, magna purus molestie risus, quis commodo lorem nunc vitae orci. In nec orci eget mauris pretium cursus. Integer nisl sapien, pellentesque vitae sollicitudin eu, semper at eros. Sed in sem sem, quis sodales ligula. Phasellus ac ligula ante, et aliquet sem. Nam justo nunc, fermentum a interdum in, placerat non magna. Vestibulum ullamcorper, nulla eu iaculis varius, enim lorem suscipit metus, at pretium elit ipsum mattis elit. Vivamus consequat ligula a augue volutpat semper. Curabitur nec euismod nunc. Maecenas vel orci enim. Phasellus vel urna sed nisi suscipit adipiscing in at libero. Aliquam sed nibh urna. Aliquam id dolor lorem, quis lobortis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur pretium cursus pellentesque. In auctor tempor viverra. Nulla facilisi. Duis elit nibh, eleifend a tempor id, suscipit sit amet felis. Pellentesque augue nisi, ultricies sodales viverra nec, ornare sed lectus. Donec non quam fermentum elit lobortis venenatis. Ut molestie, nulla sed rutrum eleifend, arcu orci imperdiet augue, id venenatis arcu leo sit amet leo. In hac habitasse platea dictumst. Phasellus fermentum commodo magna. Nulla facilisi.
4	Welcome to my awesome little forest site.\r\n\r\nHow awesome is it? You can have one of your own!
5	Hello!
6	You can start editing here.
7	You can start editing here.
9	Welcome to CCNMTL Forest. You can make pagetree sites here. It should be easy. Currently, it's not really done. But stay tuned.
10	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non mollis enim. Vestibulum est massa, gravida ut bibendum eget, porttitor vitae odio. Pellentesque mattis facilisis enim nec consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam in erat justo, eu varius velit. Nullam nec risus eget arcu mattis pulvinar eget sed augue. Cras hendrerit dolor ut magna iaculis ac accumsan diam pulvinar. Morbi hendrerit ligula ac ligula tempus vulputate. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sollicitudin libero, sed venenatis dolor condimentum ut. Vestibulum lobortis nibh id libero eleifend non blandit ipsum mattis.\r\n\r\nFusce ut velit scelerisque est elementum viverra eget id lectus. Etiam lacinia pretium quam id semper. In tempor laoreet justo sed tincidunt. Ut blandit lobortis scelerisque. Donec viverra mattis lacus a tristique. Integer eu lorem eget libero adipiscing ornare. Vivamus suscipit lacinia auctor. Sed in quam massa. Cras venenatis venenatis nibh porta consequat. Vivamus ac mauris felis. Morbi gravida purus quis ante iaculis malesuada. Proin mollis enim ac nulla dignissim aliquam sed sed purus. Nullam quis dapibus quam. Duis arcu risus, rutrum quis tristique sed, imperdiet et mi.\r\n\r\nVestibulum lobortis adipiscing semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur placerat nisi a dolor porttitor malesuada. Quisque commodo consectetur augue, sit amet vulputate dui scelerisque sit amet. Nulla facilisi. Vestibulum risus mi, aliquet vitae vestibulum eu, gravida eget est. Mauris id consequat nunc. Nunc cursus facilisis dolor sed aliquet. Duis in mauris arcu, non rhoncus diam. Fusce blandit sollicitudin sodales. Ut quis ullamcorper nulla. Aenean sagittis pharetra ante, sed dignissim nibh facilisis ut. Praesent viverra feugiat accumsan. Duis id arcu vel lectus commodo feugiat nec eget elit. Sed convallis porttitor mauris, eu pellentesque enim rhoncus ac. Sed vitae ante non arcu elementum consequat ut a velit. Nam mollis nunc a enim volutpat tincidunt sed vel libero. Cras et ipsum eu justo euismod posuere. Nullam ac congue diam. Proin vitae orci sit amet diam pellentesque dapibus vitae sit amet neque.\r\n\r\nMorbi vel mi nec tortor sollicitudin laoreet vitae vitae arcu. Quisque fermentum, massa in euismod posuere, magna purus molestie risus, quis commodo lorem nunc vitae orci. In nec orci eget mauris pretium cursus. Integer nisl sapien, pellentesque vitae sollicitudin eu, semper at eros. Sed in sem sem, quis sodales ligula. Phasellus ac ligula ante, et aliquet sem. Nam justo nunc, fermentum a interdum in, placerat non magna. Vestibulum ullamcorper, nulla eu iaculis varius, enim lorem suscipit metus, at pretium elit ipsum mattis elit. Vivamus consequat ligula a augue volutpat semper. Curabitur nec euismod nunc. Maecenas vel orci enim. Phasellus vel urna sed nisi suscipit adipiscing in at libero. Aliquam sed nibh urna. Aliquam id dolor lorem, quis lobortis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur pretium cursus pellentesque. In auctor tempor viverra. Nulla facilisi. Duis elit nibh, eleifend a tempor id, suscipit sit amet felis. Pellentesque augue nisi, ultricies sodales viverra nec, ornare sed lectus. Donec non quam fermentum elit lobortis venenatis. Ut molestie, nulla sed rutrum eleifend, arcu orci imperdiet augue, id venenatis arcu leo sit amet leo. In hac habitasse platea dictumst. Phasellus fermentum commodo magna. Nulla facilisi.
11	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non mollis enim. Vestibulum est massa, gravida ut bibendum eget, porttitor vitae odio. Pellentesque mattis facilisis enim nec consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam in erat justo, eu varius velit. Nullam nec risus eget arcu mattis pulvinar eget sed augue. Cras hendrerit dolor ut magna iaculis ac accumsan diam pulvinar. Morbi hendrerit ligula ac ligula tempus vulputate. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sollicitudin libero, sed venenatis dolor condimentum ut. Vestibulum lobortis nibh id libero eleifend non blandit ipsum mattis.\r\n\r\nFusce ut velit scelerisque est elementum viverra eget id lectus. Etiam lacinia pretium quam id semper. In tempor laoreet justo sed tincidunt. Ut blandit lobortis scelerisque. Donec viverra mattis lacus a tristique. Integer eu lorem eget libero adipiscing ornare. Vivamus suscipit lacinia auctor. Sed in quam massa. Cras venenatis venenatis nibh porta consequat. Vivamus ac mauris felis. Morbi gravida purus quis ante iaculis malesuada. Proin mollis enim ac nulla dignissim aliquam sed sed purus. Nullam quis dapibus quam. Duis arcu risus, rutrum quis tristique sed, imperdiet et mi.\r\n\r\nVestibulum lobortis adipiscing semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur placerat nisi a dolor porttitor malesuada. Quisque commodo consectetur augue, sit amet vulputate dui scelerisque sit amet. Nulla facilisi. Vestibulum risus mi, aliquet vitae vestibulum eu, gravida eget est. Mauris id consequat nunc. Nunc cursus facilisis dolor sed aliquet. Duis in mauris arcu, non rhoncus diam. Fusce blandit sollicitudin sodales. Ut quis ullamcorper nulla. Aenean sagittis pharetra ante, sed dignissim nibh facilisis ut. Praesent viverra feugiat accumsan. Duis id arcu vel lectus commodo feugiat nec eget elit. Sed convallis porttitor mauris, eu pellentesque enim rhoncus ac. Sed vitae ante non arcu elementum consequat ut a velit. Nam mollis nunc a enim volutpat tincidunt sed vel libero. Cras et ipsum eu justo euismod posuere. Nullam ac congue diam. Proin vitae orci sit amet diam pellentesque dapibus vitae sit amet neque.\r\n\r\nMorbi vel mi nec tortor sollicitudin laoreet vitae vitae arcu. Quisque fermentum, massa in euismod posuere, magna purus molestie risus, quis commodo lorem nunc vitae orci. In nec orci eget mauris pretium cursus. Integer nisl sapien, pellentesque vitae sollicitudin eu, semper at eros. Sed in sem sem, quis sodales ligula. Phasellus ac ligula ante, et aliquet sem. Nam justo nunc, fermentum a interdum in, placerat non magna. Vestibulum ullamcorper, nulla eu iaculis varius, enim lorem suscipit metus, at pretium elit ipsum mattis elit. Vivamus consequat ligula a augue volutpat semper. Curabitur nec euismod nunc. Maecenas vel orci enim. Phasellus vel urna sed nisi suscipit adipiscing in at libero. Aliquam sed nibh urna. Aliquam id dolor lorem, quis lobortis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur pretium cursus pellentesque. In auctor tempor viverra. Nulla facilisi. Duis elit nibh, eleifend a tempor id, suscipit sit amet felis. Pellentesque augue nisi, ultricies sodales viverra nec, ornare sed lectus. Donec non quam fermentum elit lobortis venenatis. Ut molestie, nulla sed rutrum eleifend, arcu orci imperdiet augue, id venenatis arcu leo sit amet leo. In hac habitasse platea dictumst. Phasellus fermentum commodo magna. Nulla facilisi.\r\n
12	Early childhood caries are a serious public oral health problem affected by various socioeconomic and cultural factors. This module aims to enhance dentists’ understanding of the social work profession to provide an option.................
13	<em>NOTE to cindy: content seems incomplete from the document I used - make sure to go back and revise.</em><br><br>\r\n<strong>1. Patient Recruitment via Community Awareness</strong>\r\n<p>Social workers often visit community centers, soup kitchens, schools, gyms, etc. to present information in an interactive and engaging manner. They can provide psychoeducational workshops to parents and children in the community to explain the importance of oral health and maintaining good dental hygiene. By modeling healthy oral health practices with parents and children, families are more likely to develop self-efficacy and continue healthy behavior.</p>\r\n \r\n<p>Interfacing with a social worker to conduct psychoeducational groups can provide valuable patient referrals from underserved, high-need communities.</p>\r\n<strong>2. Better Patient Health Outcomes</strong>\r\n<p>Social workers can identify any additional services families may need and work with them to access these services, as well as make follow-up phone calls to monitor treatment progress and general well-being.</p>\r\n<p>Social workers identify and ameliorate potential psychosocial and practical barriers to treatment such as issues of transportation, childcare, cultural values, sentiment of distrust or shame/embarrassment to going to dentist, or mental health issues such as depression, anxiety, drug/alcohol addiction etc., in the family.</p>\r\n<p>Work with patient family to explore barriers and prioritize oral health through open conversations with parents. Assist clients to apply, re-apply, or renew Medicaid or other government benefits such as food stamps, or WIC: to encourage healthy nutrition to prevent caries.</p>\r\n<p>Provide support and expertise in challenging situations, such as in suspected cases of child abuse or neglect, or domestic violence and working with family to draw up a safety plan. \r\n</p>\r\n<strong>3. Help take on challenging new cases</strong>\r\n<p>Social workers can reduce fear and anxiety, enhance cooperation, and effect treatment when working with anxious or very young children or children with special needs. Their knowledge and training of mental health disorders allows them to recognize characteristics of behavior and work with family to calm a child.</p>\r\n<strong>4. Early intervention, removing barriers,..........</strong>\r\n<p> where did the content go?</p>\r\n<strong>5. Managing challenging patient situations in office</strong>\r\n<p>Social workers are trained to respect and remain open to various cultural attitudes and practice sensitivity towards this. Additionally, many have competency in a second language.</p>\r\n<p>Work appropriately with patients or families who are living with mentally, physically disabled and/or developmentally delayed conditions</p>\r\n<p>Trained to work with families of these patients and remain open and sensitive to the unique challenges to returning for visits that these families may face</p>\r\n<strong>6. Staff capacity building </strong>\r\n<p>Cultural sensitivity training, PDD and autism training, challenging situations management training, etc. </p>\r\n<strong>7. Patient Retention</strong>\r\n<p>All these ways in which social work can benefit dental practices as well better patient outcomes contribute to patient loyalty, satisfaction and rate of return.</p>\r\n<p>Engage parents in waiting room to discuss importance of oral health to improve patient retention and set up an individualized treatment plan for every child that identifies strengths and challenges to dental care.</p>
14	Thank you for taking the time to participate in the WINGS project today. The purpose of this project is to provide information and resources to women. We are particularly interested in how women can stay safe in relationships with intimate partners. 
23	Sexual abuse may include being forced to have sex or feeling pressured into having unwanted sexual activity, like if a partner pressures you to have oral or anal sex when you don’t want to or if a partner takes sexual advantage of you when you are under the influence of drugs or alcohol. \r\n\r\n[image suggestions needed]
16	Most relationships have good times and bad times. Conflict can arise when partners have different needs or expectations or when difficult things happen that are outside of both partners’ control. Intimate relationships can be an important source of support, love, and purpose in life. While all relationships may have positives and negatives, we’d like to spend some time today talking about conflict and violence, which sometimes occurs in intimate relationships.   
17	You'll be learning about recognizing abuse and making safety plans now. What you see and hear might be upsetting to you, especially if it touches on something that's going on, or has gone on, in your life. Please remember that we're here to help you.\r\n\r\nNow you're going to complete a screening on how safe and comfortable you feel in your relationship with your intimate partners. Please answer the following questions about your current or recent partner(s).  \r\n
15	[image suggestions: logo or illustration that refers to flying]
18	[image suggestions: two people together]
22	[image suggestions: someone shouting, other suggestions needed]
24	TBD\r\n\r\n[image suggestions needed]
27	Sometimes alcohol and drug use make the pattern of violence worse. Individuals who use drugs and alcohol are more likely to commit acts of physical or sexual violence against their partners. Women who are under the influence of drugs or alcohol may be less likely to pick up on cues when their partners are about to become violent and less able to escape or resist abusive situations or to refuse to have unwanted sex. When an intimate partner keeps someone from attending treatment or threatens to hurt them if they use or don’t use drugs, this is a part of abusive behavior.  \r\n\r\n[image suggestions needed]
28	Approximately 1 in 4 women will experience domestic abuse in her lifetime. Each year there are approximately 16,800 homicides and over 2 million medically treated injuries related to intimate partner violence.  Less than 20% accessed medical treatment after being abused.\r\n\r\n[images suggestions needed]\r\n\r\n[note: the word 'prevalence' is difficult.  perhaps the title 'IPV is a problem for a lot of women' or something similar would get the point across at a lower reading level]
25	All the types of behavior just described abuse are related to power and control, and they are forms of intimate partner violence. Such violence can occur from partners who are female or male, and within relationships that are long-term or casual, of the same or of different genders.    
21	In addition to physical violence, verbal abuse, such as screaming, yelling, threats, name calling, and putdowns can include angry words that make you feel hurt, ashamed or insignificant. These behaviors are also sometimes referred to as emotional abuse. 
30	Many women who experience violence from their partner have difficulty in telling someone about what is happening. Some women feel that there is no way out of the situation and their partner has control. Addressing such a situation may not be easy. But the purpose of our conversation today is to consider any risks you or your loved ones may be facing, and to consider what supports and resources are available to you.
31	Intimate partners may hurt each other in different ways. One type of violence includes physical abuse with behaviors such as shoving, pushing, slapping, hitting, kicking, pulling hair or punching. Such abuse can cause severe injuries and may even be deadly.
29	Women who experience such abuse by their partners may develop sleep disturbances, sexual dysfunction, depression, anxiety, post traumatic stress disorder, eating disorders, malnutrition, gynecological problems, become isolated, feel an intense loss of social connections, and may attempt suicide. Such abuse may also make it difficult for women to negotiate condom use with their partners and protect themselves against HIV and other STIs.\r\n \r\nExposure to violence can also have lasting consequences for children. Children who see or hear violence often experience grief, fear of harm and abandonment, and anxiety. Boys who witness violence between their parents are ten times more likely to abuse their partners when they become adults. Girls who witness parental violence are much more likely to be abused by their partners when they grow up.\r\n\r\nSome women who experience violence in relationships may become angry and want to strike back or hurt their partner. By fighting back their partners, women may put themselves at risk for being charged assault or other criminal charges that result in incarceration.\r\n\r\n\r\n[image suggestions needed]\r\n\r\n[The above language is difficult spoken or written.  Here is a rewrite with easier words/clauses.  This was written by Jess, feel free to ignore:\r\n\r\nWomen who are abused by their partners may have trouble sleeping, have problems with sex, and be depressed or anxious.  They may experience post traumatic stress disorder.  They can develop eating disorders, poor nutrition, and other health problems.  They can become isolated and feel distant from family and friends.  Some may attempt suicide.  \r\n\r\nIt can be hard to talk about condoms with an abusive partner.  This makes it difficult for women to protect themselves from HIV and other STIs.\r\n\r\nExposure to violence can also have lasting consequences for children.\r\n\r\nSome women who experience violence may become angry and want to strike back or hurt their partners.  This can create a dangerous situation in which a woman may be killed.  It may also lead to arrest and prison time.]
32	For the following statements about your current or recent partner, please indicate on scale of 1 to 6 how much you agree with the statement\r\n\r\n1 – Strongly Agree\r\n2 – Agree Somewhat\r\n3 – Agree a little\r\n4 – Disagree a little\r\n5 – Disagree Somewhat\r\n6 – Disagree Strongly\r\n
33	this section is TBD
34	Risk for Relationship Conflict or Intimate Partner Violence:\r\n\r\nIt does appear that you are experiencing some relationship conflict that may be hurting you  and making it difficult to protect yourself from HIV and other STIs. If you have questions or concerns about your risk for IPV and how to get help to reduce IPV, your a staff member will be available after the session to meet you.  Later on in this program you will learn about public services available to you and you will receive a book of resources with names and numbers you can call.\r\n\r\nYou are about learn some safety planning steps to make sure that you are prepared in case the relationship conflict gets out of hand. By learning about safety planning, you may be able to help family or friends who are experiencing serious relationship conflict.\r\n\r\nOR\r\n\r\nNo IPV Risk:\r\n\r\nBased on your answers, it doesn’t appear that you are experiencing serious relationship conflict, but we would like you to continue learning about how to help your family or friends who may experiencing serious relationship conflict or intimate partner violence.\r\n
35	Relationship conflicts with partners – which may include emotional, physical, or sexual abuse – are common triggers for using drugs and alcohol to cope with the emotional and sometimes physical pain. Violence often causes women in recovery to relapse and drop out of treatment. 
36	Thinking through your relationship with your partner(s) now or in the past, when you experience conflict or if you are being hurt by your partner, what are some negative consequences that you have experienced or have concerns about?
37	After considering the different negative ways that relationship conflict, fighting with your partner or being hurt by your partner may be affecting your life and your family, what are some reasons why it would be important for you to reduce relationship conflict with your partner and reduce your risk for being hurt by your partner? 
38	Thinking through your relationship with your partner(s) now or in the past, when you experience conflict or if you are being hurt by your partner, what are some negative consequences that you have experienced or have concerns about?
40	Women cannot always avoid violent incidents. In order to increase safety, women may use a variety of strategies.  You are about to make a plan about how to increase your saftey in a variety of situations.
41	During a violent incident you may need to leave the place where you live with your partner.  You may also need to communicate with your children and find a place for you and your children to stay while your partner calms down.  You can use the following strategies to help stay safe.
42	I can teach my children how to use the telephone and dial 911 to contact the police and the fire department. 
43	I can also teach these strategies to some or all of my children.
44	I will use my judgment and intuition. If the situation is very serious, I can give my partner what he/she wants to calm him/her down. I have to protect myself until I/we are out of danger.
46	Call 311 and ask for the NYC Domestic Violence Hotline (800-621-4673; TDD 866-604-5350) if you need counseling, legal assistance or emergency housing.  If you are feeling threatened by your partner or in more immediate danger, call 911 for the police.
47	Keep change for phone calls on you at all times. If you use your telephone credit card, the following month the telephone bill will tell your partner those numbers that you called after you left. To keep your telephone communications confidential, you must either use coins at a pay phone or get a friend to let you use their telephone credit card for a limited time when you first leave. 
48	I will rehearse my escape plan and, as appropriate, practice it with my children.
45	A woman may have to leave the residence she shares with her partner, who is out of control. Leaving must be done with a careful plan in order to increase safety.  A violent partner often strikes back if he believes that the woman is leaving a relationship.
49	Let's identify the goals you most want to pursue and focus on these.\r\n
\.


--
-- Data for Name: pagetree_hierarchy; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_hierarchy (id, name, base_url) FROM stdin;
1	forest.ccnmtl.columbia.edu	/
4	awesome.forest.ccnmtl.columbia.edu	/
5	newsite.forest.ccnmtl.columbia.edu	/
7	pass.ccnmtl.columbia.edu	/
8	match.ccnmtl.columbia.edu	/
9	www.sciencedirect.com	/
10	ejtest.forest.ccnmtl.columbia.edu	/
11	wings.forest.ccnmtl.columbia.edu	/
\.


--
-- Data for Name: pagetree_pageblock; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_pageblock (id, section_id, ordinality, label, content_type_id, object_id) FROM stdin;
3	6	1		16	2
4	4	1		16	3
5	4	2	Pop Quiz, sucka!	26	1
6	12	1		16	4
7	17	1		16	5
8	17	2		19	2
9	22	1		16	6
12	26	1		16	9
13	26	2	A forest	19	3
14	27	1		16	10
15	27	2	Pop Quiz, sucka!	26	2
16	28	1		16	11
69	70	1	Prevalence	16	28
71	73	1	Difficulty of Disclosure	16	30
132	112	1		16	43
102	100	2		26	30
103	100	3		26	31
104	100	4		26	32
105	100	5		26	33
106	100	6		26	34
107	100	7		26	35
73	63	1	Physical Abuse	16	31
108	100	8		26	36
62	64	1	Verbal Abuse	16	21
74	74	1	Emotional Abuse	19	5
64	65	1	Sexual Abuse	16	23
66	67	1	Power and Control	16	25
10	21	1		16	7
109	100	9		26	37
75	68	1	The Cycle of Violence	19	6
70	72	1	Negative Consequences	16	29
35	41	1		16	12
36	41	2	Social Workers: Who Are They?	17	16
37	41	3	Social Work Licenses in NY	17	17
78	77	1	Introduction	16	32
38	22	2	Demo Career Map	32	1
40	50	1	Introductory Survey	26	6
1	3	1		16	1
39	3	2	Refrigerator Game from Diabeaters	36	1
2	3	3	A forest	19	1
41	41	4	Survey	26	7
42	42	1	Myths	17	18
43	42	2	Quiz	26	8
44	43	1	Working with Social Workers to Enhance your Practice	16	13
45	44	1	Case 1: Recruit patients	17	19
46	44	2	How a Social Worker can assist in this case	17	20
47	45	1	Case 2: Retain patients	17	21
48	45	2	Role of Social Worker:	17	22
49	46	1	Case 3: Better outcomes for patient	17	23
50	46	2	Possible social worker roles:	17	24
51	47	1	Case 4: Better outcomes for office	17	25
52	47	2	Role of Social Worker:	17	26
53	48	1	Joyce, Natasha and Baby Joe	17	27
54	48	2	Quiz	26	9
55	61	1	Welcome to WINGS!	16	14
79	76	1	Introduction	16	33
57	59	1	Relationships	16	16
58	53	1	Screening for IPV	16	17
56	61	2		16	15
59	59	2		16	18
63	64	2		16	22
68	69	1	Drug Use and IPV	16	27
80	78	1		26	12
81	79	1		26	13
82	80	1		26	14
83	81	1		26	15
84	82	1		26	16
85	83	1		26	17
86	84	1		26	18
87	85	1		26	19
88	86	1		26	20
89	87	1		26	21
90	88	1		26	22
91	89	1		26	23
92	90	1		26	24
93	92	1		26	25
94	93	1		26	26
95	94	1		26	27
96	54	1	Risk or No Risk statement	16	34
97	97	1		16	35
133	113	1		26	55
100	99	1	E.\t Identifying Reasons to Reduce Relationship Conflict and Improve Safety	16	37
101	99	2		26	29
110	100	10		26	38
111	100	11		26	39
112	100	12		26	40
113	100	1	Cons of Relationship Conflict	16	38
134	114	1		16	44
136	115	1		26	56
137	116	1		26	57
138	117	1		26	58
139	118	1		26	59
140	119	1		16	46
141	120	1		16	47
142	121	1		26	60
143	123	1		26	61
144	124	1		26	62
145	125	1		26	63
146	126	1		16	48
135	103	1	Safety When Preparing to Leave	16	45
147	57	1	Goal Setting	16	49
148	57	2		26	64
149	58	1		26	65
121	56	1		16	40
122	104	1		26	47
123	105	1		26	48
124	106	1		26	49
125	107	1		26	50
126	108	1		26	51
127	102	1	Strategies for Saftey During a Violent Incident	16	41
128	109	1		16	42
129	110	1		26	52
130	111	1		26	53
131	111	2		26	54
\.


--
-- Data for Name: pagetree_section; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY pagetree_section (id, path, depth, numchild, label, slug, hierarchy_id) FROM stdin;
3	00010001	2	0	Introduction	introduction	1
5	00010003	2	0	Third Module	third-module	1
1	0001	1	3	Root		1
7	000100020002	3	0	page 2	page-2	1
8	000100020003	3	0	page 3	page-3	1
4	00010002	2	3	Second Module	second-module	1
9	0001000200010001	4	0	grand grand child	grand-grand-child	1
6	000100020001	3	1	page 1	page-1	1
12	00030001	2	0	Introduction	introduction	4
13	00030002	2	0	Module 1	module-1	4
14	00030003	2	0	Module 2	module-2	4
15	00030004	2	0	Module 3	module-3	4
11	0003	1	4	Root		4
17	00040001	2	0	Introduction	introduction	5
18	00040002	2	0	Module 1	module-1	5
16	0004	1	2	Root		5
24	0008	1	0	Root		9
50	000600020001	3	0	Survey	survey	7
49	00060002	2	1	Module 1	module-1	7
26	00090001	2	0	Introduction	introduction	10
28	000900020001	3	1	page 1	page-1	10
29	0009000200010001	4	0	grand grand child	grand-grand-child	10
100	000A000C0008	3	0	Cons of Relationship Conflict	cons-of-relationship-conflict	11
30	000900020002	3	0	page 2	page-2	10
27	00090002	2	3	Second Module	second-module	10
31	000900020003	3	0	page 3	page-3	10
25	0009	1	3	Root		10
32	00090003	2	0	Third Module	third-module	10
104	000A000E00010001	4	0	plan part 1	plan-part-1	11
21	0007	1	1	Root		8
112	000A000E00010009	4	0	plan part 9	plan-part-9	11
106	000A000E00010003	4	0	plan part 3	plan-part-3	11
108	000A000E00010005	4	0	plan part 5	plan-part-5	11
114	000A000E0001000B	4	0	plan part 11	plan-part-11	11
110	000A000E00010007	4	0	plan part 7	plan-part-7	11
102	000A000E0001	3	11	During a Violent Incident	during-a-violent-incident	11
116	000A000E00020002	4	0	plan part 2	plan-part-2	11
118	000A000E00020004	4	0	plan part 4	plan-part-4	11
120	000A000E00020006	4	0	plan part 6	plan-part-6	11
124	000A000E00020009	4	0	plan part 9	plan-part-9	11
126	000A000E0002000B	4	0	plan part 11	plan-part-11	11
41	000700080001	3	0	Introduction	introduction	8
42	000700080002	3	0	Myths	myths	8
43	000700080003	3	0	Your Practice	your-practice	8
44	000700080004	3	0	Recruiting	recruiting	8
45	000700080005	3	0	Retaining	retaining	8
46	000700080006	3	0	Outcomes	outcomes	8
47	000700080007	3	0	Office	office	8
48	000700080008	3	0	What Would You Do?	what-would-you-do	8
23	00070008	2	8	Module 1: Social Work	socialwork	8
20	0006	1	2	Root		7
22	00060003	2	0	Introduction	introduction	7
76	000A000A0001	3	0	Relationship Satisfaction	relationship-satisfaction	11
53	000A000A	2	2	Screening for IPV	screening-for-ipv	11
79	000A000A0002000K	4	0	question 2	question-2	11
80	000A000A0002000L	4	0	question 3	question-3	11
78	000A000A0002000J	4	0	question 1	question-1	11
51	000A	1	8	Root		11
69	000A00090005	3	0	Drug Use and IPV	drug-use-and-ipv	11
70	000A00090006	3	0	Prevalence	prevalence	11
72	000A00090007	3	0	Consequences of IPV	consequences-of-ipv	11
73	000A00090008	3	0	Difficulty of Disclosure	difficulty-of-disclosure	11
52	000A0009	2	7	Introduction	introduction	11
63	000A000900040008	4	0	Physical Abuse	physical-abuse	11
64	000A000900040009	4	0	Verbal Abuse	verbal-abuse	11
65	000A00090004000B	4	0	Sexual Abuse	sexual-abuse	11
61	000A00090002	3	0	Welcome	welcome	11
59	000A00090003	3	0	Relationships	relationships	11
81	000A000A0002000M	4	0	question 4	question-4	11
82	000A000A0002000N	4	0	question 5	question-5	11
99	000A000C0009	3	0	Reasons to Reduce Conflict	reasons-to-reduce-conflict	11
97	000A000C	2	2	Enhancing Motivation	enhancing-motivation	11
67	000A00090004000D	4	0	Power and Control	power-and-control	11
68	000A00090004000E	4	0	The Cycle of Violence	the-cycle-of-violence	11
74	000A00090004000A	4	0	Emotional Abuse	emotional-abuse	11
62	000A00090004	3	6	Types of Conflict	types-of-conflict	11
83	000A000A0002000O	4	0	question 6	question-6	11
84	000A000A0002000P	4	0	question 7	question-7	11
85	000A000A0002000Q	4	0	question 8	question-8	11
86	000A000A0002000R	4	0	question 9	question-9	11
87	000A000A0002000S	4	0	question 10	question-10	11
88	000A000A0002000T	4	0	question 11	question-11	11
77	000A000A0002	3	16	Violence Screening	violence-screening	11
89	000A000A0002000V	4	0	question 12	question-12	11
90	000A000A0002000W	4	0	question 13	question-13	11
92	000A000A0002000Y	4	0	question 14	question-14	11
93	000A000A0002000Z	4	0	question 15	question-15	11
94	000A000A00020010	4	0	question 16	question-16	11
54	000A000B	2	0	Feedback on IPV Risk	feedback-on-ipv-risk	11
55	000A000D	2	0	Social Support Map	social-support-map	11
57	000A000F	2	0	Goal Setting	goal-setting	11
58	000A000G	2	0	Service Referrals	service-referrals	11
56	000A000E	2	2	Safety Plan	safety-plan	11
105	000A000E00010002	4	0	plan part 2	plan-part-2	11
107	000A000E00010004	4	0	plan part 4	plan-part-4	11
109	000A000E00010006	4	0	plan part 6	plan-part-6	11
111	000A000E00010008	4	0	plan part 8 	plan-part-8	11
113	000A000E0001000A	4	0	plan part 10	plan-part-10	11
115	000A000E00020001	4	0	plan part 1	plan-part-1	11
117	000A000E00020003	4	0	plan part 3	plan-part-3	11
119	000A000E00020005	4	0	plan part 5	plan-part-5	11
121	000A000E00020007	4	0	plan part 7	plan-part-7	11
123	000A000E00020008	4	0	plan part 8	plan-part-8	11
125	000A000E0002000A	4	0	plan part 10	plan-part-10	11
103	000A000E0002	3	11	Preparing to Leave	preparing-to-leave	11
\.


--
-- Data for Name: quizblock_answer; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_answer (id, question_id, value, label, correct, _order) FROM stdin;
1	2	yes	Yes	f	0
2	2	no	No	f	1
3	2	constantly	Constantly	t	2
4	3	yes	Yes	f	0
5	3	no	No	f	1
6	3	constantly	Constantly	t	2
7	4	a	True	f	0
84	41	Louisiana State University School of Dentistry	Louisiana State University School of Dentistry	f	14
8	4	b	False	t	1
9	5	a	True	f	0
10	5	b	False	t	1
11	6	a	True	f	0
12	6	b	False	t	1
13	7	a	True	f	0
14	7	b	False	t	1
15	8	a	True	f	0
16	8	b	False	t	1
25	19	a	Yes	f	0
26	19	b	No	f	1
27	21	a	At the hospital	f	0
28	21	b	At your practice	f	1
29	23	a	Natasha	f	0
30	23	b	Joyce	f	1
31	31	Male	Male	f	0
32	31	Female	Female	f	1
33	32	White	White	f	0
34	32	Black or African American	Black or African American	f	1
35	32	American Indian and Alaska Native	American Indian and Alaska Native	f	2
36	32	Asian	Asian	f	3
37	32	Native Hawaiian or Other Pacific Islander	Native Hawaiian or Other Pacific Islander	f	4
38	32	Two or more races	Two or more races	f	5
39	33	Hispanic	Hispanic	f	0
40	33	Non-Hispanic	Non-Hispanic	f	1
41	36	Yes	Yes	f	0
42	36	No	No	f	1
43	38	Some high school	Some high school	f	0
44	38	High school graduate	High school graduate	f	1
45	38	Some college	Some college	f	2
46	38	Associate/2 year degree	Associate/2 year degree	f	3
47	38	College graduate/ 4 year degree	College graduate/ 4 year degree	f	4
48	38	Some graduate school	Some graduate school	f	5
49	38	Masters/Professional degree	Masters/Professional degree	f	6
50	38	Other	Other	f	7
51	39	Some high school	Some high school	f	0
52	39	High school graduate	High school graduate	f	1
53	39	Some college	Some college	f	2
54	39	Associate/2 year degree	Associate/2 year degree	f	3
55	39	College graduate/ 4 year degree	College graduate/ 4 year degree	f	4
56	39	Some graduate school	Some graduate school	f	5
57	39	Masters/Professional degree	Masters/Professional degree	f	6
58	39	Other	Other	f	7
59	40	Master of Art, please specify field of study	Master of Art, please specify field of study	f	0
60	40	Master of Science, please specify field of study	Master of Science, please specify field of study	f	1
61	40	Master of Public Health, please specify concentration	Master of Public Health, please specify concentration	f	2
62	40	Other Masters degree, please specify	Other Masters degree, please specify	f	3
63	40	Juris Doctor	Juris Doctor	f	4
64	40	Medical Doctor, please specify specialty	Medical Doctor, please specify specialty	f	5
65	40	Doctor of Philosophy, please specify specialty	Doctor of Philosophy, please specify specialty	f	6
66	40	Doctor of Education, please specify concentration	Doctor of Education, please specify concentration	f	7
67	40	Doctor of Psychology, please specify concentration	Doctor of Psychology, please specify concentration	f	8
68	40	Doctor of Public Health, please specify concentration	Doctor of Public Health, please specify concentration	f	9
69	40	Other Doctoral degree, please specify	Other Doctoral degree, please specify	f	10
70	41	A.T. Still University Arizona School of Dentistry and Oral Health	A.T. Still University Arizona School of Dentistry and Oral Health	f	0
71	41	Baylor College of Dentistry Component of Texas A & M Health Sci Ctr	Baylor College of Dentistry Component of Texas A & M Health Sci Ctr	f	1
72	41	Boston University Goldman School of Dental Medicine	Boston University Goldman School of Dental Medicine	f	2
73	41	Case Western Reserve Univ. School of Dental Medicine	Case Western Reserve Univ. School of Dental Medicine	f	3
74	41	Columbia University College of Dental Medicine	Columbia University College of Dental Medicine	f	4
75	41	Creighton University School of Dentistry	Creighton University School of Dentistry	f	5
76	41	East Carolina University School of Dental Medicine	East Carolina University School of Dental Medicine	f	6
77	41	Georgia Health Sciences University School of Dentistry	Georgia Health Sciences University School of Dentistry	f	7
78	41	Harvard University School of Dental Medicine	Harvard University School of Dental Medicine	f	8
79	41	Herman Ostrow School of Dentistry of USC	Herman Ostrow School of Dentistry of USC	f	9
80	41	Howard University College of Dentistry	Howard University College of Dentistry	f	10
81	41	Indiana University School of Dentistry	Indiana University School of Dentistry	f	11
82	41	LECOM College of Dental Medicine	LECOM College of Dental Medicine	f	12
83	41	Loma Linda University School of Dentistry	Loma Linda University School of Dentistry	f	13
85	41	Marquette University School of Dentistry	Marquette University School of Dentistry	f	15
86	41	Medical University of South Carolina James B. Edwards College of Dental Medicine	Medical University of South Carolina James B. Edwards College of Dental Medicine	f	16
87	41	Meharry Medical College School of Dentistry	Meharry Medical College School of Dentistry	f	17
88	41	Midwestern University College of Dental Medicine- Arizona	Midwestern University College of Dental Medicine- Arizona	f	18
89	41	Midwestern University College of Dental Medicine- Illinois	Midwestern University College of Dental Medicine- Illinois	f	19
90	41	New York University College of Dentistry	New York University College of Dentistry	f	20
91	41	Nova Southeastern University College of Dental Medicine	Nova Southeastern University College of Dental Medicine	f	21
92	41	Ohio State University College of Dentistry	Ohio State University College of Dentistry	f	22
93	41	Oregon Health and Science University School of Dentistry	Oregon Health and Science University School of Dentistry	f	23
94	41	Southern Illinois University School of Dental Medicine	Southern Illinois University School of Dental Medicine	f	24
95	41	State University of New York at Buffalo School of Dental Medicine	State University of New York at Buffalo School of Dental Medicine	f	25
96	41	State University of New York at Stony Brook School of Dental Medicine	State University of New York at Stony Brook School of Dental Medicine	f	26
97	41	Temple University The Maurice H. Kornberg School of Dentistry	Temple University The Maurice H. Kornberg School of Dentistry	f	27
98	41	The University of Texas School of Dentistry at Houston	The University of Texas School of Dentistry at Houston	f	28
99	41	Tufts University School of Dental Medicine	Tufts University School of Dental Medicine	f	29
100	41	University of Alabama School of Dentistry at UAB	University of Alabama School of Dentistry at UAB	f	30
101	41	University of California at Los Angeles School of Dentistry	University of California at Los Angeles School of Dentistry	f	31
102	41	University of California at San Francisco School of Dentistry	University of California at San Francisco School of Dentistry	f	32
103	41	University of Colorado Denver	University of Colorado Denver	f	33
104	41	University of Connecticut School of Dental Medicine	University of Connecticut School of Dental Medicine	f	34
105	41	University of Detroit Mercy School of Dentistry	University of Detroit Mercy School of Dentistry	f	35
106	41	University of Florida College of Dentistry	University of Florida College of Dentistry	f	36
107	41	University of Illinois at Chicago College of Dentistry	University of Illinois at Chicago College of Dentistry	f	37
108	41	University of Iowa College of Dentistry	University of Iowa College of Dentistry	f	38
109	41	University of Kentucky College of Dentistry	University of Kentucky College of Dentistry	f	39
110	41	University of Louisville School of Dentistry	University of Louisville School of Dentistry	f	40
111	41	University of Maryland Baltimore College of Dental Surgery	University of Maryland Baltimore College of Dental Surgery	f	41
112	41	University of Medicine & Dentistry of New Jersey New Jersey Dental School	University of Medicine & Dentistry of New Jersey New Jersey Dental\r\nSchool	f	42
113	41	University of Michigan School of Dentistry	University of Michigan School of Dentistry	f	43
114	41	University of Minnesota School of Dentistry	University of Minnesota School of Dentistry	f	44
115	41	University of Mississippi School of Dentistry	University of Mississippi School of Dentistry	f	45
116	41	University of Missouri-Kansas City School of Dentistry	University of Missouri-Kansas City School of Dentistry	f	46
117	41	University of Nebraska Medical Center College of Dentistry	University of Nebraska Medical Center College of Dentistry	f	47
118	41	University of Nevada Las Vegas School of Dental Medicine	University of Nevada Las Vegas School of Dental Medicine	f	48
119	41	University of North Carolina School of Dentistry	University of North Carolina School of Dentistry	f	49
120	41	University of Oklahoma College of Dentistry	University of Oklahoma College of Dentistry	f	50
121	41	University of Pennsylvania School of Dental Medicine	University of Pennsylvania School of Dental Medicine	f	51
122	41	University of Pittsburgh School of Dental Medicine	University of Pittsburgh School of Dental Medicine	f	52
123	41	University of Puerto Rico School of Dental Medicine	University of Puerto Rico School of Dental Medicine	f	53
124	41	University of Tennessee College of Dentistry	University of Tennessee College of Dentistry	f	54
125	41	University of Texas Hlth Science Cnt-San Antonio Dental School	University of Texas Hlth Science Cnt-San Antonio Dental School	f	55
126	41	University of the Pacific Arthur A. Dugoni School of Dentistry	University of the Pacific Arthur A. Dugoni School of Dentistry	f	56
127	41	University of Washington-Health Sciences School of Dentistry	University of Washington-Health Sciences School of Dentistry	f	57
128	41	Virginia Commonwealth University School of Dentistry	Virginia Commonwealth University School of Dentistry	f	58
129	41	West Virginia University School of Dentistry	West Virginia University School of Dentistry	f	59
130	41	Western University of Health Sciences College of Dental Medicine	Western University of Health Sciences College of Dental Medicine	f	60
131	41	Other	Other	f	61
132	44	Male	Male	f	0
133	44	Female	Female	f	1
134	45	White	White	f	0
135	45	Black or African American	Black or African American	f	1
136	45	American Indian and Alaska Native	American Indian and Alaska Native	f	2
137	45	Asian	Asian	f	3
138	45	Native Hawaiian or Other Pacific Islander	Native Hawaiian or Other Pacific Islander	f	4
139	45	Two or more races	Two or more races	f	5
140	46	Hispanic	Hispanic	f	0
141	46	Non-Hispanic	Non-Hispanic	f	1
142	49	Yes	Yes	f	0
143	49	No	No	f	1
144	51	Some high school	Some high school	f	0
145	51	High school graduate	High school graduate	f	1
146	51	Some college	Some college	f	2
147	51	Associate/2 year degree	Associate/2 year degree	f	3
148	51	College graduate/ 4 year degree	College graduate/ 4 year degree	f	4
149	51	Some graduate school	Some graduate school	f	5
150	51	Masters/Professional degree	Masters/Professional degree	f	6
151	51	Other	Other	f	7
152	52	Some high school	Some high school	f	0
153	52	High school graduate	High school graduate	f	1
154	52	Some college	Some college	f	2
155	52	Associate/2 year degree	Associate/2 year degree	f	3
156	52	College graduate/ 4 year degree	College graduate/ 4 year degree	f	4
157	52	Some graduate school	Some graduate school	f	5
158	52	Masters/Professional degree	Masters/Professional degree	f	6
159	52	Other	Other	f	7
160	53	Master of Art, please specify field of study	Master of Art, please specify field of study	f	0
161	53	Master of Science, please specify field of study	Master of Science, please specify field of study	f	1
162	53	Master of Public Health, please specify concentration	Master of Public Health, please specify concentration	f	2
163	53	Other Masters degree, please specify	Other Masters degree, please specify	f	3
164	53	Juris Doctor	Juris Doctor	f	4
165	53	Medical Doctor, please specify specialty	Medical Doctor, please specify specialty	f	5
166	53	Doctor of Philosophy, please specify specialty	Doctor of Philosophy, please specify specialty	f	6
167	53	Doctor of Education, please specify concentration	Doctor of Education, please specify concentration	f	7
168	53	Doctor of Psychology, please specify concentration	Doctor of Psychology, please specify concentration	f	8
169	53	Doctor of Public Health, please specify concentration	Doctor of Public Health, please specify concentration	f	9
170	53	Other Doctoral degree, please specify	Other Doctoral degree, please specify	f	10
171	54	A.T. Still University Arizona School of Dentistry and Oral Health	A.T. Still University Arizona School of Dentistry and Oral Health	f	0
172	54	Baylor College of Dentistry Component of Texas A & M Health Sci Ctr	Baylor College of Dentistry Component of Texas A & M Health Sci Ctr	f	1
173	54	Boston University Goldman School of Dental Medicine	Boston University Goldman School of Dental Medicine	f	2
174	54	Case Western Reserve Univ. School of Dental Medicine	Case Western Reserve Univ. School of Dental Medicine	f	3
175	54	Columbia University College of Dental Medicine	Columbia University College of Dental Medicine	f	4
176	54	Creighton University School of Dentistry	Creighton University School of Dentistry	f	5
177	54	East Carolina University School of Dental Medicine	East Carolina University School of Dental Medicine	f	6
178	54	Georgia Health Sciences University School of Dentistry	Georgia Health Sciences University School of Dentistry	f	7
179	54	Harvard University School of Dental Medicine	Harvard University School of Dental Medicine	f	8
180	54	Herman Ostrow School of Dentistry of USC	Herman Ostrow School of Dentistry of USC	f	9
181	54	Howard University College of Dentistry	Howard University College of Dentistry	f	10
182	54	Indiana University School of Dentistry	Indiana University School of Dentistry	f	11
183	54	LECOM College of Dental Medicine	LECOM College of Dental Medicine	f	12
184	54	Loma Linda University School of Dentistry	Loma Linda University School of Dentistry	f	13
185	54	Louisiana State University School of Dentistry	Louisiana State University School of Dentistry	f	14
186	54	Marquette University School of Dentistry	Marquette University School of Dentistry	f	15
187	54	Medical University of South Carolina James B. Edwards College of Dental Medicine	Medical University of South Carolina James B. Edwards College of Dental Medicine	f	16
188	54	Meharry Medical College School of Dentistry	Meharry Medical College School of Dentistry	f	17
189	54	Midwestern University College of Dental Medicine- Arizona	Midwestern University College of Dental Medicine- Arizona	f	18
190	54	Midwestern University College of Dental Medicine- Illinois	Midwestern University College of Dental Medicine- Illinois	f	19
191	54	New York University College of Dentistry	New York University College of Dentistry	f	20
192	54	Nova Southeastern University College of Dental Medicine	Nova Southeastern University College of Dental Medicine	f	21
193	54	Ohio State University College of Dentistry	Ohio State University College of Dentistry	f	22
194	54	Oregon Health and Science University School of Dentistry	Oregon Health and Science University School of Dentistry	f	23
195	54	Southern Illinois University School of Dental Medicine	Southern Illinois University School of Dental Medicine	f	24
196	54	State University of New York at Buffalo School of Dental Medicine	State University of New York at Buffalo School of Dental Medicine	f	25
197	54	State University of New York at Stony Brook School of Dental Medicine	State University of New York at Stony Brook School of Dental Medicine	f	26
198	54	Temple University The Maurice H. Kornberg School of Dentistry	Temple University The Maurice H. Kornberg School of Dentistry	f	27
199	54	The University of Texas School of Dentistry at Houston	The University of Texas School of Dentistry at Houston	f	28
200	54	Tufts University School of Dental Medicine	Tufts University School of Dental Medicine	f	29
201	54	University of Alabama School of Dentistry at UAB	University of Alabama School of Dentistry at UAB	f	30
202	54	University of California at Los Angeles School of Dentistry	University of California at Los Angeles School of Dentistry	f	31
203	54	University of California at San Francisco School of Dentistry	University of California at San Francisco School of Dentistry	f	32
204	54	University of Colorado Denver	University of Colorado Denver	f	33
205	54	University of Connecticut School of Dental Medicine	University of Connecticut School of Dental Medicine	f	34
206	54	University of Detroit Mercy School of Dentistry	University of Detroit Mercy School of Dentistry	f	35
207	54	University of Florida College of Dentistry	University of Florida College of Dentistry	f	36
208	54	University of Illinois at Chicago College of Dentistry	University of Illinois at Chicago College of Dentistry	f	37
209	54	University of Iowa College of Dentistry	University of Iowa College of Dentistry	f	38
210	54	University of Kentucky College of Dentistry	University of Kentucky College of Dentistry	f	39
211	54	University of Louisville School of Dentistry	University of Louisville School of Dentistry	f	40
212	54	University of Maryland Baltimore College of Dental Surgery	University of Maryland Baltimore College of Dental Surgery	f	41
213	54	University of Medicine & Dentistry of New Jersey New Jersey Dental School	University of Medicine & Dentistry of New Jersey New Jersey Dental\r\nSchool	f	42
214	54	University of Michigan School of Dentistry	University of Michigan School of Dentistry	f	43
215	54	University of Minnesota School of Dentistry	University of Minnesota School of Dentistry	f	44
216	54	University of Mississippi School of Dentistry	University of Mississippi School of Dentistry	f	45
217	54	University of Missouri-Kansas City School of Dentistry	University of Missouri-Kansas City School of Dentistry	f	46
218	54	University of Nebraska Medical Center College of Dentistry	University of Nebraska Medical Center College of Dentistry	f	47
219	54	University of Nevada Las Vegas School of Dental Medicine	University of Nevada Las Vegas School of Dental Medicine	f	48
220	54	University of North Carolina School of Dentistry	University of North Carolina School of Dentistry	f	49
221	54	University of Oklahoma College of Dentistry	University of Oklahoma College of Dentistry	f	50
222	54	University of Pennsylvania School of Dental Medicine	University of Pennsylvania School of Dental Medicine	f	51
223	54	University of Pittsburgh School of Dental Medicine	University of Pittsburgh School of Dental Medicine	f	52
224	54	University of Puerto Rico School of Dental Medicine	University of Puerto Rico School of Dental Medicine	f	53
225	54	University of Tennessee College of Dentistry	University of Tennessee College of Dentistry	f	54
226	54	University of Texas Hlth Science Cnt-San Antonio Dental School	University of Texas Hlth Science Cnt-San Antonio Dental School	f	55
227	54	University of the Pacific Arthur A. Dugoni School of Dentistry	University of the Pacific Arthur A. Dugoni School of Dentistry	f	56
228	54	University of Washington-Health Sciences School of Dentistry	University of Washington-Health Sciences School of Dentistry	f	57
229	54	Virginia Commonwealth University School of Dentistry	Virginia Commonwealth University School of Dentistry	f	58
230	54	West Virginia University School of Dentistry	West Virginia University School of Dentistry	f	59
231	54	Western University of Health Sciences College of Dental Medicine	Western University of Health Sciences College of Dental Medicine	f	60
232	54	Other	Other	f	61
233	60	a	Yes	f	0
234	60	b	No	f	1
235	62	a	At the hospital	f	0
236	62	b	At your practice	f	1
237	64	a	Natasha	f	0
238	64	b	Joyce	f	1
239	55	a	True	f	0
240	55	b	False	t	1
241	56	a	True	f	0
242	56	b	False	t	1
243	57	a	True	f	0
244	57	b	False	t	1
245	58	a	True	f	0
246	58	b	False	t	1
247	59	a	True	f	0
248	59	b	False	t	1
261	72	1	Strongly Agree	f	0
262	72	2	Agree Somewhat	f	1
263	72	3	Agree a little	f	2
264	72	4	Disagree a little	f	3
265	72	5	Disagree Somewhat	f	4
266	72	6	Disagree Strongly	f	5
267	73	1	Strongly Agree	f	0
268	73	2	Agree Somewhat	f	1
269	73	3	Agree a little	f	2
270	73	4	Disagree a little	f	3
271	73	5	Disagree Somewhat	f	4
272	73	6	Disagree Strongly	f	5
273	74	1	Strongly Agree	f	0
274	74	2	Agree Somewhat	f	1
275	74	3	Agree a little	f	2
276	74	4	Disagree a little	f	3
277	74	5	Disagree Somewhat	f	4
278	74	6	Disagree Strongly	f	5
279	75	1	Strongly Agree	f	0
280	75	2	Agree Somewhat	f	1
281	75	3	Agree a little	f	2
282	75	4	Disagree a little	f	3
283	75	5	Disagree Somewhat	f	4
284	75	6	Disagree Strongly	f	5
285	76	1	Strongly Agree	f	0
286	76	2	Agree Somewhat	f	1
287	76	3	Agree a little	f	2
288	76	4	Disagree a little	f	3
289	76	5	Disagree Somewhat	f	4
290	76	6	Disagree Strongly	f	5
291	77	1	Strongly Agree	f	0
292	77	2	Agree Somewhat	f	1
293	77	3	Agree a little	f	2
294	77	4	Disagree a little	f	3
295	77	5	Disagree Somewhat	f	4
296	77	6	Disagree Strongly	f	5
297	78	1	Strongly Agree	f	0
298	78	2	Agree Somewhat	f	1
299	78	3	Agree a little	f	2
300	78	4	Disagree a little	f	3
301	78	5	Disagree Somewhat	f	4
302	78	6	Disagree Strongly	f	5
303	79	1	Strongly Agree	f	0
304	79	2	Agree Somewhat	f	1
305	79	3	Agree a little	f	2
306	79	4	Disagree a little	f	3
307	79	5	Disagree Somewhat	f	4
308	79	6	Disagree Strongly	f	5
309	80	1	Strongly Agree	f	0
310	80	2	Agree Somewhat	f	1
311	80	3	Agree a little	f	2
312	80	4	Disagree a little	f	3
313	80	5	Disagree Somewhat	f	4
314	80	6	Disagree Strongly	f	5
315	81	1	Strongly Agree	f	0
316	81	2	Agree Somewhat	f	1
317	81	3	Agree a little	f	2
318	81	4	Disagree a little	f	3
319	81	5	Disagree Somewhat	f	4
320	81	6	Disagree Strongly	f	5
321	82	1	yes	f	0
322	82	2	no	f	1
323	83	1	yes	f	0
324	83	2	no	f	1
325	84	1	yes	f	0
326	84	2	no	f	1
327	85	1	yes	f	0
328	85	2	no	f	1
329	86	1	yes	f	0
330	86	2	no	f	1
331	87	1	yes	f	0
332	87	2	no	f	1
333	88	1	yes	f	0
334	88	2	no	f	1
335	89	1	yes	f	0
336	89	2	no	f	1
367	112	1	yes	f	0
368	112	2	no	f	1
369	112	3	maybe	f	2
370	113	1	yes	f	0
371	113	2	no	f	1
372	113	3	maybe	f	2
373	114	1	yes	f	0
374	114	2	no	f	1
375	114	3	maybe	f	2
376	115	1	yes	f	0
377	115	2	no	f	1
378	115	3	maybe	f	2
379	116	1	yes	f	0
380	116	2	no	f	1
381	116	3	maybe	f	2
382	117	1	yes	f	0
383	117	2	no	f	1
384	117	3	maybe	f	2
385	118	1	yes	f	0
386	118	2	no	f	1
387	118	3	maybe	f	2
388	119	1	yes	f	0
389	119	2	no	f	1
390	119	3	maybe	f	2
391	120	1	yes	f	0
392	120	2	no	f	1
393	120	3	maybe	f	2
394	121	1	yes	f	0
395	121	2	no	f	1
396	121	3	maybe	f	2
397	123	1	yes	f	0
398	123	2	maybe	f	1
399	123	3	no	f	2
404	131	1	yes	f	0
405	131	2	no	f	1
406	131	3	maybe	f	2
407	132	1	yes	f	0
408	132	2	no	f	1
409	132	3	maybe	f	2
410	133	1	yes	f	0
411	133	2	no	f	1
412	133	3	maybe	f	2
413	134	1	yes	f	0
414	134	2	no	f	1
415	134	3	maybe	f	2
416	135	1	yes	f	0
417	135	2	no	f	1
418	135	3	maybe	f	2
419	136	1	yes	f	0
420	136	2	no	f	1
421	136	3	maybe	f	2
422	137	1	yes	f	0
423	137	2	no	f	1
424	137	3	maybe	f	2
425	138	1	yes	f	0
426	138	2	no	f	1
427	138	3	maybe	f	2
428	139	1	yes	f	0
429	139	2	no	f	1
430	139	3	maybe	f	2
431	140	1	yes	f	0
432	140	2	no	f	1
433	140	3	maybe	f	2
434	167	1	My partner and I stay together, with no change	f	0
435	167	2	My partner and I stay together.  Stop emotional abuse.	f	1
436	167	3	My partner and I stay together.  Stop physical abuse.	f	2
437	167	4	My partner moves out and we have no further contact.	f	3
438	167	5	My partner moves out, but continues to be involved with me.	f	4
439	167	6	My partner moves out, but continues to be involved with my children. 	f	5
440	169	1	alcohol or drug problems	f	0
441	169	2	mental health issues	f	1
442	169	3	legal or documentation problems	f	2
443	169		employment and education needs	f	3
444	169		financial and housing needs	f	4
445	169		family services	f	5
446	169		medical services	f	6
447	169		victim of violence	f	7
\.


--
-- Data for Name: quizblock_question; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_question (id, quiz_id, text, question_type, explanation, intro_text, _order) FROM stdin;
2	1	Drink?	single choice			0
3	2	Drink?	single choice			0
23	5	If and when Joe goes to the dentist, who signs consent for Joe’s treatment?	single choice			4
24	5	How do you help the two “mothers” come to an agreement about diet and its role in dental disease?	long text			5
4	3	All social service volunteers, employees, caseworkers and managers are social workers.	single choice	A social worker is a trained professional who’s gone through extensive training to receive a bachelor’s degree, master’s degree or a doctorate in social work. Social workers are licensed by the state after receiving their degree – a social service employee or volunteer may, indeed, be a social worker, but only if they have a degree and a license.		0
5	3	Most social workers deal with welfare recipients or child protective services.	single choice	One of biggest misconceptions: social workers serve in a number of areas, including mental health centers, schools, hospitals, the court system, police departments, child advocacy centers, foster care and adoption agencies, private practices, shelters and family counseling centers. Most state and federal employees who administer welfare and other social service aren’t professional social workers.		1
6	3	Most social workers work in government agencies.	single choice	Although many people believe that most social workers are employed at local, state, or federal government agencies, NASW survey data show otherwise. Almost three-quarters of all social workers work in private organizations.		2
7	3	Social Workers work primarily with the poor.	single choice	Social Work has a strong commitment to work with the poor and the vulnerable and to advancing social and economic justice. Social workers also work with people from various socioeconomic groups in a diverse range of settings including school settings, child and family service agencies, early intervention programs, mental health agencies, prevention programs, community-based health agencies and hospitals, nursing homes and rehabilitation settings, advocacy agencies, community development organizations, and private practice groups.		3
8	3	To provide mental health services you need a degree in psychology.	single choice	Over 60 percent of mental health services and psychotherapy is provided by master’s level social workers. Social workers are the clinicians of choice because they view clients within their environment, taking into account personal and significant relationships, economic and social conditions, and physical health. Social workers build on strengths and assist clients in working on constraints that impinge on their well-being.		4
25	5	How do you help Joyce understand the role of bacteria in dental disease and that her dental care is as important as the others in the family?	long text			6
26	5	Do you help the family find a dentist that can care for all members of the family so they do not have to have one dentist for the children and one for the adults?	long text			7
27	5	How do you get the family to the dentist?	long text			8
28	5	How could a social worker facilitate this family’s navigation of the dental system?	long text			9
29	6	Name	short text			0
30	6	Email Address	short text			1
31	6	Gender	single choice			2
32	6	Race (US Census)	single choice			3
33	6	Ethnicity	single choice			4
36	6	Born in the U.S.?	single choice			7
37	6	Year of graduation	short text			8
38	6	Please indicate the highest level of education your mother/guardian completed:	single choice			9
19	5	Would you convince Natasha and Joyce that Joe needs dental care?	single choice			0
20	5	If yes, how would try to convince Natasha?	long text			1
21	5	Where would you do this?	multiple choice			2
22	5	How can you ensure that Natasha returns to your office for restorative care?	long text			3
39	6	Please indicate the highest level of education your father/guardian completed:	single choice			10
40	6	Affiliated degrees	multiple choice			11
41	6	Where did you attend dental school?	single choice			12
34	6	Age (month of birth)	short text			5
35	6	Age (year of birth)	short text			6
42	7	Name	short text			0
43	7	Email Address	short text			1
44	7	Gender	single choice			2
45	7	Race (US Census)	single choice			3
46	7	Ethnicity	single choice			4
47	7	Age (month of birth)	short text			5
48	7	Age (year of birth)	short text			6
49	7	Born in the U.S.?	single choice			7
50	7	Year of graduation	short text			8
51	7	Please indicate the highest level of education your mother/guardian completed:	single choice			9
52	7	Please indicate the highest level of education your father/guardian completed:	single choice			10
53	7	Affiliated degrees	multiple choice			11
54	7	Where did you attend dental school?	single choice			12
55	8	All social service volunteers, employees, caseworkers and managers are social workers.	single choice	A social worker is a trained professional who’s gone through extensive training to receive a bachelor’s degree, master’s degree or a doctorate in social work. Social workers are licensed by the state after receiving their degree – a social service employee or volunteer may, indeed, be a social worker, but only if they have a degree and a license.		0
56	8	Most social workers deal with welfare recipients or child protective services.	single choice	One of biggest misconceptions: social workers serve in a number of areas, including mental health centers, schools, hospitals, the court system, police departments, child advocacy centers, foster care and adoption agencies, private practices, shelters and family counseling centers. Most state and federal employees who administer welfare and other social service aren’t professional social workers.		1
57	8	Most social workers work in government agencies.	single choice	Although many people believe that most social workers are employed at local, state, or federal government agencies, NASW survey data show otherwise. Almost three-quarters of all social workers work in private organizations.		2
138	37	Concerned that I may be injured in a fight.	single choice			0
139	38	Concerned that I may be exposed to HIV or sexually transmitted behaviors because of unsafe sex.	single choice			0
140	39	Makes me feel hopeless or helpless about my future.	single choice			0
58	8	Social Workers work primarily with the poor.	single choice	Social Work has a strong commitment to work with the poor and the vulnerable and to advancing social and economic justice. Social workers also work with people from various socioeconomic groups in a diverse range of settings including school settings, child and family service agencies, early intervention programs, mental health agencies, prevention programs, community-based health agencies and hospitals, nursing homes and rehabilitation settings, advocacy agencies, community development organizations, and private practice groups.		3
59	8	To provide mental health services you need a degree in psychology.	single choice	Over 60 percent of mental health services and psychotherapy is provided by master’s level social workers. Social workers are the clinicians of choice because they view clients within their environment, taking into account personal and significant relationships, economic and social conditions, and physical health. Social workers build on strengths and assist clients in working on constraints that impinge on their well-being.		4
60	9	Would you convince Natasha and Joyce that Joe needs dental care?	single choice			0
62	9	Where would you do this?	single choice			2
63	9	How can you ensure that Natasha returns to your office for restorative care?	long text			3
61	9	If yes, how would try to convince Natasha?	long text			1
64	9	If and when Joe goes to the dentist, who signs consent for Joe’s treatment?	single choice			4
65	9	How do you help the two “mothers” come to an agreement about diet and its role in dental disease?	long text			5
66	9	How do you help Joyce understand the role of bacteria in dental disease and that her dental care is as important as the others in the family?	long text			6
67	9	Do you help the family find a dentist that can care for all members of the family so they do not have to have one dentist for the children and one for the adults?	long text			7
68	9	How do you get the family to the dentist?	long text			8
69	9	How could a social worker facilitate this family’s navigation of the dental system?	long text			9
72	12	My partner makes me feel unsafe, even in my own home.	single choice			0
73	13	I feel ashamed of the things my partner does to me.	single choice			0
74	14	I try not to rock the boat because I am afraid of what my partner might do.	single choice			0
75	15	I feel like I am programmed to react a certain way to my partner.	single choice			0
76	16	I feel like my partner keeps me prisoner.	single choice			0
77	17	My partner makes me feel like I have no control over my life, no power, no protection.	single choice			0
78	18	My partner keeps me from family and friends.	single choice			0
79	19	I feel owned and controlled by my partner.	single choice			0
80	20	My partner can scare me without laying a hand on me.	single choice			0
81	21	My partner has a look that goes straight through me and terrifies me.	single choice			0
82	22	Have you been hit, kicked, slapped, pushed, punched, shoved, or otherwise hurt by an intimate partner within the past year?	single choice			0
83	22	Have you done any of these to an intimate partner in the past year?	single choice			1
84	23	Has an intimate partner ever forced you to have sexual activities within the past year? 	single choice			0
85	24	Has an intimate partner choked you or threatened you with a weapon in the past year?	single choice			0
86	24	Have you choked or threatened your partner in the past year?	single choice			1
87	25	Do you feel safe in your current relationship?	single choice			0
88	26	Is there a partner from a previous relationship who is making you feel unsafe now?	single choice			0
89	27	Has an intimate partner ever insisted on having sex without a condom in the past year?	single choice			0
113	28	Makes me feel anxious, stressed out, or on edge	single choice			1
114	28	Makes me feel isolated from my friends and families	single choice			2
115	28	Makes me feel like using drugs or alcohol	single choice			3
116	28	Concerned that it is negatively affecting my children	single choice			4
117	28	Concerned that I may end up fighting back or hurting my partner and risk getting charged with assault	single choice			5
118	28	Concerned it is contributing towards physical problems that I am experiencing like headaches, stomach problems, body pains, gynecological problems	single choice			6
119	28	Concerned that I may be injured in a fight	single choice			7
120	28	Concerned that I may be exposed to HIV or sexually transmitted behaviors because of unsafe sex	single choice			8
121	28	Makes me feel hopeless or helpless about my future	single choice			9
122	28	Other Concerns that I have (list): 	long text			10
112	28	Makes me feel sad or depressed	single choice			0
124	29	I want to feel less isolated from my family or friends	single choice			1
125	29	I want to improve the quality of life for my kids or other family members who are affected by the relationship conflict	single choice			2
126	29	I don’t want to feel scared or anxious when I am around my partner	single choice			3
127	29	I want to improve the relationship I have with my partner 	single choice			4
128	29	I don’t want to feel trapped in the relationship	single choice			5
129	29	Other (list):	long text			6
123	29	I want to feel better about myself and my future	single choice			0
131	31	Makes me feel anxious, stressed out, or on edge.	single choice			0
133	33	Makes me feel like using drugs or alcohol.	single choice			0
134	32	Makes me feel isolated from my friends and families.	single choice			0
132	30	Makes me feel sad or depressed.	single choice			0
135	34	Concerned that it is negatively affecting my children.	single choice			0
136	35	Concerned that I may end up fighting back or hurting my partner and risk getting charged with assault.	single choice			0
137	36	Concerned it is contributing towards physical problems that I am experiencing like headaches, stomach problems, body pains, gynecological problems.	single choice			0
141	40	Other Concerns that I have (list): 	long text			0
142	41	This plan is for:	short text			0
164	61	I can leave extra clothes with:	short text			0
148	47	This plan is for (name):	short text			0
151	49	In order to leave quickly, I can keep my purse, identification, and metro card (or bus/train fare) ready and put them (place):	short text			0
153	50	I can tell a person that I trust about the violence and request they call the police if they hear suspicious noises coming from my apartment.  One person I can tell is:	short text			0
154	51	Another person I can tell is:	short text			0
150	48	If I decide to leave, I will:	long text		It is a good idea to practice how to get out of your house or apartment safely.  What doors, windows, elevators, stairwells, or fire escapes would you use?  Consider which exits are safest.  Below, write down how you would get out.	0
156	53	If I have to leave my home I will go to:	short text		It's a good idea to decide where you can go if you have to leave your apartment.  Decide this even if you don't think you will experience another violent incident.	0
157	54	If I cannot go to the location above I will go:	short text			0
158	55	When I expect we are going to have an argument, I will try to move to a space that is lowest risk, such as:	short text		Try to avoid arguments in the bathroom, and kitchens, near weapons or in rooms without access to an outside door.	0
155	52	My code word will be:	short text		I can use a code word with my children or my friends so they can call for help. (CODE WORDS should not evoke suspicion from partner, but should not also be “every day” language that might confuse helping person. Some examples of code words are “Aunt _ _ _ has not returned my phone call today“.   Code words for children need to be appropriate for their age.  For example, a code word for a 13 year old girl may be “Your cousin _ _ _ called you today and wants you to call her back today”.  For a younger child “Your grandmother called today and wanted to talk with you about something.”(Most children under the age of 5 will be too young to understand how to operate under code language, you will need to figure out whether your child can be entrusted with this task) 	0
159	56	So that I can leave quickly, I will leave money and an extra set of keys with:	short text		I can use some or all of the following safety strategies:	0
160	57	I will keep copies of important documents (social security cards, birth certificates, shot records – see step 8) or keys at :	short text			0
161	58	To increase my independence, I will open a savings account by (date):	short text		It's important to become financially independent.  To get help with becoming financially independent from your partner call 1-800-873-2227.	0
162	59	Other things I can do to increase my independence include: 	long text			0
166	63	The person I will ask is:\r\n\t\r\n	short text		Ask a trusted friend or advocate to help you review review your plan.  	0
163	60	I will check with the following people to see if I can stay with them or borrow money:	long text		It is important to find people who will let you stay with them or lend you some money.  	0
165	62	In order to plan the safest way to leave the residence, I will sit down and review my safety plan every (time frame): 	short text			0
167	64	If you could choose the best outcome (s) for you and your partner, what would it be?  (mark all that apply)	multiple choice			0
168	64	Other desired outcomes:	long text			1
169	65	Here are some issues a lot of women have. Which ones are issues for you? Click on the buttons below.	multiple choice			0
\.


--
-- Data for Name: quizblock_quiz; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_quiz (id, description, rhetorical, allow_redo) FROM stdin;
1	Weren't ready for this were you?	f	t
2	Weren't ready for this were you?	f	t
3		f	t
5		f	t
6		f	t
7		f	t
8		f	t
9		f	t
12		f	t
13		f	t
14		f	t
15		f	t
16		f	t
17		f	t
18		f	t
19		f	t
20		f	t
21		f	t
22		f	t
23		f	t
24		f	t
25		f	t
26		f	t
27		f	t
28		f	t
29		f	t
31		f	t
30		f	t
33		f	t
32		f	t
34		f	t
35		f	t
36		f	t
37		f	t
38		f	t
39		f	t
40		f	t
41		f	t
47		f	t
48		f	t
49		f	t
50		f	t
51		f	t
52		f	t
53		f	t
54		f	t
55		f	t
56		f	t
57		f	t
58		f	t
59		f	f
60		f	f
61		f	f
62		f	f
63		f	f
64		f	f
65		f	f
\.


--
-- Data for Name: quizblock_response; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_response (id, question_id, submission_id, value) FROM stdin;
1	2	1	constantly
9	5	5	a
10	4	5	a
11	7	5	a
12	6	5	a
13	8	5	a
16	119	9	1
17	118	9	3
18	113	9	1
19	112	9	1
20	115	9	2
21	114	9	1
22	117	9	2
23	116	9	1
24	120	9	1
25	121	9	1
26	122	9	
27	72	10	1
28	73	11	2
\.


--
-- Data for Name: quizblock_submission; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY quizblock_submission (id, quiz_id, user_id, submitted) FROM stdin;
1	1	1	2011-06-03 14:47:52.508224-04
5	3	11	2011-08-18 14:55:08.839373-04
9	28	15	2011-10-17 12:59:08.188626-04
10	12	5	2011-10-18 14:48:35.781645-04
11	13	5	2011-10-18 14:49:27.734903-04
\.


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	main	0001_initial	2011-10-20 18:02:14.520257-04
2	pagetree	0001_initial	2011-10-20 19:01:58.197487-04
3	main	0002_pagetree	2011-10-20 19:02:12.538257-04
4	pageblocks	0001_initial	2011-10-20 19:51:29.099098-04
5	main	0003_pageblocks	2011-10-20 19:51:32.730676-04
6	quizblock	0001_initial	2011-10-21 15:52:09.051191-04
7	main	0004_quizblock	2011-10-21 15:52:15.060603-04
\.


--
-- Data for Name: tagging_tag; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY tagging_tag (id, name) FROM stdin;
\.


--
-- Data for Name: tagging_taggeditem; Type: TABLE DATA; Schema: public; Owner: ccnmtl
--

COPY tagging_taggeditem (id, tag_id, content_type_id, object_id) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: careermapblock_basemap_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY careermapblock_basemap
    ADD CONSTRAINT careermapblock_basemap_pkey PRIMARY KEY (id);


--
-- Name: careermapblock_careermap_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY careermapblock_careermap
    ADD CONSTRAINT careermapblock_careermap_pkey PRIMARY KEY (id);


--
-- Name: careermapblock_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY careermapblock_layer
    ADD CONSTRAINT careermapblock_layer_pkey PRIMARY KEY (id);


--
-- Name: careermapblock_question_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY careermapblock_question
    ADD CONSTRAINT careermapblock_question_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites_flatpage_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_key UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_category
    ADD CONSTRAINT fridgeblock_category_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_fridgeblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_fridgeblock
    ADD CONSTRAINT fridgeblock_fridgeblock_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_item_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_item
    ADD CONSTRAINT fridgeblock_item_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_magnet_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_magnet
    ADD CONSTRAINT fridgeblock_magnet_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_session
    ADD CONSTRAINT fridgeblock_session_pkey PRIMARY KEY (id);


--
-- Name: main_stand_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY main_stand
    ADD CONSTRAINT main_stand_pkey PRIMARY KEY (id);


--
-- Name: main_standavailablepageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY main_standavailablepageblock
    ADD CONSTRAINT main_standavailablepageblock_pkey PRIMARY KEY (id);


--
-- Name: main_standgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY main_standgroup
    ADD CONSTRAINT main_standgroup_pkey PRIMARY KEY (id);


--
-- Name: main_standsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY main_standsetting
    ADD CONSTRAINT main_standsetting_pkey PRIMARY KEY (id);


--
-- Name: main_standuser_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY main_standuser
    ADD CONSTRAINT main_standuser_pkey PRIMARY KEY (id);


--
-- Name: munin_test_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY munin_test
    ADD CONSTRAINT munin_test_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_htmlblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_htmlblock
    ADD CONSTRAINT pageblocks_htmlblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_htmlblockwysiwyg_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_htmlblockwysiwyg
    ADD CONSTRAINT pageblocks_htmlblockwysiwyg_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_imageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_imageblock
    ADD CONSTRAINT pageblocks_imageblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_imagepullquoteblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_imagepullquoteblock
    ADD CONSTRAINT pageblocks_imagepullquoteblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_pullquoteblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_pullquoteblock
    ADD CONSTRAINT pageblocks_pullquoteblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_textblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pageblocks_textblock
    ADD CONSTRAINT pageblocks_textblock_pkey PRIMARY KEY (id);


--
-- Name: pagetree_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_hierarchy
    ADD CONSTRAINT pagetree_hierarchy_pkey PRIMARY KEY (id);


--
-- Name: pagetree_pageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pageblock_pkey PRIMARY KEY (id);


--
-- Name: pagetree_section_path_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_path_key UNIQUE (path);


--
-- Name: pagetree_section_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_pkey PRIMARY KEY (id);


--
-- Name: quizblock_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_answer
    ADD CONSTRAINT quizblock_answer_pkey PRIMARY KEY (id);


--
-- Name: quizblock_question_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_question
    ADD CONSTRAINT quizblock_question_pkey PRIMARY KEY (id);


--
-- Name: quizblock_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_quiz
    ADD CONSTRAINT quizblock_quiz_pkey PRIMARY KEY (id);


--
-- Name: quizblock_response_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_response_pkey PRIMARY KEY (id);


--
-- Name: quizblock_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: tagging_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_name_key UNIQUE (name);


--
-- Name: tagging_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_tag_id_content_type_id_object_id_key; Type: CONSTRAINT; Schema: public; Owner: ccnmtl; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_content_type_id_object_id_key UNIQUE (tag_id, content_type_id, object_id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: careermapblock_basemap_cmap_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX careermapblock_basemap_cmap_id ON careermapblock_basemap USING btree (cmap_id);


--
-- Name: careermapblock_layer_cmap_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX careermapblock_layer_cmap_id ON careermapblock_layer USING btree (cmap_id);


--
-- Name: careermapblock_question_cmap_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX careermapblock_question_cmap_id ON careermapblock_question USING btree (cmap_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_sites_flatpage_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_flatpage_sites_flatpage_id ON django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_flatpage_sites_site_id ON django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_flatpage_url ON django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX django_flatpage_url_like ON django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: fridgeblock_category_fridgeblock_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX fridgeblock_category_fridgeblock_id ON fridgeblock_category USING btree (fridgeblock_id);


--
-- Name: fridgeblock_item_category_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX fridgeblock_item_category_id ON fridgeblock_item USING btree (category_id);


--
-- Name: fridgeblock_magnet_item_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX fridgeblock_magnet_item_id ON fridgeblock_magnet USING btree (item_id);


--
-- Name: fridgeblock_magnet_session_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX fridgeblock_magnet_session_id ON fridgeblock_magnet USING btree (session_id);


--
-- Name: fridgeblock_session_fridgeblock_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX fridgeblock_session_fridgeblock_id ON fridgeblock_session USING btree (fridgeblock_id);


--
-- Name: fridgeblock_session_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX fridgeblock_session_user_id ON fridgeblock_session USING btree (user_id);


--
-- Name: main_stand_hostname; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_stand_hostname ON main_stand USING btree (hostname);


--
-- Name: main_stand_hostname_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_stand_hostname_like ON main_stand USING btree (hostname varchar_pattern_ops);


--
-- Name: main_standavailablepageblock_block; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standavailablepageblock_block ON main_standavailablepageblock USING btree (block);


--
-- Name: main_standavailablepageblock_block_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standavailablepageblock_block_like ON main_standavailablepageblock USING btree (block varchar_pattern_ops);


--
-- Name: main_standavailablepageblock_stand_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standavailablepageblock_stand_id ON main_standavailablepageblock USING btree (stand_id);


--
-- Name: main_standgroup_group_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standgroup_group_id ON main_standgroup USING btree (group_id);


--
-- Name: main_standgroup_stand_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standgroup_stand_id ON main_standgroup USING btree (stand_id);


--
-- Name: main_standsetting_name; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standsetting_name ON main_standsetting USING btree (name);


--
-- Name: main_standsetting_name_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standsetting_name_like ON main_standsetting USING btree (name varchar_pattern_ops);


--
-- Name: main_standsetting_stand_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standsetting_stand_id ON main_standsetting USING btree (stand_id);


--
-- Name: main_standuser_stand_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standuser_stand_id ON main_standuser USING btree (stand_id);


--
-- Name: main_standuser_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX main_standuser_user_id ON main_standuser USING btree (user_id);


--
-- Name: pagetree_pageblock_content_type_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_pageblock_content_type_id ON pagetree_pageblock USING btree (content_type_id);


--
-- Name: pagetree_pageblock_section_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_pageblock_section_id ON pagetree_pageblock USING btree (section_id);


--
-- Name: pagetree_section_hierarchy_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_section_hierarchy_id ON pagetree_section USING btree (hierarchy_id);


--
-- Name: pagetree_section_slug; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_section_slug ON pagetree_section USING btree (slug);


--
-- Name: pagetree_section_slug_like; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX pagetree_section_slug_like ON pagetree_section USING btree (slug varchar_pattern_ops);


--
-- Name: quizblock_answer_question_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_answer_question_id ON quizblock_answer USING btree (question_id);


--
-- Name: quizblock_question_quiz_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_question_quiz_id ON quizblock_question USING btree (quiz_id);


--
-- Name: quizblock_response_question_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_response_question_id ON quizblock_response USING btree (question_id);


--
-- Name: quizblock_response_submission_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_response_submission_id ON quizblock_response USING btree (submission_id);


--
-- Name: quizblock_submission_quiz_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_submission_quiz_id ON quizblock_submission USING btree (quiz_id);


--
-- Name: quizblock_submission_user_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX quizblock_submission_user_id ON quizblock_submission USING btree (user_id);


--
-- Name: tagging_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX tagging_taggeditem_content_type_id ON tagging_taggeditem USING btree (content_type_id);


--
-- Name: tagging_taggeditem_object_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX tagging_taggeditem_object_id ON tagging_taggeditem USING btree (object_id);


--
-- Name: tagging_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: ccnmtl; Tablespace: 
--

CREATE INDEX tagging_taggeditem_tag_id ON tagging_taggeditem USING btree (tag_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: careermapblock_basemap_cmap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY careermapblock_basemap
    ADD CONSTRAINT careermapblock_basemap_cmap_id_fkey FOREIGN KEY (cmap_id) REFERENCES careermapblock_careermap(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: careermapblock_layer_cmap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY careermapblock_layer
    ADD CONSTRAINT careermapblock_layer_cmap_id_fkey FOREIGN KEY (cmap_id) REFERENCES careermapblock_careermap(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: careermapblock_question_cmap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY careermapblock_question
    ADD CONSTRAINT careermapblock_question_cmap_id_fkey FOREIGN KEY (cmap_id) REFERENCES careermapblock_careermap(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flatpage_id_refs_id_c0e84f5a; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT flatpage_id_refs_id_c0e84f5a FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_category_fridgeblock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY fridgeblock_category
    ADD CONSTRAINT fridgeblock_category_fridgeblock_id_fkey FOREIGN KEY (fridgeblock_id) REFERENCES fridgeblock_fridgeblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_item_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY fridgeblock_item
    ADD CONSTRAINT fridgeblock_item_category_id_fkey FOREIGN KEY (category_id) REFERENCES fridgeblock_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_magnet_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY fridgeblock_magnet
    ADD CONSTRAINT fridgeblock_magnet_item_id_fkey FOREIGN KEY (item_id) REFERENCES fridgeblock_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_magnet_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY fridgeblock_magnet
    ADD CONSTRAINT fridgeblock_magnet_session_id_fkey FOREIGN KEY (session_id) REFERENCES fridgeblock_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_session_fridgeblock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY fridgeblock_session
    ADD CONSTRAINT fridgeblock_session_fridgeblock_id_fkey FOREIGN KEY (fridgeblock_id) REFERENCES fridgeblock_fridgeblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY fridgeblock_session
    ADD CONSTRAINT fridgeblock_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standavailablepageblock_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY main_standavailablepageblock
    ADD CONSTRAINT main_standavailablepageblock_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standgroup_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY main_standgroup
    ADD CONSTRAINT main_standgroup_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standgroup_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY main_standgroup
    ADD CONSTRAINT main_standgroup_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standsetting_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY main_standsetting
    ADD CONSTRAINT main_standsetting_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standuser_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY main_standuser
    ADD CONSTRAINT main_standuser_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standuser_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY main_standuser
    ADD CONSTRAINT main_standuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_pageblock_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pageblock_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_pageblock_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pageblock_section_id_fkey FOREIGN KEY (section_id) REFERENCES pagetree_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_section_hierarchy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_hierarchy_id_fkey FOREIGN KEY (hierarchy_id) REFERENCES pagetree_hierarchy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_answer_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_answer
    ADD CONSTRAINT quizblock_answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES quizblock_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_question_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_question
    ADD CONSTRAINT quizblock_question_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES quizblock_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_response_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_response_question_id_fkey FOREIGN KEY (question_id) REFERENCES quizblock_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_response_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_response_submission_id_fkey FOREIGN KEY (submission_id) REFERENCES quizblock_submission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_submission_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES quizblock_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_submission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tagging_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: ccnmtl
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

