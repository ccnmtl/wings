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
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: audioblock_audioblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE audioblock_audioblock (
    id integer NOT NULL,
    description text NOT NULL,
    audio_file character varying(100)
);


--
-- Name: audioblock_audioblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE audioblock_audioblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audioblock_audioblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE audioblock_audioblock_id_seq OWNED BY audioblock_audioblock.id;


--
-- Name: audioblock_audioblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('audioblock_audioblock_id_seq', 1, true);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 49, true);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 6, true);


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_message_id_seq', 273, true);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 153, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 86, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 112, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 144, true);


--
-- Name: careermapblock_basemap; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE careermapblock_basemap (
    id integer NOT NULL,
    cmap_id integer NOT NULL,
    name character varying(256) NOT NULL,
    image character varying(100) NOT NULL,
    _order integer NOT NULL
);


--
-- Name: careermapblock_basemap_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE careermapblock_basemap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: careermapblock_basemap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE careermapblock_basemap_id_seq OWNED BY careermapblock_basemap.id;


--
-- Name: careermapblock_basemap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('careermapblock_basemap_id_seq', 5, true);


--
-- Name: careermapblock_careermap; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE careermapblock_careermap (
    id integer NOT NULL,
    description text NOT NULL
);


--
-- Name: careermapblock_careermap_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE careermapblock_careermap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: careermapblock_careermap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE careermapblock_careermap_id_seq OWNED BY careermapblock_careermap.id;


--
-- Name: careermapblock_careermap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('careermapblock_careermap_id_seq', 1, true);


--
-- Name: careermapblock_layer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE careermapblock_layer (
    id integer NOT NULL,
    cmap_id integer NOT NULL,
    name character varying(256) NOT NULL,
    color character varying(16) NOT NULL,
    image character varying(100) NOT NULL,
    _order integer NOT NULL
);


--
-- Name: careermapblock_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE careermapblock_layer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: careermapblock_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE careermapblock_layer_id_seq OWNED BY careermapblock_layer.id;


--
-- Name: careermapblock_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('careermapblock_layer_id_seq', 5, true);


--
-- Name: careermapblock_question; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE careermapblock_question (
    id integer NOT NULL,
    cmap_id integer NOT NULL,
    text text,
    _order integer NOT NULL
);


--
-- Name: careermapblock_question_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE careermapblock_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: careermapblock_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE careermapblock_question_id_seq OWNED BY careermapblock_question.id;


--
-- Name: careermapblock_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('careermapblock_question_id_seq', 3, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 200, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 51, true);


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_flatpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_flatpage_id_seq OWNED BY django_flatpage.id;


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_flatpage_id_seq', 1, false);


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_flatpage_sites_id_seq OWNED BY django_flatpage_sites.id;


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 1, false);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: exitmaterialsblock_exitmaterialsblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE exitmaterialsblock_exitmaterialsblock (
    id integer NOT NULL,
    description text NOT NULL
);


--
-- Name: exitmaterialsblock_exitmaterialsblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exitmaterialsblock_exitmaterialsblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exitmaterialsblock_exitmaterialsblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exitmaterialsblock_exitmaterialsblock_id_seq OWNED BY exitmaterialsblock_exitmaterialsblock.id;


--
-- Name: exitmaterialsblock_exitmaterialsblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('exitmaterialsblock_exitmaterialsblock_id_seq', 1, false);


--
-- Name: fridgeblock_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fridgeblock_category (
    id integer NOT NULL,
    fridgeblock_id integer NOT NULL,
    label character varying(256) NOT NULL,
    image character varying(100) NOT NULL,
    _order integer NOT NULL
);


--
-- Name: fridgeblock_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fridgeblock_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fridgeblock_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fridgeblock_category_id_seq OWNED BY fridgeblock_category.id;


--
-- Name: fridgeblock_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fridgeblock_category_id_seq', 4, true);


--
-- Name: fridgeblock_fridgeblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fridgeblock_fridgeblock (
    id integer NOT NULL
);


--
-- Name: fridgeblock_fridgeblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fridgeblock_fridgeblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fridgeblock_fridgeblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fridgeblock_fridgeblock_id_seq OWNED BY fridgeblock_fridgeblock.id;


--
-- Name: fridgeblock_fridgeblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fridgeblock_fridgeblock_id_seq', 1, true);


--
-- Name: fridgeblock_item; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fridgeblock_item (
    id integer NOT NULL,
    label character varying(256) NOT NULL,
    category_id integer NOT NULL,
    description text NOT NULL,
    _order integer NOT NULL
);


--
-- Name: fridgeblock_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fridgeblock_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fridgeblock_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fridgeblock_item_id_seq OWNED BY fridgeblock_item.id;


--
-- Name: fridgeblock_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fridgeblock_item_id_seq', 8, true);


--
-- Name: fridgeblock_magnet; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fridgeblock_magnet (
    id integer NOT NULL,
    session_id integer NOT NULL,
    item_id integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL
);


--
-- Name: fridgeblock_magnet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fridgeblock_magnet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fridgeblock_magnet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fridgeblock_magnet_id_seq OWNED BY fridgeblock_magnet.id;


--
-- Name: fridgeblock_magnet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fridgeblock_magnet_id_seq', 4, true);


--
-- Name: fridgeblock_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fridgeblock_session (
    id integer NOT NULL,
    fridgeblock_id integer NOT NULL,
    user_id integer NOT NULL,
    saved timestamp with time zone NOT NULL
);


--
-- Name: fridgeblock_session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fridgeblock_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fridgeblock_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fridgeblock_session_id_seq OWNED BY fridgeblock_session.id;


--
-- Name: fridgeblock_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fridgeblock_session_id_seq', 4, true);


--
-- Name: helpblock_helpblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE helpblock_helpblock (
    id integer NOT NULL,
    description text NOT NULL,
    audio_file character varying(100)
);


--
-- Name: helpblock_helpblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE helpblock_helpblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: helpblock_helpblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE helpblock_helpblock_id_seq OWNED BY helpblock_helpblock.id;


--
-- Name: helpblock_helpblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('helpblock_helpblock_id_seq', 1, true);


--
-- Name: main_stand; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: main_stand_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE main_stand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_stand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE main_stand_id_seq OWNED BY main_stand.id;


--
-- Name: main_stand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('main_stand_id_seq', 8, true);


--
-- Name: main_standavailablepageblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE main_standavailablepageblock (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    block character varying(256) NOT NULL
);


--
-- Name: main_standavailablepageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE main_standavailablepageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_standavailablepageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE main_standavailablepageblock_id_seq OWNED BY main_standavailablepageblock.id;


--
-- Name: main_standavailablepageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('main_standavailablepageblock_id_seq', 38, true);


--
-- Name: main_standgroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE main_standgroup (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    group_id integer NOT NULL,
    access character varying(16) NOT NULL
);


--
-- Name: main_standgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE main_standgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_standgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE main_standgroup_id_seq OWNED BY main_standgroup.id;


--
-- Name: main_standgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('main_standgroup_id_seq', 1, false);


--
-- Name: main_standsetting; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE main_standsetting (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    name character varying(256) NOT NULL,
    value character varying(256) NOT NULL
);


--
-- Name: main_standsetting_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE main_standsetting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_standsetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE main_standsetting_id_seq OWNED BY main_standsetting.id;


--
-- Name: main_standsetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('main_standsetting_id_seq', 1, false);


--
-- Name: main_standuser; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE main_standuser (
    id integer NOT NULL,
    stand_id integer NOT NULL,
    user_id integer NOT NULL,
    access character varying(16) NOT NULL
);


--
-- Name: main_standuser_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE main_standuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_standuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE main_standuser_id_seq OWNED BY main_standuser.id;


--
-- Name: main_standuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('main_standuser_id_seq', 27, true);


--
-- Name: munin_test; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE munin_test (
    id integer NOT NULL,
    name character varying(256) NOT NULL
);


--
-- Name: munin_test_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE munin_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: munin_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE munin_test_id_seq OWNED BY munin_test.id;


--
-- Name: munin_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('munin_test_id_seq', 90129, true);


--
-- Name: pageblocks_htmlblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pageblocks_htmlblock (
    id integer NOT NULL,
    html text NOT NULL
);


--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pageblocks_htmlblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pageblocks_htmlblock_id_seq OWNED BY pageblocks_htmlblock.id;


--
-- Name: pageblocks_htmlblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pageblocks_htmlblock_id_seq', 27, true);


--
-- Name: pageblocks_htmlblockwysiwyg; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pageblocks_htmlblockwysiwyg (
    id integer NOT NULL,
    wysiwyg_html text NOT NULL
);


--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pageblocks_htmlblockwysiwyg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pageblocks_htmlblockwysiwyg_id_seq OWNED BY pageblocks_htmlblockwysiwyg.id;


--
-- Name: pageblocks_htmlblockwysiwyg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pageblocks_htmlblockwysiwyg_id_seq', 1, false);


--
-- Name: pageblocks_imageblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pageblocks_imageblock (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    caption text NOT NULL,
    alt character varying(100)
);


--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pageblocks_imageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pageblocks_imageblock_id_seq OWNED BY pageblocks_imageblock.id;


--
-- Name: pageblocks_imageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pageblocks_imageblock_id_seq', 14, true);


--
-- Name: pageblocks_imagepullquoteblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pageblocks_imagepullquoteblock (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    caption text NOT NULL,
    alt character varying(100)
);


--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pageblocks_imagepullquoteblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pageblocks_imagepullquoteblock_id_seq OWNED BY pageblocks_imagepullquoteblock.id;


--
-- Name: pageblocks_imagepullquoteblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pageblocks_imagepullquoteblock_id_seq', 1, false);


--
-- Name: pageblocks_pullquoteblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pageblocks_pullquoteblock (
    id integer NOT NULL,
    body text NOT NULL
);


--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pageblocks_pullquoteblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pageblocks_pullquoteblock_id_seq OWNED BY pageblocks_pullquoteblock.id;


--
-- Name: pageblocks_pullquoteblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pageblocks_pullquoteblock_id_seq', 1, false);


--
-- Name: pageblocks_textblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pageblocks_textblock (
    id integer NOT NULL,
    body text NOT NULL
);


--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pageblocks_textblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pageblocks_textblock_id_seq OWNED BY pageblocks_textblock.id;


--
-- Name: pageblocks_textblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pageblocks_textblock_id_seq', 78, true);


--
-- Name: pagetree_hierarchy; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pagetree_hierarchy (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    base_url character varying(256) NOT NULL
);


--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pagetree_hierarchy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pagetree_hierarchy_id_seq OWNED BY pagetree_hierarchy.id;


--
-- Name: pagetree_hierarchy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pagetree_hierarchy_id_seq', 29, true);


--
-- Name: pagetree_pageblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pagetree_pageblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pagetree_pageblock_id_seq OWNED BY pagetree_pageblock.id;


--
-- Name: pagetree_pageblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pagetree_pageblock_id_seq', 254, true);


--
-- Name: pagetree_section; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: pagetree_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pagetree_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagetree_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pagetree_section_id_seq OWNED BY pagetree_section.id;


--
-- Name: pagetree_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pagetree_section_id_seq', 218, true);


--
-- Name: quizblock_answer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE quizblock_answer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    value character varying(256) NOT NULL,
    label text NOT NULL,
    correct boolean NOT NULL,
    _order integer NOT NULL
);


--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quizblock_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quizblock_answer_id_seq OWNED BY quizblock_answer.id;


--
-- Name: quizblock_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('quizblock_answer_id_seq', 655, true);


--
-- Name: quizblock_question; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: quizblock_question_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quizblock_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizblock_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quizblock_question_id_seq OWNED BY quizblock_question.id;


--
-- Name: quizblock_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('quizblock_question_id_seq', 243, true);


--
-- Name: quizblock_quiz; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE quizblock_quiz (
    id integer NOT NULL,
    description text NOT NULL,
    rhetorical boolean NOT NULL,
    allow_redo boolean DEFAULT true
);


--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quizblock_quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quizblock_quiz_id_seq OWNED BY quizblock_quiz.id;


--
-- Name: quizblock_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('quizblock_quiz_id_seq', 127, true);


--
-- Name: quizblock_response; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE quizblock_response (
    id integer NOT NULL,
    question_id integer NOT NULL,
    submission_id integer NOT NULL,
    value text NOT NULL
);


--
-- Name: quizblock_response_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quizblock_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizblock_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quizblock_response_id_seq OWNED BY quizblock_response.id;


--
-- Name: quizblock_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('quizblock_response_id_seq', 425, true);


--
-- Name: quizblock_submission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE quizblock_submission (
    id integer NOT NULL,
    quiz_id integer NOT NULL,
    user_id integer NOT NULL,
    submitted timestamp with time zone NOT NULL
);


--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quizblock_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quizblock_submission_id_seq OWNED BY quizblock_submission.id;


--
-- Name: quizblock_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('quizblock_submission_id_seq', 639, true);


--
-- Name: riskblock_riskblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE riskblock_riskblock (
    id integer NOT NULL,
    no_risk_copy text NOT NULL,
    some_risk_copy text NOT NULL,
    severe_risk_copy text NOT NULL
);


--
-- Name: riskblock_riskblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE riskblock_riskblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: riskblock_riskblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE riskblock_riskblock_id_seq OWNED BY riskblock_riskblock.id;


--
-- Name: riskblock_riskblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('riskblock_riskblock_id_seq', 1, true);


--
-- Name: servicesblock_servicesblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE servicesblock_servicesblock (
    id integer NOT NULL,
    description text NOT NULL
);


--
-- Name: servicesblock_servicesblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE servicesblock_servicesblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: servicesblock_servicesblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE servicesblock_servicesblock_id_seq OWNED BY servicesblock_servicesblock.id;


--
-- Name: servicesblock_servicesblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('servicesblock_servicesblock_id_seq', 1, false);


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 25, true);


--
-- Name: ssnmtreeblock_ssnmtreeblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreeblock (
    id integer NOT NULL,
    error_copy text,
    page_type text NOT NULL
);


--
-- Name: ssnmtreeblock_ssnmtreeblock_boxes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreeblock_boxes (
    id integer NOT NULL,
    ssnmtreeblock_id integer NOT NULL,
    ssnmtreebox_id integer NOT NULL
);


--
-- Name: ssnmtreeblock_ssnmtreeblock_boxes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreeblock_boxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreeblock_boxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreeblock_boxes_id_seq OWNED BY ssnmtreeblock_ssnmtreeblock_boxes.id;


--
-- Name: ssnmtreeblock_ssnmtreeblock_boxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_boxes_id_seq', 36, true);


--
-- Name: ssnmtreeblock_ssnmtreeblock_editable_support_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreeblock_editable_support_types (
    id integer NOT NULL,
    ssnmtreeblock_id integer NOT NULL,
    ssnmtreesupporttype_id integer NOT NULL
);


--
-- Name: ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq OWNED BY ssnmtreeblock_ssnmtreeblock_editable_support_types.id;


--
-- Name: ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq', 8, true);


--
-- Name: ssnmtreeblock_ssnmtreeblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreeblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreeblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreeblock_id_seq OWNED BY ssnmtreeblock_ssnmtreeblock.id;


--
-- Name: ssnmtreeblock_ssnmtreeblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_id_seq', 3, true);


--
-- Name: ssnmtreeblock_ssnmtreeblock_visible_support_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreeblock_visible_support_types (
    id integer NOT NULL,
    ssnmtreeblock_id integer NOT NULL,
    ssnmtreesupporttype_id integer NOT NULL
);


--
-- Name: ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq OWNED BY ssnmtreeblock_ssnmtreeblock_visible_support_types.id;


--
-- Name: ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq', 12, true);


--
-- Name: ssnmtreeblock_ssnmtreebox; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreebox (
    id integer NOT NULL,
    pixels_from_top integer DEFAULT 0 NOT NULL,
    pixels_from_left integer DEFAULT 0 NOT NULL,
    label text
);


--
-- Name: ssnmtreeblock_ssnmtreebox_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreebox_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreebox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreebox_id_seq OWNED BY ssnmtreeblock_ssnmtreebox.id;


--
-- Name: ssnmtreeblock_ssnmtreebox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreebox_id_seq', 5, true);


--
-- Name: ssnmtreeblock_ssnmtreeperson; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreeperson (
    id integer NOT NULL,
    user_id integer NOT NULL,
    tree_box_id integer NOT NULL,
    name text
);


--
-- Name: ssnmtreeblock_ssnmtreeperson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreeperson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreeperson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreeperson_id_seq OWNED BY ssnmtreeblock_ssnmtreeperson.id;


--
-- Name: ssnmtreeblock_ssnmtreeperson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeperson_id_seq', 5, true);


--
-- Name: ssnmtreeblock_ssnmtreeperson_support_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreeperson_support_types (
    id integer NOT NULL,
    ssnmtreeperson_id integer NOT NULL,
    ssnmtreesupporttype_id integer NOT NULL
);


--
-- Name: ssnmtreeblock_ssnmtreeperson_support_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreeperson_support_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreeperson_support_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreeperson_support_types_id_seq OWNED BY ssnmtreeblock_ssnmtreeperson_support_types.id;


--
-- Name: ssnmtreeblock_ssnmtreeperson_support_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeperson_support_types_id_seq', 9, true);


--
-- Name: ssnmtreeblock_ssnmtreesupporttype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ssnmtreeblock_ssnmtreesupporttype (
    id integer NOT NULL,
    label text,
    description text
);


--
-- Name: ssnmtreeblock_ssnmtreesupporttype_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ssnmtreeblock_ssnmtreesupporttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssnmtreeblock_ssnmtreesupporttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ssnmtreeblock_ssnmtreesupporttype_id_seq OWNED BY ssnmtreeblock_ssnmtreesupporttype.id;


--
-- Name: ssnmtreeblock_ssnmtreesupporttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreesupporttype_id_seq', 2, true);


--
-- Name: tagging_tag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tagging_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tagging_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tagging_tag_id_seq OWNED BY tagging_tag.id;


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tagging_tag_id_seq', 1, false);


--
-- Name: tagging_taggeditem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tagging_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT tagging_taggeditem_object_id_check CHECK ((object_id >= 0))
);


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tagging_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tagging_taggeditem_id_seq OWNED BY tagging_taggeditem.id;


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tagging_taggeditem_id_seq', 1, false);


--
-- Name: wings_main_participant; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wings_main_participant (
    id integer NOT NULL,
    id_string integer NOT NULL,
    user_id integer,
    current_section_id integer
);


--
-- Name: wings_main_participant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wings_main_participant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wings_main_participant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wings_main_participant_id_seq OWNED BY wings_main_participant.id;


--
-- Name: wings_main_participant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wings_main_participant_id_seq', 55, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE audioblock_audioblock ALTER COLUMN id SET DEFAULT nextval('audioblock_audioblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE careermapblock_basemap ALTER COLUMN id SET DEFAULT nextval('careermapblock_basemap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE careermapblock_careermap ALTER COLUMN id SET DEFAULT nextval('careermapblock_careermap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE careermapblock_layer ALTER COLUMN id SET DEFAULT nextval('careermapblock_layer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE careermapblock_question ALTER COLUMN id SET DEFAULT nextval('careermapblock_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_flatpage ALTER COLUMN id SET DEFAULT nextval('django_flatpage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('django_flatpage_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE exitmaterialsblock_exitmaterialsblock ALTER COLUMN id SET DEFAULT nextval('exitmaterialsblock_exitmaterialsblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE fridgeblock_category ALTER COLUMN id SET DEFAULT nextval('fridgeblock_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE fridgeblock_fridgeblock ALTER COLUMN id SET DEFAULT nextval('fridgeblock_fridgeblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE fridgeblock_item ALTER COLUMN id SET DEFAULT nextval('fridgeblock_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE fridgeblock_magnet ALTER COLUMN id SET DEFAULT nextval('fridgeblock_magnet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE fridgeblock_session ALTER COLUMN id SET DEFAULT nextval('fridgeblock_session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE helpblock_helpblock ALTER COLUMN id SET DEFAULT nextval('helpblock_helpblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE main_stand ALTER COLUMN id SET DEFAULT nextval('main_stand_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE main_standavailablepageblock ALTER COLUMN id SET DEFAULT nextval('main_standavailablepageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE main_standgroup ALTER COLUMN id SET DEFAULT nextval('main_standgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE main_standsetting ALTER COLUMN id SET DEFAULT nextval('main_standsetting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE main_standuser ALTER COLUMN id SET DEFAULT nextval('main_standuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE munin_test ALTER COLUMN id SET DEFAULT nextval('munin_test_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pageblocks_htmlblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_htmlblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pageblocks_htmlblockwysiwyg ALTER COLUMN id SET DEFAULT nextval('pageblocks_htmlblockwysiwyg_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pageblocks_imageblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_imageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pageblocks_imagepullquoteblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_imagepullquoteblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pageblocks_pullquoteblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_pullquoteblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pageblocks_textblock ALTER COLUMN id SET DEFAULT nextval('pageblocks_textblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pagetree_hierarchy ALTER COLUMN id SET DEFAULT nextval('pagetree_hierarchy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pagetree_pageblock ALTER COLUMN id SET DEFAULT nextval('pagetree_pageblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pagetree_section ALTER COLUMN id SET DEFAULT nextval('pagetree_section_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE quizblock_answer ALTER COLUMN id SET DEFAULT nextval('quizblock_answer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE quizblock_question ALTER COLUMN id SET DEFAULT nextval('quizblock_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE quizblock_quiz ALTER COLUMN id SET DEFAULT nextval('quizblock_quiz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE quizblock_response ALTER COLUMN id SET DEFAULT nextval('quizblock_response_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE quizblock_submission ALTER COLUMN id SET DEFAULT nextval('quizblock_submission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE riskblock_riskblock ALTER COLUMN id SET DEFAULT nextval('riskblock_riskblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE servicesblock_servicesblock ALTER COLUMN id SET DEFAULT nextval('servicesblock_servicesblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreeblock ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreeblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreeblock_boxes ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreeblock_boxes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreeblock_editable_support_types ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreeblock_visible_support_types ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreebox ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreebox_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreeperson ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreeperson_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreeperson_support_types ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreeperson_support_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ssnmtreeblock_ssnmtreesupporttype ALTER COLUMN id SET DEFAULT nextval('ssnmtreeblock_ssnmtreesupporttype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tagging_tag ALTER COLUMN id SET DEFAULT nextval('tagging_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tagging_taggeditem ALTER COLUMN id SET DEFAULT nextval('tagging_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE wings_main_participant ALTER COLUMN id SET DEFAULT nextval('wings_main_participant_id_seq'::regclass);


--
-- Data for Name: audioblock_audioblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY audioblock_audioblock (id, description, audio_file) FROM stdin;
1	Gal Costa sings "Trem das Onze".	audio_file/2011/11/09/trem.mp3
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
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
49	facilitator
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
5	49	124
6	49	125
\.


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
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
124	Can add participant	42	add_participant
125	Can change participant	42	change_participant
126	Can delete participant	42	delete_participant
127	Can add audio block	43	add_audioblock
128	Can change audio block	43	change_audioblock
129	Can delete audio block	43	delete_audioblock
130	Can add help block	44	add_helpblock
131	Can change help block	44	change_helpblock
132	Can delete help block	44	delete_helpblock
133	Can add ssnm tree block	45	add_ssnmtreeblock
134	Can change ssnm tree block	45	change_ssnmtreeblock
135	Can delete ssnm tree block	45	delete_ssnmtreeblock
136	Can add services block	46	add_servicesblock
137	Can change services block	46	change_servicesblock
138	Can delete services block	46	delete_servicesblock
139	Can add risk block	47	add_riskblock
140	Can change risk block	47	change_riskblock
141	Can delete risk block	47	delete_riskblock
142	Can add exit materials block	48	add_exitmaterialsblock
143	Can change exit materials block	48	change_exitmaterialsblock
144	Can delete exit materials block	48	delete_exitmaterialsblock
145	Can add SSNM Tree: Text Box	49	add_ssnmtreebox
146	Can change SSNM Tree: Text Box	49	change_ssnmtreebox
147	Can delete SSNM Tree: Text Box	49	delete_ssnmtreebox
148	Can add ssnm tree support type	50	add_ssnmtreesupporttype
149	Can change ssnm tree support type	50	change_ssnmtreesupporttype
150	Can delete ssnm tree support type	50	delete_ssnmtreesupporttype
151	Can add SSNM Tree: People	51	add_ssnmtreeperson
152	Can change SSNM Tree: People	51	change_ssnmtreeperson
153	Can delete SSNM Tree: People	51	delete_ssnmtreeperson
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
4	zm4	Zarina	Mustapha	zm4@columbia.edu	!	f	t	f	2011-06-02 15:21:46.02636-04	2011-06-02 15:21:46.026372-04
6	amm8	A.	Matiz	amm8@columbia.edu	!	f	t	f	2011-06-02 15:22:30.926288-04	2011-06-02 15:22:30.926301-04
9	mar227	Marc	Raymond	mar227@columbia.edu	!	f	t	f	2011-06-02 15:23:00.029295-04	2011-06-02 15:23:00.029307-04
10	sld2131	Susan	Dreher	sld2131@columbia.edu	!	f	t	f	2011-06-02 15:23:17.279174-04	2011-06-02 15:23:17.279188-04
16	dg2121	Dawn	Goddard-Eckrich	dg2121@columbia.edu	!	f	t	f	2011-10-17 11:44:00.292812-04	2011-10-17 11:44:00.292828-04
15	sas2268	Stacey	Shaw	sas2268@columbia.edu	!	f	t	f	2011-10-17 12:56:56.268183-04	2011-10-17 11:43:47.944542-04
11	cks2120	Cindy	Smalletz	cks2120@columbia.edu	!	t	t	f	2011-08-25 18:01:26.073388-04	2011-06-20 15:02:19.998826-04
2	jb2410	Jonah	Bossewitch	jb2410@columbia.edu	!	t	t	t	2011-09-15 17:53:14.469942-04	2011-06-01 14:35:19.53697-04
1	anp8	Anders	Pearson	anp8@columbia.edu	!	t	t	t	2011-10-24 11:37:17.52734-04	2011-05-18 15:57:36.886786-04
8	ed2198	Elizabeth	Day	ed2198@columbia.edu	!	t	t	t	2011-09-15 17:58:04.768569-04	2011-06-02 15:22:48.818126-04
14	lg123	Louisa	Gilbert	lg123@columbia.edu	sha1$44f3d$42703ef0a554b17379ff82a5702533b8c6e675dd	f	t	f	2011-10-17 11:43:30.561116-04	2011-10-17 11:43:30.561128-04
12	jl3562	June	Levine	jl3562@columbia.edu	sha1$af08e$f226be5974f594bbe22a4cf35a8a064a406dd4e6	f	t	f	2011-07-20 15:04:51.859021-04	2011-07-20 15:04:51.831345-04
81	jesstest				sha1$57671$5b8c7dbe93ccf1a55d8fb03c0ec096f20354bb4a	t	t	f	2011-11-11 13:11:11.975745-05	2011-11-11 13:07:30-05
5	eddie	Edward	Rubeiz	egr2107@columbia.edu	sha1$e26a0$df0db8b3077e90a88ec832c9f6c141409fb25008	t	t	t	2011-12-14 18:28:28.365303-05	2011-06-02 15:22:04-04
17	wanda	Wanda	Wingsworker		sha1$ab793$a4ed33b4cbfe35ca9b796bbec8334f2834651d29	t	t	f	2011-12-15 11:03:36.489084-05	2011-10-18 11:54:07-04
109	ccnmtl				sha1$39038$3319c0dad839fcbabecd0f37add7dd8aef2b816e	t	t	t	2011-12-12 16:26:09.346662-05	2011-12-09 15:38:04-05
13	jr2502	Jessica	Rowe	jr2502@columbia.edu	sha1$156db$0309acb8024af5d8281e01e6c209e806921a0435	t	t	t	2011-12-14 11:46:52.183812-05	2011-10-11 11:39:54-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
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
67	17	49
68	5	2
69	5	3
70	5	4
73	13	1
74	13	2
75	13	3
76	13	4
77	109	1
78	109	2
79	109	3
80	109	4
81	109	5
82	109	6
83	109	7
84	109	8
85	109	9
86	109	10
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	109	1
2	109	2
3	109	3
4	109	4
5	109	5
6	109	6
7	109	7
8	109	8
9	109	9
10	109	10
11	109	11
12	109	12
13	109	13
14	109	14
15	109	15
16	109	16
17	109	17
18	109	18
19	109	19
20	109	20
21	109	21
22	109	22
23	109	23
24	109	24
25	109	25
26	109	26
27	109	27
28	109	28
29	109	29
30	109	30
31	109	31
32	109	32
33	109	33
34	109	34
35	109	35
36	109	36
37	109	37
38	109	38
39	109	39
40	109	40
41	109	41
42	109	42
43	109	43
44	109	44
45	109	45
46	109	46
47	109	47
48	109	48
49	109	49
50	109	50
51	109	51
52	109	52
53	109	53
54	109	54
55	109	55
56	109	56
57	109	57
58	109	58
59	109	59
60	109	60
61	109	61
62	109	62
63	109	63
64	109	64
65	109	65
66	109	66
67	109	67
68	109	68
69	109	69
70	109	70
71	109	71
72	109	72
73	109	73
74	109	74
75	109	75
76	109	76
77	109	77
78	109	78
79	109	79
80	109	80
81	109	81
82	109	82
83	109	83
84	109	84
85	109	85
86	109	86
87	109	87
88	109	88
89	109	89
90	109	90
91	109	91
92	109	92
93	109	93
94	109	94
95	109	95
96	109	96
97	109	97
98	109	98
99	109	99
100	109	100
101	109	101
102	109	102
103	109	103
104	109	104
105	109	105
106	109	106
107	109	107
108	109	108
109	109	109
110	109	110
111	109	111
112	109	112
113	109	113
114	109	114
115	109	115
116	109	116
117	109	117
118	109	118
119	109	119
120	109	120
121	109	121
122	109	122
123	109	123
124	109	124
125	109	125
126	109	126
127	109	127
128	109	128
129	109	129
130	109	130
131	109	131
132	109	132
133	109	133
134	109	134
135	109	135
136	109	136
137	109	137
138	109	138
139	109	139
140	109	140
141	109	141
142	109	142
143	109	143
144	109	144
\.


--
-- Data for Name: careermapblock_basemap; Type: TABLE DATA; Schema: public; Owner: -
--

COPY careermapblock_basemap (id, cmap_id, name, image, _order) FROM stdin;
1	1	base	images/careermapblock/base_maps/2011/08/02/map_base.jpg	0
2	1	drought/flood	images/careermapblock/base_maps/2011/08/02/map_base_droughtflood.jpg	1
3	1	ethnic groups	images/careermapblock/base_maps/2011/08/02/map_base_ethnicgroups.jpg	2
4	1	population	images/careermapblock/base_maps/2011/08/02/map_base_population.jpg	3
5	1	rainfall	images/careermapblock/base_maps/2011/08/02/map_base_rainfall.jpg	4
\.


--
-- Data for Name: careermapblock_careermap; Type: TABLE DATA; Schema: public; Owner: -
--

COPY careermapblock_careermap (id, description) FROM stdin;
1	This is what they'll look like.
\.


--
-- Data for Name: careermapblock_layer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY careermapblock_layer (id, cmap_id, name, color, image, _order) FROM stdin;
1	1	conflict	#ff0000	images/careermapblock/layers/2011/08/02/map_layer_basicconflict.png	0
2	1	camps	orange	images/careermapblock/layers/2011/08/02/map_layer_camps.png	1
3	1	cholera	purple	images/careermapblock/layers/2011/08/02/map_layer_cholera.png	2
4	1	labels	black	images/careermapblock/layers/2011/08/02/map_layer_labels.png	3
5	1	parks	green	images/careermapblock/layers/2011/08/02/map_layer_parks.png	4
\.


--
-- Data for Name: careermapblock_question; Type: TABLE DATA; Schema: public; Owner: -
--

COPY careermapblock_question (id, cmap_id, text, _order) FROM stdin;
1	1	Questions go in here too. Do you like it?	0
2	1	What about this question?	1
3	1	Or this one?	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2011-05-20 16:24:21.348149-04	1	13	2	main	3	
2	2011-06-07 10:29:01.4952-04	1	13	3	www.sciencedirect.com	3	
3	2011-06-22 15:13:12.135274-04	1	13	6	www.sciencedirect.com	3	
4	2011-07-26 17:26:45.594041-04	8	14	23	Social Work	2	Changed label and slug.
5	2011-10-24 15:50:15.671465-04	5	2	49	facilitator	1	
6	2011-10-24 15:50:48.73127-04	5	3	17	wanda	2	Changed groups.
7	2011-10-24 15:51:06.183193-04	17	42	1	P12345	1	
8	2011-10-26 11:47:18.098381-04	17	42	1	P12345	2	No fields changed.
9	2011-10-26 11:51:09.889508-04	5	3	5	eddie	2	Changed username.
10	2011-10-26 11:52:18.059206-04	5	3	13	jr2502	2	Changed is_superuser.
11	2011-10-26 12:03:16.800281-04	5	13	10	ejtest.forest.ccnmtl.columbia.edu	3	
12	2011-10-26 12:03:16.801222-04	5	13	9	www.sciencedirect.com	3	
13	2011-10-26 12:03:16.801663-04	5	13	8	match.ccnmtl.columbia.edu	3	
14	2011-10-26 12:03:16.802077-04	5	13	7	pass.ccnmtl.columbia.edu	3	
15	2011-10-26 12:03:16.802481-04	5	13	5	newsite.forest.ccnmtl.columbia.edu	3	
16	2011-10-26 12:03:16.802886-04	5	13	4	awesome.forest.ccnmtl.columbia.edu	3	
17	2011-10-26 12:03:16.803291-04	5	13	1	forest.ccnmtl.columbia.edu	3	
18	2011-10-26 12:32:33.184773-04	5	42	1	P12345	1	
19	2011-10-26 12:44:31.84849-04	5	42	1	P12345	3	
20	2011-10-26 12:44:39.094305-04	5	42	2	P13245	1	
21	2011-10-26 12:45:47.91683-04	5	42	2	P13245	3	
22	2011-10-26 12:45:54.80912-04	5	42	3	P12345	1	
23	2011-10-26 12:48:12.922798-04	5	3	34	12345	3	
24	2011-10-26 12:48:12.924563-04	5	3	33	<built-in function id>	3	
25	2011-10-26 13:33:43.774119-04	5	42	4	P54326	1	
26	2011-10-26 13:41:48.633846-04	5	42	5	P154	1	
27	2011-10-26 13:43:55.677923-04	5	42	6	P12	1	
28	2011-10-26 13:51:18.008981-04	17	42	1	P143	1	
29	2011-10-26 13:55:55.760523-04	5	42	2	P143	1	
30	2011-10-26 13:58:49.940809-04	5	42	1	P1234	1	
31	2011-10-26 13:59:00.5939-04	5	42	2	P12345	1	
32	2011-10-26 13:59:06.551355-04	5	42	3	P342	1	
33	2011-10-26 14:04:35.582531-04	5	42	1	P1223	1	
34	2011-10-26 14:04:38.476515-04	5	42	2	P12345	1	
35	2011-10-26 14:04:41.264845-04	5	42	3	P23425	1	
36	2011-10-26 14:04:44.060852-04	5	42	4	P24365	1	
37	2011-10-26 14:04:48.822857-04	5	42	5	P432	1	
38	2011-10-26 14:23:22.672813-04	5	3	45	12	3	
39	2011-10-26 14:23:22.67362-04	5	3	55	1223	3	
40	2011-10-26 14:23:22.674048-04	5	3	47	1234	3	
41	2011-10-26 14:23:22.674459-04	5	3	36	12345	3	
42	2011-10-26 14:23:22.674867-04	5	3	46	143	3	
43	2011-10-26 14:23:22.675284-04	5	3	44	154	3	
44	2011-10-26 14:23:22.675691-04	5	3	51	23425	3	
45	2011-10-26 14:23:22.676166-04	5	3	52	24365	3	
46	2011-10-26 14:23:22.676609-04	5	3	48	342	3	
47	2011-10-26 14:23:22.677014-04	5	3	50	432	3	
48	2011-10-26 14:23:22.677418-04	5	3	41	54326	3	
49	2011-10-26 15:11:15.033962-04	17	42	6	P12354	1	
50	2011-10-26 16:02:41.817664-04	17	42	6	P12354	3	
51	2011-10-26 16:02:48.315357-04	17	42	7	P154	1	
52	2011-10-26 17:03:40.580701-04	17	42	8	P432	1	
53	2011-10-26 17:04:07.739371-04	5	13	11	wings.ccnmtl.columbia.edu	2	Changed name.
54	2011-10-26 17:04:39.824998-04	5	7	1	wings.ccnmtl.columbia.edu	2	Changed domain and name.
55	2011-10-26 17:07:05.098099-04	5	42	9	P6543	1	
56	2011-10-28 09:45:13.29798-04	13	42	10	P12547	1	
57	2011-10-28 09:46:16.068106-04	5	42	11	P1234	1	
58	2011-10-28 09:51:37.292183-04	5	3	13	jr2502	2	Changed groups.
59	2011-10-31 10:34:08.31974-04	13	42	12	P55555	1	
60	2011-10-31 15:26:45.177906-04	5	42	12	P55555	2	No fields changed.
61	2011-11-03 09:33:10.924961-04	13	42	13	P543221	1	
62	2011-11-03 16:31:39.139012-04	5	42	14	P7654	1	
63	2011-11-03 16:50:17.967807-04	5	42	15	P6464	1	
64	2011-11-04 09:53:37.058737-04	13	42	16	P98765	1	
65	2011-11-04 10:08:32.381557-04	5	42	17	P123456	1	
66	2011-11-04 10:57:36.188333-04	5	42	18	P2345	1	
67	2011-11-04 12:38:49.656678-04	5	42	18	P2345	3	
68	2011-11-04 12:38:53.114894-04	5	42	17	P123456	3	
69	2011-11-04 12:38:56.313941-04	5	42	16	P98765	3	
70	2011-11-04 12:38:59.336931-04	5	42	14	P7654	3	
71	2011-11-04 12:39:02.45204-04	5	42	13	P543221	3	
72	2011-11-04 12:39:05.730995-04	5	42	11	P1234	3	
73	2011-11-04 12:39:09.14402-04	5	42	10	P12547	3	
74	2011-11-04 12:39:13.187232-04	5	42	15	P6464	3	
75	2011-11-04 12:39:16.355454-04	5	42	9	P6543	3	
76	2011-11-04 12:39:19.087648-04	5	42	8	P432	3	
77	2011-11-04 12:39:21.810451-04	5	42	7	P154	3	
78	2011-11-04 12:39:32.596755-04	5	42	19	P100	1	
79	2011-11-04 14:15:51.979638-04	13	42	20	P234567	1	
80	2011-11-07 16:48:30.981652-05	5	42	21	P25252	1	
81	2011-11-09 11:36:03.099016-05	13	42	22	P76544	1	
82	2011-11-09 11:39:28.958425-05	13	42	23	P987654	1	
83	2011-11-09 15:51:38.606437-05	17	42	24	P9876	1	
84	2011-11-09 15:52:54.952371-05	17	42	25	P4862	1	
85	2011-11-09 16:10:46.679632-05	17	42	26	P879605	1	
86	2011-11-09 16:28:20.253492-05	13	42	27	P89766	1	
87	2011-11-11 10:55:04.700669-05	13	42	28	P354657	1	
88	2011-11-11 13:07:30.526252-05	13	3	81	jesstest	1	
89	2011-11-11 13:10:49.871711-05	13	3	81	jesstest	2	Changed is_staff.
90	2011-11-15 12:24:01.255536-05	17	42	20	P234567	2	No fields changed.
91	2011-11-16 12:06:07.531773-05	17	42	29	P565656	1	
92	2011-11-16 15:06:37.556566-05	13	42	30	P654879	1	
93	2011-11-16 15:08:36.423525-05	13	42	31	P436789	1	
94	2011-11-16 15:09:22.882313-05	13	42	31	P436789	2	No fields changed.
95	2011-11-16 15:09:37.952475-05	13	42	30	P654879	2	No fields changed.
96	2011-11-16 15:10:38.166637-05	13	2	49	facilitator	2	Changed permissions.
97	2011-11-16 15:12:11.625516-05	5	2	49	facilitator	2	Changed permissions.
98	2011-11-16 15:12:39.690786-05	17	42	32	P1423	1	
99	2011-11-16 15:12:58.774802-05	17	42	32	P1423	2	No fields changed.
100	2011-11-16 15:13:03.392792-05	17	42	32	P1423	2	No fields changed.
101	2011-11-22 16:28:41.361795-05	5	42	33	P46464	1	
102	2011-11-22 16:38:06.141213-05	5	42	34	P78787	1	
103	2011-11-23 11:36:02.832864-05	13	42	35	P357098	1	
104	2011-11-23 12:23:01.46841-05	13	42	36	P143567	1	
105	2011-11-23 14:12:00.056842-05	13	42	37	P132456	1	
106	2011-11-28 09:14:11.591113-05	13	42	38	P98765	1	
107	2011-11-28 11:36:17.910686-05	5	3	68	98765	3	
108	2011-11-28 11:37:00.80958-05	5	3	95	98765	3	
109	2011-11-28 13:53:51.016733-05	13	42	39	P475820	1	
110	2011-11-30 10:49:14.142244-05	17	42	40	P211777	1	
111	2011-11-30 11:16:09.561862-05	17	42	41	P777777	1	
112	2011-11-30 13:30:16.654723-05	5	42	42	P242424242	1	
113	2011-11-30 13:37:36.174702-05	17	42	43	P8675309	1	
114	2011-12-01 16:58:19.533189-05	17	42	44	P743777	1	
115	2011-12-01 16:58:58.018958-05	17	42	45	P654321	1	
116	2011-12-02 10:39:52.791204-05	17	42	46	P777666555	1	
117	2011-12-02 11:18:34.382595-05	17	42	47	P666777222	1	
118	2011-12-02 13:32:31.126187-05	13	42	42	P242424242	2	No fields changed.
119	2011-12-02 14:00:49.084022-05	17	42	48	P545	1	
120	2011-12-05 10:39:04.00124-05	5	42	49	P231	1	
121	2011-12-05 16:12:33.26145-05	5	42	50	P11111	1	
122	2011-12-05 16:14:31.802444-05	5	42	51	P111111111	1	
123	2011-12-06 17:33:34.210751-05	5	42	51	P111111111	3	
124	2011-12-09 15:38:04.303734-05	5	3	109	ccnmtl	1	
125	2011-12-09 15:38:17.281702-05	5	3	109	ccnmtl	2	Changed is_staff and is_superuser.
126	2011-12-09 15:46:36.621314-05	5	3	109	ccnmtl	2	Changed user_permissions and groups.
127	2011-12-09 15:59:10.070094-05	109	42	52	P54321	1	
128	2011-12-09 16:51:08.499775-05	17	42	53	P987555	1	
129	2011-12-12 16:23:13.993023-05	109	42	54	P14263765	1	
130	2011-12-14 18:32:14.467139-05	5	50	1	Practical	1	
131	2011-12-14 18:32:30.424115-05	5	50	2	Emotional	1	
132	2011-12-14 18:45:31.343864-05	5	49	1	 ( 60 , 130)	1	
133	2011-12-14 18:45:51.417845-05	5	49	2	box_2 ( 100 , 290)	1	
134	2011-12-14 18:46:09.981362-05	5	49	1	box_1 ( 60 , 130)	2	Changed label.
135	2011-12-14 18:51:55.200327-05	5	45	1	map screen 1 [2]: First page	2	Changed boxes.
136	2011-12-14 18:52:22.124014-05	5	45	3	map screen 3 [2]: Practical Support	2	Changed boxes, editable_support_types and visible_support_types.
137	2011-12-14 18:52:37.861397-05	5	45	2	map screen 2 [2]: Emotional support	2	Changed boxes, editable_support_types and visible_support_types.
138	2011-12-14 18:52:43.382086-05	5	45	2	map screen 2 [2]: Emotional support	2	No fields changed.
139	2011-12-14 18:52:48.542432-05	5	45	1	map screen 1 [2]: First page	2	No fields changed.
140	2011-12-14 18:52:54.479994-05	5	45	3	map screen 3 [2]: Practical Support	2	No fields changed.
141	2011-12-14 18:54:45.962623-05	5	49	3	box_3 ( 50 , 50)	1	
142	2011-12-14 18:55:14.091098-05	5	45	3	map screen 3 [2]: Practical Support	2	Changed boxes.
143	2011-12-14 18:55:18.420543-05	5	45	2	map screen 2 [2]: Emotional support	2	Changed boxes.
144	2011-12-14 18:55:23.074142-05	5	45	1	map screen 1 [2]: First page	2	Changed boxes.
145	2011-12-15 10:43:02.717163-05	5	49	4	box_4 ( 80 , 250)	1	
146	2011-12-15 10:43:17.232192-05	5	49	5	box_5 ( 30 , 200)	1	
147	2011-12-15 10:43:34.671958-05	5	45	3	map screen 3 [2]: Practical Support	2	Changed boxes.
148	2011-12-15 10:43:42.087087-05	5	45	2	map screen 2 [2]: Emotional support	2	Changed boxes.
149	2011-12-15 10:43:48.833868-05	5	45	1	map screen 1 [2]: First page	2	Changed boxes.
150	2011-12-15 11:05:37.765002-05	5	42	55	P23	1	
151	2011-12-15 11:08:35.513942-05	5	3	71	100	3	
152	2011-12-15 11:08:35.515512-05	5	3	107	11111	3	
153	2011-12-15 11:08:35.516648-05	5	3	108	111111111	3	
154	2011-12-15 11:08:35.517819-05	5	3	63	1234	3	
155	2011-12-15 11:08:35.519044-05	5	3	57	12345	3	
156	2011-12-15 11:08:35.520143-05	5	3	69	123456	3	
157	2011-12-15 11:08:35.521187-05	5	3	58	12354	3	
158	2011-12-15 11:08:35.522236-05	5	3	62	12547	3	
159	2011-12-15 11:08:35.523318-05	5	3	90	132456	3	
160	2011-12-15 11:08:35.524384-05	5	3	85	1423	3	
161	2011-12-15 11:08:35.525655-05	5	3	112	14263765	3	
162	2011-12-15 11:08:35.526834-05	5	3	89	143567	3	
163	2011-12-15 11:08:35.528014-05	5	3	59	154	3	
164	2011-12-15 11:08:35.529141-05	5	3	97	211777	3	
165	2011-12-15 11:08:35.530226-05	5	3	106	231	3	
166	2011-12-15 11:08:35.531328-05	5	3	70	2345	3	
167	2011-12-15 11:08:35.532392-05	5	3	72	234567	3	
168	2011-12-15 11:08:35.533543-05	5	3	99	242424242	3	
169	2011-12-15 11:08:35.534668-05	5	3	73	25252	3	
170	2011-12-15 11:08:35.535745-05	5	3	80	354657	3	
171	2011-12-15 11:08:35.536819-05	5	3	88	357098	3	
172	2011-12-15 11:08:35.537881-05	5	3	60	432	3	
173	2011-12-15 11:08:35.538976-05	5	3	84	436789	3	
174	2011-12-15 11:08:35.540041-05	5	3	86	46464	3	
175	2011-12-15 11:08:35.541122-05	5	3	96	475820	3	
176	2011-12-15 11:08:35.542202-05	5	3	77	4862	3	
177	2011-12-15 11:08:35.543264-05	5	3	110	54321	3	
178	2011-12-15 11:08:35.544341-05	5	3	65	543221	3	
179	2011-12-15 11:08:35.545469-05	5	3	105	545	3	
180	2011-12-15 11:08:35.546545-05	5	3	64	55555	3	
181	2011-12-15 11:08:35.5476-05	5	3	82	565656	3	
182	2011-12-15 11:08:35.548685-05	5	3	67	6464	3	
183	2011-12-15 11:08:35.549749-05	5	3	61	6543	3	
184	2011-12-15 11:08:35.550829-05	5	3	102	654321	3	
185	2011-12-15 11:08:35.5519-05	5	3	83	654879	3	
186	2011-12-15 11:08:35.552953-05	5	3	104	666777222	3	
187	2011-12-15 11:08:35.554022-05	5	3	101	743777	3	
188	2011-12-15 11:08:35.555118-05	5	3	66	7654	3	
189	2011-12-15 11:08:35.556204-05	5	3	74	76544	3	
190	2011-12-15 11:08:35.557241-05	5	3	103	777666555	3	
191	2011-12-15 11:08:35.558192-05	5	3	98	777777	3	
192	2011-12-15 11:08:35.559196-05	5	3	87	78787	3	
193	2011-12-15 11:08:35.560236-05	5	3	100	8675309	3	
194	2011-12-15 11:08:35.561218-05	5	3	78	879605	3	
195	2011-12-15 11:08:35.562194-05	5	3	79	89766	3	
196	2011-12-15 11:08:35.563194-05	5	3	111	987555	3	
197	2011-12-15 11:08:35.564149-05	5	3	76	9876	3	
198	2011-12-15 11:08:35.56521-05	5	3	75	987654	3	
199	2011-12-15 11:08:35.566272-05	5	3	7	ej2223	3	
200	2011-12-15 11:08:35.567229-05	5	3	3	sbd12	3	
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
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
42	participant	wings_main	participant
43	audio block	audioblock	audioblock
44	help block	helpblock	helpblock
45	ssnm tree block	ssnmtreeblock	ssnmtreeblock
46	services block	servicesblock	servicesblock
47	risk block	riskblock	riskblock
48	exit materials block	exitmaterialsblock	exitmaterialsblock
49	SSNM Tree: Text Box	ssnmtreeblock	ssnmtreebox
50	ssnm tree support type	ssnmtreeblock	ssnmtreesupporttype
51	SSNM Tree: People	ssnmtreeblock	ssnmtreeperson
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
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
9ce5239e84ac2cb5db4bc5ebe8988ec1	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-07 16:14:36.443266-05
3e69b7665fb632abd7cbb1ffb52dd54a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-09 11:50:47.738721-05
d175a620bdc6fdf80811f8217d5e4db1	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-09 12:34:50.780482-05
882e551fb874f20809f5912aa847b923	gAJ9cQEoVQ1fYXV0aF91c2VyX2lkSwVVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRy\naWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1LjYxNjI5MmIyNTg0OWVkN2EwOTczMTI5ZjBj\nZTYxZDg2\n	2011-11-09 12:37:20.373153-05
56696b3d7533ffd384110643b66730a2	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-09 12:38:37.60236-05
c7d61827da773297362c0b3af496f359	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-09 12:38:47.996291-05
c0ebaaf727272167fb6b7c0e9c9f73c7	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-09 12:39:06.060854-05
332ba5d4658ecb64eae84b046f8ed38c	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-09 12:39:48.659284-05
fa2335c4547378a3364c5c2743a88d29	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-11-09 12:42:10.032328-05
9572fdab6e468fd8db4cc7936d2f3cc7	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEhdS4zYzA4YWU4YzliMGE3NDI5NjQ4\nNWQ2ZDFiOGJkYzYyNA==\n	2011-11-09 12:45:37.76636-05
34fb98d67ad4821cdca53d0997f08561	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-11-09 15:13:23.252652-05
cd17df14180291820db619e822d8da6c	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigE7dS5lNzc5NzE0MjU4NTNkOTU3ZGYy\nNzIyNWQzZjU3YzM2NA==\n	2011-11-09 16:02:50.182817-05
e29b76613bee260304c66d388c1d3213	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-11-11 09:53:06.925105-05
6402e5a9014990a3ea6a864461e51a84	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFudS5jYzYyYzdkZDAxZjBkODVhZjJk\nZTYxODM2ZTc2ODY5OA==\n	2011-12-23 15:59:13.143151-05
b247c04da85bbf724e0ad0058842a600	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigE+dS5mMWIyOTg5NzU3MzcwMzgzMjU1\nNzRiNTdmODljZjg0Yg==\n	2011-11-11 09:45:15.109556-05
cd8ec31c3b67bc0e69e8e7edfd60a6ae	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-11-18 10:11:33.177136-05
6bc53f6dc9af1829542928038e4284c6	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESxF1LmRmNDAzMzgyNDQyYjg2ODhiZGY1\nOGJhMzVjNjFmMjYy\n	2011-11-30 15:12:25.311913-05
be4c1dd06a68a651fd84d08abc7d626d	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESxF1LmRmNDAzMzgyNDQyYjg2ODhiZGY1\nOGJhMzVjNjFmMjYy\n	2011-12-02 15:51:56.86637-05
91b1b86220dd8dcd780ec571d574f3a0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFBdS5iMWI2OGE5M2EyNjg2MmU1NGY0\nN2NhZTk2NTE4NmIxZg==\n	2011-11-17 09:33:18.54077-05
1e1d0b086049b58345374ebe3b9d74e7	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-11-23 11:38:28.688588-05
2aaeb277f05789bf33ae933892b7c642	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-06 16:28:37.189924-05
cf7ed38d2e4a1ea71eeb0df1bc30f376	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-11-18 10:11:32.643584-05
c4076347f658f714ae4320b5056facfd	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-11-23 11:38:22.959774-05
252b54e6b01ca6ecd476f391070af916	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFMdS5hMGM2MjZhNTUzMjU2NzliYjBj\nYTdjYzFjYmJkZTBlOA==\n	2011-11-23 15:51:42.746677-05
d23483134577f75bafdd82385e53dc59	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFNdS5iNDE5MmE0ZGNjY2QzYjUzYTYx\nYmM4OTY4ZDEzYTcxZQ==\n	2011-11-23 15:52:57.567067-05
c6c5a48ec9d7b0146953d642e21314d5	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFPdS40MDQ0OGE3MTM2NTNkNTI4NmVl\nOTVkYmY1ZDdjOTY2YQ==\n	2011-11-23 16:28:22.015651-05
e22ae6db690e6ea085fb2124d2f00daf	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-11-24 09:28:07.47234-05
1196f71d0b36f74916e6a005610c1434	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-11-24 09:04:45.758836-05
dbfed5f967b06031e216cfa0109c0cdc	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-07 11:16:21.381876-05
5866f5775a2d37c185fef36d4c433ded	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-19 10:44:19.667359-05
0fe277b55431848174081011d086356b	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFvdS43ZTRkZGUxMDIzZWQ4NzY1MjQy\nMDRhNGI2ZmMxOTA3ZQ==\n	2011-12-23 16:51:11.715923-05
bc674a708e1244f740d30c6b1649d2f4	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-01 08:48:14.837408-05
063fa8f5c276bdb35511359e662e98a0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES211LjEyNzQ1NDI5YmFmZWNiZDMzZDQx\nNjRjNTdkZjg0OTZk\n	2011-12-26 16:25:01.257803-05
faa8f66a5f87678bc5bba27519dde133	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES211LjEyNzQ1NDI5YmFmZWNiZDMzZDQx\nNjRjNTdkZjg0OTZk\n	2011-12-26 16:26:09.357284-05
18197bfdbf76dc1b0480a5b57ba73888	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESxF1LmRmNDAzMzgyNDQyYjg2ODhiZGY1\nOGJhMzVjNjFmMjYy\n	2011-11-29 12:23:24.34709-05
a5f68ae123636b26f5724a51747d1f6e	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFkdS5iYTA3YTY1ZDdlNTUyMWQ1NDMx\nNWJmMmU4OTUxZmIwYQ==\n	2011-12-14 13:38:03.586349-05
53e8d6b855b2d71267c67a7139d4f067	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESxF1LmRmNDAzMzgyNDQyYjg2ODhiZGY1\nOGJhMzVjNjFmMjYy\n	2011-11-30 10:12:21.694884-05
4c2d829b5ca3bdb5b206e7554269903e	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigFSdS45NjlmNjQ0NmIzZDI0MWM5NjZj\nNDIwOTA4OTkxNDg0ZA==\n	2011-11-30 12:06:13.072433-05
dd77c864283a81461bac42442bd39bb8	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-27 17:44:28.643042-05
b36292d439a0ba8aaf8527753021bd07	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-28 10:30:47.428099-05
fb024c77eda0a0d651ad34999951b4c8	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-14 14:30:35.005574-05
2a763a3d38e9685c63b6aa6f0112e278	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-28 11:46:52.302522-05
5b90c41bd716af6a26d54cb5f2e79bf3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-16 12:29:55.202325-05
ab7d407e23618b1f700f4614694bf6a7	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-15 15:56:33.064672-05
11e2dae72af6f904ea218fd9e9213bdb	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-15 17:31:57.727918-05
3fc26076d55ba07d98c5e9ba8ba2300a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-16 00:45:10.346025-05
daac80c207ef4f6f5655c06819327c9c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-16 07:41:04.584845-05
ff013ae28c76855e8b624d11e84232ef	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-12-28 18:28:28.375517-05
4bfc131fea8dd2dc64088f41808cd02e	gAJ9cQEuMTVkOGZjNmI2MzFmYjBiYTA4Yjc5ZTE4ZDBiYWU5MmQ=\n	2011-12-19 10:47:26.65133-05
20e5fd397bc8febf54ca20f920df8278	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-28 22:05:25.464543-05
aa98caaee8c8f05c8cbe6809d9f92ad1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-28 22:05:25.523516-05
7892f9a11c5196bd7d848e9cb6cbcb8f	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESxF1LmRmNDAzMzgyNDQyYjg2ODhiZGY1\nOGJhMzVjNjFmMjYy\n	2011-12-16 13:17:57.014955-05
71a91b61eaa8936ecd008fdaf86e97f0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESxF1LmRmNDAzMzgyNDQyYjg2ODhiZGY1\nOGJhMzVjNjFmMjYy\n	2011-12-29 11:03:36.521383-05
bb3d603b881bd7db45f3d1c945088084	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESxF1LmRmNDAzMzgyNDQyYjg2ODhiZGY1\nOGJhMzVjNjFmMjYy\n	2011-12-16 14:12:20.532915-05
2a7879869869b0b74bef3a5f1785f47b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2011-12-19 15:01:18.961448-05
b5c3aedf7b0ede14b4e637ecdcebc47a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2011-12-20 15:02:18.106815-05
c5e0e489929f255f54a87edd7a4fc6e1	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES2t1LmVmY2I3M2Y3OGViYjBiMWYwZmE5\nY2Y2MjQxYmMzZmIx\n	2011-12-23 12:10:09.319994-05
83d23b4895c1a2236f49f573abaf65f6	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2011-12-23 12:12:44.019333-05
dd889696293ac7d5221f0541916aa2e0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES2t1LmVmY2I3M2Y3OGViYjBiMWYwZmE5\nY2Y2MjQxYmMzZmIx\n	2011-12-23 13:03:17.703475-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_site (id, domain, name) FROM stdin;
1	wings.ccnmtl.columbia.edu	wings.ccnmtl.columbia.edu
\.


--
-- Data for Name: exitmaterialsblock_exitmaterialsblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY exitmaterialsblock_exitmaterialsblock (id, description) FROM stdin;
\.


--
-- Data for Name: fridgeblock_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fridgeblock_category (id, fridgeblock_id, label, image, _order) FROM stdin;
1	1	Get Fit!	images/fridge/categories/2011/08/05/icon_getfit.png	0
2	1	Eat Smart!	images/fridge/categories/2011/08/05/icon_eatsmart.png	1
3	1	Look Sharp!	images/fridge/categories/2011/08/05/icon_looksharp.png	2
4	1	Think Positive!	images/fridge/categories/2011/08/05/icon_thinkpositive.png	3
\.


--
-- Data for Name: fridgeblock_fridgeblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fridgeblock_fridgeblock (id) FROM stdin;
1
\.


--
-- Data for Name: fridgeblock_item; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: fridgeblock_magnet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fridgeblock_magnet (id, session_id, item_id, x, y) FROM stdin;
1	1	1	62	64
4	1	6	40	148
3	1	2	103	231
2	1	3	65	335
\.


--
-- Data for Name: fridgeblock_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fridgeblock_session (id, fridgeblock_id, user_id, saved) FROM stdin;
1	1	1	2011-08-05 16:37:34.29947-04
2	1	2	2011-08-09 13:03:49.407189-04
3	1	5	2011-10-11 11:33:01.329277-04
4	1	13	2011-10-17 11:40:54.462247-04
\.


--
-- Data for Name: helpblock_helpblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY helpblock_helpblock (id, description, audio_file) FROM stdin;
1	Martha Argerich rocks a toccata by Prokofiev.	audio_file/2011/11/23/toccata.mp3
\.


--
-- Data for Name: main_stand; Type: TABLE DATA; Schema: public; Owner: -
--

COPY main_stand (id, title, hostname, created, css, description, access) FROM stdin;
1	Forest	forest.ccnmtl.columbia.edu	2011-05-23 16:43:08.902207-04	#content table {width: 90%;}\r\n#content table textarea {width: 95%;}		open
2	www.sciencedirect.com	www.sciencedirect.com	2011-05-24 04:28:11.440115-04			open
3	Awesome	awesome.forest.ccnmtl.columbia.edu	2011-06-07 10:07:39.395617-04			open
4	new one	newsite.forest.ccnmtl.columbia.edu	2011-06-07 10:20:14.195109-04			open
5	PASS	pass.ccnmtl.columbia.edu	2011-06-17 16:01:49.22484-04			open
7	Forest	ejtest.forest.ccnmtl.columbia.edu	2011-06-28 11:55:39.258464-04	#content table {width: 90%;}\r\n#content table textarea {width: 95%;}		open
6	MATCH	match.ccnmtl.columbia.edu	2011-07-26 17:48:37.510592-04	#primarynav ul.globalnav {\r\n\r\nmargin: 144px 0 0 1px;\r\nfloat: none;\r\noverflow: hidden;\r\n}\r\n\r\n#primarynav ul.globalnav li a {\r\n\r\nbackground-color: transparent;\r\n}\r\n\r\n\r\n#standardnav {\r\n    display: none;\r\n}\r\n\r\n#header {\r\n    background: #fff;\r\n    height: 92px;\r\n \r\n}\r\n\r\nh1#logo_project {\r\nheight: 80px;\r\nwidth: 485px;\r\nborder: none;\r\nbackground: url("http://ccnmtl.columbia.edu/draft/lizday/oral_health/match_logo.png") no-repeat scroll left top transparent;\r\nmargin: 0;\r\n\r\n}\r\n\r\nh4#logo_ccnmtl {\r\nheight: 47px;\r\nwidth: 151px;\r\nborder: none;\r\nbackground: url("http://ccnmtl.columbia.edu/draft/lizday/oral_health/uncharted_logo.png") no-repeat scroll left top transparent;\r\nfloat: right;\r\n}\r\n\r\n#primarynav {\r\n    overflow: auto;\r\n    height: auto;\r\nbackground: url("http://ccnmtl.columbia.edu/draft/lizday/oral_health/social_work_header.png") no-repeat scroll left top transparent;\r\nheight: 188px;\r\n\r\n\r\n}\r\n\r\n#primarynav ul {\r\n    background-color: transparent;\r\n}\r\n\r\n#primarynav #usernav {\r\n    color: black;\r\n    left: 57%;\r\n    margin: 0 6px 0 0;\r\n    position: absolute;\r\n    top: 66px;\r\n}		open
8	wings	wings.ccnmtl.columbia.edu	2011-10-11 11:23:29.816906-04		Here's where we'll start collecting info for the new Wings project. This may or may not evolve into the production site.	open
\.


--
-- Data for Name: main_standavailablepageblock; Type: TABLE DATA; Schema: public; Owner: -
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
34	8	riskblock.RiskBlock
35	8	audioblock.AudioBlock
36	8	servicesblock.ServicesBlock
37	8	ssnmtreeblock.SsnmTreeBlock
38	8	helpblock.HelpBlock
\.


--
-- Data for Name: main_standgroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY main_standgroup (id, stand_id, group_id, access) FROM stdin;
\.


--
-- Data for Name: main_standsetting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY main_standsetting (id, stand_id, name, value) FROM stdin;
\.


--
-- Data for Name: main_standuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY main_standuser (id, stand_id, user_id, access) FROM stdin;
1	1	1	admin
3	1	2	instructor
4	1	4	instructor
5	1	5	instructor
6	1	6	student
8	1	8	student
9	1	9	student
10	1	10	student
11	3	1	admin
12	4	1	admin
13	5	1	admin
14	6	1	admin
15	5	11	admin
16	6	11	admin
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
-- Data for Name: munin_test; Type: TABLE DATA; Schema: public; Owner: -
--

COPY munin_test (id, name) FROM stdin;
\.


--
-- Data for Name: pageblocks_htmlblock; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: pageblocks_htmlblockwysiwyg; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pageblocks_htmlblockwysiwyg (id, wysiwyg_html) FROM stdin;
\.


--
-- Data for Name: pageblocks_imageblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pageblocks_imageblock (id, image, caption, alt) FROM stdin;
1	images/2011/05/18/04.jpg	Look! you can upload pictures!	a forest
2	images/2011/06/07/04.jpg	tree!	
3	images/2011/06/28/pageblocks1-04.jpg	Look! you can upload pictures!	\N
6	images/2011/10/14/cycleofviolence.jpg	This chart shows what many women experience when in abusive relationships. First, tension builds and the partner becomes more controlling. Then, the partner may feel he or she loses control and an abusive incident occurs. Afterward, the partner apologizes and promises to change. Often in a situation like this the woman has mixed feelings, and may feel that she is walking on eggshells around the partner.  	cycle of violence diagram
10	images/2011/11/23/powerandcontrol-phys.jpg		
11	images/2011/11/23/powerandcontrol.jpg		
12	images/2011/11/23/powerandcontrol-emot.jpg		
13	images/2011/11/23/powerandcontrol-sexu.jpg		
14	images/2011/11/23/powerandcontrol-econ.jpg		
5	images/2011/10/14/powerandcontrol-phsy.jpg	Emotional abuse occurs when a partner isolates a woman from her friends and family, or uses controlling behaviors (e.g. calling frequently to check where you are, follows you to see where you are going, tells you what to wear, who to talk to, where you can go, take’s control over your money, etc.). Abuse may also occur when one partner tries to control the other partner by such behaviors as threatening to call ACS regarding her children or threatening to report her to the police or probation for criminal activity. Verbal abuse includes behaviors such as screaming, yelling, threats, name calling, putdowns, or can other angry words that make you feel hurt, ashamed or insignificant.	
\.


--
-- Data for Name: pageblocks_imagepullquoteblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pageblocks_imagepullquoteblock (id, image, caption, alt) FROM stdin;
\.


--
-- Data for Name: pageblocks_pullquoteblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pageblocks_pullquoteblock (id, body) FROM stdin;
\.


--
-- Data for Name: pageblocks_textblock; Type: TABLE DATA; Schema: public; Owner: -
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
32	For the following statements about your current or recent partner, please indicate on scale of 1 to 6 how much you agree with the statement\r\n\r\n1 – Strongly Agree\r\n2 – Agree Somewhat\r\n3 – Agree a little\r\n4 – Disagree a little\r\n5 – Disagree Somewhat\r\n6 – Disagree Strongly\r\n
34	Risk for Relationship Conflict or Intimate Partner Violence:\r\n\r\nIt does appear that you are experiencing some relationship conflict that may be hurting you  and making it difficult to protect yourself from HIV and other STIs. If you have questions or concerns about your risk for IPV and how to get help to reduce IPV, your a staff member will be available after the session to meet you.  Later on in this program you will learn about public services available to you and you will receive a book of resources with names and numbers you can call.\r\n\r\nYou are about learn some safety planning steps to make sure that you are prepared in case the relationship conflict gets out of hand. By learning about safety planning, you may be able to help family or friends who are experiencing serious relationship conflict.\r\n\r\nOR\r\n\r\nNo IPV Risk:\r\n\r\nBased on your answers, it doesn’t appear that you are experiencing serious relationship conflict, but we would like you to continue learning about how to help your family or friends who may experiencing serious relationship conflict or intimate partner violence.\r\n
11	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non mollis enim. Vestibulum est massa, gravida ut bibendum eget, porttitor vitae odio. Pellentesque mattis facilisis enim nec consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam in erat justo, eu varius velit. Nullam nec risus eget arcu mattis pulvinar eget sed augue. Cras hendrerit dolor ut magna iaculis ac accumsan diam pulvinar. Morbi hendrerit ligula ac ligula tempus vulputate. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sollicitudin libero, sed venenatis dolor condimentum ut. Vestibulum lobortis nibh id libero eleifend non blandit ipsum mattis.\r\n\r\nFusce ut velit scelerisque est elementum viverra eget id lectus. Etiam lacinia pretium quam id semper. In tempor laoreet justo sed tincidunt. Ut blandit lobortis scelerisque. Donec viverra mattis lacus a tristique. Integer eu lorem eget libero adipiscing ornare. Vivamus suscipit lacinia auctor. Sed in quam massa. Cras venenatis venenatis nibh porta consequat. Vivamus ac mauris felis. Morbi gravida purus quis ante iaculis malesuada. Proin mollis enim ac nulla dignissim aliquam sed sed purus. Nullam quis dapibus quam. Duis arcu risus, rutrum quis tristique sed, imperdiet et mi.\r\n\r\nVestibulum lobortis adipiscing semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur placerat nisi a dolor porttitor malesuada. Quisque commodo consectetur augue, sit amet vulputate dui scelerisque sit amet. Nulla facilisi. Vestibulum risus mi, aliquet vitae vestibulum eu, gravida eget est. Mauris id consequat nunc. Nunc cursus facilisis dolor sed aliquet. Duis in mauris arcu, non rhoncus diam. Fusce blandit sollicitudin sodales. Ut quis ullamcorper nulla. Aenean sagittis pharetra ante, sed dignissim nibh facilisis ut. Praesent viverra feugiat accumsan. Duis id arcu vel lectus commodo feugiat nec eget elit. Sed convallis porttitor mauris, eu pellentesque enim rhoncus ac. Sed vitae ante non arcu elementum consequat ut a velit. Nam mollis nunc a enim volutpat tincidunt sed vel libero. Cras et ipsum eu justo euismod posuere. Nullam ac congue diam. Proin vitae orci sit amet diam pellentesque dapibus vitae sit amet neque.\r\n\r\nMorbi vel mi nec tortor sollicitudin laoreet vitae vitae arcu. Quisque fermentum, massa in euismod posuere, magna purus molestie risus, quis commodo lorem nunc vitae orci. In nec orci eget mauris pretium cursus. Integer nisl sapien, pellentesque vitae sollicitudin eu, semper at eros. Sed in sem sem, quis sodales ligula. Phasellus ac ligula ante, et aliquet sem. Nam justo nunc, fermentum a interdum in, placerat non magna. Vestibulum ullamcorper, nulla eu iaculis varius, enim lorem suscipit metus, at pretium elit ipsum mattis elit. Vivamus consequat ligula a augue volutpat semper. Curabitur nec euismod nunc. Maecenas vel orci enim. Phasellus vel urna sed nisi suscipit adipiscing in at libero. Aliquam sed nibh urna. Aliquam id dolor lorem, quis lobortis enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur pretium cursus pellentesque. In auctor tempor viverra. Nulla facilisi. Duis elit nibh, eleifend a tempor id, suscipit sit amet felis. Pellentesque augue nisi, ultricies sodales viverra nec, ornare sed lectus. Donec non quam fermentum elit lobortis venenatis. Ut molestie, nulla sed rutrum eleifend, arcu orci imperdiet augue, id venenatis arcu leo sit amet leo. In hac habitasse platea dictumst. Phasellus fermentum commodo magna. Nulla facilisi.\r\n
12	Early childhood caries are a serious public oral health problem affected by various socioeconomic and cultural factors. This module aims to enhance dentists’ understanding of the social work profession to provide an option.................
13	<em>NOTE to cindy: content seems incomplete from the document I used - make sure to go back and revise.</em><br><br>\r\n<strong>1. Patient Recruitment via Community Awareness</strong>\r\n<p>Social workers often visit community centers, soup kitchens, schools, gyms, etc. to present information in an interactive and engaging manner. They can provide psychoeducational workshops to parents and children in the community to explain the importance of oral health and maintaining good dental hygiene. By modeling healthy oral health practices with parents and children, families are more likely to develop self-efficacy and continue healthy behavior.</p>\r\n \r\n<p>Interfacing with a social worker to conduct psychoeducational groups can provide valuable patient referrals from underserved, high-need communities.</p>\r\n<strong>2. Better Patient Health Outcomes</strong>\r\n<p>Social workers can identify any additional services families may need and work with them to access these services, as well as make follow-up phone calls to monitor treatment progress and general well-being.</p>\r\n<p>Social workers identify and ameliorate potential psychosocial and practical barriers to treatment such as issues of transportation, childcare, cultural values, sentiment of distrust or shame/embarrassment to going to dentist, or mental health issues such as depression, anxiety, drug/alcohol addiction etc., in the family.</p>\r\n<p>Work with patient family to explore barriers and prioritize oral health through open conversations with parents. Assist clients to apply, re-apply, or renew Medicaid or other government benefits such as food stamps, or WIC: to encourage healthy nutrition to prevent caries.</p>\r\n<p>Provide support and expertise in challenging situations, such as in suspected cases of child abuse or neglect, or domestic violence and working with family to draw up a safety plan. \r\n</p>\r\n<strong>3. Help take on challenging new cases</strong>\r\n<p>Social workers can reduce fear and anxiety, enhance cooperation, and effect treatment when working with anxious or very young children or children with special needs. Their knowledge and training of mental health disorders allows them to recognize characteristics of behavior and work with family to calm a child.</p>\r\n<strong>4. Early intervention, removing barriers,..........</strong>\r\n<p> where did the content go?</p>\r\n<strong>5. Managing challenging patient situations in office</strong>\r\n<p>Social workers are trained to respect and remain open to various cultural attitudes and practice sensitivity towards this. Additionally, many have competency in a second language.</p>\r\n<p>Work appropriately with patients or families who are living with mentally, physically disabled and/or developmentally delayed conditions</p>\r\n<p>Trained to work with families of these patients and remain open and sensitive to the unique challenges to returning for visits that these families may face</p>\r\n<strong>6. Staff capacity building </strong>\r\n<p>Cultural sensitivity training, PDD and autism training, challenging situations management training, etc. </p>\r\n<strong>7. Patient Retention</strong>\r\n<p>All these ways in which social work can benefit dental practices as well better patient outcomes contribute to patient loyalty, satisfaction and rate of return.</p>\r\n<p>Engage parents in waiting room to discuss importance of oral health to improve patient retention and set up an individualized treatment plan for every child that identifies strengths and challenges to dental care.</p>
15	[image suggestions: logo or illustration that refers to flying]
22	[image suggestions: someone shouting, other suggestions needed]
24	TBD\r\n\r\n[image suggestions needed]
25	All the types of behavior just described abuse are related to power and control, and they are forms of intimate partner violence. Such violence can occur from partners who are female or male, and within relationships that are long-term or casual, of the same or of different genders.    
21	In addition to physical violence, verbal abuse, such as screaming, yelling, threats, name calling, and putdowns can include angry words that make you feel hurt, ashamed or insignificant. These behaviors are also sometimes referred to as emotional abuse. 
30	Many women who experience violence from their partner have difficulty in telling someone about what is happening. Some women feel that there is no way out of the situation and their partner has control. Addressing such a situation may not be easy. But the purpose of our conversation today is to consider any risks you or your loved ones may be facing, and to consider what supports and resources are available to you.
23	Sexual abuse may include being forced to have sex or feeling pressured into having unwanted sexual activity.  For example if a partner pressures you to have oral or anal sex when you don’t want to or if a partner takes sexual advantage of you when you are under the influence of drugs or alcohol.
31	One type of violence includes physical abuse with behaviors such as shoving, pushing, slapping, hitting, kicking, pulling hair or punching.
27	Encouraging a woman to be dependent on drugs, or preventing her from accessing drug treatment, is also a form of abuse that can occur in intimate relationships. Pressuring women to sell sex for money or drugs is also a form of abuse.
17	We'll be talking about recognizing relationship conflict and different types of abuse now. What we talk about might be upsetting to you, especially if it touches on something that's going on in your life. Please remember that we're here to help.\r\n
28	Approximately 1 in 4 women will experience domestic abuse in her lifetime. Each year there are approximately 16,800 homicides and over 2 million medically treated injuries related to intimate partner violence.  Among women on probation or parole in New York City, the rate of experiencing physical or sexual violence is very high – over one third of women have gone to the emergency room for injuries resulting from a fight with a partner.\r\n\r\nBecause so many women experience violence in relationships, we are introducing this WINGS program.
29	Women who experience abuse by their partners may develop sleep disturbances, sexual dysfunction, depression, anxiety, posttraumatic stress disorder, eating disorders, feminine problems, become isolated, feel an intense loss of social connections, and may attempt suicide. Such abuse may also make it difficult for women to negotiate condom use with their partners and protect themselves against HIV and other sexually transmitted infections.  
35	Relationship conflicts with partners – which may include emotional, physical, or sexual abuse – are common triggers for using drugs and alcohol to cope with the emotional and sometimes physical pain. Violence often causes women in recovery to relapse and drop out of treatment. 
36	Thinking through your relationship with your partner(s) now or in the past, when you experience conflict or if you are being hurt by your partner, what are some negative consequences that you have experienced or have concerns about?
42	I can teach my children how to use the telephone and dial 911 to contact the police and the fire department. 
43	I can also teach these strategies to some or all of my children.
44	I will use my judgment and intuition. If the situation is very serious, I can give my partner what he/she wants to calm him/her down. I have to protect myself until I/we are out of danger.
48	I will rehearse my escape plan and, as appropriate, practice it with my children.
54	Address line one\r\n\r\nAddress line two\r\n\r\nAddress line three
55	Title/Name/\r\n\r\nphone number\r\n\r\nemail address
56	Because you chose to view this service, the address, name and contact information will be saved for you and printed in your exit materials.
57	image of completed social support map\r\n\r\n[/safety-plan/during-a-violent-incident/plan-part-1/]'s Safety Plan\r\n\r\nPart One: Strategies for Safety During a Violent Incident\r\n\r\nIf I decide to leave, I will: [/safety-plan/during-a-violent-incident/plan-part-2/]\r\n\r\nIn order to leave quickly, I can keep my purse, identification, and metro card (or bus/train fare) ready and put them: [/safety-plan/during-a-violent-incident/plan-part-3/]\r\n\r\nI can tell a person that I trust about the violence and request they call the police if they hear suspicious noises coming from my apartment. One person I can tell is: [/safety-plan/during-a-violent-incident/plan-part-4/]\r\n\r\nAnother person I can tell is: [/safety-plan/during-a-violent-incident/plan-part-5/]\r\n\r\nI can teach my children how to use the telephone and dial 911 to contact the police and the fire department. \r\n\r\nI can use a code word with my children or my friends so they can call for help. (CODE WORDS should not evoke suspicion from partner, but should not also be “every day” language that might confuse helping person. Some examples of code words are “Aunt _ _ _ has not returned my phone call today“. Code words for children need to be appropriate for their age. For example, a code word for a 13 year old girl may be “Your cousin _ _ _ called you today and wants you to call her back today”. For a younger child “Your grandmother called today and wanted to talk with you about something.”(Most children under the age of 5 will be too young to understand how to operate under code language, you will need to figure out whether your child can be entrusted with this task)\r\n\r\nMy code word will be: [/safety-plan/during-a-violent-incident/plan-part-7/]\r\n\r\nIf I have to leave my home I will go to: [/safety-plan/during-a-violent-incident/plan-part-8/]\r\n\r\nIf I cannot go to the location above I will go: [/safety-plan/during-a-violent-incident/plan-part-9/]\r\n\r\nI can also teach these strategies to some or all of my children.\r\n\r\nWhen I expect we are going to have an argument, I will try to move to a space that is lowest risk, such as: [/safety-plan/during-a-violent-incident/plan-part-11/]\r\n\r\nI will use my judgment and intuition. If the situation is very serious, I can give my partner what he/she wants to calm him/her down. I have to protect myself until I/we are out of danger.\r\n\r\nPart Two: Preparing to Leave\r\n\r\nSo that I can leave quickly, I will leave money and an extra set of keys with: [/safety-plan/preparing-to-leave/plan-part-1/]\r\n\r\nI will keep copies of important documents (social security cards, birth certificates, shot records – see step 8) or keys at :[/safety-plan/preparing-to-leave/plan-part-2/]\r\n\r\nTo increase my independence, I will open a savings account by: [/safety-plan/preparing-to-leave/plan-part-3/]\r\n\r\nOther things I can do to increase my independence include: [/safety-plan/preparing-to-leave/plan-part-4/]\r\n\r\nCall 311 and ask for the NYC Domestic Violence Hotline (800-621-4673; TDD 866-604-5350) if you need counseling, legal assistance or emergency housing. If you are feeling threatened by your partner or in more immediate danger, call 911 for the police.\r\n\r\nKeep change for phone calls on you at all times. If you use your telephone credit card, the following month the telephone bill will tell your partner those numbers that you called after you left. To keep your telephone communications confidential, you must either use coins at a pay phone or get a friend to let you use their telephone credit card for a limited time when you first leave.\r\n\r\nI will check with the following people to see if I can stay with them or borrow money:[/safety-plan/preparing-to-leave/plan-part-7/]\r\n\r\nI can leave extra clothes with:[/safety-plan/preparing-to-leave/plan-part-8/]\r\n\r\nIn order to plan the safest way to leave the residence, I will sit down and review my safety plan every:[/safety-plan/preparing-to-leave/plan-part-9/]\r\n\r\n[safety-plan/preparing-to-leave/plan-part-10/] will help me review my safety plan.\r\n\r\nI will rehearse my escape plan and, as appropriate, practice it with my children.\r\n\r\nAny services viewed in the service referrals activity in this format:\r\n\r\nHigest Level Heading (i.e. 'Drugs and Alcohol)\r\n\r\nNext Level Heading (i.e. Detox)\r\n\r\nServices viewed under this heading\r\n\r\n\r\n
14	Thank you for taking the time to participate in the WINGS project today. The purpose of this project is to provide information and resources to women. We are particularly interested in how women can stay safe in relationships with intimate partners. Test
45	A woman may have to leave the residence she shares with her partner, who is out of control. Leaving must be done with a careful plan in order to increase safety.  A violent partner often strikes back if he or she believes that the woman is leaving a relationship.
62	Economic abuse occurs when a partner attempts to make a woman financially dependent, takes her money, or forces her to sell drugs.
61	This chart shows what many women experience when in abusive relationships. First, tension builds and the partner becomes more controlling. Then, the partner may feel he or she loses control and an abusive incident occurs. Afterward, the partner apologizes and promises to change. Often in a situation like this the woman has mixed feelings, and may feel that she is walking on eggshells while others may feel like it's never going to happen again.\r\n\r\n[graphic of Cycle of Violence here]
46	Call 311 and ask for the NYC Domestic Violence Hotline (800-621-4673 or 866-604-5350) if you need counseling, legal assistance or emergency housing.  If you are feeling threatened by your partner or in more immediate danger, call 911 for the police.
16	Most relationships have good times and bad times. Intimate relationships can be an important source of support, love, and purpose in life. Conflict can arise when partners have different needs or expectations or when difficult things happen that are outside of both partners’ control. While all relationships may have positives and negatives, we’d like to spend some time today talking about conflict and abuse, which sometimes occurs in intimate relationships. \r\n\r\nNow we’re going to hear from three women who have experienced conflict and will share some of their experiences.\r\n   
59	this page holds a video clip from Strength of a woman cut together with some voice over:\r\n\r\nVO: Now we’re going to hear from three women who have experienced conflict and will share some of their experiences.\r\nVIDEO CLIP: “Intros/Stories”\r\nVO: None of these women expected to experience abuse or violence in their relationships. Things started off great, but over time their partners became more controlling\r\n
38	Thinking through your relationship with your partner(s), when conflict or abuse occurs what are some negative consequences that you experience or are concerned about? Please answer the following questions.
37	After considering the different negative ways that relationship conflict may be affecting your life and your family, what are some reasons why it would be important for you to reduce conflict? Please answer the following questions.
47	Keep change for phone calls on you at all times. If you use your cell phone, the following month the telephone bill will tell your partner those numbers that you called after you left. To keep your calls confidential, you must either use coins at a pay phone or use a calling card for a limited time when you first leave. 
49	Let's identify the goals you most want to pursue.\r\n
60	Intimate partners may hurt each other in different ways. All of these types of violence or abuse are often related to power and control. Such violence can occur from intimate partners who are female or male, and within relationships that are long-term or casual.
41	Women cannot always avoid violent incidents. In order to increase safety, women may use a variety of strategies. You can use some or all of the following strategies to stay safe.
58	Welcome to Wings!\r\n\r\n[video of Charlene saying the following:]\r\n\r\nThank you for taking the time to participate in the WINGS project today. \r\n\r\nMy name is Charlene and I will be speaking with you throughout the next hour. The purpose of this project is to provide information and resources to women. We’ll start by talking about relationships and different types of conflict. Then I will ask you a few questions about relationships. At the end of this session, we’ll discuss safety planning, support and goals.\r\n
33	Now you're going to complete a screening on how safe and comfortable you feel in your relationship with your intimate partner(s). The next three pages will ask you some questions about sexual or romantic partners you've had in the past year.
68	You answered that relationship conflict gives you these feelings and concerns:\r\n\r\n[list of question text from the previous questions numbered 1-12 with 'yes' and 'maybe' answers\r\n\r\nplus\r\n\r\nany text typed into field in question 13]
70	Women cannot always avoid violent incidents. In order to increase safety, women may use a variety of strategies.  You can use some or all the strategies on the following pages to stay safe.
71	You will be given or mailed a copy of this safety plan.  Do you have a safe place to keep the safety plan at home or with a friend?\r\n\r\nYou will also get a list called 'Items to Remember' that provides a suggested list of things to take with you if you have to leave.  Where can you keep this list?\r\n\r\nDo you have a safe place to keep the 24-hour hotline number and other important numbers?
73	write the names of one to five people you trust onto the birds on this tree.
74	now click on each of the people who can give you emotional support
75	Now click on the names of people who can give you practical support, like giving you a place to stay, watching your pets, or lending you money.
77	It looks like you haven't entered any names on the tree. There are times in life when you may feel isolated from all your friends and family, but can you think of any people who you would like to reach out to and connect with?  This may include extended family members you have lost contact with, neighbors, people you work with, clergy, or service providers.  Please try to put at least two names on the tree.
76	Can you think of two things you can do to strengthen your support from family or friends in the next week?  This may be calling someone who you like to hang out with to get together for coffee or go for walk so that you have a chance to connect with him or her. It may mean calling or a text, email or letter to someone who you have lost touch with but who you would like to reconnect with.  It may mean choosing someone who you trust and respect to talk with about the relationship conflict or abuse that you are experiencing so that you can get their advice or support on how to deal with it.
78	Now you're going to answer some questions about the types of issues that can trigger conflict for you and your partner.  Then you'll learn about services and organizations that might be able to help you with your particular needs.
40	If you or a family member or friend is experiencing relationship conflict or abuse by a partner, there are steps you can take to reduce conflict and help to prevent being hurt by a partner. Now we’ll cover two things that can reduce your risk for being hurt by your partner: coming up with a safety plan and identifying friends or family members you can turn to for support.
64	Sometimes alcohol and drug use make the pattern of violence worse. People who use drugs and alcohol are more likely to commit acts of violence against their partners. Women who are under the influence of drugs or alcohol may be less likely to escape or resist abusive situations. When an intimate partner keeps someone from attending treatment or threatens to hurt them if they use or don’t use drugs, this is a part of abusive behavior.  
65	Some women who experience violence in relationships may become angry and want to fight back. By fighting back, women may put themselves at risk for receiving criminal charges or going to jail.  Women who experience intense relationship conflict are also more likely to turn to drugs or alcohol to cope with the pain from the abuse. This may also increase their risk for being arrested for drug-related charges.
72	In addition to coming up with a safety plan, it may also help for you to be able to reach out family and friends who you can turn to for help, advice, and emotional support if you are feeling afraid that your partner might hurt you. There may also be times when it is safer for you to stay with a friend or family member. Your friends or family may also help you out by taking care of your children or pets or helping you financially if you need to leave.\r\n\r\nDifferent people may be able to help you in different ways. For example, it may be easier to talk with a friend about your relationship problems but ask your aunt for place to stay. Can you name between 1 to 5 people who you trust that may be able to support you?
63	Exposure to violence can also have lasting consequences for children. Kids who see or hear violence often experience grief, fear, and anxiety. Boys who witness violence between their parents are ten times more likely to abuse their partners when they become adults. Girls who witness parental violence are much more likely to be abused by their partners when they grow up. 
66	[video clips from Strength of a Woman plus VO that says:\r\n\r\nMany women have a hard time talking about the abuse they are experiencing and getting help]
\.


--
-- Data for Name: pagetree_hierarchy; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pagetree_hierarchy (id, name, base_url) FROM stdin;
11	wings.ccnmtl.columbia.edu	/
\.


--
-- Data for Name: pagetree_pageblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pagetree_pageblock (id, section_id, ordinality, label, content_type_id, object_id) FROM stdin;
132	112	1		16	43
97	97	1		16	35
133	113	1		26	55
134	114	1		16	44
136	115	1		26	56
137	116	1		26	57
138	117	1		26	58
139	118	1		26	59
142	121	1		26	60
143	123	1		26	61
144	124	1		26	62
145	125	1		26	63
146	126	1		16	48
148	57	2		26	64
122	104	1		26	47
123	105	1		26	48
124	106	1		26	49
125	107	1		26	50
126	108	1		26	51
128	109	1		16	42
129	110	1		26	52
130	111	1		26	53
131	111	2		26	54
154	147	1	Service provider organization	16	54
155	147	2	Provider Name	16	55
156	147	3		16	56
58	53	1	Screening for IPV	16	17
79	76	1	Relationship Satisfaction	16	33
168	156	1		26	66
169	156	2		26	67
157	148	1	what to include in the journal:	16	57
170	156	3		26	68
171	156	4		26	69
198	176	1		26	95
199	177	1		26	96
200	178	1		26	97
201	179	1		26	98
160	149	1		16	59
162	150	1		16	61
211	187	1		26	105
73	63	1		16	31
212	188	1		26	106
213	189	1		26	107
74	74	1		19	5
121	56	1	Taking steps to increase relationship safety 	16	40
69	70	1		16	28
164	152	1		16	63
113	100	1	Cons of Relationship Conflict	16	38
214	190	1		26	108
173	157	1		26	70
174	157	2		26	71
175	157	3		26	72
176	157	4		26	73
177	158	1		26	74
178	158	2		26	75
179	158	3		26	76
180	158	4		26	77
181	159	1		26	78
182	159	2		26	79
183	161	1		26	80
184	162	1		26	81
185	163	1		26	82
186	164	1		26	83
187	165	1		26	84
188	166	1		26	85
189	167	1		26	86
190	168	1		26	87
191	169	1		26	88
192	170	1		26	89
193	171	1		26	90
194	172	1		26	91
195	173	1		26	92
196	174	1		26	93
197	175	1		26	94
202	180	1		26	99
203	181	1		26	100
204	182	1		26	101
205	183	1		26	102
206	184	1		26	103
207	185	1		26	104
215	191	1		26	109
230	63	2		19	10
231	62	2		19	11
216	192	1		26	110
232	74	2		19	12
68	69	1		16	27
217	193	1		26	111
218	194	1		26	112
219	195	1		26	113
220	196	1		26	114
221	197	1		26	115
222	198	1		26	116
234	65	2		19	13
226	204	1		26	119
158	52	2		16	58
224	202	1		26	117
225	203	1		26	118
223	201	1	How relationship conflict makes you feel	16	68
227	205	1		26	120
100	99	1	Identifying Reasons to Reduce Relationship Conflict and Improve Safety	16	37
235	151	2		19	14
228	206	1		26	121
236	207	1		26	122
161	62	1		16	60
159	52	3		43	1
172	52	1		44	1
237	208	1		26	123
135	103	1	Safety When Preparing to Leave	16	45
127	102	1	Strategies for Saftey During a Violent Incident	16	41
239	210	1		16	71
241	211	1		16	73
242	212	1		16	74
243	213	1		16	75
245	215	2		26	124
246	214	1		16	77
244	215	1	Steps to increase support	16	76
248	58	1	Service Referrals	16	78
247	145	1	Issues that can trigger conflict in your relationship	26	125
57	59	1		16	16
165	153	1		16	64
70	72	1		16	29
140	119	1		16	46
141	120	1		16	47
147	57	1	Goal Setting	16	49
240	55	1	Social Support Tree	16	72
64	65	1		16	23
163	151	1		16	62
166	154	1		16	65
167	155	1		16	66
249	146	1	Resources to help you towards your goals	26	126
250	200	1		26	127
251	186	1		47	1
252	211	2	First page	45	1
253	212	2	Emotional support	45	2
254	213	2	Practical Support	45	3
\.


--
-- Data for Name: pagetree_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pagetree_section (id, path, depth, numchild, label, slug, hierarchy_id) FROM stdin;
212	000A000M0002	3	0	map screen 2	map-screen-2	11
215	000A000M0005	3	0	steps to increase support	steps-to-increase-support	11
70	000A000I001T	3	0	How Common It Is	how-common-it-is	11
59	000A000I001O	3	1	Relationships	relationships	11
149	000A000I001O0001	4	0	Three Stories	three-stories	11
150	000A000I001Q	3	0	The Cycle of Violence	cycle-of-violence	11
53	000A000J	2	1	Screening for IPV	screening-for-ipv	11
63	000A000I001R000L	4	0	Physical Abuse	physical-abuse	11
161	000A000J00010006	4	0	question 1	question-1	11
156	000A000J00010001	4	0	partner 1 questions	partner-1-questions	11
151	000A000I001R000O	4	0	Economic Abuse	economic-abuse	11
74	000A000I001R000M	4	0	Emotional Abuse	emotional-abuse	11
65	000A000I001R000N	4	0	Sexual Abuse	sexual-abuse	11
62	000A000I001R	3	4	Types of Conflict	types-of-conflict	11
69	000A000I001S	3	0	Drug Use and IPV	drug-use-and-ipv	11
72	000A000I001U	3	0	Negative Consequences	negative-consequences	11
159	000A000J00010004	4	0	main partner questions	main-partner-questions	11
51	000A	1	8	Root		11
198	000A000K0008000R	4	0	question 13	question-13	11
197	000A000K0008000Q	4	0	question 12	question-12	11
196	000A000K0008000P	4	0	question 11	question-11	11
195	000A000K0008000O	4	0	question  10	question-10	11
194	000A000K0008000N	4	0	question 9	question-9	11
210	000A000L0001000P	4	0	plan part 12	plan-part-12	11
213	000A000M0003	3	0	map screen 3	map-screen-3	11
217	000A000O0004	3	0	results page	results-page	11
193	000A000K0008000M	4	0	question 8	question-8	11
52	000A000I	2	10	Welcome	welcome	11
155	000A000I001Y	3	0	Talking about the abuse	video-talking-about-the-abuse	11
192	000A000K0008000L	4	0	question 7	question-7	11
200	000A000K0008000K	4	0	question 6	question-6	11
152	000A000I001V	3	0	Negative Cosequences for Children	negative-cosequences-for-children	11
153	000A000I001W	3	0	Negative Consequences and Alcohol or Drugs	negative-consequences-and-alcohol-or-drugs	11
154	000A000I001X	3	0	Anger and Fighting Back	anger-and-fighting-back	11
158	000A000J00010003	4	0	partner 3 questions	partner-3-questions	11
163	000A000J00010008	4	0	question 3	question-3	11
165	000A000J0001000A	4	0	question 5	question-5	11
167	000A000J0001000C	4	0	question 7	question-7	11
169	000A000J0001000E	4	0	question 9	question-9	11
171	000A000J0001000G	4	0	question 11	question-11	11
173	000A000J0001000I	4	0	question 13	question-13	11
175	000A000J0001000K	4	0	question 15	question-15	11
177	000A000J0001000M	4	0	question 17	question-17	11
179	000A000J0001000O	4	0	question 19	question-19	11
157	000A000J00010002	4	0	partner 2 questions	partner-2-questions	11
160	000A000J00010005	4	0	events over past year intro	events-over-past-year-intro	11
162	000A000J00010007	4	0	question 2	question-2	11
164	000A000J00010009	4	0	question 4	question-4	11
166	000A000J0001000B	4	0	question 6	question-6	11
168	000A000J0001000D	4	0	question 8	question-8	11
170	000A000J0001000F	4	0	question 10	question-10	11
172	000A000J0001000H	4	0	question 12	question-12	11
174	000A000J0001000J	4	0	question 14	question-14	11
176	000A000J0001000L	4	0	question 16	question-16	11
178	000A000J0001000N	4	0	question 18	question-18	11
180	000A000J0001000P	4	0	question 20	question-20	11
202	000A000K00090001	4	0	question 1	question-1	11
204	000A000K00090003	4	0	question 3	question-3	11
206	000A000K00090005	4	0	question 5	question-5	11
208	000A000K00090007	4	0	question 7	question-7	11
187	000A000K0008000F	4	0	question 1	question-1	11
188	000A000K0008000G	4	0	question 2	question-2	11
189	000A000K0008000H	4	0	question 3	question-3	11
190	000A000K0008000I	4	0	question 4	question-4	11
191	000A000K0008000J	4	0	question 5	question-5	11
181	000A000J0001000Q	4	0	question 21	question-21	11
182	000A000J0001000R	4	0	question 22	question-22	11
183	000A000J0001000S	4	0	question 23	question-23	11
184	000A000J0001000T	4	0	question 24	question-24	11
185	000A000J0001000U	4	0	question 25	question-25	11
186	000A000J0001000V	4	0	feedback on relationshop satisfaction screener	feedback-on-relationshop-satisfaction-screener	11
76	000A000J0001	3	31	Relationship Satisfaction	relationship-satisfaction	11
207	000A000K00090006	4	0	question 6	question-6	11
201	000A000K0008000S	4	0	summary of answers	summary-of-answers	11
100	000A000K0008	3	14	Cons of Relationship Conflict	cons-of-relationship-conflict	11
203	000A000K00090002	4	0	question 2	question-2	11
99	000A000K0009	3	7	Reasons to Reduce Conflict	reasons-to-reduce-conflict	11
205	000A000K00090004	4	0	question 4	question-4	11
116	000A000L00020002	4	0	plan part 2	plan-part-2	11
118	000A000L00020004	4	0	plan part 4	plan-part-4	11
120	000A000L00020006	4	0	plan part 6	plan-part-6	11
124	000A000L00020009	4	0	plan part 9	plan-part-9	11
126	000A000L0002000B	4	0	plan part 11	plan-part-11	11
56	000A000L	2	2	Safety Plan	safety-plan	11
115	000A000L00020001	4	0	plan part 1	plan-part-1	11
117	000A000L00020003	4	0	plan part 3	plan-part-3	11
119	000A000L00020005	4	0	plan part 5	plan-part-5	11
121	000A000L00020007	4	0	plan part 7	plan-part-7	11
123	000A000L00020008	4	0	plan part 8	plan-part-8	11
125	000A000L0002000A	4	0	plan part 10	plan-part-10	11
103	000A000L0002	3	11	Preparing to Leave	preparing-to-leave	11
57	000A000N	2	0	Goal Setting	goal-setting	11
148	000A000P	2	0	exit materials	exit-materials	11
104	000A000L0001000D	4	0	plan part 1	plan-part-1	11
105	000A000L0001000F	4	0	plan part 2	plan-part-2	11
106	000A000L0001000G	4	0	plan part 3	plan-part-3	11
107	000A000L0001000H	4	0	plan part 4	plan-part-4	11
108	000A000L0001000I	4	0	plan part 5	plan-part-5	11
109	000A000L0001000J	4	0	plan part 6	plan-part-6	11
110	000A000L0001000K	4	0	plan part 7	plan-part-7	11
111	000A000L0001000L	4	0	plan part 8 	plan-part-8	11
112	000A000L0001000M	4	0	plan part 9	plan-part-9	11
113	000A000L0001000N	4	0	plan part 10	plan-part-10	11
114	000A000L0001000O	4	0	plan part 11	plan-part-11	11
102	000A000L0001	3	12	During a Violent Incident	during-a-violent-incident	11
211	000A000M0001	3	0	map screen 1	map-screen-1	11
214	000A000M0004	3	0	error message/prompt for no names	error-messageprompt-for-no-names	11
55	000A000M	2	5	Social Support Map	social-support-map	11
145	000A000O0001	3	0	issues question	issues-question	11
146	000A000O0002	3	0	services selection page	services-selection-page	11
147	000A000O0003	3	0	action plan	action-plan	11
218	000A000O0005	3	0	wrap up and good bye	wrap-up-and-good-bye	11
58	000A000O	2	5	Service Referrals	service-referrals	11
97	000A000K	2	2	Empowerment	empowerment	11
\.


--
-- Data for Name: quizblock_answer; Type: TABLE DATA; Schema: public; Owner: -
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
370	113	1	yes	f	0
371	113	2	no	f	1
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
372	113	3	maybe	f	2
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
434	167	1	My partner and I stay together, with no change	f	0
435	167	2	My partner and I stay together.  Stop emotional abuse.	f	1
436	167	3	My partner and I stay together.  Stop physical abuse.	f	2
437	167	4	My partner moves out and we have no further contact.	f	3
438	167	5	My partner moves out, but continues to be involved with me.	f	4
439	167	6	My partner moves out, but continues to be involved with my children. 	f	5
448	172	1	Boyfriend	f	0
449	172	2	Girlfriend	f	1
450	172	3	Ex-Boyfriend	f	2
451	172	4	Ex-Girlfriend	f	3
452	172	5	Husband	f	4
453	172	6	Wife	f	5
454	172	7	Ex-Husband	f	6
455	172	Ex-Wife	Ex-Wife	f	7
456	172	9	Common-law Husband	f	8
457	172	10	Common-law Wife	f	9
458	172	11	Lover	f	10
459	174	1	yes	f	0
460	174	2	no	f	1
461	176	1	Boyfriend	f	0
462	176	2	Girlfriend	f	1
463	176	3	Ex-Boyfriend	f	2
464	176	4	Ex-Girlfriend	f	3
465	176	5	Husband	f	4
466	176	6	Wife	f	5
467	176	7	Ex-Husband	f	6
468	176	Ex-Wife	Ex-Wife	f	7
469	176	9	Common-law Husband	f	8
470	176	10	Common-law Wife	f	9
471	176	11	Lover	f	10
472	178	1	yes	f	0
473	178	2	no	f	1
474	176	12	Not Applicable/No second intimate partner	f	11
475	178	3	Not Applicable/no second intimate partner	f	2
476	180	1	Boyfriend	f	0
477	180	2	Girlfriend	f	1
478	180	3	Ex-Boyfriend	f	2
479	180	4	Ex-Girlfriend	f	3
480	180	5	Husband	f	4
481	180	6	Wife	f	5
482	180	7	Ex-Husband	f	6
483	180	Ex-Wife	Ex-Wife	f	7
484	180	9	Common-law Husband	f	8
485	180	10	Common-law Wife	f	9
486	180	11	Lover	f	10
487	182	1	yes	f	0
488	182	2	no	f	1
489	180	12	Not Applicable/no third intimate partner	f	11
490	182	3	Not Applicable/no third second partner	f	2
492	183	1	First partner I mentioned	f	0
493	183	2	second partner I mentioned	f	1
494	183	3	third partner I mentioned	f	2
495	184	1	yes	f	0
496	184	2	no	f	1
497	185	1	yes	f	0
498	185	2	no	f	1
499	186	1	yes	f	0
500	186	2	no	f	1
501	187	1	yes	f	0
502	187	2	no	f	1
503	188	1	yes	f	0
504	188	2	no	f	1
505	189	1	yes	f	0
506	189	2	no	f	1
507	190	1	yes	f	0
508	190	2	no	f	1
509	191	1	yes	f	0
510	191	2	no	f	1
511	192	1	yes	f	0
512	192	2	no	f	1
513	193	1	yes	f	0
514	193	2	no	f	1
515	194	1	yes	f	0
516	194	2	no	f	1
517	195	1	yes	f	0
518	195	2	no	f	1
519	196	1	yes	f	0
520	196	2	no	f	1
521	197	1	yes	f	0
522	197	2	no	f	1
523	198	1	yes	f	0
524	198	2	no	f	1
525	199	1	yes	f	0
526	199	2	no	f	1
527	200	1	yes	f	0
528	200	2	no	f	1
531	202	0	never	f	0
532	202	1	only once	f	1
533	202	2	once a month	f	2
534	202	3	once a week	f	3
535	202	4	daily	f	4
536	203	0	never	f	0
537	203	1	only once	f	1
538	203	2	once a month	f	2
539	203	3	once a week	f	3
540	203	4	daily	f	4
541	204	0	never	f	0
542	204	1	only once	f	1
543	204	2	once a month	f	2
544	204	3	once a week	f	3
545	204	4	daily	f	4
551	206	0	never	f	0
552	206	1	only once	f	1
553	206	2	once a month	f	2
554	206	3	once a week	f	3
555	206	4	daily	f	4
556	207	0	never	f	0
557	207	1	only once	f	1
558	207	2	once a month	f	2
559	207	3	once a week	f	3
560	207	4	daily	f	4
561	208	0	never	f	0
562	208	1	only once	f	1
563	208	2	once a month	f	2
564	208	3	once a week	f	3
565	208	4	daily	f	4
566	209	0	never	f	0
567	209	1	only once	f	1
568	209	2	once a month	f	2
569	209	3	once a week	f	3
570	209	4	daily	f	4
571	210	1	yes	f	0
572	210	2	no	f	1
573	210	3	maybe	f	2
574	211	1	yes	f	0
575	211	2	no	f	1
576	211	3	maybe	f	2
577	212	1	yes	f	0
578	212	2	no	f	1
579	212	3	maybe	f	2
580	213	1	yes	f	0
581	213	2	no	f	1
582	213	3	maybe	f	2
583	215	1	yes	f	0
584	215	2	no	f	1
585	215	3	maybe	f	2
586	216	1	yes	f	0
587	216	2	no	f	1
588	216	3	maybe	f	2
589	217	1	yes	f	0
590	217	2	no	f	1
591	217	3	maybe	f	2
592	218	1	yes	f	0
593	218	2	no	f	1
594	218	3	maybe	f	2
595	219	1	yes	f	0
596	219	2	no	f	1
597	219	3	maybe	f	2
598	220	1	yes	f	0
599	220	2	no	f	1
600	220	3	maybe	f	2
601	221	1	yes	f	0
602	221	2	no	f	1
603	221	3	maybe	f	2
604	223	1	yes	f	0
605	223	2	maybe	f	1
606	223	3	no	f	2
607	230	1	yes	f	0
608	230	2	maybe	f	1
609	230	3	no	f	2
610	231	1	yes	f	0
611	231	2	maybe	f	1
612	231	3	no	f	2
613	232	1	yes	f	0
614	232	2	maybe	f	1
615	232	3	no	f	2
616	233	1	yes	f	0
617	233	2	maybe	f	1
618	233	3	no	f	2
620	234	1	yes	f	0
621	234	2	maybe	f	1
622	234	3	no	f	2
628	239	1	Partner’s mental health issues or problem	f	0
629	239	2	Partner’s unemployment	f	1
630	239	3	Partner’s drug or alcohol issue 	f	2
631	239	4	Partner’s legal problems	f	3
632	239	5	Conflict over Financial Problems	f	4
633	239	6	Lack of communication with partner	f	5
634	239	7	Conflict over children	f	6
635	239	8	Conflict over family and friends	f	7
636	239	9	My drug or alcohol use	f	8
637	239	10	My mental health issues or problem managing anger	f	9
638	239	11	My legal problems 	f	10
639	239	12	Housing problems	f	11
640	241	1	Job training for self or partner	f	0
641	241	2	Help Getting Housing	f	1
642	241	3	Education/Go back to School/GED	f	2
643	241	4	Recreation/Social Activities	f	3
644	241	5	Safety day care for children	f	4
645	241	6	Mental Health Counseling for self or partner	f	5
646	241	7	Alcohol Drug Abuse Counseling for self or partner	f	6
647	241	8	Anger management or batterer’s treatment program for Partner or Self	f	7
648	241	9	Counseling or Group Support to deal with Partner abuse	f	8
649	241	10	Emergency Domestic Violence Shelter or Residential Program	f	9
650	241	11	Legal assistance (i.e. assistance getting restraining order, divorce or child custody)	f	10
651	241	11	Counseling from a religious organization (pastor, priest, rabbi)	f	11
652	241	12	Couples/Marital counseling	f	12
547	205	1	only once	f	0
548	205	2	once a month	f	1
549	205	3	once a week	f	2
550	205	4	daily	f	3
546	205	0	never	f	4
653	243	1	yes	f	0
654	243	2	no	f	1
655	243	3	maybe	f	2
\.


--
-- Data for Name: quizblock_question; Type: TABLE DATA; Schema: public; Owner: -
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
159	56	So that I can leave quickly, I will leave money and an extra set of keys with:	short text		I can use some or all of the following safety strategies:	0
161	58	To increase my independence, I will open a savings account by (date):	short text		It's important to become financially independent.  To get help with becoming financially independent from your partner call 1-800-873-2227.	0
162	59	Other things I can do to increase my independence include: 	long text			0
166	63	The person I will ask is:\r\n\t\r\n	short text		Ask a trusted friend or advocate to help you review review your plan.  	0
163	60	I will check with the following people to see if I can stay with them or borrow money:	long text		It is important to find people who will let you stay with them or lend you some money.  	0
167	64	If you could choose the best outcome (s) for you and your partner, what would it be?  (mark all that apply)	multiple choice			0
168	64	Other desired outcomes:	long text			1
170	66	Initials or a fake name of an intimate partner you've had in the past year:	short text			0
172	67	In the past year, was this partner your:	single choice			0
173	68	How many years have you been in a relationship with this partner?	single choice			0
174	69	Are you currently living with this partner?	single choice			0
176	71	In the past year, was this partner your:	single choice			0
177	72	How many years have you been in a relationship with this partner?	single choice			0
178	73	Are you currently living with this partner?	single choice			0
175	70	Initials or a fake name of a second intimate partner you've had in the past year (if you have not had more than one partner in the past year, please enter NA):	short text			0
180	75	In the past year, was this partner your:	single choice			0
181	76	How many years have you been in a relationship with this partner?	single choice			0
182	77	Are you currently living with this partner?	single choice			0
183	78	Of all these partners, who do you consider to be your MAIN partner? 	single choice			0
184	80	In the past year, has your partner(s) showed respect for your feelings about an issue? 	single choice			0
185	81	In the past year, has the relationship with your partner been important to you?	single choice			0
188	84	In the past year, has your partner(s) twisted your arm, or thrown something at you that could hurt, or pushed, grabbed or slapped you? 	single choice			0
187	83	In the past year, have you called your partner insulting names, destroyed something that belonged to your partner or accused your partner of being a lousy lover?	single choice			0
179	74	Initials or a fake name of a third intimate partner you've had in the past year.  (if you have not had more than one partner in the past year, please enter NA):	short text			0
186	82	In the past year, has your partner(s) called you insulting names, such as fat or ugly, slut or whore, destroyed something that belonged to you or accused you of being a lousy lover? 	single choice			0
189	85	In the past year, have you twisted your partner(s) arm or thrown something at your partner(s) that could hurt, or pushed, grabbed or slapped your partner(s)? 	single choice			0
190	86	In the past year, has your partner(s) kicked you, slammed you against a wall, beaten you up, or burned or scalded you on purpose? 	single choice			0
191	87	In the past year, have you kicked your partner(s), slammed your partner(s) against a wall, beaten your partner(s) up, or burned or scalded your partner(s) on purpose?	single choice			0
192	88	In the past year, have you had a good relationship with your partner(s)?	single choice			0
193	89	In the past year, have you been able to count on your partner(s) to help you out if you had a problem?	single choice			0
160	57	I will keep copies of important documents (social security cards, birth certificates, immunization records) or keys at :	short text			0
165	62	It's important to review your safety plan occasionally.  How often will you sit down and review your safety plan?	short text			0
194	90	In the past year, has your partner(s) choked you?	single choice			0
195	91	In the past year, has your partner(s) punched or hit you with something that could hurt or used or threatened to use a knife or gun on you?	single choice			0
212	107	I am concerned that relationship conflict makes me feel isolated from my friends and family.	single choice			0
217	112	Concerned it is contributing towards physical problems that I am experiencing like headaches, stomach problems, body pains, feminine problems.	single choice			0
219	114	Concerned that I may be exposed to HIV or sexually transmitted infections because of unsafe sex.	single choice			0
199	95	In the past year, has your partner(s) showed you that s/he cared even though you disagreed? 	single choice			0
200	96	In the past year, has your partner(s) said s/he was sure you could work out a problem together?	single choice			0
203	98	In the past year, My partner followed me. . .	single choice			0
202	97	In the past year, My partner has told me that I wasn’t good enough. . .	single choice			0
204	99	In the past year, My partner tried to turn my family, friends, and children against me. . .	single choice			0
155	52	My code word will be:	short text		I can use a code word with my children or my friends so they can call for help. (CODE WORDS should not raise suspicion from partner, but should not also be “every day” language that might confuse people. Some examples of code words are “Aunt _ _ _ has not returned my phone call today“.   Code words for children need to be appropriate for their age.  For example, a code word for a 13 year old girl may be “Your cousin _ _ _ called you today and wants you to call her back today”.  For a younger child “Your grandmother called today and wanted to talk with you about something.”(Most children under the age of 5 will be too young to understand how to operate under code language, you will need to figure out who you can trust with this task) 	0
206	101	In the past year, My partner blamed me for causing their abusive behavior	single choice			0
207	102	In the past year, My partner harassed me over the phone or through texts . . .	single choice			0
208	103	In the past year, My partner told me that no one would ever want me. . .	single choice			0
209	104	In the past year, My partner tried to convince my friends, family, or children that I was crazy. . .	single choice			0
213	108	Makes me feel like using drugs or alcohol.	single choice			0
215	110	Concerned that it is negatively affecting my children.	single choice			0
216	111	Concerned that I may end up fighting back or hurting my partner and risk getting charged with assault.	single choice			0
218	113	Concerned that I may be injured in a fight.	single choice			0
221	109	Makes me feel hopeless or helpless about my future.	single choice			0
220	115	concerned about becoming pregnant.	single choice			0
222	116	Other concerns that I have (list):	long text			0
223	117	I want to feel better about myself and my future	single choice			0
230	118	I want to feel less isolated from my family or friends	single choice			0
231	119	I want to improve the quality of life for my kids or other family members who are affected by the relationship conflict	single choice			0
232	120	I don’t want to feel scared or anxious when I am around my partner	single choice			0
233	121	I want to improve the relationship I have with my partner 	single choice			0
234	122	I don't want to feel trapped in the relationship	single choice			0
235	123	Other reasons to reduce relationship conflict:	long text			0
236	124	In the next week, I can do the following to strengthen my support:	short text			0
237	124	In the next week, I can also do the following to strengthen my support:	short text			1
239	125	What are the main issues that may trigger relationship conflict or abuse? 	multiple choice			0
240	125	Other issues that trigger relationship problems or abuse:	long text			1
241	126	What services might help you work towards these goals with your partner?	multiple choice			0
242	126	Other services that might help you:	long text			1
205	100	In the past year, My partner tried to keep me from seeing or talking to my family or friends. . .	single choice			0
196	92	In the past year, has your partner(s) insisted you have sex even though you didn’t want to? 	single choice			0
197	93	In the past year, has your partner(s) forced you to have sex without a condom?	single choice			0
198	94	In the past year, has your partner(s) threatened or forced (like hitting, holding down, or using a weapon) you to have sex?	single choice			0
243	127	I am concerned that relationship conflict makes me feel bad about myself	single choice		I am concerned that relationship conflict	0
210	105	I am concerned that relationship conflict makes me feel sad or depressed.	single choice			0
211	106	I am concerned that relationship conflict makes me feel anxious, stressed out, or on edge.	single choice			0
\.


--
-- Data for Name: quizblock_quiz; Type: TABLE DATA; Schema: public; Owner: -
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
66		f	f
67		f	f
68		f	f
69		f	f
70		f	f
71		f	f
72		f	f
73		f	f
74		f	f
75		f	f
76		f	f
77		f	f
78		f	f
79		f	f
80		f	f
81		f	f
82		f	f
83		f	f
84		f	f
85		f	f
86		f	f
87		f	f
88		f	f
89		f	f
90		f	f
91		f	f
92		f	f
93		f	f
94		f	f
95		f	f
96		f	f
97		f	f
98		f	f
99		f	f
100		f	f
101		f	f
102		f	f
103		f	f
104		f	f
105		f	t
106		f	t
107		f	t
108		f	t
110		f	t
111		f	t
112		f	t
113		f	t
114		f	t
115		f	t
109		f	t
116		f	f
117		f	t
118		f	t
119		f	t
120		f	t
121		f	t
122		f	f
123		f	f
124	Action Steps to Increase Support from Family and Friends in the Next Week	f	f
125		f	f
126		f	f
127		f	f
\.


--
-- Data for Name: quizblock_response; Type: TABLE DATA; Schema: public; Owner: -
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
41	72	21	2
98	179	120	
99	180	121	Ex-Wife
100	179	124	
101	180	125	Ex-Wife
102	236	128	
103	237	128	
104	170	129	
105	175	133	
106	151	137	
107	156	138	
108	157	139	
109	158	140	
110	159	141	
111	165	142	
227	170	319	a
228	170	323	a
229	172	324	2
230	170	327	a
231	172	328	2
232	170	331	a
233	172	332	2
234	170	335	a
235	172	336	6
236	170	339	a
237	172	340	4
238	170	343	a
239	172	344	4
240	170	347	a
241	172	348	4
242	170	351	a
243	172	352	4
244	170	355	a
245	172	356	7
246	170	359	a
247	172	360	5
248	170	363	a
249	172	364	5
250	170	367	a
251	172	368	6
252	170	371	a
253	172	372	2
254	170	375	a
255	172	376	2
256	170	379	a
257	172	380	2
258	170	383	a
259	172	384	2
260	170	387	a
261	172	388	11
262	170	391	a
263	172	392	11
264	170	395	a
265	172	396	1
266	170	399	a
267	172	400	9
268	170	403	a
269	172	404	9
270	170	407	a
271	172	408	11
272	170	411	a
273	172	412	5
274	170	415	a
275	172	416	Ex-Wife
276	170	419	a
277	172	420	Ex-Wife
278	170	423	a
279	172	424	3
280	170	427	a
281	172	428	11
282	170	431	a
283	172	432	1
284	170	435	a
285	172	436	1
286	170	439	a
287	172	440	11
288	170	443	a
289	172	444	11
290	170	447	a
291	172	448	1
292	170	451	as
293	172	452	1
294	170	455	as
295	172	456	11
296	170	459	asa
297	172	460	11
298	170	463	asa
299	172	464	1
300	170	467	asa
301	172	468	11
302	170	471	
303	172	472	11
304	170	475	
305	172	476	1
306	170	479	a
307	172	480	1
308	170	483	a
309	172	484	11
310	170	487	a
311	172	488	11
312	174	490	1
313	170	491	a
314	172	492	11
315	174	494	2
316	170	495	a
317	172	496	11
318	174	498	2
319	170	499	a
320	172	500	7
321	174	502	2
322	170	503	a
323	172	504	7
324	174	506	2
325	170	507	a
326	172	508	9
327	174	510	2
328	170	511	a
329	172	512	9
330	174	514	1
331	170	515	a
332	172	516	1
333	174	518	1
334	170	519	a
335	172	520	1
336	174	522	2
337	170	523	aa
338	172	524	1
339	174	526	2
340	170	527	aaa
341	172	528	1
342	174	530	2
343	170	531	aaa
344	172	532	5
345	174	534	2
346	170	535	aaaa
347	172	536	5
348	174	538	2
349	170	539	aaaa
350	172	540	1
351	174	542	2
352	170	543	aaaa
353	172	544	1
354	174	546	1
355	170	547	aaaa
356	172	548	7
357	174	550	1
358	170	551	aaaaa
359	172	552	7
360	174	554	1
361	170	555	aaaaa
362	172	556	7
363	174	558	1
364	170	559	aaaaa
365	172	560	7
366	174	562	1
367	170	563	aaaaaa
368	172	564	7
369	174	566	1
370	170	567	aaaaaa
371	172	568	1
372	174	570	1
373	170	571	aaaaaa
374	172	572	2
375	174	574	1
376	170	575	aaaaaaa
377	172	576	2
378	174	578	1
379	170	579	aaaaaaa
380	172	580	1
381	174	582	1
382	170	583	aaaaaaaa
383	172	584	1
384	174	586	1
385	170	587	aaaaaaaa
386	172	588	4
387	174	590	1
388	170	591	aaaaaaaaa
389	172	592	4
390	174	594	1
391	170	595	aaaaaaaaa
392	172	596	3
393	174	598	1
394	170	599	aaaaaaaaa
395	172	600	3
396	174	602	1
397	170	603	aaaaaaaaas
398	172	604	3
399	174	606	1
400	170	607	aaaaaaaaas
401	172	608	6
402	174	610	1
403	170	611	aaaaaaaaass
404	172	612	6
405	174	614	1
406	170	615	aaaaaaaaass
407	172	616	2
408	174	618	1
409	170	619	aaaaaaaaass
410	172	620	3
411	174	622	1
412	170	623	aaaaaaaaass
413	172	624	3
414	174	626	1
415	170	627	aaaaaaaaass
416	172	628	4
417	174	630	1
418	170	631	aaaaaaaaassa
419	172	632	4
420	174	634	1
421	170	635	aaaaaaaaassa
422	172	636	2
423	174	638	1
424	236	639	
425	237	639	
\.


--
-- Data for Name: quizblock_submission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY quizblock_submission (id, quiz_id, user_id, submitted) FROM stdin;
1	1	1	2011-06-03 14:47:52.508224-04
5	3	11	2011-08-18 14:55:08.839373-04
9	28	15	2011-10-17 12:59:08.188626-04
10	12	5	2011-10-18 14:48:35.781645-04
11	13	5	2011-10-18 14:49:27.734903-04
21	12	13	2011-11-10 09:29:04.058432-05
120	74	5	2011-11-28 13:59:53.861876-05
121	75	5	2011-11-28 13:59:53.868288-05
122	76	5	2011-11-28 13:59:53.87375-05
123	77	5	2011-11-28 13:59:53.876455-05
124	74	5	2011-11-28 13:59:54.501359-05
125	75	5	2011-11-28 13:59:54.510408-05
126	76	5	2011-11-28 13:59:54.516922-05
127	77	5	2011-11-28 13:59:54.52029-05
128	124	13	2011-11-30 10:56:51.831516-05
129	66	17	2011-12-02 14:38:05.355256-05
130	67	17	2011-12-02 14:38:05.390225-05
131	68	17	2011-12-02 14:38:05.393032-05
132	69	17	2011-12-02 14:38:05.395705-05
133	70	17	2011-12-02 14:39:13.566053-05
134	71	17	2011-12-02 14:39:13.572431-05
135	72	17	2011-12-02 14:39:13.575169-05
136	73	17	2011-12-02 14:39:13.577994-05
137	49	17	2011-12-02 15:04:05.696996-05
138	53	17	2011-12-02 15:07:39.453771-05
139	54	17	2011-12-02 15:07:39.460373-05
140	55	17	2011-12-02 15:09:40.324027-05
141	56	17	2011-12-02 15:11:44.855558-05
142	62	17	2011-12-02 15:19:02.686698-05
319	66	5	2011-12-09 16:16:49.59296-05
320	67	5	2011-12-09 16:16:49.599501-05
321	68	5	2011-12-09 16:16:49.60216-05
322	69	5	2011-12-09 16:16:49.605013-05
323	66	5	2011-12-09 16:16:54.107998-05
324	67	5	2011-12-09 16:16:54.114308-05
325	68	5	2011-12-09 16:16:54.119629-05
326	69	5	2011-12-09 16:16:54.122483-05
327	66	5	2011-12-09 16:16:55.146854-05
328	67	5	2011-12-09 16:16:55.15371-05
329	68	5	2011-12-09 16:16:55.160538-05
330	69	5	2011-12-09 16:16:55.165077-05
331	66	5	2011-12-09 16:16:56.210381-05
332	67	5	2011-12-09 16:16:56.224542-05
333	68	5	2011-12-09 16:16:56.230998-05
334	69	5	2011-12-09 16:16:56.233932-05
335	66	5	2011-12-09 16:16:56.754275-05
336	67	5	2011-12-09 16:16:56.762609-05
337	68	5	2011-12-09 16:16:56.768716-05
338	69	5	2011-12-09 16:16:56.773414-05
339	66	5	2011-12-09 16:16:58.416037-05
340	67	5	2011-12-09 16:16:58.422409-05
341	68	5	2011-12-09 16:16:58.427556-05
342	69	5	2011-12-09 16:16:58.430185-05
343	66	5	2011-12-09 16:16:59.239144-05
344	67	5	2011-12-09 16:16:59.253051-05
345	68	5	2011-12-09 16:16:59.267443-05
346	69	5	2011-12-09 16:16:59.270326-05
347	66	5	2011-12-09 16:17:00.333121-05
348	67	5	2011-12-09 16:17:00.33943-05
349	68	5	2011-12-09 16:17:00.344617-05
350	69	5	2011-12-09 16:17:00.347478-05
351	66	5	2011-12-09 16:17:03.027766-05
352	67	5	2011-12-09 16:17:03.034187-05
353	68	5	2011-12-09 16:17:03.039222-05
354	69	5	2011-12-09 16:17:03.041939-05
355	66	5	2011-12-09 16:17:05.145389-05
356	67	5	2011-12-09 16:17:05.15172-05
357	68	5	2011-12-09 16:17:05.157038-05
358	69	5	2011-12-09 16:17:05.159743-05
359	66	5	2011-12-09 16:17:08.152767-05
360	67	5	2011-12-09 16:17:08.159092-05
361	68	5	2011-12-09 16:17:08.164541-05
362	69	5	2011-12-09 16:17:08.167326-05
363	66	5	2011-12-09 16:17:09.046157-05
364	67	5	2011-12-09 16:17:09.054655-05
365	68	5	2011-12-09 16:17:09.06775-05
366	69	5	2011-12-09 16:17:09.070592-05
367	66	5	2011-12-09 16:17:09.949741-05
368	67	5	2011-12-09 16:17:09.956464-05
369	68	5	2011-12-09 16:17:09.963006-05
370	69	5	2011-12-09 16:17:09.971806-05
371	66	5	2011-12-09 16:17:10.733816-05
372	67	5	2011-12-09 16:17:10.7408-05
373	68	5	2011-12-09 16:17:10.746989-05
374	69	5	2011-12-09 16:17:10.75326-05
375	66	5	2011-12-09 16:17:11.767584-05
376	67	5	2011-12-09 16:17:11.779257-05
377	68	5	2011-12-09 16:17:11.785931-05
378	69	5	2011-12-09 16:17:11.79065-05
379	66	5	2011-12-09 16:17:14.568603-05
380	67	5	2011-12-09 16:17:14.574559-05
381	68	5	2011-12-09 16:17:14.579381-05
382	69	5	2011-12-09 16:17:14.581832-05
383	66	5	2011-12-09 16:17:17.415032-05
384	67	5	2011-12-09 16:17:17.421368-05
385	68	5	2011-12-09 16:17:17.426759-05
386	69	5	2011-12-09 16:17:17.429473-05
387	66	5	2011-12-09 16:17:18.327198-05
388	67	5	2011-12-09 16:17:18.332538-05
389	68	5	2011-12-09 16:17:18.336901-05
390	69	5	2011-12-09 16:17:18.339128-05
391	66	5	2011-12-09 16:17:21.00015-05
392	67	5	2011-12-09 16:17:21.006481-05
393	68	5	2011-12-09 16:17:21.011762-05
394	69	5	2011-12-09 16:17:21.014588-05
395	66	5	2011-12-09 16:17:21.146827-05
396	67	5	2011-12-09 16:17:21.153634-05
397	68	5	2011-12-09 16:17:21.160665-05
398	69	5	2011-12-09 16:17:21.164497-05
399	66	5	2011-12-09 16:17:47.390272-05
400	67	5	2011-12-09 16:17:47.396763-05
401	68	5	2011-12-09 16:17:47.40232-05
402	69	5	2011-12-09 16:17:47.405194-05
403	66	5	2011-12-09 16:17:48.304765-05
404	67	5	2011-12-09 16:17:48.311282-05
405	68	5	2011-12-09 16:17:48.317978-05
406	69	5	2011-12-09 16:17:48.321168-05
407	66	5	2011-12-09 16:17:49.128891-05
408	67	5	2011-12-09 16:17:49.13757-05
409	68	5	2011-12-09 16:17:49.14488-05
410	69	5	2011-12-09 16:17:49.148604-05
411	66	5	2011-12-09 16:17:50.278291-05
412	67	5	2011-12-09 16:17:50.284759-05
413	68	5	2011-12-09 16:17:50.2901-05
414	69	5	2011-12-09 16:17:50.292924-05
415	66	5	2011-12-09 16:17:51.133271-05
416	67	5	2011-12-09 16:17:51.141397-05
417	68	5	2011-12-09 16:17:51.147118-05
418	69	5	2011-12-09 16:17:51.151107-05
419	66	5	2011-12-09 16:17:51.996166-05
420	67	5	2011-12-09 16:17:52.003994-05
421	68	5	2011-12-09 16:17:52.011674-05
422	69	5	2011-12-09 16:17:52.01495-05
423	66	5	2011-12-09 16:17:52.463328-05
424	67	5	2011-12-09 16:17:52.470879-05
425	68	5	2011-12-09 16:17:52.478323-05
426	69	5	2011-12-09 16:17:52.481498-05
427	66	5	2011-12-09 16:17:54.147816-05
428	67	5	2011-12-09 16:17:54.154111-05
429	68	5	2011-12-09 16:17:54.159456-05
430	69	5	2011-12-09 16:17:54.162193-05
431	66	5	2011-12-09 16:17:57.870026-05
432	67	5	2011-12-09 16:17:57.876253-05
433	68	5	2011-12-09 16:17:57.881172-05
434	69	5	2011-12-09 16:17:57.883863-05
435	66	5	2011-12-09 16:18:00.507556-05
436	67	5	2011-12-09 16:18:00.513942-05
437	68	5	2011-12-09 16:18:00.519214-05
438	69	5	2011-12-09 16:18:00.522009-05
439	66	5	2011-12-09 16:18:00.638412-05
440	67	5	2011-12-09 16:18:00.644817-05
441	68	5	2011-12-09 16:18:00.653182-05
442	69	5	2011-12-09 16:18:00.657841-05
443	66	5	2011-12-09 16:18:04.933448-05
444	67	5	2011-12-09 16:18:04.93986-05
445	68	5	2011-12-09 16:18:04.945323-05
446	69	5	2011-12-09 16:18:04.948054-05
447	66	5	2011-12-09 16:18:05.084077-05
448	67	5	2011-12-09 16:18:05.090958-05
449	68	5	2011-12-09 16:18:05.097376-05
450	69	5	2011-12-09 16:18:05.102059-05
451	66	5	2011-12-09 16:18:11.841111-05
452	67	5	2011-12-09 16:18:11.847519-05
453	68	5	2011-12-09 16:18:11.852766-05
454	69	5	2011-12-09 16:18:11.855663-05
455	66	5	2011-12-09 16:18:16.076094-05
456	67	5	2011-12-09 16:18:16.082424-05
457	68	5	2011-12-09 16:18:16.087547-05
458	69	5	2011-12-09 16:18:16.090369-05
459	66	5	2011-12-09 16:18:19.554152-05
460	67	5	2011-12-09 16:18:19.560434-05
461	68	5	2011-12-09 16:18:19.565496-05
462	69	5	2011-12-09 16:18:19.567837-05
463	66	5	2011-12-09 16:18:19.671805-05
464	67	5	2011-12-09 16:18:19.677055-05
465	68	5	2011-12-09 16:18:19.681252-05
466	69	5	2011-12-09 16:18:19.683386-05
467	66	5	2011-12-09 16:18:22.087131-05
468	67	5	2011-12-09 16:18:22.093611-05
469	68	5	2011-12-09 16:18:22.099049-05
470	69	5	2011-12-09 16:18:22.101809-05
471	66	5	2011-12-09 16:18:30.22321-05
472	67	5	2011-12-09 16:18:30.229596-05
473	68	5	2011-12-09 16:18:30.234901-05
474	69	5	2011-12-09 16:18:30.237595-05
475	66	5	2011-12-09 16:18:30.335102-05
476	67	5	2011-12-09 16:18:30.344243-05
477	68	5	2011-12-09 16:18:30.350786-05
478	69	5	2011-12-09 16:18:30.355529-05
479	66	5	2011-12-09 16:18:34.982871-05
480	67	5	2011-12-09 16:18:34.989418-05
481	68	5	2011-12-09 16:18:34.994774-05
482	69	5	2011-12-09 16:18:34.997782-05
483	66	5	2011-12-09 16:18:36.347717-05
484	67	5	2011-12-09 16:18:36.35403-05
485	68	5	2011-12-09 16:18:36.359016-05
486	69	5	2011-12-09 16:18:36.361583-05
487	66	5	2011-12-09 16:18:50.467304-05
488	67	5	2011-12-09 16:18:50.473673-05
489	68	5	2011-12-09 16:18:50.479099-05
490	69	5	2011-12-09 16:18:50.481857-05
491	66	5	2011-12-09 16:18:52.202626-05
492	67	5	2011-12-09 16:18:52.207759-05
493	68	5	2011-12-09 16:18:52.211701-05
494	69	5	2011-12-09 16:18:52.213759-05
495	66	5	2011-12-09 16:18:53.010486-05
496	67	5	2011-12-09 16:18:53.015804-05
497	68	5	2011-12-09 16:18:53.019923-05
498	69	5	2011-12-09 16:18:53.022008-05
499	66	5	2011-12-09 16:18:53.1042-05
500	67	5	2011-12-09 16:18:53.111308-05
501	68	5	2011-12-09 16:18:53.118496-05
502	69	5	2011-12-09 16:18:53.120592-05
503	66	5	2011-12-09 16:18:54.288471-05
504	67	5	2011-12-09 16:18:54.294304-05
505	68	5	2011-12-09 16:18:54.299125-05
506	69	5	2011-12-09 16:18:54.301594-05
507	66	5	2011-12-09 16:18:55.908011-05
508	67	5	2011-12-09 16:18:55.914485-05
509	68	5	2011-12-09 16:18:55.919599-05
510	69	5	2011-12-09 16:18:55.922348-05
511	66	5	2011-12-09 16:18:57.185616-05
512	67	5	2011-12-09 16:18:57.1918-05
513	68	5	2011-12-09 16:18:57.19706-05
514	69	5	2011-12-09 16:18:57.199688-05
515	66	5	2011-12-09 16:18:59.883059-05
516	67	5	2011-12-09 16:18:59.889431-05
517	68	5	2011-12-09 16:18:59.894812-05
518	69	5	2011-12-09 16:18:59.89763-05
519	66	5	2011-12-09 16:19:01.372344-05
520	67	5	2011-12-09 16:19:01.378761-05
521	68	5	2011-12-09 16:19:01.384285-05
522	69	5	2011-12-09 16:19:01.387218-05
523	66	5	2011-12-09 16:19:05.302222-05
524	67	5	2011-12-09 16:19:05.308632-05
525	68	5	2011-12-09 16:19:05.313932-05
526	69	5	2011-12-09 16:19:05.316755-05
527	66	5	2011-12-09 16:19:11.339699-05
528	67	5	2011-12-09 16:19:11.346125-05
529	68	5	2011-12-09 16:19:11.351516-05
530	69	5	2011-12-09 16:19:11.354312-05
531	66	5	2011-12-09 16:19:11.470599-05
532	67	5	2011-12-09 16:19:11.477402-05
533	68	5	2011-12-09 16:19:11.484192-05
534	69	5	2011-12-09 16:19:11.488441-05
535	66	5	2011-12-09 16:19:16.274925-05
536	67	5	2011-12-09 16:19:16.281122-05
537	68	5	2011-12-09 16:19:16.28641-05
538	69	5	2011-12-09 16:19:16.289216-05
539	66	5	2011-12-09 16:19:16.409182-05
540	67	5	2011-12-09 16:19:16.415727-05
541	68	5	2011-12-09 16:19:16.42241-05
542	69	5	2011-12-09 16:19:16.430791-05
543	66	5	2011-12-09 16:19:19.446829-05
544	67	5	2011-12-09 16:19:19.452936-05
545	68	5	2011-12-09 16:19:19.457751-05
546	69	5	2011-12-09 16:19:19.46034-05
547	66	5	2011-12-09 16:19:20.767812-05
548	67	5	2011-12-09 16:19:20.77431-05
549	68	5	2011-12-09 16:19:20.779779-05
550	69	5	2011-12-09 16:19:20.782671-05
551	66	5	2011-12-09 16:19:24.263474-05
552	67	5	2011-12-09 16:19:24.269881-05
553	68	5	2011-12-09 16:19:24.275304-05
554	69	5	2011-12-09 16:19:24.27798-05
555	66	5	2011-12-09 17:00:53.262268-05
556	67	5	2011-12-09 17:00:53.268974-05
557	68	5	2011-12-09 17:00:53.274221-05
558	69	5	2011-12-09 17:00:53.276914-05
559	66	5	2011-12-09 18:51:05.985486-05
560	67	5	2011-12-09 18:51:05.992183-05
561	68	5	2011-12-09 18:51:05.997285-05
562	69	5	2011-12-09 18:51:05.999956-05
563	66	5	2011-12-09 18:56:10.665895-05
564	67	5	2011-12-09 18:56:10.672599-05
565	68	5	2011-12-09 18:56:10.677693-05
566	69	5	2011-12-09 18:56:10.680439-05
567	66	5	2011-12-09 18:56:11.752494-05
568	67	5	2011-12-09 18:56:11.758547-05
569	68	5	2011-12-09 18:56:11.763698-05
570	69	5	2011-12-09 18:56:11.76623-05
571	66	5	2011-12-09 18:56:12.365181-05
572	67	5	2011-12-09 18:56:12.371806-05
573	68	5	2011-12-09 18:56:12.379682-05
574	69	5	2011-12-09 18:56:12.38289-05
575	66	5	2011-12-09 18:56:45.324729-05
576	67	5	2011-12-09 18:56:45.331268-05
577	68	5	2011-12-09 18:56:45.336806-05
578	69	5	2011-12-09 18:56:45.339677-05
579	66	5	2011-12-09 18:56:45.495583-05
580	67	5	2011-12-09 18:56:45.503977-05
581	68	5	2011-12-09 18:56:45.512135-05
582	69	5	2011-12-09 18:56:45.51572-05
583	66	5	2011-12-09 18:56:50.144958-05
584	67	5	2011-12-09 18:56:50.15129-05
585	68	5	2011-12-09 18:56:50.156635-05
586	69	5	2011-12-09 18:56:50.159334-05
587	66	5	2011-12-09 18:56:50.715904-05
588	67	5	2011-12-09 18:56:50.725447-05
589	68	5	2011-12-09 18:56:50.731538-05
590	69	5	2011-12-09 18:56:50.735159-05
591	66	5	2011-12-09 19:03:27.98192-05
592	67	5	2011-12-09 19:03:27.988623-05
593	68	5	2011-12-09 19:03:27.993921-05
594	69	5	2011-12-09 19:03:27.996678-05
595	66	5	2011-12-09 19:03:30.377089-05
596	67	5	2011-12-09 19:03:30.383294-05
597	68	5	2011-12-09 19:03:30.388287-05
598	69	5	2011-12-09 19:03:30.390921-05
599	66	5	2011-12-09 19:03:31.324674-05
600	67	5	2011-12-09 19:03:31.333354-05
601	68	5	2011-12-09 19:03:31.339525-05
602	69	5	2011-12-09 19:03:31.344111-05
603	66	5	2011-12-09 19:03:37.694412-05
604	67	5	2011-12-09 19:03:37.700786-05
605	68	5	2011-12-09 19:03:37.705917-05
606	69	5	2011-12-09 19:03:37.708604-05
607	66	5	2011-12-09 19:03:45.930604-05
608	67	5	2011-12-09 19:03:45.936477-05
609	68	5	2011-12-09 19:03:45.941584-05
610	69	5	2011-12-09 19:03:45.944195-05
611	66	5	2011-12-09 19:04:07.263976-05
612	67	5	2011-12-09 19:04:07.27037-05
613	68	5	2011-12-09 19:04:07.275481-05
614	69	5	2011-12-09 19:04:07.278277-05
615	66	5	2011-12-09 19:04:09.709206-05
616	67	5	2011-12-09 19:04:09.715271-05
617	68	5	2011-12-09 19:04:09.720237-05
618	69	5	2011-12-09 19:04:09.722836-05
619	66	5	2011-12-09 19:04:13.72508-05
620	67	5	2011-12-09 19:04:13.731436-05
621	68	5	2011-12-09 19:04:13.736768-05
622	69	5	2011-12-09 19:04:13.739524-05
623	66	5	2011-12-09 19:04:14.330503-05
624	67	5	2011-12-09 19:04:14.338994-05
625	68	5	2011-12-09 19:04:14.347606-05
626	69	5	2011-12-09 19:04:14.350482-05
627	66	5	2011-12-09 19:04:15.13942-05
628	67	5	2011-12-09 19:04:15.146352-05
629	68	5	2011-12-09 19:04:15.15192-05
630	69	5	2011-12-09 19:04:15.155571-05
631	66	5	2011-12-09 19:04:31.691079-05
632	67	5	2011-12-09 19:04:31.697414-05
633	68	5	2011-12-09 19:04:31.702849-05
634	69	5	2011-12-09 19:04:31.705657-05
635	66	5	2011-12-09 19:04:34.270616-05
636	67	5	2011-12-09 19:04:34.277038-05
637	68	5	2011-12-09 19:04:34.282963-05
638	69	5	2011-12-09 19:04:34.285642-05
639	124	5	2011-12-12 11:01:24.04068-05
\.


--
-- Data for Name: riskblock_riskblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY riskblock_riskblock (id, no_risk_copy, some_risk_copy, severe_risk_copy) FROM stdin;
1	From your answers, it doesn’t look like you are experiencing serious relationship conflict, but we would like you to continue learning about how to help your family or friends who may experiencing serious relationship conflict or intimate partner violence.	From your answers, it looks like there are some concerns about safety in your relationship. I’d like to ask a few more questions about how you are influenced by the relationship, and then I’d like to go through some steps of safety planning to make sure that you are prepared in case conflict gets out of hand.	From your answers, it looks like there is a serious concern about safety in your relationship. I’d like to ask a few more questions about how you are influenced by the relationship, and then I’d like to go through some steps of safety planning to make sure that you are prepared in case conflict gets out of hand. 
\.


--
-- Data for Name: servicesblock_servicesblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY servicesblock_servicesblock (id, description) FROM stdin;
\.


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	main	0001_initial	2011-10-20 18:02:14.520257-04
2	pagetree	0001_initial	2011-10-20 19:01:58.197487-04
3	main	0002_pagetree	2011-10-20 19:02:12.538257-04
4	pageblocks	0001_initial	2011-10-20 19:51:29.099098-04
5	main	0003_pageblocks	2011-10-20 19:51:32.730676-04
6	quizblock	0001_initial	2011-10-21 15:52:09.051191-04
7	main	0004_quizblock	2011-10-21 15:52:15.060603-04
8	wings_main	0001_initial	2011-11-03 20:27:13.402871-04
9	wings_main	0002_auto__add_field_participant_current_section	2011-11-03 20:28:32.525872-04
10	audioblock	0001_initial	2011-11-07 21:22:58.758824-05
11	helpblock	0001_initial	2011-11-07 21:22:59.380576-05
12	ssnmtreeblock	0001_initial	2011-11-07 21:23:00.044333-05
13	servicesblock	0001_initial	2011-11-07 21:23:00.667912-05
14	riskblock	0001_initial	2011-11-07 21:23:01.389007-05
15	exitmaterialsblock	0001_initial	2011-11-07 22:12:43.888206-05
16	audioblock	0002_auto__add_field_audioblock_audio_file	2011-11-09 20:11:26.073815-05
17	helpblock	0002_auto__add_field_helpblock_audio_file	2011-11-17 17:21:36.350609-05
18	riskblock	0002_auto__del_field_riskblock_description__add_field_riskblock_no_risk_cop	2011-12-06 21:48:00.747592-05
19	ssnmtreeblock	0002_auto__del_field_ssnmtreeblock_description__add_field_ssnmtreeblock_err	2011-12-14 23:30:41.746922-05
20	ssnmtreeblock	0003_auto__add_ssnmtreebox	2011-12-14 23:30:41.860014-05
21	ssnmtreeblock	0004_auto__add_ssnmtreeperson	2011-12-14 23:30:41.912516-05
22	ssnmtreeblock	0005_auto__add_ssnmtreesupporttype__add_field_ssnmtreeperson_name	2011-12-14 23:30:41.990049-05
23	ssnmtreeblock	0006_auto__add_field_ssnmtreebox_label	2011-12-14 23:30:42.039349-05
24	ssnmtreeblock	0007_auto__add_unique_ssnmtreebox_label__add_unique_ssnmtreesupporttype_lab	2011-12-14 23:30:42.096431-05
25	ssnmtreeblock	0008_auto	2011-12-14 23:30:42.172831-05
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeblock (id, error_copy, page_type) FROM stdin;
3		page_3
2		page_2
1	(ignore this)	page_1
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeblock_boxes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeblock_boxes (id, ssnmtreeblock_id, ssnmtreebox_id) FROM stdin;
22	3	1
23	3	2
24	3	3
25	3	4
26	3	5
27	2	1
28	2	2
29	2	3
30	2	4
31	2	5
32	1	1
33	1	2
34	1	3
35	1	4
36	1	5
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeblock_editable_support_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeblock_editable_support_types (id, ssnmtreeblock_id, ssnmtreesupporttype_id) FROM stdin;
7	3	1
8	2	2
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeblock_visible_support_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeblock_visible_support_types (id, ssnmtreeblock_id, ssnmtreesupporttype_id) FROM stdin;
10	3	1
11	3	2
12	2	2
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreebox; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreebox (id, pixels_from_top, pixels_from_left, label) FROM stdin;
2	290	100	box_2
1	130	60	box_1
3	50	50	box_3
4	250	80	box_4
5	200	30	box_5
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeperson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeperson (id, user_id, tree_box_id, name) FROM stdin;
2	5	1	mom
1	5	2	dad
3	5	3	helen
4	5	4	
5	5	5	
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeperson_support_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeperson_support_types (id, ssnmtreeperson_id, ssnmtreesupporttype_id) FROM stdin;
1	1	2
2	2	2
3	1	1
4	2	1
5	3	1
6	3	2
7	4	2
8	4	1
9	5	1
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreesupporttype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreesupporttype (id, label, description) FROM stdin;
1	Practical	Practical support
2	Emotional	Emotional support.
\.


--
-- Data for Name: tagging_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tagging_tag (id, name) FROM stdin;
\.


--
-- Data for Name: tagging_taggeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tagging_taggeditem (id, tag_id, content_type_id, object_id) FROM stdin;
\.


--
-- Data for Name: wings_main_participant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wings_main_participant (id, id_string, user_id, current_section_id) FROM stdin;
55	23	\N	\N
\.


--
-- Name: audioblock_audioblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY audioblock_audioblock
    ADD CONSTRAINT audioblock_audioblock_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: careermapblock_basemap_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY careermapblock_basemap
    ADD CONSTRAINT careermapblock_basemap_pkey PRIMARY KEY (id);


--
-- Name: careermapblock_careermap_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY careermapblock_careermap
    ADD CONSTRAINT careermapblock_careermap_pkey PRIMARY KEY (id);


--
-- Name: careermapblock_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY careermapblock_layer
    ADD CONSTRAINT careermapblock_layer_pkey PRIMARY KEY (id);


--
-- Name: careermapblock_question_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY careermapblock_question
    ADD CONSTRAINT careermapblock_question_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites_flatpage_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_key UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: exitmaterialsblock_exitmaterialsblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY exitmaterialsblock_exitmaterialsblock
    ADD CONSTRAINT exitmaterialsblock_exitmaterialsblock_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_category
    ADD CONSTRAINT fridgeblock_category_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_fridgeblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_fridgeblock
    ADD CONSTRAINT fridgeblock_fridgeblock_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_item
    ADD CONSTRAINT fridgeblock_item_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_magnet_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_magnet
    ADD CONSTRAINT fridgeblock_magnet_pkey PRIMARY KEY (id);


--
-- Name: fridgeblock_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fridgeblock_session
    ADD CONSTRAINT fridgeblock_session_pkey PRIMARY KEY (id);


--
-- Name: helpblock_helpblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY helpblock_helpblock
    ADD CONSTRAINT helpblock_helpblock_pkey PRIMARY KEY (id);


--
-- Name: main_stand_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY main_stand
    ADD CONSTRAINT main_stand_pkey PRIMARY KEY (id);


--
-- Name: main_standavailablepageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY main_standavailablepageblock
    ADD CONSTRAINT main_standavailablepageblock_pkey PRIMARY KEY (id);


--
-- Name: main_standgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY main_standgroup
    ADD CONSTRAINT main_standgroup_pkey PRIMARY KEY (id);


--
-- Name: main_standsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY main_standsetting
    ADD CONSTRAINT main_standsetting_pkey PRIMARY KEY (id);


--
-- Name: main_standuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY main_standuser
    ADD CONSTRAINT main_standuser_pkey PRIMARY KEY (id);


--
-- Name: munin_test_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY munin_test
    ADD CONSTRAINT munin_test_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_htmlblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pageblocks_htmlblock
    ADD CONSTRAINT pageblocks_htmlblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_htmlblockwysiwyg_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pageblocks_htmlblockwysiwyg
    ADD CONSTRAINT pageblocks_htmlblockwysiwyg_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_imageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pageblocks_imageblock
    ADD CONSTRAINT pageblocks_imageblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_imagepullquoteblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pageblocks_imagepullquoteblock
    ADD CONSTRAINT pageblocks_imagepullquoteblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_pullquoteblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pageblocks_pullquoteblock
    ADD CONSTRAINT pageblocks_pullquoteblock_pkey PRIMARY KEY (id);


--
-- Name: pageblocks_textblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pageblocks_textblock
    ADD CONSTRAINT pageblocks_textblock_pkey PRIMARY KEY (id);


--
-- Name: pagetree_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pagetree_hierarchy
    ADD CONSTRAINT pagetree_hierarchy_pkey PRIMARY KEY (id);


--
-- Name: pagetree_pageblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pageblock_pkey PRIMARY KEY (id);


--
-- Name: pagetree_section_path_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_path_key UNIQUE (path);


--
-- Name: pagetree_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_pkey PRIMARY KEY (id);


--
-- Name: quizblock_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY quizblock_answer
    ADD CONSTRAINT quizblock_answer_pkey PRIMARY KEY (id);


--
-- Name: quizblock_question_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY quizblock_question
    ADD CONSTRAINT quizblock_question_pkey PRIMARY KEY (id);


--
-- Name: quizblock_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY quizblock_quiz
    ADD CONSTRAINT quizblock_quiz_pkey PRIMARY KEY (id);


--
-- Name: quizblock_response_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_response_pkey PRIMARY KEY (id);


--
-- Name: quizblock_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_pkey PRIMARY KEY (id);


--
-- Name: riskblock_riskblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY riskblock_riskblock
    ADD CONSTRAINT riskblock_riskblock_pkey PRIMARY KEY (id);


--
-- Name: servicesblock_servicesblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY servicesblock_servicesblock
    ADD CONSTRAINT servicesblock_servicesblock_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreebl_ssnmtreeblock_id_1757f59bf81168ec_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_boxes
    ADD CONSTRAINT ssnmtreeblock_ssnmtreebl_ssnmtreeblock_id_1757f59bf81168ec_uniq UNIQUE (ssnmtreeblock_id, ssnmtreebox_id);


--
-- Name: ssnmtreeblock_ssnmtreebl_ssnmtreeblock_id_1b7adae98b329839_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_visible_support_types
    ADD CONSTRAINT ssnmtreeblock_ssnmtreebl_ssnmtreeblock_id_1b7adae98b329839_uniq UNIQUE (ssnmtreeblock_id, ssnmtreesupporttype_id);


--
-- Name: ssnmtreeblock_ssnmtreebl_ssnmtreeblock_id_42830aef3eddf5f8_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_editable_support_types
    ADD CONSTRAINT ssnmtreeblock_ssnmtreebl_ssnmtreeblock_id_42830aef3eddf5f8_uniq UNIQUE (ssnmtreeblock_id, ssnmtreesupporttype_id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_boxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_boxes
    ADD CONSTRAINT ssnmtreeblock_ssnmtreeblock_boxes_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_editable_support_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_editable_support_types
    ADD CONSTRAINT ssnmtreeblock_ssnmtreeblock_editable_support_types_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock
    ADD CONSTRAINT ssnmtreeblock_ssnmtreeblock_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_visible_support_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_visible_support_types
    ADD CONSTRAINT ssnmtreeblock_ssnmtreeblock_visible_support_types_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreebox_label_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreebox
    ADD CONSTRAINT ssnmtreeblock_ssnmtreebox_label_uniq UNIQUE (label);


--
-- Name: ssnmtreeblock_ssnmtreebox_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreebox
    ADD CONSTRAINT ssnmtreeblock_ssnmtreebox_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreepe_ssnmtreeperson_id_820eb0cfcf2d822_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeperson_support_types
    ADD CONSTRAINT ssnmtreeblock_ssnmtreepe_ssnmtreeperson_id_820eb0cfcf2d822_uniq UNIQUE (ssnmtreeperson_id, ssnmtreesupporttype_id);


--
-- Name: ssnmtreeblock_ssnmtreeperson_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeperson
    ADD CONSTRAINT ssnmtreeblock_ssnmtreeperson_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreeperson_support_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeperson_support_types
    ADD CONSTRAINT ssnmtreeblock_ssnmtreeperson_support_types_pkey PRIMARY KEY (id);


--
-- Name: ssnmtreeblock_ssnmtreesupporttype_label_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreesupporttype
    ADD CONSTRAINT ssnmtreeblock_ssnmtreesupporttype_label_uniq UNIQUE (label);


--
-- Name: ssnmtreeblock_ssnmtreesupporttype_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreesupporttype
    ADD CONSTRAINT ssnmtreeblock_ssnmtreesupporttype_pkey PRIMARY KEY (id);


--
-- Name: tagging_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_name_key UNIQUE (name);


--
-- Name: tagging_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_tag_id_content_type_id_object_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_content_type_id_object_id_key UNIQUE (tag_id, content_type_id, object_id);


--
-- Name: wings_main_participant_id_string_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wings_main_participant
    ADD CONSTRAINT wings_main_participant_id_string_key UNIQUE (id_string);


--
-- Name: wings_main_participant_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wings_main_participant
    ADD CONSTRAINT wings_main_participant_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: careermapblock_basemap_cmap_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX careermapblock_basemap_cmap_id ON careermapblock_basemap USING btree (cmap_id);


--
-- Name: careermapblock_layer_cmap_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX careermapblock_layer_cmap_id ON careermapblock_layer USING btree (cmap_id);


--
-- Name: careermapblock_question_cmap_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX careermapblock_question_cmap_id ON careermapblock_question USING btree (cmap_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_sites_flatpage_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_flatpage_sites_flatpage_id ON django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_flatpage_sites_site_id ON django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_flatpage_url ON django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_flatpage_url_like ON django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: fridgeblock_category_fridgeblock_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fridgeblock_category_fridgeblock_id ON fridgeblock_category USING btree (fridgeblock_id);


--
-- Name: fridgeblock_item_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fridgeblock_item_category_id ON fridgeblock_item USING btree (category_id);


--
-- Name: fridgeblock_magnet_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fridgeblock_magnet_item_id ON fridgeblock_magnet USING btree (item_id);


--
-- Name: fridgeblock_magnet_session_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fridgeblock_magnet_session_id ON fridgeblock_magnet USING btree (session_id);


--
-- Name: fridgeblock_session_fridgeblock_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fridgeblock_session_fridgeblock_id ON fridgeblock_session USING btree (fridgeblock_id);


--
-- Name: fridgeblock_session_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fridgeblock_session_user_id ON fridgeblock_session USING btree (user_id);


--
-- Name: main_stand_hostname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_stand_hostname ON main_stand USING btree (hostname);


--
-- Name: main_stand_hostname_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_stand_hostname_like ON main_stand USING btree (hostname varchar_pattern_ops);


--
-- Name: main_standavailablepageblock_block; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standavailablepageblock_block ON main_standavailablepageblock USING btree (block);


--
-- Name: main_standavailablepageblock_block_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standavailablepageblock_block_like ON main_standavailablepageblock USING btree (block varchar_pattern_ops);


--
-- Name: main_standavailablepageblock_stand_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standavailablepageblock_stand_id ON main_standavailablepageblock USING btree (stand_id);


--
-- Name: main_standgroup_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standgroup_group_id ON main_standgroup USING btree (group_id);


--
-- Name: main_standgroup_stand_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standgroup_stand_id ON main_standgroup USING btree (stand_id);


--
-- Name: main_standsetting_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standsetting_name ON main_standsetting USING btree (name);


--
-- Name: main_standsetting_name_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standsetting_name_like ON main_standsetting USING btree (name varchar_pattern_ops);


--
-- Name: main_standsetting_stand_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standsetting_stand_id ON main_standsetting USING btree (stand_id);


--
-- Name: main_standuser_stand_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standuser_stand_id ON main_standuser USING btree (stand_id);


--
-- Name: main_standuser_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX main_standuser_user_id ON main_standuser USING btree (user_id);


--
-- Name: pagetree_pageblock_content_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pagetree_pageblock_content_type_id ON pagetree_pageblock USING btree (content_type_id);


--
-- Name: pagetree_pageblock_section_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pagetree_pageblock_section_id ON pagetree_pageblock USING btree (section_id);


--
-- Name: pagetree_section_hierarchy_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pagetree_section_hierarchy_id ON pagetree_section USING btree (hierarchy_id);


--
-- Name: pagetree_section_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pagetree_section_slug ON pagetree_section USING btree (slug);


--
-- Name: pagetree_section_slug_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX pagetree_section_slug_like ON pagetree_section USING btree (slug varchar_pattern_ops);


--
-- Name: quizblock_answer_question_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX quizblock_answer_question_id ON quizblock_answer USING btree (question_id);


--
-- Name: quizblock_question_quiz_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX quizblock_question_quiz_id ON quizblock_question USING btree (quiz_id);


--
-- Name: quizblock_response_question_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX quizblock_response_question_id ON quizblock_response USING btree (question_id);


--
-- Name: quizblock_response_submission_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX quizblock_response_submission_id ON quizblock_response USING btree (submission_id);


--
-- Name: quizblock_submission_quiz_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX quizblock_submission_quiz_id ON quizblock_submission USING btree (quiz_id);


--
-- Name: quizblock_submission_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX quizblock_submission_user_id ON quizblock_submission USING btree (user_id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_boxes_ssnmtreeblock_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeblock_boxes_ssnmtreeblock_id ON ssnmtreeblock_ssnmtreeblock_boxes USING btree (ssnmtreeblock_id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_boxes_ssnmtreebox_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeblock_boxes_ssnmtreebox_id ON ssnmtreeblock_ssnmtreeblock_boxes USING btree (ssnmtreebox_id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_editable_support_types_ssnmtreebloc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeblock_editable_support_types_ssnmtreebloc ON ssnmtreeblock_ssnmtreeblock_editable_support_types USING btree (ssnmtreeblock_id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_editable_support_types_ssnmtreesupp; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeblock_editable_support_types_ssnmtreesupp ON ssnmtreeblock_ssnmtreeblock_editable_support_types USING btree (ssnmtreesupporttype_id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_visible_support_types_ssnmtreeblock; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeblock_visible_support_types_ssnmtreeblock ON ssnmtreeblock_ssnmtreeblock_visible_support_types USING btree (ssnmtreeblock_id);


--
-- Name: ssnmtreeblock_ssnmtreeblock_visible_support_types_ssnmtreesuppo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeblock_visible_support_types_ssnmtreesuppo ON ssnmtreeblock_ssnmtreeblock_visible_support_types USING btree (ssnmtreesupporttype_id);


--
-- Name: ssnmtreeblock_ssnmtreeperson_support_types_ssnmtreeperson_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeperson_support_types_ssnmtreeperson_id ON ssnmtreeblock_ssnmtreeperson_support_types USING btree (ssnmtreeperson_id);


--
-- Name: ssnmtreeblock_ssnmtreeperson_support_types_ssnmtreesupporttype_; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeperson_support_types_ssnmtreesupporttype_ ON ssnmtreeblock_ssnmtreeperson_support_types USING btree (ssnmtreesupporttype_id);


--
-- Name: ssnmtreeblock_ssnmtreeperson_tree_box_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeperson_tree_box_id ON ssnmtreeblock_ssnmtreeperson USING btree (tree_box_id);


--
-- Name: ssnmtreeblock_ssnmtreeperson_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ssnmtreeblock_ssnmtreeperson_user_id ON ssnmtreeblock_ssnmtreeperson USING btree (user_id);


--
-- Name: tagging_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tagging_taggeditem_content_type_id ON tagging_taggeditem USING btree (content_type_id);


--
-- Name: tagging_taggeditem_object_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tagging_taggeditem_object_id ON tagging_taggeditem USING btree (object_id);


--
-- Name: tagging_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tagging_taggeditem_tag_id ON tagging_taggeditem USING btree (tag_id);


--
-- Name: wings_main_participant_current_section_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wings_main_participant_current_section_id ON wings_main_participant USING btree (current_section_id);


--
-- Name: wings_main_participant_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wings_main_participant_user_id ON wings_main_participant USING btree (user_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: careermapblock_basemap_cmap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY careermapblock_basemap
    ADD CONSTRAINT careermapblock_basemap_cmap_id_fkey FOREIGN KEY (cmap_id) REFERENCES careermapblock_careermap(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: careermapblock_layer_cmap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY careermapblock_layer
    ADD CONSTRAINT careermapblock_layer_cmap_id_fkey FOREIGN KEY (cmap_id) REFERENCES careermapblock_careermap(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: careermapblock_question_cmap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY careermapblock_question
    ADD CONSTRAINT careermapblock_question_cmap_id_fkey FOREIGN KEY (cmap_id) REFERENCES careermapblock_careermap(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: current_section_id_refs_id_4fd733bc404536c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wings_main_participant
    ADD CONSTRAINT current_section_id_refs_id_4fd733bc404536c0 FOREIGN KEY (current_section_id) REFERENCES pagetree_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flatpage_id_refs_id_c0e84f5a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT flatpage_id_refs_id_c0e84f5a FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_category_fridgeblock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fridgeblock_category
    ADD CONSTRAINT fridgeblock_category_fridgeblock_id_fkey FOREIGN KEY (fridgeblock_id) REFERENCES fridgeblock_fridgeblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_item_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fridgeblock_item
    ADD CONSTRAINT fridgeblock_item_category_id_fkey FOREIGN KEY (category_id) REFERENCES fridgeblock_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_magnet_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fridgeblock_magnet
    ADD CONSTRAINT fridgeblock_magnet_item_id_fkey FOREIGN KEY (item_id) REFERENCES fridgeblock_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_magnet_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fridgeblock_magnet
    ADD CONSTRAINT fridgeblock_magnet_session_id_fkey FOREIGN KEY (session_id) REFERENCES fridgeblock_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_session_fridgeblock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fridgeblock_session
    ADD CONSTRAINT fridgeblock_session_fridgeblock_id_fkey FOREIGN KEY (fridgeblock_id) REFERENCES fridgeblock_fridgeblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fridgeblock_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fridgeblock_session
    ADD CONSTRAINT fridgeblock_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standavailablepageblock_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY main_standavailablepageblock
    ADD CONSTRAINT main_standavailablepageblock_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standgroup_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY main_standgroup
    ADD CONSTRAINT main_standgroup_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standgroup_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY main_standgroup
    ADD CONSTRAINT main_standgroup_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standsetting_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY main_standsetting
    ADD CONSTRAINT main_standsetting_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standuser_stand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY main_standuser
    ADD CONSTRAINT main_standuser_stand_id_fkey FOREIGN KEY (stand_id) REFERENCES main_stand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_standuser_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY main_standuser
    ADD CONSTRAINT main_standuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_pageblock_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pageblock_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_pageblock_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetree_pageblock
    ADD CONSTRAINT pagetree_pageblock_section_id_fkey FOREIGN KEY (section_id) REFERENCES pagetree_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagetree_section_hierarchy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagetree_section
    ADD CONSTRAINT pagetree_section_hierarchy_id_fkey FOREIGN KEY (hierarchy_id) REFERENCES pagetree_hierarchy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_answer_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizblock_answer
    ADD CONSTRAINT quizblock_answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES quizblock_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_question_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizblock_question
    ADD CONSTRAINT quizblock_question_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES quizblock_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_response_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_response_question_id_fkey FOREIGN KEY (question_id) REFERENCES quizblock_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_response_submission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizblock_response
    ADD CONSTRAINT quizblock_response_submission_id_fkey FOREIGN KEY (submission_id) REFERENCES quizblock_submission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_submission_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES quizblock_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quizblock_submission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizblock_submission
    ADD CONSTRAINT quizblock_submission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreeblock_id_refs_id_2255450f40fc3a48; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_visible_support_types
    ADD CONSTRAINT ssnmtreeblock_id_refs_id_2255450f40fc3a48 FOREIGN KEY (ssnmtreeblock_id) REFERENCES ssnmtreeblock_ssnmtreeblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreeblock_id_refs_id_2eb137987b0d67f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_editable_support_types
    ADD CONSTRAINT ssnmtreeblock_id_refs_id_2eb137987b0d67f9 FOREIGN KEY (ssnmtreeblock_id) REFERENCES ssnmtreeblock_ssnmtreeblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreeblock_id_refs_id_6d3aa1792be28447; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_boxes
    ADD CONSTRAINT ssnmtreeblock_id_refs_id_6d3aa1792be28447 FOREIGN KEY (ssnmtreeblock_id) REFERENCES ssnmtreeblock_ssnmtreeblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreebox_id_refs_id_690738d9292ed271; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_boxes
    ADD CONSTRAINT ssnmtreebox_id_refs_id_690738d9292ed271 FOREIGN KEY (ssnmtreebox_id) REFERENCES ssnmtreeblock_ssnmtreebox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreeperson_id_refs_id_7dbc5c667216cfa5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeperson_support_types
    ADD CONSTRAINT ssnmtreeperson_id_refs_id_7dbc5c667216cfa5 FOREIGN KEY (ssnmtreeperson_id) REFERENCES ssnmtreeblock_ssnmtreeperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreesupporttype_id_refs_id_35fd9d349ad69a05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_editable_support_types
    ADD CONSTRAINT ssnmtreesupporttype_id_refs_id_35fd9d349ad69a05 FOREIGN KEY (ssnmtreesupporttype_id) REFERENCES ssnmtreeblock_ssnmtreesupporttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreesupporttype_id_refs_id_44297c13e48bcaa0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeperson_support_types
    ADD CONSTRAINT ssnmtreesupporttype_id_refs_id_44297c13e48bcaa0 FOREIGN KEY (ssnmtreesupporttype_id) REFERENCES ssnmtreeblock_ssnmtreesupporttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ssnmtreesupporttype_id_refs_id_49256b7cc75157c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeblock_visible_support_types
    ADD CONSTRAINT ssnmtreesupporttype_id_refs_id_49256b7cc75157c4 FOREIGN KEY (ssnmtreesupporttype_id) REFERENCES ssnmtreeblock_ssnmtreesupporttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tagging_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tree_box_id_refs_id_515ef2e97e3c6ffe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeperson
    ADD CONSTRAINT tree_box_id_refs_id_515ef2e97e3c6ffe FOREIGN KEY (tree_box_id) REFERENCES ssnmtreeblock_ssnmtreebox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_493cdd86ee08451f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ssnmtreeblock_ssnmtreeperson
    ADD CONSTRAINT user_id_refs_id_493cdd86ee08451f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wings_main_participant_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wings_main_participant
    ADD CONSTRAINT wings_main_participant_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

