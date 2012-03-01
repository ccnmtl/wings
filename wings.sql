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

SELECT pg_catalog.setval('audioblock_audioblock_id_seq', 111, true);


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

SELECT pg_catalog.setval('auth_message_id_seq', 882, true);


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

SELECT pg_catalog.setval('auth_permission_id_seq', 159, true);


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

SELECT pg_catalog.setval('auth_user_groups_id_seq', 99, true);


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

SELECT pg_catalog.setval('auth_user_id_seq', 184, true);


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

SELECT pg_catalog.setval('django_admin_log_id_seq', 453, true);


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

SELECT pg_catalog.setval('django_content_type_id_seq', 54, true);


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

SELECT pg_catalog.setval('django_flatpage_id_seq', 2, true);


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

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 5, true);


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

SELECT pg_catalog.setval('helpblock_helpblock_id_seq', 90, true);


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

SELECT pg_catalog.setval('pageblocks_htmlblock_id_seq', 46, true);


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

SELECT pg_catalog.setval('pageblocks_imageblock_id_seq', 17, true);


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

SELECT pg_catalog.setval('pageblocks_imagepullquoteblock_id_seq', 21, true);


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

SELECT pg_catalog.setval('pageblocks_textblock_id_seq', 109, true);


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

SELECT pg_catalog.setval('pagetree_pageblock_id_seq', 536, true);


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

SELECT pg_catalog.setval('pagetree_section_id_seq', 224, true);


--
-- Name: pastquizanswersblock_pastquizanswersblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pastquizanswersblock_pastquizanswersblock (
    id integer NOT NULL,
    description text NOT NULL,
    copy text NOT NULL
);


--
-- Name: pastquizanswersblock_pastquizanswersblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pastquizanswersblock_pastquizanswersblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pastquizanswersblock_pastquizanswersblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pastquizanswersblock_pastquizanswersblock_id_seq OWNED BY pastquizanswersblock_pastquizanswersblock.id;


--
-- Name: pastquizanswersblock_pastquizanswersblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pastquizanswersblock_pastquizanswersblock_id_seq', 1, true);


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

SELECT pg_catalog.setval('quizblock_answer_id_seq', 664, true);


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

SELECT pg_catalog.setval('quizblock_question_id_seq', 245, true);


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

SELECT pg_catalog.setval('quizblock_quiz_id_seq', 128, true);


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

SELECT pg_catalog.setval('quizblock_response_id_seq', 4064, true);


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

SELECT pg_catalog.setval('quizblock_submission_id_seq', 3938, true);


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
-- Name: servicesblock_narroweddownanswer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE servicesblock_narroweddownanswer (
    id integer NOT NULL,
    user_id integer NOT NULL,
    answer_id integer,
    question_id integer NOT NULL
);


--
-- Name: servicesblock_narroweddownanswer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE servicesblock_narroweddownanswer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: servicesblock_narroweddownanswer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE servicesblock_narroweddownanswer_id_seq OWNED BY servicesblock_narroweddownanswer.id;


--
-- Name: servicesblock_narroweddownanswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('servicesblock_narroweddownanswer_id_seq', 40, true);


--
-- Name: servicesblock_serviceprovider; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE servicesblock_serviceprovider (
    id integer NOT NULL,
    issue_id integer,
    name text,
    phone text,
    url text,
    address text,
    map_image character varying(100),
    description text
);


--
-- Name: servicesblock_serviceprovider_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE servicesblock_serviceprovider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: servicesblock_serviceprovider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE servicesblock_serviceprovider_id_seq OWNED BY servicesblock_serviceprovider.id;


--
-- Name: servicesblock_serviceprovider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('servicesblock_serviceprovider_id_seq', 35, true);


--
-- Name: servicesblock_servicesblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE servicesblock_servicesblock (
    id integer NOT NULL,
    description text NOT NULL,
    page_type text NOT NULL
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

SELECT pg_catalog.setval('servicesblock_servicesblock_id_seq', 6, true);


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

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 36, true);


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

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_boxes_id_seq', 46, true);


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

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_editable_support_types_id_seq', 9, true);


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

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_id_seq', 4, true);


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

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeblock_visible_support_types_id_seq', 16, true);


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

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeperson_id_seq', 240, true);


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

SELECT pg_catalog.setval('ssnmtreeblock_ssnmtreeperson_support_types_id_seq', 186, true);


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
    id_string bigint NOT NULL,
    user_id integer,
    current_section_id integer,
    created_on timestamp with time zone NOT NULL
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

SELECT pg_catalog.setval('wings_main_participant_id_seq', 122, true);


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

ALTER TABLE pastquizanswersblock_pastquizanswersblock ALTER COLUMN id SET DEFAULT nextval('pastquizanswersblock_pastquizanswersblock_id_seq'::regclass);


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

ALTER TABLE servicesblock_narroweddownanswer ALTER COLUMN id SET DEFAULT nextval('servicesblock_narroweddownanswer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE servicesblock_serviceprovider ALTER COLUMN id SET DEFAULT nextval('servicesblock_serviceprovider_id_seq'::regclass);


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
44		audio_file/2012/01/11/screening_question_18.mp3
26		audio_file/2012/01/04/screening_question_3.mp3
2		audio_file/2012/01/04/intro_relationships.mp3
27		audio_file/2012/01/04/screening_question_4.mp3
3		audio_file/2012/01/04/intro_cycle_of_viole.mp3
4		audio_file/2012/01/04/intro_types_of_confl.mp3
5		audio_file/2012/01/04/intro_physical_abuse.mp3
28		audio_file/2012/01/04/screening_question_5.mp3
6		audio_file/2012/01/04/intro_emotional_abus.mp3
7		audio_file/2012/01/04/intro_sexual_abuse.mp3
8		audio_file/2012/01/04/intro_economic_abuse.mp3
45		audio_file/2012/01/11/screening_question_19.mp3
9		audio_file/2012/01/04/intro_drug_use_and_i.mp3
30		audio_file/2012/01/09/screening_for_ipv.mp3
10		audio_file/2012/01/04/intro_how_common_is_.mp3
11		audio_file/2012/01/04/intro_negative_conse.mp3
12		audio_file/2012/01/04/intro_effects_on_chi.mp3
31		audio_file/2012/01/09/intro_drug_use_and_i.mp3
13		audio_file/2012/01/04/intro_alcohol_drugs_.mp3
76		audio_file/2012/01/12/strategies_during_a_violent_incident_11.mp3
14		audio_file/2012/01/04/intro_anger_and_figh.mp3
29		audio_file/2012/01/11/screening_question_6.mp3
15		audio_file/2012/01/04/screening_question_1.mp3
16		audio_file/2012/01/04/cons_of_relationship.mp3
46		audio_file/2012/01/11/screening_question_20.mp3
32		audio_file/2012/01/11/screening_question_7.mp3
18		audio_file/2012/01/04/empowerment_intro.mp3
33		audio_file/2012/01/11/screening_question_8.mp3
64		audio_file/2012/01/12/other_concerns_that_i_have.mp3
20		audio_file/2012/01/04/safety_intro.mp3
34		audio_file/2012/01/11/screening_question_9.mp3
19		audio_file/2012/01/04/strategies_during_a_.mp3
21		audio_file/2012/01/04/safety_when_preparin.mp3
47		audio_file/2012/01/11/screening_question_21.mp3
22		audio_file/2012/01/04/preparing-to-leave-1.mp3
24		audio_file/2012/01/04/service_referrals.mp3
25		audio_file/2012/01/04/screening_question_2.mp3
48		audio_file/2012/01/11/screening_question_22.mp3
49		audio_file/2012/01/11/screening_question_23.mp3
65		audio_file/2012/01/12/how_relationship_conflict_makes_you_feel.mp3
50		audio_file/2012/01/11/screening_question_24.mp3
51		audio_file/2012/01/11/screening_question_25.mp3
52		audio_file/2012/01/12/cons_question_1.mp3
68		audio_file/2012/01/12/strategies_during_a_violent_incident_4.mp3
53		audio_file/2012/01/12/cons_question_2.mp3
35		audio_file/2012/01/11/screening_question_10.mp3
54		audio_file/2012/01/12/cons_question_3.mp3
36		audio_file/2012/01/11/screening_question_11.mp3
73		audio_file/2012/01/12/strategies_during_a_violent_incident_9.mp3
55		audio_file/2012/01/12/cons_question_4.mp3
37		audio_file/2012/01/11/screening_question_12.mp3
38		audio_file/2012/01/11/screening_question_13.mp3
69		audio_file/2012/01/12/strategies_during_a_violent_incident_5.mp3
39		audio_file/2012/01/11/screening_question_14.mp3
56		audio_file/2012/01/12/cons_question_5.mp3
41		audio_file/2012/01/11/screening_question_15.mp3
42		audio_file/2012/01/11/screening_question_16.mp3
43		audio_file/2012/01/11/screening_question_17.mp3
57		audio_file/2012/01/12/cons_question_6.mp3
58		audio_file/2012/01/12/cons_question_7.mp3
59		audio_file/2012/01/12/cons_question_8.mp3
60		audio_file/2012/01/12/cons_question_9.mp3
61		audio_file/2012/01/12/cons_question_10.mp3
62		audio_file/2012/01/12/cons_question_11.mp3
78		audio_file/2012/01/12/preparing_to_leave_1.mp3
63		audio_file/2012/01/12/cons-question-12.mp3
70		audio_file/2012/01/12/strategies_during_a_violent_incident_6.mp3
79		audio_file/2012/01/12/preparing_to_leave_2.mp3
75		audio_file/2012/01/12/strategies_during_a_violent_incident_10.mp3
74		audio_file/2012/01/12/strategies_during_a_violent_incident_try.mp3
71		audio_file/2012/01/12/cons_question_7.mp3
66		audio_file/2012/01/12/strategies_during_a_violent_incident_2.mp3
67		audio_file/2012/01/12/strategies_during_a_violent_incident_3.mp3
72		audio_file/2012/01/12/strategies_during_a_violent_incident_8.mp3
83		audio_file/2012/01/12/preparing-to-leave-7.mp3
80		audio_file/2012/01/12/preparing_to_leave_3.mp3
85		audio_file/2012/01/12/preparing-to-leave-10.mp3
84		audio_file/2012/01/12/preparing-to-leave-8.mp3
81		audio_file/2012/01/12/preparing_to_leave_5.mp3
82		audio_file/2012/01/12/preparing_to_leave_6.mp3
86		audio_file/2012/01/12/preparing-to-leave-11.mp3
87		audio_file/2012/01/12/preparing-to-leave-12.mp3
88		audio_file/2012/01/12/preparing-to-leave-13.mp3
89		audio_file/2012/01/12/tree_state_1.mp3
23		audio_file/2012/01/12/tree_state_2.mp3
90		audio_file/2012/01/12/tree_state_3.mp3
91		audio_file/2012/01/12/steps_to_increase_support.mp3
92		audio_file/2012/01/12/goal_setting.mp3
93		audio_file/2012/01/12/issues_that_trigger_conflict.mp3
108		audio_file/2012/01/23/reasons_to_reduce_conflict_wrapup.mp3
107		audio_file/2012/01/23/intro_to_events_over_past_year.mp3
94		audio_file/2012/01/23/resources_to_help_you_towards_your_goals.mp3
110		audio_file/2012/01/24/strategies_during_a_violent_incident-9_5.mp3
111		audio_file/2012/01/24/reasons_to_reduce_conflict_intro.mp3
95		audio_file/2012/02/13/drill_down_one.mp3
96		audio_file/2012/02/13/drill_down_two.mp3
98		audio_file/2012/02/15/getting_a_copy.mp3
97		audio_file/2012/02/15/action_plan.mp3
99		audio_file/2012/02/15/wrap_up_and_goodbye.mp3
106		audio_file/2012/02/15/reasons_to_reduce_conflict_7.mp3
100		audio_file/2012/02/23/reasons_to_reduce_conflict_1.mp3
101		audio_file/2012/02/23/reasons_to_reduce_conflict_2.mp3
102		audio_file/2012/02/23/reasons_to_reduce_conflict_3.mp3
103		audio_file/2012/02/23/reasons_to_reduce_conflict_4.mp3
104		audio_file/2012/02/23/reasons_to_reduce_conflict_5.mp3
105		audio_file/2012/02/23/reasons_to_reduce_conflict_6.mp3
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
1	staff.cunix.local:columbia.edu
2	tlc.cunix.local:columbia.edu
3	tlcxml.cunix.local:columbia.edu
4	ALL_CU
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
800	124	Logged in!
862	176	Logged in!
824	174	Logged in!
849	173	Logged in!
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
154	Can add Services: Narrowed Down Answer	52	add_narroweddownanswer
155	Can change Services: Narrowed Down Answer	52	change_narroweddownanswer
156	Can delete Services: Narrowed Down Answer	52	delete_narroweddownanswer
157	Can add service provider	53	add_serviceprovider
158	Can change service provider	53	change_serviceprovider
159	Can delete service provider	53	delete_serviceprovider
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
16	dg2121	Dawn	Goddard-Eckrich	dg2121@columbia.edu	sha1$e64ac$410763a83e7bb1616dfc21685e2e6e12001fd637	t	t	f	2011-10-17 11:44:00-04	2011-10-17 11:44:00-04
4	zm4	Zarina	Mustapha	zm4@columbia.edu	!	f	t	f	2011-06-02 15:21:46.02636-04	2011-06-02 15:21:46.026372-04
6	amm8	A.	Matiz	amm8@columbia.edu	!	f	t	f	2011-06-02 15:22:30.926288-04	2011-06-02 15:22:30.926301-04
9	mar227	Marc	Raymond	mar227@columbia.edu	!	f	t	f	2011-06-02 15:23:00.029295-04	2011-06-02 15:23:00.029307-04
10	sld2131	Susan	Dreher	sld2131@columbia.edu	!	f	t	f	2011-06-02 15:23:17.279174-04	2011-06-02 15:23:17.279188-04
14	lg123	Louisa	Gilbert	lg123@columbia.edu	sha1$409e7$0a5083fc4b9db06284e2388e171179de9ed03748	t	t	f	2011-10-17 11:43:30-04	2011-10-17 11:43:30-04
11	cks2120	Cindy	Smalletz	cks2120@columbia.edu	!	t	t	f	2011-08-25 18:01:26.073388-04	2011-06-20 15:02:19.998826-04
2	jb2410	Jonah	Bossewitch	jb2410@columbia.edu	!	t	t	t	2011-09-15 17:53:14.469942-04	2011-06-01 14:35:19.53697-04
1	anp8	Anders	Pearson	anp8@columbia.edu	!	t	t	t	2011-10-24 11:37:17.52734-04	2011-05-18 15:57:36.886786-04
12	jl3562	June	Levine	jl3562@columbia.edu	sha1$af08e$f226be5974f594bbe22a4cf35a8a064a406dd4e6	f	t	f	2011-07-20 15:04:51.859021-04	2011-07-20 15:04:51.831345-04
172	121212121212				!	f	t	f	2012-02-24 12:55:46.543746-05	2012-02-21 10:03:46.879003-05
8	ed2198	Elizabeth	Day	ed2198@columbia.edu	sha1$79a42$f540acf3140449844ab34c4ea8f4316ac9fb71e0	t	t	t	2012-01-27 16:30:47.692487-05	2011-06-02 15:22:48.818126-04
173	simone				sha1$8bb62$6047a2ca056c3268097855eda196ce6d3b21c3c1	t	t	f	2012-02-24 13:15:46.03539-05	2012-02-24 12:03:12-05
177	248248248248				!	f	t	f	2012-02-24 13:15:55.567899-05	2012-02-24 12:46:05.179717-05
171	999999999999				!	f	t	f	2012-02-20 16:43:39.34772-05	2012-02-20 14:03:42.792225-05
124	casi				sha1$92c83$216ed4e0c9a87d9d46f583a6763f11470a8cd2f5	t	t	f	2012-02-20 16:52:44.220477-05	2012-01-05 16:44:20-05
180	122224124115				!	f	t	f	2012-02-27 12:22:58.831365-05	2012-02-24 12:47:58.471026-05
175	stacey				sha1$22b1e$dbbcd855fe8c4254706e7464702c86948c0e745e	f	t	f	2012-02-24 12:03:49.85688-05	2012-02-24 12:03:49.856896-05
162	marc				sha1$b235f$17e295bad3044fc7261fcd372a53c5f986b7627e	t	t	t	2012-02-28 16:36:58.142916-05	2012-01-30 10:16:57-05
13	jr2502	Jessica	Rowe	jr2502@columbia.edu	sha1$156db$0309acb8024af5d8281e01e6c209e806921a0435	t	t	t	2012-02-29 13:58:57.531649-05	2011-10-11 11:39:54-04
109	ccnmtl				sha1$39038$3319c0dad839fcbabecd0f37add7dd8aef2b816e	t	t	t	2012-02-29 17:23:31.962139-05	2011-12-09 15:38:04-05
15	sas2268	Stacey	Shaw	sas2268@columbia.edu	sha1$8383f$c78ba31d659db8e6286366fe2c7e47dc678c5407	t	t	f	2012-02-24 12:22:39.48181-05	2011-10-17 11:43:47-04
179	127224124597				!	f	t	f	2012-02-24 12:46:07.125922-05	2012-02-24 12:46:07.117693-05
81	jesstest				sha1$57671$5b8c7dbe93ccf1a55d8fb03c0ec096f20354bb4a	t	t	f	2011-11-11 13:11:11.975745-05	2011-11-11 13:07:30-05
176	brittany				sha1$7bf0b$a398a506907b4314b983ee1c138d09e8dcf71a48	t	t	f	2012-02-27 11:45:47.937444-05	2012-02-24 12:05:15-05
182	sdreher				sha1$23bfa$21281c327af1a40b0881bf1347136a620e166f92	t	t	t	2012-02-28 08:15:15.040863-05	2012-02-27 09:19:13-05
183	123123123122				!	f	t	f	2012-02-28 16:37:10.062143-05	2012-02-28 10:43:24.035853-05
174	denise				sha1$7a3b7$1d34f81473d576cad552c9ae2b34498d51488adf	t	t	f	2012-02-24 12:23:21.426257-05	2012-02-24 12:03:31-05
184	454545454545				!	f	t	f	2012-02-29 13:52:08.277517-05	2012-02-29 13:52:08.208866-05
178	343434343434				!	f	t	f	2012-02-24 12:46:05.552373-05	2012-02-24 12:46:05.541937-05
181	989898989898				!	f	t	f	2012-02-29 19:00:16.809377-05	2012-02-24 14:32:12.103822-05
5	eddie	Edward	Rubeiz	egr2107@columbia.edu	sha1$fb341$7dcb9403cb4e538d1bfefd33a87891bf4b7b72b4	t	t	t	2012-02-29 19:01:46.907741-05	2011-06-02 15:22:04-04
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
91	14	49
92	16	49
93	15	49
94	124	49
95	174	49
96	173	49
98	176	49
99	182	49
34	2	4
38	11	2
44	11	4
45	12	4
46	8	2
47	8	4
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
86	2011-11-09 16:28:20.253492-05	13	42	27	P89766	1	
87	2011-11-11 10:55:04.700669-05	13	42	28	P354657	1	
88	2011-11-11 13:07:30.526252-05	13	3	81	jesstest	1	
89	2011-11-11 13:10:49.871711-05	13	3	81	jesstest	2	Changed is_staff.
92	2011-11-16 15:06:37.556566-05	13	42	30	P654879	1	
93	2011-11-16 15:08:36.423525-05	13	42	31	P436789	1	
94	2011-11-16 15:09:22.882313-05	13	42	31	P436789	2	No fields changed.
95	2011-11-16 15:09:37.952475-05	13	42	30	P654879	2	No fields changed.
96	2011-11-16 15:10:38.166637-05	13	2	49	facilitator	2	Changed permissions.
97	2011-11-16 15:12:11.625516-05	5	2	49	facilitator	2	Changed permissions.
101	2011-11-22 16:28:41.361795-05	5	42	33	P46464	1	
102	2011-11-22 16:38:06.141213-05	5	42	34	P78787	1	
103	2011-11-23 11:36:02.832864-05	13	42	35	P357098	1	
104	2011-11-23 12:23:01.46841-05	13	42	36	P143567	1	
105	2011-11-23 14:12:00.056842-05	13	42	37	P132456	1	
106	2011-11-28 09:14:11.591113-05	13	42	38	P98765	1	
107	2011-11-28 11:36:17.910686-05	5	3	68	98765	3	
108	2011-11-28 11:37:00.80958-05	5	3	95	98765	3	
109	2011-11-28 13:53:51.016733-05	13	42	39	P475820	1	
112	2011-11-30 13:30:16.654723-05	5	42	42	P242424242	1	
118	2011-12-02 13:32:31.126187-05	13	42	42	P242424242	2	No fields changed.
120	2011-12-05 10:39:04.00124-05	5	42	49	P231	1	
121	2011-12-05 16:12:33.26145-05	5	42	50	P11111	1	
122	2011-12-05 16:14:31.802444-05	5	42	51	P111111111	1	
123	2011-12-06 17:33:34.210751-05	5	42	51	P111111111	3	
124	2011-12-09 15:38:04.303734-05	5	3	109	ccnmtl	1	
125	2011-12-09 15:38:17.281702-05	5	3	109	ccnmtl	2	Changed is_staff and is_superuser.
126	2011-12-09 15:46:36.621314-05	5	3	109	ccnmtl	2	Changed user_permissions and groups.
127	2011-12-09 15:59:10.070094-05	109	42	52	P54321	1	
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
201	2011-12-15 15:57:48.316557-05	5	49	5	box_5 ( 30 , 200)	2	No fields changed.
202	2011-12-15 15:57:54.112757-05	5	49	4	box_4 ( 80 , 250)	2	No fields changed.
203	2011-12-15 15:58:05.322849-05	5	49	2	box_2 ( 333 , 225)	2	Changed pixels_from_top and pixels_from_left.
204	2011-12-15 16:18:47.816891-05	109	42	56	P344656756	1	
205	2011-12-16 09:49:43.970511-05	13	42	57	P256789	1	
206	2011-12-16 10:31:53.550949-05	5	42	58	P4	1	
207	2011-12-16 12:45:01.298669-05	109	49	5	box_5 ( 30 , 315)	2	Changed pixels_from_top.
208	2011-12-16 12:45:10.176572-05	109	49	4	box_4 ( 260 , 10)	2	Changed pixels_from_top and pixels_from_left.
209	2011-12-16 12:45:18.611537-05	109	49	3	box_3 ( 100 , 30)	2	Changed pixels_from_top and pixels_from_left.
210	2011-12-16 12:45:28.791224-05	109	49	2	box_2 ( 300 , 160)	2	Changed pixels_from_top and pixels_from_left.
211	2011-12-16 12:45:41.803203-05	109	49	1	box_1 ( 5 , 175)	2	Changed pixels_from_top and pixels_from_left.
213	2011-12-20 16:19:07.731086-05	5	42	60	P9999999	1	
214	2011-12-21 10:54:47.640026-05	5	42	61	P9999999	1	
215	2012-01-04 10:20:20.876175-05	13	42	62	P357159	1	
216	2012-01-04 17:55:46.474349-05	5	53	1	ServiceProvider object	1	
217	2012-01-04 17:56:01.270835-05	5	53	2	ServiceProvider object	1	
218	2012-01-05 10:30:36.196692-05	5	53	3	ServiceProvider object	1	
219	2012-01-05 15:04:35.602672-05	13	42	63	P159753	1	
220	2012-01-05 15:13:05.501556-05	13	42	64	P143680	1	
221	2012-01-05 15:19:50.55494-05	13	42	65	P444444	1	
222	2012-01-05 16:44:20.440261-05	13	3	124	casi	1	
223	2012-01-05 16:45:35.788623-05	13	3	124	casi	2	Changed is_staff.
224	2012-01-05 16:49:32.664189-05	13	3	124	casi	2	Changed is_superuser.
226	2012-01-09 10:13:29.164005-05	13	53	2	ServiceProvider object	2	Changed map_image.
227	2012-01-09 10:14:38.291387-05	13	53	4	ServiceProvider object	1	
228	2012-01-09 14:14:37.051279-05	13	42	67	P9999999	1	
229	2012-01-11 10:21:21.465279-05	109	42	68	P33489576	1	
230	2012-01-12 13:51:02.434857-05	5	45	2	Social Support Map: Emotional Support [1]: 	2	Changed boxes and visible_support_types.
231	2012-01-12 17:32:48.387001-05	5	45	4	exit materials [2]: 	2	Changed boxes and visible_support_types.
232	2012-01-12 17:34:03.012501-05	5	42	69	P9999999	1	
233	2012-01-12 19:17:07.38842-05	5	42	70	P9999999	1	
234	2012-01-13 11:14:24.127051-05	13	42	71	P474747	1	
235	2012-01-13 15:18:21.41136-05	5	42	72	P9999999	1	
236	2012-01-17 13:02:42.647719-05	13	42	73	P80808	1	
237	2012-01-17 13:51:24.94326-05	5	42	74	P9999999	1	
238	2012-01-17 14:13:59.212302-05	109	42	75	P9999999	1	
239	2012-01-17 19:24:39.611884-05	5	42	76	P9999999	1	
240	2012-01-18 11:12:24.097521-05	5	42	77	P2	1	
241	2012-01-18 13:18:17.864484-05	5	42	78	P9999999	1	
242	2012-01-18 15:59:28.774809-05	5	42	79	P9999999	1	
243	2012-01-18 16:11:13.562902-05	5	42	80	P9999999	1	
244	2012-01-18 16:13:32.759183-05	5	42	81	P9999999	1	
245	2012-01-18 17:17:02.095562-05	5	42	82	P9999999	1	
246	2012-01-18 17:20:33.207731-05	5	42	83	P9999999	1	
247	2012-01-18 18:13:52.422498-05	5	42	84	P123	1	
248	2012-01-18 18:15:14.47895-05	5	3	122	143680	3	
249	2012-01-18 18:15:14.480302-05	5	3	117	1444444	3	
250	2012-01-18 18:15:14.481236-05	5	3	121	159753	3	
251	2012-01-18 18:15:14.482241-05	5	3	136	2	3	
252	2012-01-18 18:15:14.483246-05	5	3	113	23	3	
253	2012-01-18 18:15:14.484247-05	5	3	116	256789	3	
254	2012-01-18 18:15:14.485192-05	5	3	127	33489576	3	
255	2012-01-18 18:15:14.486156-05	5	3	114	344656756	3	
256	2012-01-18 18:15:14.487256-05	5	3	120	357159	3	
257	2012-01-18 18:15:14.48837-05	5	3	115	4	3	
258	2012-01-18 18:15:14.489352-05	5	3	123	444444	3	
259	2012-01-18 18:15:14.490274-05	5	3	130	474747	3	
260	2012-01-18 18:15:14.491278-05	5	3	132	80808	3	
261	2012-01-18 18:15:14.492265-05	5	3	125	99996	3	
262	2012-01-18 18:15:14.493242-05	5	3	142	9999999	3	
263	2012-01-18 19:00:49.544806-05	5	42	85	P9999999	1	
264	2012-01-18 19:04:55.855423-05	5	42	86	P9999999	1	
265	2012-01-19 11:04:36.897886-05	13	53	5	ServiceProvider object	1	
266	2012-01-19 11:05:09.991782-05	13	53	6	ServiceProvider object	1	
267	2012-01-19 11:05:40.793536-05	13	53	7	ServiceProvider object	1	
268	2012-01-19 11:06:05.66962-05	13	53	8	ServiceProvider object	1	
269	2012-01-19 11:07:43.783026-05	13	53	9	ServiceProvider object	1	
270	2012-01-19 11:08:34.968264-05	13	53	10	ServiceProvider object	1	
271	2012-01-19 11:09:18.803886-05	13	53	11	ServiceProvider object	1	
272	2012-01-19 11:09:50.446428-05	13	53	12	ServiceProvider object	1	
273	2012-01-19 11:11:13.870604-05	13	53	13	ServiceProvider object	1	
274	2012-01-19 11:11:36.802718-05	13	53	14	ServiceProvider object	1	
275	2012-01-19 11:12:27.632366-05	13	53	15	ServiceProvider object	1	
276	2012-01-19 11:13:08.79185-05	13	53	16	ServiceProvider object	1	
277	2012-01-19 11:13:31.997927-05	13	53	17	ServiceProvider object	1	
278	2012-01-19 11:14:46.195653-05	13	53	18	ServiceProvider object	1	
279	2012-01-19 14:05:38.88766-05	13	53	19	ServiceProvider object	1	
280	2012-01-19 14:06:12.058022-05	13	53	20	ServiceProvider object	1	
281	2012-01-19 14:06:48.3418-05	13	53	21	ServiceProvider object	1	
282	2012-01-19 14:07:28.917016-05	13	53	22	ServiceProvider object	1	
283	2012-01-19 14:08:02.534471-05	13	53	23	ServiceProvider object	1	
284	2012-01-19 14:08:41.409598-05	13	53	24	ServiceProvider object	1	
285	2012-01-19 14:09:46.170634-05	13	53	25	ServiceProvider object	1	
286	2012-01-19 14:10:14.288081-05	13	53	26	ServiceProvider object	1	
287	2012-01-19 14:10:36.141472-05	13	53	27	ServiceProvider object	1	
288	2012-01-19 14:11:40.565568-05	13	53	28	ServiceProvider object	1	
289	2012-01-19 14:12:05.602502-05	13	53	29	ServiceProvider object	1	
290	2012-01-19 14:12:33.247926-05	13	53	30	ServiceProvider object	1	
291	2012-01-19 14:13:40.880551-05	13	53	31	ServiceProvider object	1	
292	2012-01-19 14:14:19.06866-05	13	53	32	ServiceProvider object	1	
293	2012-01-19 14:14:38.746724-05	13	53	33	ServiceProvider object	1	
294	2012-01-19 14:14:52.191166-05	13	53	3	ServiceProvider object	3	
295	2012-01-19 14:14:59.408542-05	13	53	4	ServiceProvider object	3	
296	2012-01-19 14:16:27.992175-05	13	53	34	ServiceProvider object	1	
297	2012-01-19 14:18:15.129399-05	109	42	87	P9999999	1	
298	2012-01-19 14:30:13.548512-05	13	42	88	P777666	1	
299	2012-01-19 15:25:16.439495-05	13	42	89	P555555	1	
300	2012-01-20 20:23:15.316931-05	5	42	90	P9999999	1	
301	2012-01-23 11:00:21.194783-05	13	42	91	P98909	1	
302	2012-01-23 11:08:28.490281-05	109	42	92	P9999999	1	
303	2012-01-23 11:11:12.657201-05	109	42	93	P9999999	1	
304	2012-01-23 12:50:04.312303-05	5	42	94	P9999999	1	
305	2012-01-23 15:03:47.545847-05	5	42	95	P9999999	1	
306	2012-01-23 15:25:20.050167-05	13	3	16	dg2121	2	Changed is_staff and groups.
307	2012-01-23 15:25:34.131107-05	5	2	17	t1.y2005.s001.cl9325.law.st.course:columbia.edu	3	
308	2012-01-23 15:25:34.13282-05	5	2	10	t1.y2006.s001.cf2010.coll.st.course:columbia.edu	3	
309	2012-01-23 15:25:34.133933-05	5	2	24	t1.y2008.s001.cg8247.pols.st.course:columbia.edu	3	
310	2012-01-23 15:25:34.134997-05	5	2	6	t1.y2008.s002.cy5010.a&h.st.course:columbia.edu	3	
311	2012-01-23 15:25:34.136049-05	5	2	19	t1.y2008.s005.cy6901.mstu.st.course:columbia.edu	3	
312	2012-01-23 15:25:34.137249-05	5	2	16	t1.y2009.s001.cj9055.jour.st.course:columbia.edu	3	
313	2012-01-23 15:25:34.138365-05	5	2	22	t1.y2009.s001.co2206.nyug.st.course:columbia.edu	3	
314	2012-01-23 15:25:34.139413-05	5	2	9	t1.y2010.s001.cb8210.buec.st.course:columbia.edu	3	
315	2012-01-23 15:25:34.140573-05	5	2	27	t1.y2010.s001.cj0002.resi.st.course:columbia.edu	3	
316	2012-01-23 15:25:34.142833-05	5	2	31	t1.y2010.s001.ck4030.nmed.st.course:columbia.edu	3	
317	2012-01-23 15:25:34.143906-05	5	2	18	t1.y2010.s007.cy4901.mstu.st.course:columbia.edu	3	
318	2012-01-23 15:25:34.145054-05	5	2	29	t1.y2011.s001.cj0002.resi.st.course:columbia.edu	3	
319	2012-01-23 15:25:34.146267-05	5	2	33	t1.y2011.s001.ck4110.nmed.st.course:columbia.edu	3	
320	2012-01-23 15:25:34.147387-05	5	2	34	t1.y2011.s001.ck4111.nmed.st.course:columbia.edu	3	
321	2012-01-23 15:25:34.148432-05	5	2	20	t1.y2011.s001.ck4220.nmed.st.course:columbia.edu	3	
322	2012-01-23 15:25:34.149435-05	5	2	44	t1.y2011.s001.ct8203.socw.st.course:columbia.edu	3	
323	2012-01-23 15:25:34.150528-05	5	2	45	t1.y2011.s001.ct8507.socw.st.course:columbia.edu	3	
324	2012-01-23 15:25:34.151547-05	5	2	47	t1.y2011.s001.ct8510.socw.st.course:columbia.edu	3	
325	2012-01-23 15:25:34.15261-05	5	2	5	t1.y2011.s001.cy4199.a&hh.st.course:columbia.edu	3	
326	2012-01-23 15:25:34.153665-05	5	2	40	t1.y2011.s002.cu6501.sipa.st.course:columbia.edu	3	
327	2012-01-23 15:25:34.15479-05	5	2	11	t3.y2006.s001.cu8793.inaf.st.course:columbia.edu	3	
328	2012-01-23 15:25:34.155831-05	5	2	12	t3.y2006.s016.cj6010.jour.st.course:columbia.edu	3	
329	2012-01-23 15:25:34.156871-05	5	2	14	t3.y2007.s001.cj8040.jour.st.course:columbia.edu	3	
330	2012-01-23 15:25:34.157906-05	5	2	21	t3.y2007.s001.co6023.nwsg.st.course:columbia.edu	3	
331	2012-01-23 15:25:34.15886-05	5	2	7	t3.y2008.s001.ca4469.arch.st.course:columbia.edu	3	
332	2012-01-23 15:25:34.159788-05	5	2	13	t3.y2008.s001.cj6019.jour.st.course:columbia.edu	3	
333	2012-01-23 15:25:34.160728-05	5	2	30	t3.y2009.s001.cg8200.soci.st.course:columbia.edu	3	
334	2012-01-23 15:25:34.161645-05	5	2	26	t3.y2009.s001.cj0002.resi.st.course:columbia.edu	3	
335	2012-01-23 15:25:34.162775-05	5	2	15	t3.y2009.s001.cj9042.jour.st.course:columbia.edu	3	
336	2012-01-23 15:25:34.163812-05	5	2	32	t3.y2009.s001.ck4100.nmed.st.course:columbia.edu	3	
337	2012-01-23 15:25:34.164865-05	5	2	8	t3.y2010.s001.ca4642.arch.st.course:columbia.edu	3	
338	2012-01-23 15:25:34.165884-05	5	2	23	t3.y2010.s001.cg4010.ohma.st.course:columbia.edu	3	
339	2012-01-23 15:25:34.16684-05	5	2	28	t3.y2010.s001.cj0002.resi.st.course:columbia.edu	3	
340	2012-01-23 15:25:34.167768-05	5	2	35	t3.y2010.s001.ck4990.nmed.st.course:columbia.edu	3	
341	2012-01-23 15:25:34.168754-05	5	2	41	t3.y2010.s001.ct8002.socw.st.course:columbia.edu	3	
342	2012-01-23 15:25:34.169821-05	5	2	43	t3.y2010.s001.ct8202.socw.st.course:columbia.edu	3	
343	2012-01-23 15:25:34.170876-05	5	2	46	t3.y2010.s001.ct8509.socw.st.course:columbia.edu	3	
344	2012-01-23 15:25:34.171851-05	5	2	48	t3.y2010.s001.ct8801.socw.st.course:columbia.edu	3	
345	2012-01-23 15:25:34.172775-05	5	2	42	t3.y2010.s002.ct8004.socw.st.course:columbia.edu	3	
346	2012-01-23 15:25:34.173738-05	5	2	39	t3.y2010.s005.cu6500.sipa.st.course:columbia.edu	3	
347	2012-01-23 15:25:34.174658-05	5	2	25	t3.y2011.s001.cj0001.regi.st.course:columbia.edu	3	
348	2012-01-23 15:25:34.175633-05	5	2	37	t3.y2011.s001.cy5045.ccpx.st.course:columbia.edu	3	
349	2012-01-23 15:25:34.176678-05	5	2	36	t3.y2011.s002.cj9900.jour.st.course:columbia.edu	3	
350	2012-01-23 15:25:34.177786-05	5	2	38	t3.y2011.s002.co2012.nyug.st.course:columbia.edu	3	
351	2012-01-23 15:27:23.685974-05	13	3	16	dg2121	2	Changed groups.
352	2012-01-23 15:28:13.308673-05	13	3	14	lg123	2	Changed is_staff and groups.
353	2012-01-23 15:28:40.322082-05	13	3	15	sas2268	2	Changed is_staff and groups.
354	2012-01-23 15:29:39.098782-05	13	3	14	lg123	2	Changed password.
355	2012-01-23 15:29:49.951464-05	13	3	16	dg2121	2	Changed password.
356	2012-01-23 15:30:02.562284-05	13	3	15	sas2268	2	Changed password.
357	2012-01-23 15:33:39.327411-05	13	3	17	wanda	3	
358	2012-01-23 15:54:27.565842-05	5	8	1	/about/ -- About WINGS	1	
359	2012-01-23 15:54:40.339837-05	5	8	2	/help/ -- Help	1	
360	2012-01-23 15:55:40.69443-05	5	8	1	/about/ -- About WINGS	2	Changed content.
361	2012-01-23 15:55:56.469463-05	5	8	1	/about/ -- About WINGS	2	No fields changed.
362	2012-01-23 15:56:14.245152-05	5	8	2	/help/ -- Help	2	Changed content.
363	2012-01-24 10:55:08.839019-05	5	42	96	P9999999	1	
364	2012-01-24 13:51:54.539516-05	5	42	97	P9999999	1	
365	2012-01-24 15:20:48.22121-05	13	42	98	P232323	1	
366	2012-01-24 16:12:52.755889-05	13	42	99	P362611	1	
367	2012-01-25 16:04:47.534812-05	13	42	100	P222222	1	
368	2012-01-26 18:43:11.971643-05	5	42	101	P9999999	1	
369	2012-01-27 16:21:04.140151-05	8	42	102	P2223334	1	
370	2012-01-30 10:16:57.260514-05	13	3	162	marc	1	
371	2012-01-30 10:17:16.01183-05	13	3	162	marc	2	Changed is_staff and is_superuser.
372	2012-01-30 10:33:07.465472-05	162	42	103	P90210	1	
373	2012-01-30 15:19:45.144084-05	15	42	103	P90210	2	No fields changed.
374	2012-02-01 12:05:53.866161-05	13	42	104	P1236547	1	
375	2012-02-01 15:06:10.736634-05	5	42	105	P123456789	1	
376	2012-02-13 09:59:10.541789-05	13	53	5	ServiceProvider object	2	Changed description.
377	2012-02-13 09:59:30.779333-05	13	53	6	ServiceProvider object	2	Changed description.
378	2012-02-13 09:59:44.129401-05	13	53	7	ServiceProvider object	2	Changed description.
379	2012-02-13 09:59:56.64972-05	13	53	8	ServiceProvider object	2	Changed description.
380	2012-02-13 10:00:17.787746-05	13	53	9	ServiceProvider object	2	Changed description.
381	2012-02-13 10:00:36.519737-05	13	53	10	ServiceProvider object	2	Changed description.
382	2012-02-13 10:00:57.709726-05	13	53	13	ServiceProvider object	2	Changed description.
383	2012-02-13 10:01:26.139123-05	13	53	11	ServiceProvider object	2	Changed description.
384	2012-02-13 10:01:47.709755-05	13	53	12	ServiceProvider object	2	Changed description.
385	2012-02-13 10:02:12.971227-05	13	53	14	ServiceProvider object	2	Changed description.
386	2012-02-13 10:02:29.239911-05	13	53	15	ServiceProvider object	2	Changed description.
387	2012-02-13 10:04:46.561251-05	13	53	16	ServiceProvider object	2	Changed description.
388	2012-02-13 10:05:14.245419-05	13	53	17	ServiceProvider object	2	Changed description.
389	2012-02-13 10:05:30.810867-05	13	53	18	ServiceProvider object	2	Changed description.
390	2012-02-13 10:06:02.907769-05	13	53	34	ServiceProvider object	2	Changed address.
391	2012-02-13 10:06:23.081759-05	13	53	19	ServiceProvider object	2	Changed description.
392	2012-02-13 10:06:43.211987-05	13	53	20	ServiceProvider object	2	Changed description.
393	2012-02-13 10:07:02.112579-05	13	53	21	ServiceProvider object	2	Changed description.
394	2012-02-13 10:07:29.372377-05	13	53	22	ServiceProvider object	2	Changed description.
395	2012-02-13 10:07:44.772853-05	13	53	23	ServiceProvider object	2	Changed description.
396	2012-02-13 10:08:04.813397-05	13	53	24	ServiceProvider object	2	Changed description.
397	2012-02-13 10:08:16.182142-05	13	53	25	ServiceProvider object	2	Changed description.
398	2012-02-13 10:09:12.786747-05	13	53	35	ServiceProvider object	1	
399	2012-02-13 10:10:28.323175-05	13	53	26	ServiceProvider object	2	Changed name, phone and description.
400	2012-02-13 10:10:48.213251-05	13	53	27	ServiceProvider object	2	Changed description.
401	2012-02-13 10:11:15.655493-05	13	53	28	ServiceProvider object	2	Changed description.
402	2012-02-13 10:11:37.205786-05	13	53	29	ServiceProvider object	2	Changed description.
403	2012-02-13 10:11:51.674792-05	13	53	30	ServiceProvider object	2	Changed description.
404	2012-02-13 10:12:07.434788-05	13	53	31	ServiceProvider object	2	Changed description.
405	2012-02-13 10:12:23.554131-05	13	53	32	ServiceProvider object	2	Changed description.
406	2012-02-13 10:12:36.124373-05	13	53	33	ServiceProvider object	2	Changed description.
407	2012-02-13 15:41:13.084466-05	5	42	106	P1234	1	
408	2012-02-15 10:30:57.116491-05	109	42	107	P88999777	1	
409	2012-02-15 11:39:25.260404-05	13	42	108	P363636	1	
410	2012-02-15 15:41:52.836743-05	109	3	124	casi	2	Changed is_superuser and groups.
411	2012-02-17 11:29:49.997564-05	5	3	143	123	3	
412	2012-02-17 11:29:50.004816-05	5	3	166	1234	3	
413	2012-02-17 11:29:50.006044-05	5	3	165	123456789	3	
414	2012-02-17 11:29:50.00719-05	5	3	164	1236547	3	
415	2012-02-17 11:29:50.008335-05	5	3	159	222222	3	
416	2012-02-17 11:29:50.009495-05	5	3	161	2223334	3	
417	2012-02-17 11:29:50.010586-05	5	3	157	232323	3	
418	2012-02-17 11:29:50.011622-05	5	3	158	362611	3	
419	2012-02-17 11:29:50.01274-05	5	3	167	363636	3	
420	2012-02-17 11:29:50.013827-05	5	3	148	555555	3	
421	2012-02-17 11:29:50.014929-05	5	3	147	777666	3	
422	2012-02-17 11:29:50.01604-05	5	3	163	90210	3	
423	2012-02-17 11:29:50.017107-05	5	3	150	98909	3	
424	2012-02-17 11:29:50.018147-05	5	3	160	9999999	3	
425	2012-02-17 13:07:57.686469-05	13	42	109	P12584584	1	
426	2012-02-17 13:19:42.787478-05	5	3	170	1234123412341234	1	
427	2012-02-20 14:03:42.453927-05	5	42	110	999999999999	1	
428	2012-02-21 10:03:06.033874-05	124	42	111	121212121212	1	
429	2012-02-22 11:24:06.3157-05	5	3	170	1234123412341234	3	
430	2012-02-22 11:24:06.324382-05	5	3	169	12584584	3	
431	2012-02-22 11:24:06.325523-05	5	3	168	88999777	3	
432	2012-02-22 11:33:32.057553-05	13	42	112	123456789123	1	
433	2012-02-24 12:03:12.232942-05	5	3	173	simone	1	
434	2012-02-24 12:03:31.391669-05	5	3	174	denise	1	
435	2012-02-24 12:03:49.897162-05	5	3	175	stacey	1	
436	2012-02-24 12:05:15.792475-05	5	3	176	britney	1	
437	2012-02-24 12:07:05.757213-05	5	3	174	denise	2	Changed is_staff and groups.
438	2012-02-24 12:07:37.380664-05	5	3	173	simone	2	Changed is_staff and groups.
439	2012-02-24 12:08:38.795979-05	5	3	176	britney	2	Changed is_staff and groups.
440	2012-02-24 12:22:50.303929-05	5	3	176	brittany	2	Changed username.
441	2012-02-24 12:44:49.580684-05	13	42	113	123456789124	1	
442	2012-02-24 12:45:09.451519-05	5	42	114	111111111111	1	
443	2012-02-24 12:45:22.490701-05	15	42	115	343434343434	1	
444	2012-02-24 12:45:24.586033-05	13	42	116	123456789125	1	
445	2012-02-24 12:45:44.853297-05	173	42	117	248248248248	1	
446	2012-02-24 12:46:00.22049-05	176	42	118	127224124597	1	
447	2012-02-24 12:47:29.806819-05	174	42	119	122224124115	1	
448	2012-02-24 12:47:58.906293-05	5	42	120	989898989898	1	
449	2012-02-24 12:52:50.760793-05	5	42	121	454545454545	1	
450	2012-02-24 14:30:25.323755-05	5	42	122	111	1	
451	2012-02-24 14:46:03.2557-05	5	42	122	123123123122	2	Changed id_string.
452	2012-02-27 09:19:13.769589-05	13	3	182	sdreher	1	
453	2012-02-27 09:20:16.224206-05	13	3	182	sdreher	2	Changed is_staff, is_superuser and groups.
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
52	Services: Narrowed Down Answer	servicesblock	narroweddownanswer
53	service provider	servicesblock	serviceprovider
54	past quiz answers block	pastquizanswersblock	pastquizanswersblock
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
1	/about/	About WINGS	<h3>About Wings.</h3>\r\n\r\n<a href ="http://wings.ccnmtl.columbia.edu/admin/flatpages/flatpage/1/" >edit this copy</a>	f		f
2	/help/	Help	<h3>Help about  Wings.</h3>\r\n\r\n<a href ="http://wings.ccnmtl.columbia.edu/admin/flatpages/flatpage/2/" >edit this copy</a>	f		f
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
4	1	1
5	2	1
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
6d1ab2b4488cecbe935c99517a7cc4d1	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-02 13:54:04.918973-05
cd5b63cc70b49c6b6f96515e48730042	gAJ9cQEuMTVkOGZjNmI2MzFmYjBiYTA4Yjc5ZTE4ZDBiYWU5MmQ=\n	2012-02-06 11:10:20.121247-05
18ba1a8ea1b1f1fcd01456f7a2e389ec	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-01 14:16:12.673985-05
f2597cac4e797b82e3452779033c06a5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-14 13:23:41.3808-04
072f598bdc16569960d7371953b1abcf	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-13 01:28:56.684472-05
1a690242ed0a21ba3e8b228aed92ce51	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-01 15:46:48.172039-05
a9a7eecdb4ef1e4d55c1586e98485e6e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-01 05:23:23.564495-05
10637c972289c60d680b0a2a86f9d2c6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-01 09:03:15.437752-05
e4c428e86db805bf1dd55a03f88b349e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-01 10:31:28.107628-05
8b14762b7eeb6a4c3def489572e1027d	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKKAHUuY2YyZTQwMTFjZTc2NGQyNGJk\nOTk0ZjYwNmYzZDQxMDA=\n	2012-02-01 15:59:29.01451-05
e6c47c2ea73de52fc8b85f963f161932	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-03 22:42:51.851749-05
4dcd05c998cc190b60651cc1289d1402	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-15 21:05:30.175356-05
35f2393bb1f19e600af24ac4b64e75e9	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-02 14:32:21.043642-05
faae93729f919282bdb4db6e00f0eaf5	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-05 09:58:04.110552-05
06976173f51475d2c3b0df00c61d5270	gAJ9cQEuMTVkOGZjNmI2MzFmYjBiYTA4Yjc5ZTE4ZDBiYWU5MmQ=\n	2012-02-02 16:12:43.168559-05
9105cb876c4cebfde9420197ab59eb0b	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw91LmYxMWJiMTMyM2ZiNzdlYjkwM2Qx\nNGU2MTdkZmE2MmNh\n	2012-02-16 10:56:18.456393-05
5553e5a86fd4eac58d7f8bdc7adced3e	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2012-02-07 11:23:07.029008-05
bee7bbd7f550cd7be5403adad95f4994	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-16 13:20:45.688529-05
57b013a823cb7528b9a0deac196cd9d9	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES5t1LmRjZjAyZDBmYTk3NWM2MGI5Y2U4\nMmU0YWYwYTNkYmZk\n	2012-02-07 13:40:52.646435-05
fac235bae5367f6bf298279cdaf2eea2	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES6V1Ljc3Y2FhNzdhNzY5YTVkZTE5MzI4\nM2MwMzM0ZGY4ZTc5\n	2012-02-16 14:06:41.849888-05
9d80cd0ab2526da484f0fc898cdd8830	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-05 10:09:30.886151-05
dd7c12fc78bebc9bd32de75656fd161b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-05 00:19:29.994525-05
0e2f87682ba885aa4a7b425460f7f1f4	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-05 20:24:17.716761-05
b2c3db7607a8449a991e184ad4007dbf	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-17 10:04:53.142559-05
3dc52afa9eeec65b9ff9a4c7200fea82	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKgAHUuMGNmYWE1ZjEyZTRhODQwZDQz\nMmI3NGY1YmJiYTcyNDg=\n	2012-02-09 18:43:12.746502-05
5dd078296b4d669ccebba4f1b5222420	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw91LmYxMWJiMTMyM2ZiNzdlYjkwM2Qx\nNGU2MTdkZmE2MmNh\n	2012-02-10 11:31:49.325585-05
452298d6870c6059044b6afad581f71c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-18 11:23:26.214182-05
1c0ddb55b023d76021f16c5eb502da1a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-19 19:03:03.721673-05
5ed201ed78a5dbebc2cdd12f1754d084	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-20 04:51:52.552319-05
e8c36822be21de3852e3e764ccdf7d73	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES211LjEyNzQ1NDI5YmFmZWNiZDMzZDQx\nNjRjNTdkZjg0OTZk\n	2012-02-29 11:26:07.84265-05
16a49659a65e8a0140b48c8f09b4dc00	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES7R1LjFiMTA1MmRlMDc1NTg4MGEwZjlj\nYjk1YzQ4ZTdiN2Ey\n	2012-03-12 12:22:58.895826-04
1b4344198f333ba2145c3676e79bc455	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-23 16:46:21.619408-05
b06bea18267d0cfb2936d5e3e65d36e6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-25 17:33:44.353218-05
685afaf76989b08bbaaf62d62a400ae3	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-26 02:57:00.393425-05
41d879f945cebfe97793324cd1c9de27	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKsAHUuNjNhMTZjYzMxOTgzYzdkYjlh\nNWYzYjdlZjExOTMyMDg=\n	2012-03-06 10:03:46.91376-05
3f9677e20c131cb98b42ca70db5b2b7a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-06 20:19:00.825236-05
4487da1c3169caa7a92e267c814f146a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-03-09 12:35:45.147053-05
6a25aeaedaa0dd1374582024f56b478f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-14 16:08:56.018635-04
45b17204f63c67ff1301bcdf28dfeb0f	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-02-09 16:30:23.417829-05
38165a56bd4c16fbf71ece8f675c9ef4	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKNAHUuZGQ3NDFlMDc0MDViNTY4OGMw\nNjY4MGY4ZTA5ZjYwOWE=\n	2012-02-01 17:17:02.394192-05
713e7cc2fb7b992ba133b7d8fac71da6	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2012-02-01 11:07:15.14714-05
16d7bbac21f48c909ec2f88730da5e56	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES6J1LjQzZWUwMzg0YTk2ZWQwZGE5ODkz\nYzMzMmMyNTdkZTUz\n	2012-02-16 10:28:25.882499-05
0a6992a3cb3157c7a5d5e691b40ad3d1	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwh1LmNlZDhiNWU4MGVjNWRiNGUzZDYw\nYjE2Y2RhNDMxMGQ4\n	2012-02-10 16:30:47.702863-05
29dc448bfd7b699572581bb5bc6b7610	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-03 22:42:52.691362-05
83672c362e857ff1c4f3a39bce16a150	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-05 11:38:18.076542-05
ec00b594470fc6158d8efe4e730633c6	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwh1LmNlZDhiNWU4MGVjNWRiNGUzZDYw\nYjE2Y2RhNDMxMGQ4\n	2012-02-01 13:03:25.312098-05
5baa57f303ec50132c303d7e293f473f	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES211LjEyNzQ1NDI5YmFmZWNiZDMzZDQx\nNjRjNTdkZjg0OTZk\n	2012-02-29 10:30:22.436297-05
064606c07841fce83c66915b48139c00	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKVAHUuYTM2MDExYWQxNTg2YmIyMjBi\nMjdlOWNiYjg1ZjY2YjQ=\n	2012-02-03 20:23:16.602213-05
59985e4e9ffed239d736159c12ed2df0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwh1LmNlZDhiNWU4MGVjNWRiNGUzZDYw\nYjE2Y2RhNDMxMGQ4\n	2012-02-07 11:12:10.558204-05
357738b8a952bfccdfe1f7f0270842c6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-17 10:04:54.225013-05
fede06e67b21e52d5725abcf533cd20e	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-03-14 13:58:57.54626-04
36bce78e74bac5ba6c9d9bc6976bb9c1	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES7Z1LjUyMjA5OWZjYzY1MmQ0YmJmMDRh\nMzcyN2E0NWUzOGY2\n	2012-03-13 08:15:15.056182-04
785ca8f15d79f186d824afa0ad8c0fca	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES6x1LmM0NTM4NzlhM2VmNmYxMGIyYjk5\nNDQ3YTgzMmE0OTdk\n	2012-03-09 12:55:48.11312-05
42e1e84f38f61a133f6ff15f0a2db95b	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES3x1LjA0ZGRiM2ZmZWMxYTE3YThjYWJi\nNmJhZWZiMjZiYmNl\n	2012-03-05 16:52:44.230025-05
2df051d6f61a13939c04ffcbd0e89534	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigK3AHUuZTk3YmQxNzhhOGI0OTUwYWE5\nMjNmYTQxNmMwNDgzMTc=\n	2012-03-13 10:43:24.068854-04
d66517d6bb04e8d0ecbc0ec855eba546	gAJ9cQEuMTVkOGZjNmI2MzFmYjBiYTA4Yjc5ZTE4ZDBiYWU5MmQ=\n	2012-03-09 13:19:41.202632-05
36b9a4e995b40d70fc4d9f77a7396e1e	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-09 13:21:13.954873-05
8c673d0a909fb206e3938179f95e8e69	gAJ9cQEuMTVkOGZjNmI2MzFmYjBiYTA4Yjc5ZTE4ZDBiYWU5MmQ=\n	2012-03-09 15:53:58.578008-05
ae835a785010ebc7ea86de0f213b4602	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES211LjEyNzQ1NDI5YmFmZWNiZDMzZDQx\nNjRjNTdkZjg0OTZk\n	2012-03-14 17:23:31.978287-04
fe582a7bccb1b2da8a5ca21008c8636a	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-10 12:38:16.025674-05
8dd1cdccef506dbfaa0cba3541c44d72	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-01 13:07:18.15695-05
12a49e9bd4a7f89f0e60bcd440357868	gAJ9cQEuMTVkOGZjNmI2MzFmYjBiYTA4Yjc5ZTE4ZDBiYWU5MmQ=\n	2012-02-07 17:01:37.753212-05
8c70b4bcf8b3e57054ca4c44b5dca898	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-12 09:21:25.732171-04
e0e93f0ccb7fa899ae6e01617a06d463	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-03-07 11:47:57.528804-05
b11c083d26437f40f48f055a06023958	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-27 19:08:45.314108-05
480dde54ebff66a892b0c30f6124713f	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-08 18:22:25.521939-05
ec5bed3bb6697450769d475313d9ee9c	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-14 13:50:00.98055-05
c7176b97b2effccfde77d8729af95f5d	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw91LmYxMWJiMTMyM2ZiNzdlYjkwM2Qx\nNGU2MTdkZmE2MmNh\n	2012-02-28 12:32:18.43301-05
ca73f0920b48d97da9bfd546efc945e7	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-02-29 15:56:36.867229-05
a0b8e3fc0323029e5887ead7eb89a02f	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-03-07 12:51:48.817048-05
c6b981c4775d4fed18d084137537af59	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-03-08 14:18:22.200466-05
cf99532398337f0f561ca6ab914c0e77	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-09 13:16:43.66714-05
34aacb45d7a7e78d8e08b8b615b7c840	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-02-15 14:28:54.10541-05
77f3c77b1c0ada914d260b3fd21dfc43	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESw11LmIwOGIwOGU1MjlhNjEwOWI0YmJl\nMjkxOWQwY2Q0YjZh\n	2012-03-09 14:59:55.841325-05
44bee5ced1621983de4595b4594b30c4	gAJ9cQEoVQp0ZXN0Y29va2llcQJVBndvcmtlZHEDVRJfYXV0aF91c2VyX2JhY2tlbmRxBFUpZGph\nbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBVUNX2F1dGhfdXNlcl9pZHEG\nS6F1Ljg0YzYxYTAyMGJkOTFhOGE0NTA4ZDczNTg3YWJjOWI0\n	2012-02-13 12:18:05.937247-05
9d47f93a2b4b367d7b4d0b7c8cf7a7dc	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-13 14:38:06.398184-05
86ec943fe2802b1dfcfffdccaa007227	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-13 15:38:28.278832-05
62348158f013a745e91b3523adaa4403	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-13 17:12:06.736015-05
4793492561904ed4ab67381f7c69531b	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-02-14 11:03:53.525542-05
21510b144baf661667470aac3526fb56	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES4d1LmJjODRjZWU5NGM3NTQ0MmE5ZTc2\nYzFiMzQxMzE3ZWU3\n	2012-02-01 10:46:17.238026-05
ee3d82bf04c8eff6f06a729b48ff2f66	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES211LjEyNzQ1NDI5YmFmZWNiZDMzZDQx\nNjRjNTdkZjg0OTZk\n	2012-02-29 10:28:53.837786-05
d8dd7c69a0acfe93d430b702ad19c16e	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2012-03-14 17:24:24.63605-04
70d1c00d5ec507745482e5cc5881cc58	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-14 17:40:40.735667-04
a4aad454ec76c8617b03c746a8f81d29	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-13 13:12:14.001725-04
56821756f494a8e509ae8dcb70cc2cbb	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES7V1LjY2OTBhMDk3OTA5NWJjNWE3MzRl\nNDMxNmVmOWYzNTlm\n	2012-03-14 19:00:16.842448-04
6b4be76649ff069828fa134b36bbcc57	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2012-03-14 19:01:47.013451-04
9dd4a2eec3108fc18d585538f560c5a0	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-13 17:12:49.216167-04
16a8cfd4ea206a52531bc65c3303e2c6	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-13 18:26:45.638141-04
924fd1404c986e0a6b0a3395358418ba	gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1ODc3ZjdmNzljMDU4MjIwZDcyNzA3ZTUw\nNjUxYTVm\n	2012-03-14 10:26:18.464723-04
9bd0758a0a1cbb2b346b8e156a9901df	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwh1LmNlZDhiNWU4MGVjNWRiNGUzZDYw\nYjE2Y2RhNDMxMGQ4\n	2012-02-01 12:50:16.745078-05
e3f447455da11b6928b02230dd0aeea0	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigK0AHUuM2IxYTIwNmFmNDNmNTU2ZDQ5\nMmRjMDM3ZGJhNDNkMDM=\n	2012-03-09 12:47:58.961015-05
769aefccaa960012c440a464bf502813	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES6J1LjQzZWUwMzg0YTk2ZWQwZGE5ODkz\nYzMzMmMyNTdkZTUz\n	2012-03-13 16:25:55.779262-04
95712df13ccc4fa875a4aecd960d869a	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEES211LjEyNzQ1NDI5YmFmZWNiZDMzZDQx\nNjRjNTdkZjg0OTZk\n	2012-03-13 16:51:53.216328-04
a70b09480fb47788908b1b404ab691eb	gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwV1LjhiMmZkYWFkNjI1NGNlOTVhZThh\nYmNmNTI3Y2RkM2Yw\n	2012-03-14 12:05:57.533829-04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_site (id, domain, name) FROM stdin;
1	wings.ccnmtl.columbia.edu	wings.ccnmtl.columbia.edu
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
16	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
17	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
18	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
3	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
4	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
5	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
6	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
7	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
8	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
9	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
10	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
11	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
12	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
13	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
14	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
15	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
19	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
20	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
21	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
22	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
23	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
24	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
25	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
26	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
27	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
89	Can't Play the Video?\r\n\r\nTo play: click on the image. \r\nTo stop: click the pause button in the lower left area of the video\r\nplayer.	audio_file/2012/02/15/video_help.mp3
32	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
90	Can't Play the Video?\r\n\r\nTo play: click on the image. \r\nTo stop: click the pause button in the lower left area of the video\r\nplayer.	audio_file/2012/02/15/video_help.mp3
33	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
34	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
35	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
36	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
37	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
38	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
39	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
40	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
41	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
46	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
47	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
48	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
49	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
50	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
51	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
52	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
53	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
54	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
55	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
60	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
61	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
62	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
63	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
64	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
65	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
66	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
67	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
68	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
69	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
70	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
71	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
72	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
75	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
76	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
77	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
78	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
79	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
80	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
81	Stuck on This Screen?\n\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
31	Stuck on This Screen?\r\n\r\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/01/25/stuck_on_screen_help.mp3
83	Can't Add Names to the Tree?\r\n\r\nTo write the names on the tree, click in the white oval and then use the keyboard to type.	audio_file/2012/02/13/tree_page_1_help.mp3
84	What Are These Hearts?\r\n\r\nClick on a bird to either add or remove a heart. Adding a pink heart shows that the person whose name is on the bird can provide you with practical support.	audio_file/2012/02/13/tree_page_2_help.mp3
85	What Are These Hearts?\r\n\r\nClick on a bird to either add or remove a heart.  Adding a blue heart shows that the person whose name is on the bird can provide you with emotional support.	audio_file/2012/02/13/tree_page_3_help.mp3
86	Stuck on This Screen?\r\n\r\nYou must complete all questions on the page before moving on. To answer a question, click in the empty white box and type your answer.	audio_file/2012/02/13/stuck_on_screen_help.mp3
87	Can't Play the Video?\r\n\r\nTo play: click on the image. \r\nTo stop: click the pause button in the lower left area of the video\r\nplayer.	audio_file/2012/02/15/video_help.mp3
88	Can't Play the Video?\r\n\r\nTo play: click on the image. \r\nTo stop: click the pause button in the lower left area of the video\r\nplayer.	audio_file/2012/02/15/video_help.mp3
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
39	8	pastquizanswersblock.PastQuizAnswersBlock
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
29	<div class="video"><iframe width="480" height="296" src="https://surelink.ccnmtl.columbia.edu/video/?player=v4&file=secure/courses/wings_intro.flv&width=480&height=272&poster=http://ccnmtl.columbia.edu/broadcast/posters/secure/courses/wings_intro.jpg&protection=61cdb29236f80e3adf039185883ede5d93619692" ></iframe></div>\r\n
30	<div class="video"><iframe width="480" height="296" src="https://surelink.ccnmtl.columbia.edu/video/?player=v4&file=secure/courses/wings_intro_stories.flv&width=480&height=272&poster=http://ccnmtl.columbia.edu/broadcast/posters/secure/courses/wings_intro_stories.jpg&protection=5096ae1f9761051284497ef50a506e5e30926f07" ></iframe></div>
31	<div class="video"><iframe width="480" height="296" src="https://surelink.ccnmtl.columbia.edu/video/?player=v4&file=secure/courses/wings_hearing_other_stories.flv&width=480&height=272&poster=http://ccnmtl.columbia.edu/broadcast/posters/secure/courses/wings_hearing_other_stories.jpg&protection=b95a7cb4c12126cc6d355ae0d0c36231e5e6d204" ></iframe></div>\r\n
28	<div class="tree-instructions">\r\n<h3>Instructions: Add People</h3>\r\n<p>\r\nwrite the names of one to five people you trust onto the birds on this tree.\r\n</p>\r\n</div>
33	<p>Thank you so much for meeting with us today and taking the time to discuss this important issue that affects many women. We hope that the information we have shared will be helpful for you and for other women you know who face relationship challenges.</p>\r\n<p>Reducing conflict is not easy. Sometimes partners can work together to make changes and ensure their relationship will be respectful and safe. Sometimes one partner needs to end the relationship in order to keep herself or her children safe. This is a personal decision, but having support can help women spread their wings and choose safety.</p>\r\n<p>We hope you can find support and power within yourself, and also be a support to others.</p>\r\n<p>Thank you again for your time and your participation. Please check in with the caseworker on the way out so you can pick up any documents you want to take home, or provide an address where these documents can be sent to you.</p>\r\n\r\n<p>If you are done, click the button below.</p>\r\n<br />\r\n<div class="video"><a class="bigbutton" href="/service-referrals/getting-a-copy-of-your-plan/" >Done</a></div>
32	<iframe width="480" height="296" src="https://surelink.ccnmtl.columbia.edu/video/?player=v4&file=secure/courses/wings_proud_of_what_i_am_now.flv&width=480&height=272&poster=http://ccnmtl.columbia.edu/broadcast/posters/secure/courses/wings_proud_of_what_i_am_now.jpg&protection=d5ee5608050004ea8d07ebc153fc26f5856da89f" ></iframe>\r\n
35	<!-- just adding this to turn off the image -->
36	<div class="image_on_left">\r\n<div id="decoration_image_container">\r\n<img class="decoration_image" src="/site_media/img/cycleofviolence-small.jpg">\r\n</div>\r\n<p>This chart shows what many women experience when in abusive relationships. First, tension builds and the partner becomes more controlling. Then, the partner may feel he or she loses control and an abusive incident occurs. Afterward, the partner apologizes and promises to change. Often in a situation like this the woman has mixed feelings, and may feel that she is walking on eggshells while others may feel like it's never going to happen again.</p>\r\n</div>
37	<div class="image_on_left">\r\n<div id="decoration_image_container">\r\n<img class="decoration_image" src="/site_media/img/powerandcontrol-small.jpg">\r\n</div>\r\n<p>Intimate partners may hurt each other in different ways. All of these types of violence or abuse are often related to power and control. Such violence can occur from intimate partners who are female or male, and within relationships that are long-term or casual.</p>\r\n</div>
40	<!-- just adding this to turn off the image -->
42	<!-- just adding this to turn off the image -->
43	<!-- just adding this to turn off the image -->
45	
46	
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
15	images/2012/01/09/powerandcontrol-drug.jpg		
10	images/2011/11/23/powerandcontrol-phys.jpg		
12	images/2011/11/23/powerandcontrol-emot.jpg		
13	images/2011/11/23/powerandcontrol-sexu.jpg		
14	images/2011/11/23/powerandcontrol-econ.jpg		
\.


--
-- Data for Name: pageblocks_imagepullquoteblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pageblocks_imagepullquoteblock (id, image, caption, alt) FROM stdin;
1	images/2012/01/26/purse-metrocard_jpg_.jpg		Just use an Image Pull Quote block and everything should now work nicely.
2	images/2012/02/13/charleneandjoy.jpg		
3	images/2012/02/17/bird-screen.jpg		
4	images/2012/02/17/bird-screen.jpg		
5	images/2012/02/17/bird-screen.jpg		
6	images/2012/02/17/bird-screen.jpg		
7	images/2012/02/17/911small.jpg		
8	images/2012/02/17/bird-screen.jpg		
9	images/2012/02/17/bird-screen.jpg		
10	images/2012/02/17/bird-screen.jpg		
11	images/2012/02/17/bird-screen.jpg		
12	images/2012/02/17/keys-money.jpg		
13	images/2012/02/17/id-ssc.jpg		
14	images/2012/02/22/bird-screen.jpg		
15	images/2012/02/22/bird-screen.jpg		
16	images/2012/02/22/bird-screen.jpg		
17	images/2012/02/22/bird-screen.jpg		
18	images/2012/02/22/bird-screen.jpg		
19	images/2012/02/22/bird-screen.jpg		
20	images/2012/02/22/bird-screen.jpg		
21	images/2012/02/22/bird-screen.jpg		
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
29	Women who experience abuse by their partners may develop sleep disturbances, sexual dysfunction, depression, anxiety, posttraumatic stress disorder, eating disorders, female problems, become isolated, feel an intense loss of social connections, and may attempt suicide. Such abuse may also make it difficult for women to negotiate condom use with their partners and protect themselves against HIV and other sexually transmitted infections.  
15	[image suggestions: logo or illustration that refers to flying]
22	[image suggestions: someone shouting, other suggestions needed]
24	TBD\r\n\r\n[image suggestions needed]
25	All the types of behavior just described abuse are related to power and control, and they are forms of intimate partner violence. Such violence can occur from partners who are female or male, and within relationships that are long-term or casual, of the same or of different genders.    
21	In addition to physical violence, verbal abuse, such as screaming, yelling, threats, name calling, and putdowns can include angry words that make you feel hurt, ashamed or insignificant. These behaviors are also sometimes referred to as emotional abuse. 
30	Many women who experience violence from their partner have difficulty in telling someone about what is happening. Some women feel that there is no way out of the situation and their partner has control. Addressing such a situation may not be easy. But the purpose of our conversation today is to consider any risks you or your loved ones may be facing, and to consider what supports and resources are available to you.
27	Encouraging a woman to be dependent on drugs, or preventing her from getting drug treatment, is also a form of abuse that can occur in intimate relationships. Pressuring women to sell sex for money or drugs is also a form of abuse.
17	We'll be talking about recognizing relationship conflict and different types of abuse now. What we talk about might be upsetting to you, especially if it touches on something that's going on in your life. Please remember that we're here to help.\r\n
28	Approximately 1 in 4 women will experience domestic abuse in her lifetime. Each year there are approximately 16,800 homicides and over 2 million medically treated injuries related to intimate partner violence.  Among women on probation or parole in New York City, the rate of experiencing physical or sexual violence is very high – over one third of women have gone to the emergency room for injuries resulting from a fight with a partner.\r\n\r\nBecause so many women experience violence in relationships, we are introducing this WINGS program.
35	Relationship conflicts with partners – which may include emotional, physical, or sexual abuse – are common triggers for using drugs and alcohol to cope with the emotional and sometimes physical pain. Violence often causes women in recovery to relapse and drop out of treatment. 
36	Thinking through your relationship with your partner(s) now or in the past, when you experience conflict or if you are being hurt by your partner, what are some negative consequences that you have experienced or have concerns about?
42	I can teach my children how to use the telephone and dial 911 to contact the police and the fire department. 
43	I can also teach these strategies to some or all of my children.
44	I will use my judgment and intuition. If the situation is very serious, I can give my partner what he/she wants to calm him/her down. I have to protect myself until I/we are out of danger.
48	I will rehearse my escape plan and, as appropriate, practice it with my children.
14	Thank you for taking the time to participate in the WINGS project today. The purpose of this project is to provide information and resources to women. We are particularly interested in how women can stay safe in relationships with intimate partners. Test
37	After considering the different negative ways that relationship conflict may be affecting your life and your family, what are some reasons why it would be important for you to reduce conflict? Please answer the following questions.
46	Call 311 and ask for the NYC Domestic Violence Hotline (800-621-4673 or 866-604-5350) if you need counseling, legal assistance or emergency housing.  If you are feeling threatened by your partner or in more immediate danger, call 911 for the police.
47	Keep change for phone calls on you at all times. If you use your cell phone, the following month the telephone bill will tell your partner those numbers that you called after you left. To keep your calls confidential, you must either use coins at a pay phone or use a calling card for a limited time when you first leave. 
57	[/safety-plan/during-a-violent-incident/plan-part-1/]'s Safety Plan\r\n\r\nPart One: Strategies for Safety During a Violent Incident\r\n\r\nIf I decide to leave, I will: [/safety-plan/during-a-violent-incident/plan-part-2/]\r\n\r\nIn order to leave quickly, I can keep my purse, identification, and metro card (or bus/train fare) ready and put them: [/safety-plan/during-a-violent-incident/plan-part-3/]\r\n\r\nI can tell a person that I trust about the violence and request they call the police if they hear suspicious noises coming from my apartment. One person I can tell is: [/safety-plan/during-a-violent-incident/plan-part-4/]\r\n\r\nAnother person I can tell is: [/safety-plan/during-a-violent-incident/plan-part-5/]\r\n\r\nI can teach my children how to use the telephone and dial 911 to contact the police and the fire department. \r\n\r\nI can use a code word with my children or my friends so they can call for help. (CODE WORDS should not evoke suspicion from partner, but should not also be “every day” language that might confuse helping person. Some examples of code words are “Aunt _ _ _ has not returned my phone call today“. Code words for children need to be appropriate for their age. For example, a code word for a 13 year old girl may be “Your cousin _ _ _ called you today and wants you to call her back today”. For a younger child “Your grandmother called today and wanted to talk with you about something.”(Most children under the age of 5 will be too young to understand how to operate under code language, you will need to figure out whether your child can be entrusted with this task)\r\n\r\nMy code word will be: [/safety-plan/during-a-violent-incident/plan-part-7/]\r\n\r\nIf I have to leave my home I will go to: [/safety-plan/during-a-violent-incident/plan-part-8/]\r\n\r\nIf I cannot go to the location above I will go: [/safety-plan/during-a-violent-incident/plan-part-9/]\r\n\r\nI can also teach these strategies to some or all of my children.\r\n\r\nWhen I expect we are going to have an argument, I will try to move to a space that is lowest risk, such as: [/safety-plan/during-a-violent-incident/plan-part-11/]\r\n\r\nI will use my judgment and intuition. If the situation is very serious, I can give my partner what he/she wants to calm him/her down. I have to protect myself until I/we are out of danger.\r\n\r\nPart Two: Preparing to Leave\r\n\r\nSo that I can leave quickly, I will leave money and an extra set of keys with: [/safety-plan/preparing-to-leave/plan-part-1/]\r\n\r\nI will keep copies of important documents (social security cards, birth certificates, shot records – see step 8) or keys at :[/safety-plan/preparing-to-leave/plan-part-2/]\r\n\r\nTo increase my independence, I will open a savings account by: [/safety-plan/preparing-to-leave/plan-part-3/]\r\n\r\nOther things I can do to increase my independence include: [/safety-plan/preparing-to-leave/plan-part-4/]\r\n\r\nCall 311 and ask for the NYC Domestic Violence Hotline (800-621-4673; TDD 866-604-5350) if you need counseling, legal assistance or emergency housing. If you are feeling threatened by your partner or in more immediate danger, call 911 for the police.\r\n\r\nKeep change for phone calls on you at all times. If you use your telephone credit card, the following month the telephone bill will tell your partner those numbers that you called after you left. To keep your telephone communications confidential, you must either use coins at a pay phone or get a friend to let you use their telephone credit card for a limited time when you first leave.\r\n\r\nI will check with the following people to see if I can stay with them or borrow money:[/safety-plan/preparing-to-leave/plan-part-7/]\r\n\r\nI can leave extra clothes with:[/safety-plan/preparing-to-leave/plan-part-8/]\r\n\r\nIn order to plan the safest way to leave the residence, I will sit down and review my safety plan every:[/safety-plan/preparing-to-leave/plan-part-9/]\r\n\r\n[safety-plan/preparing-to-leave/plan-part-10/] will help me review my safety plan.\r\n\r\nI will rehearse my escape plan and, as appropriate, practice it with my children.\r\n\r\n
38	Thinking through your relationship with your partner(s), when conflict or abuse occurs what are some negative consequences that you experience or are concerned about? Please answer the following questions.
41	Women cannot always avoid violent incidents. In order to increase safety, women may use a variety of strategies. You can use some or all of the following strategies to stay safe.
45	A woman may have to leave the residence she shares with her partner, who is out of control. Leaving must be done with a careful plan in order to increase safety.  A violent partner often strikes back if he or she believes that the woman is leaving a relationship.
16	Most relationships have good times and bad times. Intimate relationships can be an important source of support, love, and purpose in life. Conflict can arise when partners have different needs or expectations or when difficult things happen that are outside of both partners’ control. While all relationships may have positives and negatives, we’d like to spend some time today talking about conflict and abuse, which sometimes occurs in intimate relationships.\r\n   
49	Let's identify the goals you most want to pursue.
87	Would you like to receive a printed copy of the safety plan and items we've talk about today, or would you prefer to have this sent by email, mailed to you, or mailed to another address? If you don't take it with you today, please talk to the caseworker to give her the address where it should be sent.\r\n<br /><br />\r\n<div class="video">\r\n<a class="bigbutton" href="/exit_materials/" >Print Now</a>\r\n<br />\r\n<br />\r\n<br />\r\n <a class="bigbutton exit_materials_logout_button" href="/logout/">Log Out</a>\r\n</div>
75	<div class="tree-instructions practical">\r\n<h3>Instructions: Practical Support</h3>\r\n<p>Now click on the names of people who can give you practical support, like giving you a place to stay, watching your pets, or lending you money.\r\n</p>\r\n</div>
70	Women cannot always avoid violent incidents. In order to increase safety, women may use a variety of strategies.  You can use some or all the strategies on the following pages to stay safe.
71	You will be given or mailed a copy of this safety plan.  Do you have a safe place to keep the safety plan at home or with a friend?\r\n\r\nYou will also get a list called 'Items to Remember' that provides a suggested list of things to take with you if you have to leave.  Where can you keep this list?\r\n\r\nDo you have a safe place to keep the 24-hour hotline number and other important numbers?
77	It looks like you haven't entered any names on the tree. There are times in life when you may feel isolated from all your friends and family, but can you think of any people who you would like to reach out to and connect with?  This may include extended family members you have lost contact with, neighbors, people you work with, clergy, or service providers.  Please try to put at least two names on the tree.
78	Now you're going to answer some questions about the types of issues that can trigger conflict for you and your partner.  Then you'll learn about services and organizations that might be able to help you with your particular needs.
40	If you or a family member or friend is experiencing relationship conflict or abuse by a partner, there are steps you can take to reduce conflict and help to prevent being hurt by a partner. Now we’ll cover two things that can reduce your risk for being hurt by your partner: coming up with a safety plan and identifying friends or family members you can turn to for support.
64	Sometimes alcohol and drug use make the pattern of violence worse. People who use drugs and alcohol are more likely to commit acts of violence against their partners. Women who are under the influence of drugs or alcohol may be less likely to escape or resist abusive situations. When an intimate partner keeps someone from attending treatment or threatens to hurt them if they use or don’t use drugs, this is a part of abusive behavior.  
65	Some women who experience violence in relationships may become angry and want to fight back. By fighting back, women may put themselves at risk for receiving criminal charges or going to jail.  Women who experience intense relationship conflict are also more likely to turn to drugs or alcohol to cope with the pain from the abuse. This may also increase their risk for being arrested for drug-related charges.
76	Can you think of two things you can do to strengthen your support from family or friends in the next week?  This may be calling someone who you like to hang out with to get together for coffee or go for walk so that you have a chance to connect with him or her. It may mean calling or a text, email or letter to someone who you have lost touch with but who you would like to reconnect with.  It may mean choosing someone who you trust and respect to talk with about the relationship conflict or abuse that you are experiencing so that you can get their advice or support on how to deal with it.
74	<div class="tree-instructions emotional">\r\n<h3>Instructions: Emotional Support</h3>\r\n<p>Now click on each of the people who can give you emotional support.\r\n</p>\r\n</div>
88	We hope this activity has been helpful to you in thinking through what role the relationship with your partner plays in your life and thinking through why you may want to reduce relationship conflict or reduce your risk for being hurt by your partner. 
80	<h5>Here is a list of organizations that provide the service you just selected as the most important to you.</h5>\r\n\r\n<p>At the end of this session you'll be given or mailed a booklet that includes these as well as other service organizations.</p>
83	In this next section I will be asking you a number of questions about your relationship(s) with all the partners you have had during the past year, and whether you have had any conflicts with any of them during the past year. 
79	<div class="cases">\r\n<div class="casecontent">\r\n<div class="casequestion">\r\n<p>Out of these services, which one is the most important, or addresses your most immediate or life-threatening issues?</p></div>
72	In addition to coming up with a safety plan, it may also help for you to be able to reach out family and friends who you can turn to for help, advice, and emotional support if you are feeling afraid that your partner might hurt you. There may also be times when it is safer for you to stay with a friend or family member. Your friends or family may also help you out by taking care of your children or pets or helping you financially if you need to leave.\r\n\r\nDifferent people may be able to help you in different ways. For example, it may be easier to talk with a friend about your relationship problems but ask your aunt for place to stay. Can you name between 1 to 5 people who you trust that may be able to support you?
63	Exposure to violence can also have lasting consequences for children. Kids who see or hear violence often experience grief, fear, and anxiety. Boys who witness violence between their parents are ten times more likely to abuse their partners when they become adults. Girls who witness parental violence are much more likely to be abused by their partners when they grow up.
84	Let's put some intro copy here.
33	Now you're going to complete a screening on how safe and comfortable\r\nyou feel in your relationship with your intimate partner(s). In this\r\nnext section I will be asking you a number of questions about your\r\nrelationships with all the partners you have had during the past year.\r\nPlease think about all intimate relationships you may have had during\r\nthe past year, including with a boyfriend, ex-boyfriend, girlfriend,\r\nex-girlfriend, husband, ex-husband, wife, ex-wife, common-law husband,\r\ncommon-law wife, or lover. These questions may apply to any of these\r\npartners.
90	It's a good idea to decide where you can go if you have to leave your apartment.  Decide this even if you don't think you will experience another violent incident.
91	It is a good idea to practice how to get out of your house or apartment safely.  What doors, windows, elevators, stairwells, or fire escapes would you use?  Consider which exits are safest.  Below, write down how you would get out.
92	I can use a code word with my children or my friends so they can call for help. (CODE WORDS should not raise suspicion from partner, but should not also be “every day” language that might confuse people. Some examples of code words are “Aunt _ _ _ has not returned my phone call today“.   Code words for children need to be appropriate for their age.  For example, a code word for a 13 year old girl may be “Your cousin _ _ _ called you today and wants you to call her back today”.  For a younger child “Your grandmother called today and wanted to talk with you about something.”(Most children under the age of 5 will be too young to understand how to operate under code language, you will need to figure out who you can trust with this task)
93	Try to avoid arguments in the bathroom, and kitchens, near weapons or in rooms without access to an outside door.
106	It is important to find people who will let you stay with them or lend you some money. 
108	I can use some or all of the following safety strategies:
109	It's important to become financially independent.  To get help with becoming financially independent from your partner call 1-800-873-2227.
107	Ask a trusted friend or advocate to help you review your plan. 
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
242	212	2		16	74
503	211	4	help_block	44	83
311	167	2		43	32
214	190	1		26	108
262	59	2		43	2
212	188	1		26	106
211	187	1		26	105
295	52	1		17	29
296	149	1		17	30
505	213	4	help_block	44	85
271	72	2		43	11
273	153	2		43	13
124	106	2		26	49
243	213	2		16	75
506	215	4	help_block	44	86
304	53	2		43	30
145	125	4		26	63
244	215	1		16	76
534	125	1		20	20
146	126	2		16	48
405	202	2		43	100
97	97	1		16	35
408	205	2		43	103
291	220	2		46	2
248	58	1		16	78
301	222	1		16	87
285	162	2		43	25
287	164	2		43	27
510	55	1		20	2
230	63	1		19	10
247	145	1		26	125
213	189	1		26	107
240	55	2		16	72
215	191	1		26	109
216	192	1		26	110
217	193	1		26	111
218	194	1		26	112
400	218	2		43	99
198	176	1		26	95
199	177	1		26	96
200	178	1		26	97
201	179	1		26	98
70	72	1		16	29
326	218	1		17	33
221	197	1		26	115
298	221	1		17	32
303	223	1		16	88
413	223	2		43	108
358	196	2		43	62
69	70	1		16	28
313	169	2		43	34
79	76	1		16	33
317	173	2		43	38
183	161	1		26	80
265	63	2		43	5
232	74	1		19	12
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
234	65	1		19	13
267	65	2		43	7
235	151	1		19	14
275	161	3		43	15
222	198	1		26	116
113	100	1		16	38
226	204	1		26	119
307	224	2		19	15
224	202	1		26	117
225	203	1		26	118
57	59	1		16	16
227	205	1		26	120
164	152	1		16	63
228	206	1		26	121
236	207	1		26	122
58	53	1		16	17
237	208	1		26	123
289	166	2		43	29
320	175	2		43	41
245	215	2		26	124
100	99	1		16	37
147	57	1		16	49
148	57	2		26	64
165	153	1		16	64
141	120	1		16	47
315	171	2		43	36
322	177	2		43	43
324	179	2		43	45
166	154	1		16	65
121	56	1	Taking steps to increase relationship safety 	16	40
327	181	2		43	47
328	182	2		43	48
330	184	2		43	50
129	110	2		26	52
239	210	1		16	71
133	113	2		26	55
135	103	1		16	45
281	103	2		43	21
132	112	1		16	43
136	115	2		26	56
283	212	3		43	23
263	150	2		43	3
219	195	1		26	113
364	125	2		16	107
356	195	2		43	61
388	125	5		43	87
360	197	2		43	63
383	120	2		43	83
403	150	1		17	36
401	146	1		17	35
270	70	2		43	10
272	152	2		43	12
274	154	2		43	14
504	212	4	help_block	44	84
278	97	2		43	18
389	126	3		43	88
508	215	5		17	42
535	126	1		20	21
284	58	2		43	24
286	163	2		43	26
288	165	2		43	28
249	146	2		26	126
290	219	2		46	1
396	219	3		43	95
395	146	3		43	94
397	220	3		43	96
423	165	1	help_block	44	7
257	147	1		26	128
404	62	1		17	37
220	196	1		26	114
415	112	2		43	110
264	62	2		43	4
266	74	2		43	6
268	151	2		43	8
306	224	1		43	31
312	168	2		43	33
361	198	2		43	64
314	170	2		43	35
282	55	3		43	22
316	172	2		43	37
318	174	2		43	39
321	176	2		43	42
323	178	2		43	44
325	180	2		43	46
329	183	2		43	49
331	185	2		43	51
334	110	1		16	92
412	76	2		43	107
399	222	2		43	98
336	113	1		16	93
297	155	1		17	31
398	147	2		43	97
390	211	3		43	89
391	213	3		43	90
392	215	3		43	91
373	113	3		43	74
424	166	1	help_block	44	8
371	110	3		43	72
393	57	3		43	92
394	145	2		43	93
377	115	1		16	108
378	115	3		43	78
261	211	2		17	28
256	220	1		16	80
255	219	1		16	79
253	212	1		45	2
254	213	1		45	3
252	211	1		45	1
338	187	2		43	52
425	167	1	help_block	44	9
426	168	1	help_block	44	10
450	106	1	help_block	44	34
420	162	1	help_block	44	4
421	163	1	help_block	44	5
340	188	2		43	53
342	189	2		43	54
344	190	2		43	55
346	191	2		43	56
250	200	1		26	127
348	200	2		43	57
350	192	2		43	58
352	193	2		43	59
354	194	2		43	60
422	164	1	help_block	44	6
427	169	1	help_block	44	11
428	170	1	help_block	44	12
429	171	1	help_block	44	13
430	172	1	help_block	44	14
431	173	1	help_block	44	15
432	174	1	help_block	44	16
433	175	1	help_block	44	17
434	176	1	help_block	44	18
435	177	1	help_block	44	19
436	178	1	help_block	44	20
437	179	1	help_block	44	21
438	180	1	help_block	44	22
439	181	1	help_block	44	23
440	182	1	help_block	44	24
441	183	1	help_block	44	25
442	184	1	help_block	44	26
443	185	1	help_block	44	27
251	186	1		47	1
419	161	2	help_block	44	3
276	100	2		43	16
454	110	1	help_block	44	38
471	125	3	help_block	44	55
456	112	1	help_block	44	40
457	113	1	help_block	44	41
509	57	4		17	43
411	208	2		43	106
536	147	3		17	46
462	115	1	help_block	44	46
406	203	2		43	101
407	204	2		43	102
409	206	2		43	104
410	207	2		43	105
467	120	1	help_block	44	51
511	221	2		44	87
512	52	2		44	88
476	187	1	help_block	44	60
477	188	1	help_block	44	61
478	189	1	help_block	44	62
479	190	1	help_block	44	63
480	191	1	help_block	44	64
481	200	1	help_block	44	65
482	192	1	help_block	44	66
483	193	1	help_block	44	67
484	194	1	help_block	44	68
485	195	1	help_block	44	69
486	196	1	help_block	44	70
487	197	1	help_block	44	71
488	198	1	help_block	44	72
513	149	2		44	89
514	155	2		44	90
491	202	1	help_block	44	75
492	203	1	help_block	44	76
493	204	1	help_block	44	77
494	205	1	help_block	44	78
495	206	1	help_block	44	79
496	207	1	help_block	44	80
497	208	1	help_block	44	81
127	102	1		16	41
447	102	2	help_block	44	31
279	102	3		43	19
367	106	3		43	68
501	106	4		20	1
502	145	3		17	40
309	201	1		54	1
362	201	2		43	65
416	99	2		43	111
280	56	2		43	20
375	210	2		43	76
122	104	2		26	47
448	104	3	help_block	44	32
365	104	4		43	66
516	104	1		20	3
333	105	2		16	91
449	105	3	help_block	44	33
123	105	4		26	48
366	105	5		43	67
517	105	1		20	4
125	107	2		26	50
451	107	3	help_block	44	35
368	107	4		43	69
518	107	1		20	5
126	108	2		26	51
452	108	3	help_block	44	36
369	108	4		43	70
519	108	1		20	6
128	109	2		16	42
453	109	3	help_block	44	37
370	109	4		43	71
520	109	1		20	7
521	110	5		17	45
332	111	2		16	90
455	111	3	help_block	44	39
130	111	4		26	53
131	111	5		26	54
372	111	6		43	73
522	111	1		20	8
523	112	4		20	9
524	113	5		20	10
134	114	2		16	44
374	114	3		43	75
525	114	1		20	11
526	115	5		20	12
463	116	2	help_block	44	47
527	116	3		20	13
379	116	4		43	79
137	116	1		26	57
386	117	2		16	109
464	117	3	help_block	44	48
138	117	4		26	58
380	117	5		43	80
528	117	1		20	14
139	118	2		26	59
465	118	3	help_block	44	49
381	118	4		43	81
529	118	1		20	15
140	119	2		16	46
466	119	3	help_block	44	50
382	119	4		43	82
530	119	1		20	16
363	121	2		16	106
468	121	3	help_block	44	52
142	121	4		26	60
384	121	5		43	84
531	121	1		20	17
143	123	2		26	61
469	123	3	help_block	44	53
385	123	4		43	85
532	123	1		20	18
144	124	2		26	62
470	124	3	help_block	44	54
387	124	4		43	86
533	124	1		20	19
\.


--
-- Data for Name: pagetree_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pagetree_section (id, path, depth, numchild, label, slug, hierarchy_id) FROM stdin;
223	000A000K00090008	4	0	Reasons to Reduce Conflict: Wrap Up	reasons-to-reduce-conflict-wrap-up	11
215	000A000M0005	3	0	steps to increase support	steps-to-increase-support	11
70	000A000I001T	3	0	How Common It Is	how-common-it-is	11
59	000A000I001O	3	1	Relationships	relationships	11
149	000A000I001O0001	4	0	Three Stories	three-stories	11
150	000A000I001Q	3	0	The Cycle of Violence	cycle-of-violence	11
53	000A000J	2	1	Recognizing Relationship Conflict	screening-for-ipv	11
224	000A000I001R000P	4	0	Drug Use and IPV	drug-use-and-ipv	11
62	000A000I001R	3	5	Types of Conflict	types-of-conflict	11
212	000A000M0002	3	0	Social Support Map: Emotional Support	map-screen-2	11
221	000A000K000A	3	0	I'm Proud of What I am Now	im-proud-of-what-i-am-now	11
219	000A000O0012	3	0	Resource Prioritization	services-drill-down-1	11
222	000A000O0016	3	0	Getting a copy of your plan	getting-a-copy-of-your-plan	11
51	000A	1	7	Root		11
63	000A000I001R000L	4	0	Physical Abuse	physical-abuse	11
161	000A000J00010006	4	0	Relationship Satisfaction question 1	question-1	11
151	000A000I001R000O	4	0	Economic Abuse	economic-abuse	11
74	000A000I001R000M	4	0	Emotional Abuse	emotional-abuse	11
65	000A000I001R000N	4	0	Sexual Abuse	sexual-abuse	11
72	000A000I001U	3	0	Negative Consequences	negative-consequences	11
170	000A000J0001000F	4	0	Relationship Satisfaction Question 10	question-10	11
171	000A000J0001000G	4	0	Relationship Satisfaction Question 11	question-11	11
155	000A000I001Y	3	0	Talking about the abuse	video-talking-about-the-abuse	11
172	000A000J0001000H	4	0	Relationship Satisfaction Question 12	question-12	11
173	000A000J0001000I	4	0	Relationship Satisfaction Question 13	question-13	11
174	000A000J0001000J	4	0	Relationship Satisfaction Question 14	question-14	11
175	000A000J0001000K	4	0	Relationship Satisfaction Question 15	question-15	11
213	000A000M0003	3	0	Social Support Map: Practical Support	map-screen-3	11
162	000A000J00010007	4	0	Relationship Satisfaction Question 2	question-2	11
163	000A000J00010008	4	0	Relationship Satisfaction Question 3	question-3	11
164	000A000J00010009	4	0	Relationship Satisfaction Question 4	question-4	11
176	000A000J0001000L	4	0	Relationship Satisfaction Question 16	question-16	11
165	000A000J0001000A	4	0	Relationship Satisfaction Question 5	question-5	11
166	000A000J0001000B	4	0	Relationship Satisfaction Question 6	question-6	11
167	000A000J0001000C	4	0	Relationship Satisfaction Question 7	question-7	11
168	000A000J0001000D	4	0	Relationship Satisfaction Question 8	question-8	11
169	000A000J0001000E	4	0	Relationship Satisfaction Question 9	question-9	11
177	000A000J0001000M	4	0	Relationship Satisfaction Question 17	question-17	11
178	000A000J0001000N	4	0	Relationship Satisfaction Question 18	question-18	11
179	000A000J0001000O	4	0	Relationship Satisfaction Question 19	question-19	11
180	000A000J0001000P	4	0	Relationship Satisfaction Question 20	question-20	11
187	000A000K0008000F	4	0	Cons of Conflict Question 1	question-1	11
188	000A000K0008000G	4	0	Cons of Conflict Question 2	question-2	11
189	000A000K0008000H	4	0	Cons of Conflict Question 3	question-3	11
190	000A000K0008000I	4	0	Cons of Conflict Question 4	question-4	11
191	000A000K0008000J	4	0	Cons of Conflict Question 5	question-5	11
200	000A000K0008000K	4	0	Cons of Conflict Question 6	question-6	11
192	000A000K0008000L	4	0	Cons of Conflict Question 7	question-7	11
193	000A000K0008000M	4	0	Cons of Conflict Question 8	question-8	11
194	000A000K0008000N	4	0	Cons of Conflict Question 9	question-9	11
195	000A000K0008000O	4	0	Cons of Conflict Question 10	question-10	11
196	000A000K0008000P	4	0	Cons of Conflict Question 11	question-11	11
152	000A000I001V	3	0	Negative Cosequences for Children	negative-cosequences-for-children	11
153	000A000I001W	3	0	Negative Consequences and Alcohol or Drugs	negative-consequences-and-alcohol-or-drugs	11
154	000A000I001X	3	0	Anger and Fighting Back	anger-and-fighting-back	11
197	000A000K0008000Q	4	0	Cons of Conflict Question 12	question-12	11
198	000A000K0008000R	4	0	Cons of Conflict Question 13	question-13	11
202	000A000K00090001	4	0	Reasons to Reduce Conflict Question 1	question-1	11
204	000A000K00090003	4	0	Reasons to Reduce Conflict Question 3	question-3	11
206	000A000K00090005	4	0	Reasons to Reduce Conflict Question 5	question-5	11
208	000A000K00090007	4	0	Reasons to Reduce Conflict Question 7	question-7	11
210	000A000L0001000P	4	0	Safety During a Violent Incident: Part 12	plan-part-12	11
52	000A000I	2	9	Welcome	welcome	11
220	000A000O0013	3	0	List of Organizations	services-drill-down-2	11
100	000A000K0008	3	14	Cons of Relationship Conflict	cons-of-relationship-conflict	11
181	000A000J0001000Q	4	0	Relationship Satisfaction Question 21	question-21	11
182	000A000J0001000R	4	0	Relationship Satisfaction Question 22	question-22	11
183	000A000J0001000S	4	0	Relationship Satisfaction Question 23	question-23	11
184	000A000J0001000T	4	0	Relationship Satisfaction Question 24	question-24	11
185	000A000J0001000U	4	0	Relationship Satisfaction Question 25	question-25	11
186	000A000J0001000V	4	0	Relationship Satisfaction: Feedback	feedback-on-relationshop-satisfaction-screener	11
201	000A000K0008000S	4	0	How Relationship Conflict Makes You Feel	summary-of-answers	11
56	000A000L	2	2	Safety Plan	safety-plan	11
203	000A000K00090002	4	0	Reasons to Reduce Conflict Question 2	question-2	11
205	000A000K00090004	4	0	Reasons to Reduce Conflict Question 4	question-4	11
207	000A000K00090006	4	0	Reasons to Reduce Conflict Question 6	question-6	11
99	000A000K0009	3	8	Identifying Reasons to Reduce Relationship Conflict and Improve Safety	reasons-to-reduce-conflict	11
104	000A000L0001000D	4	0	Safety During a Violent Incident: Part 1	plan-part-1	11
57	000A000N	2	0	Goal Setting	goal-setting	11
113	000A000L0001000N	4	0	Safety During a Violent Incident: Part 10	plan-part-10	11
105	000A000L0001000F	4	0	Safety During a Violent Incident: Part 2	plan-part-2	11
106	000A000L0001000G	4	0	Safety During a Violent Incident: Part 3	plan-part-3	11
58	000A000O	2	7	Service Referrals	service-referrals	11
107	000A000L0001000H	4	0	Safety During a Violent Incident: Part 4	plan-part-4	11
108	000A000L0001000I	4	0	Safety During a Violent Incident: Part 5	plan-part-5	11
109	000A000L0001000J	4	0	Safety During a Violent Incident: Part 6	plan-part-6	11
110	000A000L0001000K	4	0	Safety During a Violent Incident: Part 7	plan-part-7	11
111	000A000L0001000L	4	0	Safety During a Violent Incident: Part 8 	plan-part-8	11
112	000A000L0001000M	4	0	Safety During a Violent Incident: Part 9	plan-part-9	11
114	000A000L0001000O	4	0	Safety During a Violent Incident: Part 11	plan-part-11	11
115	000A000L00020001	4	0	Preparing to Leave: Part 1	plan-part-1	11
116	000A000L00020002	4	0	Preparing to Leave: Part 2	plan-part-2	11
117	000A000L00020003	4	0	Preparing to Leave: Part 3	plan-part-3	11
118	000A000L00020004	4	0	Preparing to Leave: Part 4	plan-part-4	11
119	000A000L00020005	4	0	Preparing to Leave: Part 5	plan-part-5	11
120	000A000L00020006	4	0	Preparing to Leave: Part 6	plan-part-6	11
121	000A000L00020007	4	0	Preparing to Leave: Part 7	plan-part-7	11
123	000A000L00020008	4	0	Preparing to Leave: Part 8	plan-part-8	11
124	000A000L00020009	4	0	Preparing to Leave: Part 9	plan-part-9	11
125	000A000L0002000A	4	0	Preparing to Leave: Part 10	plan-part-10	11
126	000A000L0002000B	4	0	Preparing to Leave: Part 11	plan-part-11	11
211	000A000M0001	3	0	Social Support Map: People	map-screen-1	11
76	000A000J0001	3	26	Relationship Satisfaction	relationship-satisfaction	11
103	000A000L0002	3	11	Safety When Preparing to Leave	preparing-to-leave	11
55	000A000M	2	4	Social Support Map	social-support-map	11
102	000A000L0001	3	12	Strategies for Safety During a Violent Incident	during-a-violent-incident	11
97	000A000K	2	3	Empowerment	empowerment	11
145	000A000O0010	3	0	Issues that can trigger conflict in your relationship	issues-question	11
146	000A000O0011	3	0	Resources to help you towards your goals	services-selection-page	11
147	000A000O0014	3	0	Action Plan	action-plan	11
218	000A000O0015	3	0	Wrap up and good bye	wrap-up-and-good-bye	11
\.


--
-- Data for Name: pastquizanswersblock_pastquizanswersblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pastquizanswersblock_pastquizanswersblock (id, description, copy) FROM stdin;
1	First draft of the summary is here.	Moved all this to a template. This copy field isn't being used any more.
\.


--
-- Data for Name: quizblock_answer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY quizblock_answer (id, question_id, value, label, correct, _order) FROM stdin;
659	223	4	not applicable	f	3
370	113	1	yes	f	0
371	113	2	no	f	1
660	230	4	not applicable	f	3
661	231	4	not applicable	f	3
372	113	3	maybe	f	2
662	232	4	not applicable	f	3
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
455	172	8	Ex-Wife	f	7
468	176	8	Ex-Wife	f	7
483	180	8	Ex-Wife	f	7
663	233	4	not applicable	f	3
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
610	231	1	yes	f	0
650	241	11	Legal assistance (i.e. assistance getting restraining order, divorce or child custody)	f	10
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
606	223	3	no	f	1
605	223	2	maybe	f	2
607	230	1	yes	f	0
641	241	2	Help Getting Housing	f	1
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
609	230	3	no	f	1
608	230	2	maybe	f	2
612	231	3	no	f	1
611	231	2	maybe	f	2
613	232	1	yes	f	0
615	232	3	no	f	1
614	232	2	maybe	f	2
616	233	1	yes	f	0
618	233	3	no	f	1
617	233	2	maybe	f	2
620	234	1	yes	f	0
622	234	3	no	f	1
621	234	2	maybe	f	2
653	243	1	yes	f	0
654	243	2	no	f	1
655	243	3	maybe	f	2
546	205	0	never	f	0
547	205	1	only once	f	1
548	205	2	once a month	f	2
549	205	3	once a week	f	3
550	205	4	daily	f	4
664	234	4	not applicable	f	3
656	241	1	Job training for self or partner	f	0
642	241	3	Education/Go back to School/GED	f	2
643	241	4	Recreation/Social Activities	f	3
644	241	5	Safety day care for children	f	4
645	241	6	Mental Health Counseling for self or partner	f	5
646	241	7	Alcohol Drug Abuse Counseling for self or partner	f	6
647	241	8	Anger management or batterer’s treatment program for Partner or Self	f	7
648	241	9	Counseling or Group Support to deal with Partner abuse	f	8
649	241	10	Emergency Domestic Violence Shelter or Residential Program	f	9
651	241	12	Counseling from a religious organization (pastor, priest, rabbi)	f	11
652	241	13	Couples/Marital counseling	f	12
\.


--
-- Data for Name: quizblock_question; Type: TABLE DATA; Schema: public; Owner: -
--

COPY quizblock_question (id, quiz_id, text, question_type, explanation, intro_text, _order) FROM stdin;
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
157	54	If I cannot go to the location above I will go:	short text			0
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
156	53	If I have to leave my home I will go to:	short text			0
150	48	If I decide to leave, I will:	long text			0
158	55	When I expect we are going to have an argument, I will try to move to a space that is lowest risk, such as:	short text			0
162	59	Other things I can do to increase my independence include:	long text			0
163	60	I will check with the following people to see if I can stay with them or borrow money:	long text		 	0
166	63	The person I will ask is:\r\n\t\r\n	short text		 	0
159	56	So that I can leave quickly, I will leave money and an extra set of keys with:	short text			0
161	58	To increase my independence, I will open a savings account by (date):	short text			0
167	64	If you could choose the best outcome (s) for you and your partner, what would it be?  (select all that apply)	multiple choice			0
194	90	In the past year, has your partner(s) choked you?	single choice			0
195	91	In the past year, has your partner(s) punched or hit you with something that could hurt or used or threatened to use a knife or gun on you?	single choice			0
219	114	I am concerned that I may be exposed to HIV or sexually transmitted infections because of unsafe sex	single choice			0
220	115	I am concerned about becoming pregnant	single choice			0
210	105	I am concerned that relationship conflict makes me feel sad or depressed	single choice			0
199	95	In the past year, has your partner(s) showed you that s/he cared even though you disagreed? 	single choice			0
200	96	In the past year, has your partner(s) said s/he was sure you could work out a problem together?	single choice			0
211	106	I am concerned that relationship conflict makes me feel anxious, stressed out, or on edge	single choice			0
203	98	In the past year, My partner followed me. . .	single choice			0
202	97	In the past year, My partner has told me that I wasn’t good enough. . .	single choice			0
204	99	In the past year, My partner tried to turn my family, friends, and children against me. . .	single choice			0
244	128	What are you going to do in the next week to address your most important service needs?	long text			0
206	101	In the past year, My partner blamed me for causing their abusive behavior	single choice			0
207	102	In the past year, My partner harassed me over the phone or through texts . . .	single choice			0
208	103	In the past year, My partner told me that no one would ever want me. . .	single choice			0
209	104	In the past year, My partner tried to convince my friends, family, or children that I was crazy. . .	single choice			0
212	107	I am concerned that relationship conflict makes me feel isolated from my friends and family	single choice			0
213	108	I am concerned that relationship conflict makes me feel like using drugs or alcohol	single choice			0
222	116	Other concerns that I have (list):	long text			0
221	109	I am concerned that relationship conflict makes me feel hopeless or helpless about my future	single choice			0
243	127	I am concerned that relationship conflict makes me feel bad about myself	single choice			0
215	110	I am concerned that relationship conflict is negatively affecting my children	single choice			0
216	111	I am concerned that I may end up fighting back or hurting my partner and risk getting charged with assault	single choice			0
218	113	I am concerned that I may be injured in a fight	single choice			0
245	128	What are you going to do in the next week to take time for yourself?  Some ideas including going for a walk, writing, taking a bubble bath, creating art, or going to a nail salon.	long text			1
235	123	Other reasons to reduce relationship conflict:	long text			0
236	124	In the next week, I can do the following to strengthen my support:	short text			0
237	124	In the next week, I can also do the following to strengthen my support:	short text			1
241	126	What services might help you work towards these goals with your partner? (Select all that apply.)	multiple choice			0
240	125	Other issues that trigger relationship problems or abuse:	long text			1
242	126	Other services that might help you:	long text			1
239	125	What are the main issues that may trigger relationship conflict or abuse? (Select all that apply.)	multiple choice			0
196	92	In the past year, has your partner(s) insisted you have sex even though you didn’t want to? 	single choice			0
197	93	In the past year, has your partner(s) forced you to have sex without a condom?	single choice			0
223	117	I want to feel better about myself and my future	single choice			0
230	118	I want to feel less isolated from my family or friends	single choice			0
231	119	I want to improve the quality of life for my kids or other family members who are affected by the relationship conflict	single choice			0
205	100	In the past year, My partner tried to keep me from seeing or talking to my family or friends. . .	single choice			0
155	52	My code word will be:	short text		 	0
232	120	I don’t want to feel scared or anxious when I am around my partner	single choice			0
198	94	In the past year, has your partner(s) threatened or forced you to have sex (like hitting, holding down, or using a weapon) ?	single choice			0
217	112	I am concerned that it is contributing towards physical problems that I am experiencing like headaches, stomach problems, body pains, female problems	single choice			0
233	121	I want to improve the relationship I have with my partner 	single choice			0
234	122	I don't want to feel trapped in the relationship	single choice			0
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
127		f	f
128		f	f
125		f	f
126		f	f
114		f	t
57		f	t
\.


--
-- Data for Name: quizblock_response; Type: TABLE DATA; Schema: public; Owner: -
--

COPY quizblock_response (id, question_id, submission_id, value) FROM stdin;
3429	155	3376	 
3430	156	3377	 
3431	157	3378	 
3432	158	3379	n
3434	159	3387	n
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
27	72	10	1
28	73	11	2
41	72	21	2
3517	184	3460	2
3524	191	3467	2
3531	198	3474	2
3538	206	3482	1
3545	213	3489	2
3552	219	3496	2
3559	232	3503	3
3565	151	3509	id
3571	156	3515	go to
3572	157	3516	other go to
3578	163	3522	support
3585	168	3528	desired outcomes
3586	167	3528	1
3587	167	3528	4
2873	159	2875	n
2879	163	2881	n\r\nn
2885	241	2887	2
2886	241	2887	3
3602	245	3534	take time
3603	244	3534	action plan
3620	154	3543	 
3628	156	3551	 
3629	157	3552	 
3691	187	3587	1
3697	190	3593	1
3703	189	3599	2
3709	188	3605	2
3715	192	3612	2
3721	189	3619	2
3727	200	3625	1
3733	191	3633	2
3739	196	3642	2
3745	192	3650	2
3751	199	3656	1
3757	202	3662	1
3763	211	3670	1
3769	188	3676	2
3775	206	3682	3
3781	206	3688	4
3787	215	3694	1
3793	215	3702	3
3799	208	3714	2
3805	217	3720	1
99	180	121	Ex-Wife
101	180	125	Ex-Wife
3811	196	3727	2
3817	211	3733	1
3823	215	3739	1
3829	217	3746	3
3835	232	3753	1
3841	234	3760	1
3853	231	3772	1
3859	148	3778	bob 
3865	151	3784	 by the door
3871	220	3790	2
3877	150	3796	go down the stairsbnnnbbn
3883	151	3802	in the closet 
3890	153	3809	Denise 
3896	158	3815	 foyer
3902	156	3821	3280 
3903	157	3822	 CUSSW
3909	222	3828	not having a place to live, having my vehicle taken away by him if I don't do what he says\r\n
3915	159	3834	 Jess
3921	161	3840	9/22/ 
3926	231	3845	1
3931	164	3850	brittany 
3149	167	3113	4
3150	167	3113	5
3157	184	3120	1
3158	210	3121	2
3163	151	3128	  
3165	151	3130	   
672	241	882	1
673	241	882	2
674	241	882	3
3248	186	3204	2
3260	185	3209	1
3261	148	3210	 
3263	184	3212	1
750	241	958	3
751	241	958	4
752	241	958	8
753	241	958	9
754	241	958	11
755	241	958	12
778	239	974	1
779	239	974	2
780	239	974	3
781	239	974	4
782	239	974	5
783	239	974	6
784	241	975	1
785	241	975	2
786	241	975	3
787	241	975	8
788	241	975	9
789	241	975	10
790	241	975	11
791	241	975	11
792	241	975	12
794	241	976	1
795	241	976	2
796	241	976	3
805	241	994	1
806	241	994	2
807	241	994	3
3518	185	3461	2
3525	192	3468	2
3532	199	3475	2
3539	207	3483	1
3546	221	3490	2
3553	220	3497	2
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
303	172	472	11
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
476	210	687	2
3519	186	3462	2
3526	193	3469	2
3533	200	3476	2
3540	208	3484	1
3547	243	3491	2
3560	233	3504	3
3566	153	3510	person
3573	158	3517	low risk space
3579	164	3523	clothes
3604	241	3535	2
3605	241	3535	5
3606	241	3535	10
3621	155	3544	 
3630	158	3553	n
3692	185	3588	1
3698	184	3594	2
3704	192	3600	1
3710	187	3607	2
3716	197	3613	1
3722	199	3620	1
3728	190	3626	2
3734	204	3634	3
3740	191	3643	2
3746	191	3651	2
3752	193	3657	1
3758	196	3663	1
3764	187	3671	2
3770	213	3677	1
3776	204	3683	0
3782	190	3689	2
3788	215	3696	2
3794	215	3703	1
3800	216	3715	1
3806	194	3721	2
3812	222	3728	getting arrested
3818	212	3734	2
3824	200	3740	2
3830	218	3747	1
3836	203	3754	4
3842	211	3761	2
3848	213	3767	1
2874	160	2876	n
3860	209	3779	4
3866	153	3785	my mom 
3884	232	3803	1
3891	235	3810	pie
3897	216	3816	1
3904	219	3823	1
3910	151	3829	closet 
3916	160	3835	jess 
3155	167	3119	4
3156	167	3119	5
3164	150	3129	 
3166	153	3131	 
650	239	865	2
651	239	865	3
652	239	865	4
659	241	876	2
660	241	876	3
661	241	876	5
662	241	876	6
663	241	876	7
664	241	876	8
665	241	876	12
668	239	879	1
669	239	879	2
670	239	879	3
671	239	879	4
677	239	884	1
678	239	884	2
679	239	884	3
689	241	902	3
690	241	902	4
691	241	902	5
694	241	905	8
695	241	905	9
3250	239	3205	9
3251	239	3205	10
3252	239	3205	11
3253	239	3205	12
744	241	956	8
745	241	956	9
746	240	957	test
747	239	957	1
748	239	957	2
749	239	957	3
757	241	959	3
758	241	959	4
759	241	959	8
760	241	959	9
761	241	959	11
762	241	959	11
763	241	959	12
821	241	1001	1
822	241	1001	2
823	241	1001	3
826	241	1004	1
827	241	1004	2
828	241	1004	3
836	241	1008	1
837	241	1008	2
838	241	1008	3
843	241	1012	1
844	241	1012	2
845	241	1012	3
3520	187	3463	2
3527	194	3470	2
3534	202	3478	1
3541	209	3485	1
3548	215	3492	2
3555	222	3499	this question is optional.
3561	234	3505	3
3567	151	3511	id
2780	167	2773	4
2781	167	2773	5
3574	159	3518	extra keys
3580	165	3524	review
3589	240	3530	other issues
3590	239	3530	3
3591	239	3530	6
3592	239	3530	7
3593	239	3530	11
3608	245	3536	take time
3609	244	3536	action plan
3616	148	3539	 
3622	156	3545	 
3623	157	3546	 
3631	159	3554	n
3648	239	3562	2
3649	239	3562	8
3650	239	3562	11
3657	167	3564	4
3658	167	3564	5
3664	241	3570	2
3665	241	3570	3
3666	241	3570	8
3667	241	3570	9
3671	241	3579	2
3672	241	3579	5
3673	241	3579	7
3674	241	3579	10
3677	244	3580	   
3679	239	3581	2
3680	239	3581	8
3681	239	3581	11
3687	184	3583	1
3693	186	3589	1
3699	188	3595	1
3705	187	3601	2
3711	195	3608	1
3717	189	3614	2
3723	193	3621	2
3729	202	3628	2
3735	205	3637	1
3741	207	3645	4
3747	209	3652	3
3753	194	3658	1
3759	197	3666	1
3765	204	3672	0
3771	205	3678	2
3777	243	3684	1
3783	208	3690	2
3789	215	3698	3
3795	191	3704	1
926	210	1085	1
927	211	1086	1
928	212	1087	1
929	213	1088	1
930	221	1089	1
931	243	1090	1
932	215	1091	1
933	216	1092	1
934	217	1093	1
935	218	1094	1
936	219	1095	1
937	220	1096	1
938	222	1097	This is another concern
3801	209	3716	3
3807	218	3722	1
3813	209	3729	2
2400	186	2366	1
3819	213	3735	3
3825	223	3741	2
3831	219	3748	1
3837	222	3755	fighting
3855	233	3774	3
3861	243	3780	2
3867	217	3786	2
3873	210	3792	1
3879	230	3798	3
3885	233	3804	3
3892	243	3811	1
3898	217	3817	1
2875	160	2877	n
3905	220	3824	2
3911	158	3830	the hallway 
3917	160	3836	Eddie 
3254	241	3206	2
3255	241	3206	3
970	185	1129	1
3256	241	3206	4
1685	184	1700	1
3351	151	3297	   
3359	153	3310	 
3364	158	3315	n
3368	162	3319	n\r\n\r\n\r\n\r\n
3375	148	3326	 
3379	154	3330	 
3384	159	3335	n
3388	163	3339	n\r\nn
3407	212	3353	2
3411	215	3357	2
3415	219	3361	2
3422	241	3365	2
3423	241	3365	5
3424	241	3365	7
3425	241	3365	10
2783	220	2775	2
3521	188	3464	2
3528	195	3471	2
3535	203	3479	1
3542	210	3486	2
3549	216	3493	2
3556	223	3500	3
3562	235	3506	other reasons
3568	153	3512	person
3575	160	3519	docs
3581	166	3525	review2
3594	241	3531	2
3595	241	3531	5
3596	241	3531	10
2868	184	2850	1
2870	158	2872	n
2876	161	2878	n
3625	153	3548	 
3632	160	3555	n
3637	239	3559	2
3638	239	3559	8
3639	239	3559	11
3651	241	3563	2
3652	241	3563	5
3653	241	3563	7
3654	241	3563	10
3682	241	3582	2
3683	241	3582	5
3684	241	3582	7
3685	241	3582	10
3688	185	3584	1
3694	188	3590	1
1053	239	1199	1
1054	239	1199	2
1055	239	1199	3
1056	239	1199	4
1057	239	1199	5
1058	239	1199	6
1060	239	1200	1
1061	239	1200	2
1062	239	1200	3
1063	239	1200	4
1064	239	1200	5
1065	239	1200	6
1066	241	1201	2
1067	241	1201	3
1069	241	1202	2
1070	241	1202	3
1073	239	1203	1
1074	239	1203	2
1075	239	1203	3
1076	239	1203	4
1077	239	1203	5
1078	239	1203	6
1080	239	1204	1
1081	239	1204	2
1082	239	1204	3
1083	239	1204	4
1084	239	1204	5
1085	239	1204	6
1086	241	1205	2
1087	241	1205	3
1088	241	1205	8
1089	241	1205	9
1091	241	1206	2
1092	241	1206	3
1093	241	1206	8
1094	241	1206	9
1097	239	1207	1
1098	239	1207	2
1099	239	1207	3
1100	239	1207	4
1101	239	1207	5
1102	239	1207	6
1104	167	1208	4
1105	167	1208	5
1107	239	1209	1
1108	239	1209	2
1109	239	1209	3
1110	239	1209	4
1111	239	1209	5
1112	239	1209	6
1113	241	1210	2
1114	241	1210	3
1115	241	1210	8
1116	241	1210	9
3700	185	3596	1
3706	193	3602	1
3712	191	3609	1
3718	198	3616	1
3724	188	3622	2
3730	190	3629	2
3736	195	3638	1
3742	185	3647	1
3748	198	3653	2
3754	200	3659	1
3760	203	3667	1
3766	199	3673	1
3772	202	3679	1
3778	189	3685	2
3784	215	3691	2
3790	215	3699	3
3796	207	3705	4
3802	208	3717	2
3808	195	3724	1
3814	197	3730	1
3820	199	3736	2
3826	202	3743	4
3832	203	3749	4
3838	204	3757	0
3844	205	3763	0
3850	221	3769	3
3856	234	3775	2
3862	215	3781	1
3868	218	3787	1
3874	211	3793	1
3880	213	3799	1
3886	221	3805	1
3893	153	3812	Denise 
3899	155	3818	 WINGS
3906	148	3825	 
3912	153	3831	jim 
3918	155	3837	martin 
3923	162	3842	moving into Denise
3927	156	3846	denise 
3928	157	3847	 stacey
3352	153	3298	 
3360	154	3311	 
3365	159	3316	n
3369	163	3320	n\r\nn
3380	155	3331	 
3385	160	3336	n
3393	241	3344	2
3394	241	3344	3
3408	213	3354	2
3412	216	3358	2
3416	220	3362	2
3522	189	3465	2
3529	196	3472	2
3536	204	3480	1
3543	211	3487	2
3550	217	3494	2
3557	230	3501	3
3563	148	3507	name
3569	154	3513	person 2
3576	161	3520	savings acct
3582	236	3526	step 1
3583	237	3526	step 2
3598	245	3532	take time
3599	244	3532	action plan
2869	198	2866	2
2871	158	2873	n
2877	161	2879	n
3626	154	3549	 
3633	161	3556	n
3640	241	3560	2
3641	241	3560	5
3642	241	3560	7
3643	241	3560	10
3689	186	3585	1
3695	189	3591	2
3701	191	3597	1
3707	190	3603	1
3713	196	3610	1
3719	189	3617	2
3725	189	3623	2
3731	203	3630	4
3737	206	3639	3
3743	197	3648	2
3749	192	3654	2
3755	195	3660	1
3761	210	3668	1
3767	212	3674	1
3773	221	3680	1
3779	207	3686	2
3785	215	3692	2
3791	215	3700	1
3797	192	3711	2
3803	193	3718	2
3809	219	3725	1
3815	198	3731	2
3821	221	3737	2
3827	216	3744	2
3833	231	3750	1
3839	233	3758	1
3845	212	3764	3
3851	207	3770	4
3863	150	3782	use the fire escape
3869	219	3788	3
3875	154	3794	brittany 
3887	234	3806	1
3894	215	3813	3
3900	218	3819	3
3907	148	3826	bob 
3913	154	3832	wes 
3919	223	3838	1
3929	163	3848	jess
3932	232	3851	1
3934	163	3853	djdj
3936	158	3855	hallway 
3938	165	3857	3.14 days a week 
3940	166	3859	dawn 
3942	234	3861	3
3944	166	3863	 djd
3946	161	3865	tomorrow 
3948	236	3867	contact mom 
3949	237	3867	 call stacey
3951	148	3869	 
3954	168	3871	we get clean
3955	167	3871	3
3957	148	3873	 
3960	167	3875	1
3963	239	3877	1
3965	239	3877	2
3966	239	3877	3
3967	239	3877	4
3968	239	3877	5
3969	239	3877	6
3970	239	3877	7
3971	239	3877	8
3972	239	3877	9
3973	239	3877	10
3974	239	3877	11
3975	239	3877	12
3979	239	3881	8
3353	154	3299	 
3354	148	3305	  
3355	148	3306	 
3361	155	3312	 
3366	160	3317	n
3373	148	3324	 
3381	156	3332	 
3382	157	3333	 
3386	161	3337	n
3397	244	3345	 
3400	153	3348	 
3402	244	3349	 
3404	244	3350	 
3405	210	3351	2
3409	221	3355	2
3413	217	3359	2
3980	239	3881	9
3981	239	3881	10
3998	150	3885	The front door
4001	245	3887	create art
4002	244	3887	call palladia
4009	151	3889	in the cabnet by the door 
4011	154	3891	Gertrude 
4014	236	3893	h 
4015	237	3893	h
4018	245	3895	ride the subway
4019	244	3895	go home
4021	240	3897	hi
4022	239	3897	3
4025	156	3899	Gertrude 
4026	157	3900	Tina
4029	245	3902	bye
4030	244	3902	hi
4032	159	3904	 
4034	160	3906	Gertrude home 
4036	162	3908	taking charge of my life
4038	163	3910	Tina or Gertrude
4040	165	3912	 daily
4045	167	3915	4
4052	244	3919	contact them
4056	185	3925	1
4059	185	3932	1
4061	187	3934	2
1693	198	1709	2
2785	222	2777	fghn
3523	190	3466	2
3530	197	3473	2
3537	205	3481	1
3544	212	3488	2
3551	218	3495	2
3558	231	3502	3
3564	150	3508	exits
3570	155	3514	code word
3577	162	3521	independence
3600	245	3533	take time
3601	244	3533	action plan
3619	153	3542	 
3627	155	3550	 
3634	162	3557	n\r\n\r\n\r\n\r\n
3646	244	3561	  
2872	159	2874	n
2878	162	2880	\r\nn\r\n\r\n\r\n\r\n
3690	184	3586	2
3696	187	3592	2
3702	186	3598	2
3708	194	3604	1
3714	188	3611	2
3720	188	3618	2
3726	194	3624	2
3732	190	3632	2
3738	184	3640	2
3744	208	3649	4
3750	186	3655	1
3756	187	3661	1
3762	198	3669	1
3768	200	3675	1
3774	203	3681	3
3780	205	3687	0
3786	215	3693	2
3792	215	3701	2
3798	208	3713	2
3804	209	3719	3
3810	220	3726	1
3816	210	3732	1
3822	243	3738	1
3828	230	3745	1
3834	220	3751	2
3840	210	3759	1
3846	206	3765	4
3852	230	3771	3
3858	208	3777	4
3864	216	3783	2
1565	222	1592	sdf
1566	222	1593	sdf
1567	220	1594	1
1568	222	1595	sdf
3870	148	3789	Stacey 
3876	212	3795	2
3882	155	3801	Aunt flo 
3888	156	3807	 brittany's house
3889	157	3808	 mom's
3895	154	3814	Simone 
3901	148	3820	 
3908	150	3827	go to simones
3914	159	3833	stacey 
3920	161	3839	 5/7/12
3930	164	3849	brittany 
3933	233	3852	2
3935	158	3854	hallway 
3937	164	3856	Denise 
3939	164	3858	Denise 
3941	165	3860	 3
3943	159	3862	betty 
3945	160	3864	simone 
3947	235	3866	To feel better about myself and move on with my life.
3950	162	3868	getting a cat
3952	236	3870	 go to school
3953	237	3870	 go to work
3956	163	3872	n
3958	164	3874	a 
3961	165	3876	 a
3964	166	3878	d 
3977	148	3880	Denise 
3983	241	3882	2
3984	241	3882	3
3986	241	3882	4
3987	241	3882	5
3988	241	3882	6
3989	241	3882	7
3990	241	3882	8
3991	241	3882	9
3992	241	3882	10
3993	241	3882	11
3996	239	3884	8
3997	239	3884	10
3999	236	3886	 
4000	237	3886	 
3350	150	3296	 
3356	150	3307	  
3362	156	3313	 
3363	157	3314	 
3367	161	3318	n
3378	153	3329	 
3383	158	3334	n
3387	162	3338	n\r\n\r\n\r\n\r\n
3398	148	3346	 
3406	211	3352	2
3410	243	3356	2
3414	218	3360	2
3419	239	3364	2
3420	239	3364	8
3421	239	3364	11
3428	153	3375	 
4003	241	3888	9
4004	241	3888	10
4005	241	3888	11
4006	241	3888	11
4007	241	3888	12
4008	242	3888	having fun
4010	153	3890	Tina 
4016	168	3894	hep
4017	167	3894	1
4020	155	3896	Tina 
4023	241	3898	10
4031	158	3903	along the hallway towards the front door
4033	159	3905	extra keys
4035	161	3907	next week 
4039	164	3911	 Gertrude
4041	166	3913	Gertrude 
4042	236	3914	contact my friends 
4043	237	3914	 visit my support network
4047	239	3916	1
4049	241	3918	4
4053	245	3920	services 
4054	244	3920	contact them
4055	184	3924	1
4057	186	3927	2
4058	184	3931	1
4060	186	3933	2
4062	148	3935	 
4064	185	3938	1
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
640	128	13	2011-12-16 12:37:35.874407-05
642	125	13	2011-12-16 12:37:49.886043-05
644	124	13	2011-12-16 12:37:59.962803-05
646	62	13	2011-12-16 12:38:21.191107-05
648	60	13	2011-12-16 12:38:25.468395-05
21	12	13	2011-11-10 09:29:04.058432-05
650	58	13	2011-12-16 12:38:33.448871-05
652	56	13	2011-12-16 12:38:38.036868-05
3376	52	13	2012-02-17 11:46:10.146472-05
3377	53	13	2012-02-17 12:02:39.866103-05
2872	55	13	2012-01-23 16:12:53.349974-05
2878	58	13	2012-01-23 16:13:22.220696-05
2884	63	13	2012-01-23 16:14:09.72304-05
3378	54	13	2012-02-17 12:02:39.872954-05
3379	55	13	2012-02-17 12:14:19.395129-05
3385	122	13	2012-02-17 12:20:53.073886-05
3387	56	13	2012-02-17 12:33:06.488054-05
686	124	109	2011-12-16 14:10:10.472467-05
688	106	5	2011-12-16 14:20:20.160972-05
690	108	5	2011-12-16 14:20:28.564892-05
3203	81	8	2012-01-27 16:25:03.769764-05
3204	82	8	2012-01-27 16:25:32.192258-05
3208	80	13	2012-01-30 09:40:14.665542-05
3210	47	13	2012-01-30 09:51:47.554552-05
3212	80	5	2012-01-30 10:44:44.192275-05
3460	80	171	2012-02-20 14:04:05.598649-05
3466	86	171	2012-02-20 14:04:15.47551-05
3472	92	171	2012-02-20 14:04:24.298306-05
3478	97	171	2012-02-20 14:04:32.476173-05
3484	103	171	2012-02-20 14:04:39.036559-05
3490	109	171	2012-02-20 14:04:54.112222-05
3496	114	171	2012-02-20 14:05:02.493153-05
3502	119	171	2012-02-20 14:05:14.598042-05
3508	48	171	2012-02-20 14:05:28.342964-05
3514	52	171	2012-02-20 14:05:38.252558-05
3521	59	171	2012-02-20 14:05:53.105236-05
3527	64	171	2012-02-20 14:06:18.938622-05
3533	128	171	2012-02-20 14:09:10.304127-05
3536	128	171	2012-02-20 16:43:48.213608-05
3539	47	13	2012-02-22 10:36:47.003831-05
3545	53	13	2012-02-22 10:37:04.91787-05
3546	54	13	2012-02-22 10:37:04.924034-05
3547	49	13	2012-02-22 10:41:00.94964-05
3554	56	13	2012-02-22 10:41:41.803203-05
3558	64	13	2012-02-22 10:53:52.673231-05
3562	125	13	2012-02-22 11:42:18.180732-05
3564	64	5	2012-02-22 12:08:38.022212-05
3570	126	5	2012-02-22 12:09:23.33554-05
3572	117	13	2012-02-22 12:52:08.792788-05
3578	126	5	2012-02-22 12:57:46.68717-05
3579	126	13	2012-02-23 10:24:53.484402-05
3580	128	13	2012-02-23 10:26:22.534369-05
3581	125	13	2012-02-24 12:32:55.15225-05
3583	80	177	2012-02-24 12:52:10.009878-05
3589	82	179	2012-02-24 12:52:52.461917-05
3595	84	179	2012-02-24 12:53:15.062154-05
3601	83	178	2012-02-24 12:53:21.32972-05
3607	83	178	2012-02-24 12:53:32.299927-05
3613	93	177	2012-02-24 12:53:46.282798-05
2364	84	13	2012-01-19 16:12:15.227916-05
2366	82	13	2012-01-19 16:16:18.008871-05
3619	85	178	2012-02-24 12:53:54.258795-05
3625	96	177	2012-02-24 12:54:06.955689-05
3631	87	178	2012-02-24 12:54:29.301903-05
3637	100	177	2012-02-24 12:54:56.415817-05
3643	87	178	2012-02-24 12:55:11.620683-05
3649	103	177	2012-02-24 12:55:22.000173-05
3655	82	180	2012-02-24 12:55:32.212801-05
3661	83	180	2012-02-24 12:55:46.323272-05
3667	98	179	2012-02-24 12:55:52.175052-05
3673	95	178	2012-02-24 12:56:01.783599-05
3679	97	178	2012-02-24 12:56:12.671937-05
3685	85	180	2012-02-24 12:56:22.623401-05
3113	64	5	2012-01-25 15:29:59.333699-05
3691	110	177	2012-02-24 12:56:37.428893-05
3118	124	5	2012-01-25 18:11:01.036587-05
3120	80	5	2012-01-25 18:22:50.622164-05
3121	105	5	2012-01-26 13:34:42.086917-05
3697	104	179	2012-02-24 12:56:40.173906-05
3128	49	5	2012-01-26 13:44:06.705261-05
3703	110	177	2012-02-24 12:56:41.619888-05
3709	103	178	2012-02-24 12:56:51.532738-05
3715	111	177	2012-02-24 12:56:57.566355-05
3287	125	13	2012-01-30 14:51:37.731293-05
3288	117	5	2012-01-30 15:39:49.65644-05
3294	123	5	2012-01-30 15:40:05.506354-05
3300	80	162	2012-02-01 12:19:51.858697-05
3306	47	13	2012-02-01 12:21:34.543891-05
2854	84	5	2012-01-23 15:30:46.795877-05
2860	88	5	2012-01-23 15:31:01.687934-05
2866	94	5	2012-01-23 15:31:11.548271-05
120	74	5	2011-11-28 13:59:53.861876-05
121	75	5	2011-11-28 13:59:53.868288-05
122	76	5	2011-11-28 13:59:53.87375-05
123	77	5	2011-11-28 13:59:53.876455-05
124	74	5	2011-11-28 13:59:54.501359-05
125	75	5	2011-11-28 13:59:54.510408-05
126	76	5	2011-11-28 13:59:54.516922-05
127	77	5	2011-11-28 13:59:54.52029-05
128	124	13	2011-11-30 10:56:51.831516-05
3130	49	5	2012-01-26 13:45:14.077943-05
3308	48	13	2012-02-13 10:17:29.504046-05
3315	55	13	2012-02-13 10:18:01.19762-05
3321	61	13	2012-02-13 10:20:02.46749-05
3324	47	13	2012-02-13 10:51:44.089789-05
3330	51	13	2012-02-13 10:53:01.947331-05
3337	58	13	2012-02-13 10:53:45.278917-05
3343	125	13	2012-02-13 10:55:52.060705-05
3348	50	13	2012-02-13 11:00:32.360036-05
3349	128	13	2012-02-13 11:09:29.892158-05
3721	90	180	2012-02-24 12:57:12.715453-05
3727	92	180	2012-02-24 12:57:37.048188-05
3733	106	178	2012-02-24 12:58:14.488964-05
3739	110	178	2012-02-24 12:58:37.630135-05
3745	118	177	2012-02-24 12:58:58.405429-05
3751	115	178	2012-02-24 12:59:15.005198-05
3757	99	180	2012-02-24 12:59:31.945391-05
3763	100	180	2012-02-24 12:59:44.047935-05
3769	109	179	2012-02-24 13:00:05.452357-05
863	126	5	2011-12-21 11:03:44.894575-05
865	125	5	2011-12-21 11:03:52.759875-05
867	125	5	2011-12-21 11:09:22.198634-05
869	126	5	2011-12-21 11:10:29.209348-05
871	126	5	2011-12-21 11:10:32.628588-05
873	125	5	2011-12-21 11:10:40.754949-05
875	126	5	2011-12-21 11:31:01.059599-05
876	126	5	2011-12-21 12:00:30.690284-05
878	125	5	2011-12-21 12:00:39.474468-05
880	126	5	2011-12-21 12:00:47.463478-05
882	126	5	2011-12-21 12:00:58.022628-05
884	125	5	2011-12-21 14:32:29.016306-05
886	125	13	2012-01-04 10:05:20.122227-05
899	126	5	2012-01-04 10:28:35.821809-05
901	125	5	2012-01-04 10:29:05.024048-05
903	125	5	2012-01-04 10:32:06.468792-05
905	126	5	2012-01-04 10:32:16.284128-05
641	126	13	2011-12-16 12:37:44.099681-05
643	64	13	2011-12-16 12:37:57.156669-05
645	63	13	2011-12-16 12:38:19.37414-05
647	61	13	2011-12-16 12:38:23.047075-05
649	59	13	2011-12-16 12:38:30.956519-05
651	57	13	2011-12-16 12:38:35.673998-05
3380	117	13	2012-02-17 12:20:41.330847-05
3386	123	13	2012-02-17 12:20:55.108165-05
2873	55	13	2012-01-23 16:12:56.35076-05
2879	58	13	2012-01-23 16:13:24.940495-05
2885	64	13	2012-01-23 16:14:26.948734-05
687	105	5	2011-12-16 14:20:17.733631-05
689	107	5	2011-12-16 14:20:25.029581-05
3461	81	171	2012-02-20 14:04:06.519597-05
3205	125	8	2012-01-27 16:27:04.41336-05
3209	81	13	2012-01-30 09:40:21.291691-05
3211	48	13	2012-01-30 09:51:51.347923-05
3467	87	171	2012-02-20 14:04:16.882171-05
3473	93	171	2012-02-20 14:04:25.237315-05
3479	98	171	2012-02-20 14:04:33.427581-05
3485	104	171	2012-02-20 14:04:41.59828-05
3491	127	171	2012-02-20 14:04:55.570101-05
3497	115	171	2012-02-20 14:05:03.743062-05
3503	120	171	2012-02-20 14:05:15.675835-05
3509	49	171	2012-02-20 14:05:30.156512-05
3515	53	171	2012-02-20 14:05:39.346991-05
3516	54	171	2012-02-20 14:05:39.353139-05
3522	60	171	2012-02-20 14:05:56.971258-05
3528	64	171	2012-02-20 14:06:20.361262-05
3534	128	171	2012-02-20 14:09:26.837472-05
3289	118	5	2012-01-30 15:39:51.547795-05
3540	48	13	2012-02-22 10:36:49.419169-05
3548	50	13	2012-02-22 10:41:02.66818-05
3555	57	13	2012-02-22 10:41:45.221812-05
3559	125	13	2012-02-22 10:54:00.784153-05
3563	126	13	2012-02-22 11:42:21.582242-05
3565	64	5	2012-02-22 12:08:45.303909-05
3571	64	5	2012-02-22 12:09:41.065537-05
3573	118	13	2012-02-22 12:52:11.76605-05
3582	126	13	2012-02-24 12:33:03.353818-05
3584	81	177	2012-02-24 12:52:16.676931-05
3590	84	177	2012-02-24 12:52:53.1913-05
3596	81	178	2012-02-24 12:53:15.404105-05
3602	89	177	2012-02-24 12:53:25.054059-05
3608	91	177	2012-02-24 12:53:35.357423-05
3614	85	178	2012-02-24 12:53:46.837503-05
3620	95	177	2012-02-24 12:53:54.755488-05
3626	86	178	2012-02-24 12:54:12.383957-05
3632	86	178	2012-02-24 12:54:34.775989-05
3638	91	179	2012-02-24 12:54:59.011775-05
3644	93	179	2012-02-24 12:55:15.577875-05
3650	88	178	2012-02-24 12:55:22.49866-05
3656	95	179	2012-02-24 12:55:34.127696-05
3662	97	179	2012-02-24 12:55:46.328486-05
2365	83	13	2012-01-19 16:12:19.922481-05
2367	83	13	2012-01-19 16:16:22.422087-05
3295	47	5	2012-01-30 15:40:44.302155-05
3668	105	177	2012-02-24 12:55:53.191982-05
3674	107	177	2012-02-24 12:56:04.547212-05
3680	109	177	2012-02-24 12:56:15.74661-05
3686	102	179	2012-02-24 12:56:25.804176-05
3692	110	177	2012-02-24 12:56:38.367779-05
3698	110	177	2012-02-24 12:56:40.196514-05
3704	87	180	2012-02-24 12:56:44.408013-05
3710	104	179	2012-02-24 12:56:51.853277-05
3716	104	178	2012-02-24 12:56:58.828719-05
3722	113	177	2012-02-24 12:57:16.699342-05
3728	116	177	2012-02-24 12:57:47.128559-05
3734	107	178	2012-02-24 12:58:21.233701-05
3740	96	180	2012-02-24 12:58:38.945034-05
3746	112	178	2012-02-24 12:58:59.604387-05
3301	81	162	2012-02-01 12:19:56.591977-05
3307	48	162	2012-02-01 12:21:43.065038-05
3309	49	13	2012-02-13 10:17:32.658999-05
3316	56	13	2012-02-13 10:19:42.770995-05
3322	62	13	2012-02-13 10:20:04.744481-05
3325	48	13	2012-02-13 10:51:46.221412-05
3331	52	13	2012-02-13 10:53:10.447383-05
3338	59	13	2012-02-13 10:53:48.073828-05
2855	85	5	2012-01-23 15:30:48.410069-05
2861	89	5	2012-01-23 15:31:03.226538-05
2867	95	5	2012-01-23 15:31:13.31601-05
3752	99	180	2012-02-24 12:59:16.563883-05
3119	64	5	2012-01-25 18:11:03.164223-05
3758	121	177	2012-02-24 12:59:32.26475-05
3764	107	179	2012-02-24 12:59:50.285557-05
3770	102	180	2012-02-24 13:00:06.276349-05
3775	122	178	2012-02-24 13:00:34.619716-05
3780	127	179	2012-02-24 13:00:50.977712-05
3785	50	177	2012-02-24 13:01:17.282996-05
3790	115	179	2012-02-24 13:01:39.505245-05
3795	107	180	2012-02-24 13:02:27.20415-05
3800	119	179	2012-02-24 13:02:58.558155-05
3129	48	5	2012-01-26 13:44:16.918658-05
3131	50	5	2012-01-26 13:45:23.38799-05
3344	126	13	2012-02-13 10:55:55.729985-05
3350	128	13	2012-02-13 11:11:44.402537-05
3355	109	13	2012-02-15 11:20:20.724089-05
864	125	5	2011-12-21 11:03:47.342337-05
866	126	5	2011-12-21 11:03:54.546465-05
868	125	5	2011-12-21 11:09:40.125299-05
870	125	5	2011-12-21 11:10:30.863883-05
872	126	5	2011-12-21 11:10:37.793056-05
874	126	5	2011-12-21 11:11:01.2137-05
877	126	5	2011-12-21 12:00:35.766023-05
879	125	5	2011-12-21 12:00:45.365988-05
881	125	5	2011-12-21 12:00:49.665442-05
883	126	5	2011-12-21 12:01:01.669391-05
885	126	5	2011-12-21 14:32:31.001534-05
3360	113	13	2012-02-15 11:20:36.31691-05
3365	126	13	2012-02-15 11:25:02.997678-05
3372	119	13	2012-02-15 14:31:19.060869-05
3805	109	180	2012-02-24 13:03:15.790605-05
3811	127	180	2012-02-24 13:03:33.111432-05
898	125	5	2012-01-04 10:28:30.390943-05
900	125	5	2012-01-04 10:29:01.499703-05
902	126	5	2012-01-04 10:29:09.060846-05
904	126	5	2012-01-04 10:32:10.011096-05
3816	111	180	2012-02-24 13:03:55.550732-05
3821	53	178	2012-02-24 13:04:34.738693-05
3822	54	178	2012-02-24 13:04:34.744724-05
3827	48	179	2012-02-24 13:05:54.331331-05
3832	51	179	2012-02-24 13:07:00.285614-05
3837	52	179	2012-02-24 13:07:38.164518-05
319	66	5	2011-12-09 16:16:49.59296-05
320	67	5	2011-12-09 16:16:49.599501-05
321	68	5	2011-12-09 16:16:49.60216-05
322	69	5	2011-12-09 16:16:49.605013-05
323	66	5	2011-12-09 16:16:54.107998-05
324	67	5	2011-12-09 16:16:54.114308-05
325	68	5	2011-12-09 16:16:54.119629-05
326	69	5	2011-12-09 16:16:54.122483-05
955	125	5	2012-01-04 17:51:46.027731-05
956	126	5	2012-01-04 17:51:48.906166-05
957	125	5	2012-01-05 10:31:53.774634-05
958	126	5	2012-01-05 10:31:58.918532-05
959	126	5	2012-01-05 10:44:17.892152-05
960	128	5	2012-01-05 10:44:26.731715-05
974	125	5	2012-01-05 15:33:45.644318-05
975	126	5	2012-01-05 15:34:18.194859-05
976	126	5	2012-01-05 15:34:29.082682-05
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
3381	118	13	2012-02-17 12:20:44.002509-05
2874	56	13	2012-01-23 16:13:07.905691-05
2880	59	13	2012-01-23 16:13:40.798272-05
982	80	5	2012-01-06 10:22:15.69988-05
983	81	5	2012-01-06 10:22:32.437242-05
984	63	5	2012-01-06 10:24:57.626168-05
985	63	5	2012-01-06 10:25:06.760286-05
986	62	5	2012-01-06 10:25:11.727644-05
987	48	5	2012-01-06 10:40:36.449682-05
988	47	5	2012-01-06 10:40:41.291498-05
989	80	5	2012-01-06 14:51:18.757115-05
990	81	5	2012-01-06 14:53:02.480071-05
991	64	13	2012-01-09 09:48:45.786837-05
992	125	13	2012-01-09 09:49:05.729111-05
993	126	13	2012-01-09 09:49:13.891-05
994	126	13	2012-01-09 09:57:51.594021-05
2886	125	13	2012-01-23 16:14:33.819087-05
998	128	13	2012-01-09 10:04:32.550242-05
999	125	13	2012-01-09 11:07:28.436706-05
1000	125	13	2012-01-09 11:11:29.304091-05
1001	126	13	2012-01-09 11:11:54.71173-05
1002	128	13	2012-01-09 11:13:21.680295-05
1003	125	13	2012-01-09 15:22:25.452108-05
1004	126	13	2012-01-09 15:22:29.426559-05
1005	124	13	2012-01-09 15:23:45.699797-05
1007	125	13	2012-01-10 17:11:46.075492-05
1008	126	13	2012-01-10 17:11:53.911404-05
1009	124	5	2012-01-11 13:37:54.442726-05
1010	64	5	2012-01-11 13:37:57.555469-05
1011	125	13	2012-01-11 14:12:27.945758-05
1012	126	13	2012-01-11 14:12:31.74877-05
1013	128	13	2012-01-11 14:13:12.271013-05
3462	82	171	2012-02-20 14:04:07.636503-05
3206	126	8	2012-01-27 16:27:11.284176-05
3468	88	171	2012-02-20 14:04:17.943166-05
3474	94	171	2012-02-20 14:04:26.364899-05
3480	99	171	2012-02-20 14:04:34.431811-05
3486	105	171	2012-02-20 14:04:48.497415-05
3492	110	171	2012-02-20 14:04:56.899725-05
3498	116	171	2012-02-20 14:05:04.98319-05
3504	121	171	2012-02-20 14:05:17.524544-05
3510	50	171	2012-02-20 14:05:31.243854-05
3517	55	171	2012-02-20 14:05:41.758156-05
3523	61	171	2012-02-20 14:05:58.0841-05
3529	125	171	2012-02-20 14:06:22.379417-05
3535	126	171	2012-02-20 14:09:31.63539-05
3541	49	13	2012-02-22 10:36:51.519025-05
3549	51	13	2012-02-22 10:41:04.412676-05
3556	58	13	2012-02-22 10:42:35.451934-05
3560	126	13	2012-02-22 10:54:06.39013-05
3566	64	5	2012-02-22 12:08:51.494584-05
3574	119	13	2012-02-22 12:52:15.585333-05
3585	82	177	2012-02-24 12:52:23.800412-05
3591	85	177	2012-02-24 12:53:02.267962-05
2773	64	5	2012-01-23 14:36:29.270239-05
2774	116	5	2012-01-23 14:36:54.054506-05
2778	116	5	2012-01-23 14:49:21.303197-05
3597	87	177	2012-02-24 12:53:15.773932-05
3603	86	179	2012-02-24 12:53:25.454628-05
3609	87	179	2012-02-24 12:53:37.504508-05
3615	86	178	2012-02-24 12:53:48.22159-05
3621	89	179	2012-02-24 12:53:55.205557-05
3627	87	178	2012-02-24 12:54:15.265003-05
3633	87	178	2012-02-24 12:54:42.106722-05
3639	101	177	2012-02-24 12:55:05.772417-05
3645	102	177	2012-02-24 12:55:16.050198-05
3651	87	178	2012-02-24 12:55:25.85119-05
3657	89	178	2012-02-24 12:55:34.75979-05
3663	92	178	2012-02-24 12:55:47.120311-05
3669	94	178	2012-02-24 12:55:56.853252-05
3675	96	178	2012-02-24 12:56:08.032131-05
3681	98	178	2012-02-24 12:56:16.481172-05
3687	100	178	2012-02-24 12:56:26.123411-05
3693	110	177	2012-02-24 12:56:38.948082-05
3699	110	177	2012-02-24 12:56:40.559256-05
3705	102	178	2012-02-24 12:56:46.05344-05
3711	88	180	2012-02-24 12:56:53.183404-05
3717	103	178	2012-02-24 12:57:00.869708-05
3723	114	177	2012-02-24 12:57:22.879856-05
3729	104	179	2012-02-24 12:57:49.154846-05
3735	108	178	2012-02-24 12:58:24.980227-05
3741	117	177	2012-02-24 12:58:49.10145-05
3747	113	178	2012-02-24 12:59:04.936532-05
1073	64	13	2012-01-11 15:30:21.078953-05
1074	124	13	2012-01-11 15:30:23.90214-05
1075	64	13	2012-01-11 15:30:26.227094-05
3753	120	177	2012-02-24 12:59:20.354178-05
3759	105	179	2012-02-24 12:59:36.273175-05
3765	101	180	2012-02-24 12:59:56.488209-05
3771	118	178	2012-02-24 13:00:10.664118-05
3776	123	178	2012-02-24 13:00:38.801941-05
3781	110	179	2012-02-24 13:00:57.780616-05
3786	112	179	2012-02-24 13:01:22.313145-05
3791	116	179	2012-02-24 13:01:45.580504-05
3290	119	5	2012-01-30 15:39:53.680042-05
1085	105	13	2012-01-12 11:00:50.135506-05
1086	106	13	2012-01-12 11:00:55.940749-05
1087	107	13	2012-01-12 11:01:02.007054-05
1088	108	13	2012-01-12 11:01:07.457321-05
1089	109	13	2012-01-12 11:01:15.415076-05
1090	127	13	2012-01-12 11:01:22.536501-05
1091	110	13	2012-01-12 11:01:29.609249-05
1092	111	13	2012-01-12 11:01:39.296818-05
1093	112	13	2012-01-12 11:01:49.645105-05
1094	113	13	2012-01-12 11:01:55.362183-05
1095	114	13	2012-01-12 11:02:01.931844-05
1096	115	13	2012-01-12 11:02:06.773882-05
1097	116	13	2012-01-12 11:02:18.830482-05
1098	48	13	2012-01-12 12:05:47.658296-05
1099	49	13	2012-01-12 12:05:56.056142-05
1100	55	13	2012-01-12 12:10:31.750988-05
1101	124	5	2012-01-12 14:06:02.142107-05
3296	48	5	2012-01-30 15:41:10.37085-05
3302	82	162	2012-02-01 12:20:00.530311-05
3310	50	13	2012-02-13 10:17:34.825615-05
3317	57	13	2012-02-13 10:19:48.960837-05
3323	63	13	2012-02-13 10:20:07.858954-05
3326	47	13	2012-02-13 10:52:48.913845-05
3332	53	13	2012-02-13 10:53:15.884772-05
3333	54	13	2012-02-13 10:53:15.890696-05
3339	60	13	2012-02-13 10:53:59.140222-05
3345	128	13	2012-02-13 10:56:13.560965-05
3351	105	13	2012-02-15 11:20:08.780248-05
3356	127	13	2012-02-15 11:20:23.783386-05
3361	114	13	2012-02-15 11:20:39.332539-05
3366	117	13	2012-02-15 14:24:52.372183-05
3368	117	13	2012-02-15 14:31:04.644664-05
3373	117	13	2012-02-15 14:31:36.177427-05
3374	49	13	2012-02-15 16:14:37.527044-05
3796	48	178	2012-02-24 13:02:27.590525-05
3801	52	177	2012-02-24 13:03:03.669179-05
3806	122	179	2012-02-24 13:03:20.212373-05
3812	50	178	2012-02-24 13:03:38.024939-05
3817	112	180	2012-02-24 13:04:08.944996-05
3823	114	180	2012-02-24 13:04:38.324907-05
3828	116	180	2012-02-24 13:06:07.910217-05
3833	56	177	2012-02-24 13:07:21.747377-05
3838	117	180	2012-02-24 13:07:38.735185-05
3842	59	177	2012-02-24 13:07:51.13553-05
1129	81	13	2012-01-12 16:06:29.075367-05
2850	80	5	2012-01-23 15:30:40.628318-05
2856	86	5	2012-01-23 15:30:51.048171-05
2862	90	5	2012-01-23 15:31:04.804605-05
2868	96	5	2012-01-23 15:31:16.297691-05
3382	119	13	2012-02-17 12:20:46.468599-05
2875	56	13	2012-01-23 16:13:13.55802-05
2881	60	13	2012-01-23 16:13:56.732781-05
2887	126	13	2012-01-23 16:14:37.896842-05
3463	83	171	2012-02-20 14:04:08.617903-05
3207	128	8	2012-01-27 16:27:36.907283-05
3469	89	171	2012-02-20 14:04:18.716449-05
3475	95	171	2012-02-20 14:04:28.466706-05
3481	100	171	2012-02-20 14:04:35.798473-05
3487	106	171	2012-02-20 14:04:49.685539-05
3493	111	171	2012-02-20 14:04:58.228546-05
3499	116	171	2012-02-20 14:05:08.632745-05
3505	122	171	2012-02-20 14:05:18.572435-05
3511	49	171	2012-02-20 14:05:32.51187-05
3518	56	171	2012-02-20 14:05:47.287845-05
3524	62	171	2012-02-20 14:05:59.683015-05
3530	125	171	2012-02-20 14:06:23.669918-05
3542	50	13	2012-02-22 10:36:53.91184-05
3550	52	13	2012-02-22 10:41:08.682133-05
3557	59	13	2012-02-22 10:43:50.535511-05
3561	128	13	2012-02-22 10:54:26.410344-05
3567	64	5	2012-02-22 12:08:57.871936-05
2775	115	5	2012-01-23 14:37:03.347043-05
3575	120	13	2012-02-22 12:52:19.425532-05
3586	80	179	2012-02-24 12:52:33.378294-05
3592	83	179	2012-02-24 12:53:07.175685-05
3598	82	178	2012-02-24 12:53:18.190655-05
3604	90	177	2012-02-24 12:53:29.472977-05
3610	92	177	2012-02-24 12:53:40.409336-05
3616	94	177	2012-02-24 12:53:50.427001-05
3622	84	178	2012-02-24 12:53:55.670263-05
3628	97	177	2012-02-24 12:54:21.934791-05
3634	99	177	2012-02-24 12:54:42.768047-05
3640	80	180	2012-02-24 12:55:07.061193-05
3646	88	178	2012-02-24 12:55:16.155286-05
3652	104	177	2012-02-24 12:55:27.405224-05
3658	90	178	2012-02-24 12:55:38.929059-05
3664	105	177	2012-02-24 12:55:48.932259-05
3670	106	177	2012-02-24 12:55:58.103457-05
3676	84	180	2012-02-24 12:56:08.810752-05
3682	101	179	2012-02-24 12:56:17.339366-05
3688	101	178	2012-02-24 12:56:29.978123-05
3694	110	177	2012-02-24 12:56:39.2784-05
3700	110	177	2012-02-24 12:56:40.842435-05
3706	104	179	2012-02-24 12:56:49.018084-05
3712	104	179	2012-02-24 12:56:54.003118-05
3718	89	180	2012-02-24 12:57:02.609906-05
3724	91	180	2012-02-24 12:57:27.078197-05
3730	93	180	2012-02-24 12:57:49.801223-05
3736	95	180	2012-02-24 12:58:25.202791-05
3742	111	178	2012-02-24 12:58:50.474821-05
3748	114	178	2012-02-24 12:59:09.925964-05
1199	125	5	2012-01-12 18:24:39.237124-05
1200	125	5	2012-01-12 18:24:44.107191-05
1201	126	5	2012-01-12 18:24:47.331764-05
1202	126	5	2012-01-12 18:25:02.255068-05
1203	125	5	2012-01-12 18:25:06.304169-05
1204	125	5	2012-01-12 18:25:15.485246-05
1205	126	5	2012-01-12 18:25:22.136065-05
1206	126	5	2012-01-12 18:25:33.752561-05
1207	125	5	2012-01-12 18:25:37.365728-05
1208	64	5	2012-01-12 18:25:49.069298-05
1209	125	5	2012-01-12 18:25:58.656254-05
1210	126	5	2012-01-12 18:26:05.76105-05
1211	64	13	2012-01-13 11:06:15.982025-05
3754	98	180	2012-02-24 12:59:22.351399-05
3760	122	177	2012-02-24 12:59:39.167726-05
3766	123	177	2012-02-24 12:59:58.671706-05
3772	119	178	2012-02-24 13:00:14.760825-05
3777	103	180	2012-02-24 13:00:40.233551-05
3782	48	177	2012-02-24 13:01:02.229073-05
3787	113	179	2012-02-24 13:01:26.94061-05
3792	105	180	2012-02-24 13:02:01.897562-05
3291	120	5	2012-01-30 15:39:57.354725-05
3297	49	5	2012-01-30 15:41:34.212454-05
3303	83	162	2012-02-01 12:20:03.207533-05
3311	51	13	2012-02-13 10:17:36.988769-05
3318	58	13	2012-02-13 10:19:51.135881-05
3327	48	13	2012-02-13 10:52:51.746836-05
3334	55	13	2012-02-13 10:53:22.012227-05
3340	61	13	2012-02-13 10:54:01.500471-05
3346	47	13	2012-02-13 10:57:52.752949-05
3352	106	13	2012-02-15 11:20:11.845262-05
3357	110	13	2012-02-15 11:20:26.268334-05
3797	117	179	2012-02-24 13:02:34.446197-05
3802	49	178	2012-02-24 13:03:04.761226-05
3807	53	177	2012-02-24 13:03:22.843404-05
3808	54	177	2012-02-24 13:03:22.849522-05
3813	110	180	2012-02-24 13:03:45.331658-05
3818	52	178	2012-02-24 13:04:21.27656-05
3824	115	180	2012-02-24 13:04:52.154517-05
3829	49	179	2012-02-24 13:06:27.770117-05
3834	56	178	2012-02-24 13:07:23.411241-05
3362	115	13	2012-02-15 11:20:42.892711-05
3367	118	13	2012-02-15 14:24:54.105751-05
3369	118	13	2012-02-15 14:31:07.43291-05
3375	50	13	2012-02-15 16:15:04.522123-05
2851	81	5	2012-01-23 15:30:42.266947-05
2857	85	5	2012-01-23 15:30:52.838704-05
2863	91	5	2012-01-23 15:31:06.613342-05
2869	95	5	2012-01-23 15:31:22.201709-05
3839	58	177	2012-02-24 13:07:41.159972-05
3843	59	178	2012-02-24 13:07:52.891549-05
3846	53	179	2012-02-24 13:08:14.000261-05
3847	54	179	2012-02-24 13:08:14.006535-05
3850	61	177	2012-02-24 13:08:28.947989-05
3853	60	178	2012-02-24 13:09:02.407188-05
3856	61	178	2012-02-24 13:09:06.432602-05
3859	63	177	2012-02-24 13:09:15.20802-05
3862	56	179	2012-02-24 13:10:26.736104-05
3865	58	179	2012-02-24 13:10:56.710482-05
3868	59	179	2012-02-24 13:12:12.57957-05
3871	64	177	2012-02-24 13:12:25.72122-05
3874	61	179	2012-02-24 13:12:36.455234-05
3877	125	177	2012-02-24 13:12:57.75131-05
3880	47	180	2012-02-24 13:13:08.686964-05
3883	126	178	2012-02-24 13:13:28.062676-05
3886	124	179	2012-02-24 13:14:11.26597-05
3889	49	180	2012-02-24 13:14:33.493095-05
3892	128	178	2012-02-24 13:15:01.330762-05
3895	128	178	2012-02-24 13:15:56.73191-05
3898	126	179	2012-02-24 13:16:25.636479-05
3902	128	179	2012-02-24 13:17:07.295876-05
3905	56	180	2012-02-24 13:18:23.357577-05
3908	59	180	2012-02-24 13:19:20.983715-05
3911	61	180	2012-02-24 13:20:08.991381-05
3918	126	180	2012-02-24 13:26:54.337146-05
3923	80	183	2012-02-28 15:01:40.064106-05
3926	82	183	2012-02-28 15:03:04.441716-05
3933	82	183	2012-02-28 15:12:37.171511-05
3383	120	13	2012-02-17 12:20:48.914678-05
2876	57	13	2012-01-23 16:13:16.533468-05
2882	61	13	2012-01-23 16:14:01.111463-05
2888	128	13	2012-01-23 16:14:47.078386-05
3464	84	171	2012-02-20 14:04:11.289004-05
3470	90	171	2012-02-20 14:04:19.679985-05
3476	96	171	2012-02-20 14:04:29.792452-05
3482	101	171	2012-02-20 14:04:36.811351-05
3488	107	171	2012-02-20 14:04:51.886557-05
3494	112	171	2012-02-20 14:05:00.326532-05
3500	117	171	2012-02-20 14:05:12.172234-05
3506	123	171	2012-02-20 14:05:21.890204-05
3512	50	171	2012-02-20 14:05:33.406126-05
3519	57	171	2012-02-20 14:05:49.825486-05
3525	63	171	2012-02-20 14:06:00.925659-05
3531	126	171	2012-02-20 14:06:24.754285-05
3543	51	13	2012-02-22 10:36:55.854564-05
3551	53	13	2012-02-22 10:41:11.03184-05
3552	54	13	2012-02-22 10:41:11.038214-05
3568	64	5	2012-02-22 12:09:03.432094-05
2776	116	5	2012-01-23 14:37:07.821298-05
3576	121	13	2012-02-22 12:52:23.103437-05
3292	121	5	2012-01-30 15:39:59.143327-05
3587	83	177	2012-02-24 12:52:35.728632-05
3593	86	177	2012-02-24 12:53:09.37117-05
3599	85	179	2012-02-24 12:53:19.86126-05
3605	84	178	2012-02-24 12:53:29.551511-05
3611	84	178	2012-02-24 12:53:42.151262-05
3617	85	178	2012-02-24 12:53:50.526465-05
3623	85	178	2012-02-24 12:53:57.483655-05
3629	86	178	2012-02-24 12:54:25.499337-05
3635	88	178	2012-02-24 12:54:45.329173-05
3641	102	177	2012-02-24 12:55:11.364521-05
3647	81	180	2012-02-24 12:55:19.608462-05
3653	94	179	2012-02-24 12:55:28.42997-05
3659	96	179	2012-02-24 12:55:40.9961-05
3665	84	180	2012-02-24 12:55:51.301459-05
3671	83	180	2012-02-24 12:55:58.559215-05
3677	108	177	2012-02-24 12:56:10.767299-05
3683	99	178	2012-02-24 12:56:20.438571-05
3689	86	180	2012-02-24 12:56:32.592524-05
3695	104	179	2012-02-24 12:56:39.293768-05
3701	110	177	2012-02-24 12:56:41.122142-05
3707	111	177	2012-02-24 12:56:50.109465-05
3713	103	178	2012-02-24 12:56:56.145913-05
3719	104	178	2012-02-24 12:57:05.349687-05
3725	114	177	2012-02-24 12:57:27.727522-05
3731	94	180	2012-02-24 12:58:03.032004-05
3737	109	178	2012-02-24 12:58:29.028764-05
3743	97	180	2012-02-24 12:58:52.768209-05
3749	98	180	2012-02-24 12:59:09.926577-05
3755	116	178	2012-02-24 12:59:23.386711-05
3761	106	179	2012-02-24 12:59:43.456465-05
3767	108	179	2012-02-24 13:00:00.217545-05
3773	120	178	2012-02-24 13:00:19.756573-05
3778	47	177	2012-02-24 13:00:49.393487-05
3783	111	179	2012-02-24 13:01:04.622092-05
3788	114	179	2012-02-24 13:01:31.684977-05
3298	50	5	2012-01-30 15:41:51.373747-05
3304	80	13	2012-02-01 12:20:49.305897-05
3312	52	13	2012-02-13 10:17:46.760518-05
3319	59	13	2012-02-13 10:19:53.161441-05
3328	49	13	2012-02-13 10:52:54.294772-05
3335	56	13	2012-02-13 10:53:39.927497-05
3341	62	13	2012-02-13 10:54:03.979185-05
3347	48	13	2012-02-13 10:57:54.690723-05
3353	107	13	2012-02-15 11:20:14.933825-05
3358	111	13	2012-02-15 11:20:29.242355-05
3363	116	13	2012-02-15 11:20:48.743022-05
2852	82	5	2012-01-23 15:30:43.832313-05
3793	106	180	2012-02-24 13:02:14.653827-05
3798	118	179	2012-02-24 13:02:45.925347-05
3803	120	179	2012-02-24 13:03:05.569472-05
3809	50	178	2012-02-24 13:03:32.45511-05
1592	116	5	2012-01-18 13:00:23.463191-05
1593	116	5	2012-01-18 13:00:31.600329-05
1594	115	5	2012-01-18 13:00:36.651808-05
1595	116	5	2012-01-18 13:00:39.784202-05
3814	51	178	2012-02-24 13:03:45.335207-05
3819	113	180	2012-02-24 13:04:23.61305-05
3825	47	179	2012-02-24 13:05:26.637196-05
3830	55	178	2012-02-24 13:06:37.219219-05
3370	119	13	2012-02-15 14:31:09.418542-05
3835	57	177	2012-02-24 13:07:27.281648-05
3840	58	178	2012-02-24 13:07:43.228697-05
2858	86	5	2012-01-23 15:30:56.070036-05
2864	92	5	2012-01-23 15:31:08.308542-05
2870	96	5	2012-01-23 15:31:24.804083-05
3844	59	178	2012-02-24 13:08:10.618803-05
3848	60	177	2012-02-24 13:08:15.533753-05
3851	120	180	2012-02-24 13:08:37.452964-05
3854	55	179	2012-02-24 13:09:05.179073-05
3857	62	177	2012-02-24 13:09:07.236296-05
3860	62	178	2012-02-24 13:10:01.957497-05
3863	63	178	2012-02-24 13:10:36.356873-05
3866	123	180	2012-02-24 13:11:06.356913-05
3869	47	180	2012-02-24 13:12:13.73781-05
3872	60	179	2012-02-24 13:12:29.635486-05
3875	64	178	2012-02-24 13:12:43.150755-05
3878	63	179	2012-02-24 13:12:57.914247-05
3881	125	178	2012-02-24 13:13:08.737974-05
3884	125	178	2012-02-24 13:13:39.901334-05
3887	128	177	2012-02-24 13:14:13.030123-05
3890	50	180	2012-02-24 13:14:46.644687-05
3893	124	179	2012-02-24 13:15:12.041183-05
3896	52	180	2012-02-24 13:16:15.097559-05
3899	53	180	2012-02-24 13:16:43.148523-05
3900	54	180	2012-02-24 13:16:43.154881-05
3903	55	180	2012-02-24 13:17:23.961791-05
3906	57	180	2012-02-24 13:18:47.770205-05
3909	60	180	2012-02-24 13:19:40.570904-05
3912	62	180	2012-02-24 13:20:19.27268-05
3914	124	180	2012-02-24 13:23:12.598679-05
3916	125	180	2012-02-24 13:26:18.384212-05
3919	128	180	2012-02-24 13:27:31.070228-05
3921	80	183	2012-02-28 15:01:32.444233-05
3924	80	183	2012-02-28 15:01:45.895007-05
3927	82	183	2012-02-28 15:03:57.64076-05
3928	83	183	2012-02-28 15:05:43.823497-05
3930	83	183	2012-02-28 15:10:05.362107-05
3931	80	183	2012-02-28 15:12:29.306442-05
3934	83	183	2012-02-28 15:12:43.452141-05
3935	47	13	2012-02-29 14:13:14.543992-05
3937	80	13	2012-02-29 14:17:01.846335-05
3384	121	13	2012-02-17 12:20:50.961399-05
2877	57	13	2012-01-23 16:13:19.161009-05
2883	62	13	2012-01-23 16:14:03.931352-05
3465	85	171	2012-02-20 14:04:12.246621-05
3471	91	171	2012-02-20 14:04:23.101154-05
3477	97	171	2012-02-20 14:04:31.511619-05
3483	102	171	2012-02-20 14:04:37.902979-05
3489	108	171	2012-02-20 14:04:53.102991-05
3495	113	171	2012-02-20 14:05:01.266875-05
3501	118	171	2012-02-20 14:05:13.389955-05
3507	47	171	2012-02-20 14:05:27.143146-05
3513	51	171	2012-02-20 14:05:34.381454-05
3520	58	171	2012-02-20 14:05:51.885931-05
3526	124	171	2012-02-20 14:06:17.508784-05
3532	128	171	2012-02-20 14:06:30.545006-05
3544	52	13	2012-02-22 10:37:01.634502-05
3553	55	13	2012-02-22 10:41:19.0204-05
3569	64	5	2012-02-22 12:09:11.646036-05
3577	122	13	2012-02-22 12:52:26.442146-05
2777	116	5	2012-01-23 14:39:17.703705-05
3588	81	179	2012-02-24 12:52:40.578059-05
3594	80	178	2012-02-24 12:53:10.946806-05
3600	88	177	2012-02-24 12:53:20.32146-05
3606	87	179	2012-02-24 12:53:31.021499-05
3612	88	179	2012-02-24 12:53:44.140292-05
3618	84	178	2012-02-24 12:53:52.49705-05
1700	80	5	2012-01-18 16:01:48.31777-05
3624	90	179	2012-02-24 12:54:01.059453-05
3630	98	177	2012-02-24 12:54:27.604605-05
1703	81	5	2012-01-18 16:01:54.16193-05
3636	100	177	2012-02-24 12:54:47.35324-05
3642	92	179	2012-02-24 12:55:11.417367-05
3648	93	179	2012-02-24 12:55:21.775291-05
3654	88	178	2012-02-24 12:55:30.949812-05
3660	91	178	2012-02-24 12:55:42.653657-05
1709	94	5	2012-01-18 16:02:06.233941-05
1710	95	5	2012-01-18 16:02:11.283797-05
3666	93	178	2012-02-24 12:55:51.566301-05
3672	99	179	2012-02-24 12:55:59.528481-05
3678	100	179	2012-02-24 12:56:11.330774-05
3684	127	177	2012-02-24 12:56:20.760642-05
3690	103	179	2012-02-24 12:56:35.220586-05
3696	110	177	2012-02-24 12:56:39.531132-05
3702	110	177	2012-02-24 12:56:41.385508-05
3708	104	179	2012-02-24 12:56:50.328999-05
3714	103	179	2012-02-24 12:56:57.003744-05
3720	112	177	2012-02-24 12:57:09.117025-05
3726	115	177	2012-02-24 12:57:32.770524-05
3732	105	178	2012-02-24 12:58:10.819155-05
3738	127	178	2012-02-24 12:58:32.714883-05
3744	111	178	2012-02-24 12:58:55.108689-05
3750	119	177	2012-02-24 12:59:10.450659-05
3756	121	177	2012-02-24 12:59:24.090794-05
3762	123	177	2012-02-24 12:59:43.572148-05
3768	117	178	2012-02-24 13:00:04.923787-05
3774	121	178	2012-02-24 13:00:28.115721-05
3779	104	180	2012-02-24 13:00:50.76726-05
3293	122	5	2012-01-30 15:40:00.726661-05
3299	51	5	2012-01-30 15:41:57.816544-05
3305	47	162	2012-02-01 12:21:25.681645-05
3313	53	13	2012-02-13 10:17:53.678737-05
3314	54	13	2012-02-13 10:17:53.68482-05
3320	60	13	2012-02-13 10:20:00.207727-05
3329	50	13	2012-02-13 10:52:59.426464-05
3336	57	13	2012-02-13 10:53:42.601273-05
3342	63	13	2012-02-13 10:54:08.618077-05
3354	108	13	2012-02-15 11:20:18.092072-05
3359	112	13	2012-02-15 11:20:32.605435-05
3364	125	13	2012-02-15 11:24:47.69803-05
3784	49	177	2012-02-24 13:01:10.522959-05
3789	47	178	2012-02-24 13:01:38.969448-05
3794	51	177	2012-02-24 13:02:17.005106-05
3799	108	180	2012-02-24 13:02:49.861336-05
3804	121	179	2012-02-24 13:03:11.073163-05
3810	123	179	2012-02-24 13:03:32.860908-05
3815	55	177	2012-02-24 13:03:50.730587-05
3820	47	179	2012-02-24 13:04:26.257386-05
3371	120	13	2012-02-15 14:31:17.366614-05
3826	47	179	2012-02-24 13:05:34.677195-05
3831	50	179	2012-02-24 13:06:50.758145-05
2853	83	5	2012-01-23 15:30:45.318407-05
2859	87	5	2012-01-23 15:30:59.782769-05
2865	93	5	2012-01-23 15:31:09.878466-05
2871	97	5	2012-01-23 15:31:27.310539-05
3836	57	178	2012-02-24 13:07:33.682448-05
3841	118	180	2012-02-24 13:07:47.671063-05
3845	119	180	2012-02-24 13:08:12.81663-05
3849	61	177	2012-02-24 13:08:28.408971-05
3852	121	180	2012-02-24 13:08:55.747796-05
3855	55	179	2012-02-24 13:09:05.421982-05
3858	61	178	2012-02-24 13:09:10.362731-05
3861	122	180	2012-02-24 13:10:11.96088-05
3864	57	179	2012-02-24 13:10:45.786629-05
3867	124	177	2012-02-24 13:12:03.695115-05
3870	124	178	2012-02-24 13:12:19.077364-05
3873	47	180	2012-02-24 13:12:36.454618-05
3876	62	179	2012-02-24 13:12:51.064036-05
3879	126	177	2012-02-24 13:13:06.23155-05
3882	126	177	2012-02-24 13:13:28.062046-05
3885	48	180	2012-02-24 13:14:07.545165-05
3888	126	178	2012-02-24 13:14:15.444936-05
3891	51	180	2012-02-24 13:14:59.731932-05
3894	64	179	2012-02-24 13:15:38.378391-05
3897	125	179	2012-02-24 13:16:18.170139-05
3901	128	179	2012-02-24 13:16:58.0238-05
3904	56	180	2012-02-24 13:18:01.255431-05
3907	58	180	2012-02-24 13:18:59.062661-05
3910	60	180	2012-02-24 13:19:55.580533-05
3913	63	180	2012-02-24 13:20:30.569608-05
3915	64	180	2012-02-24 13:23:39.844734-05
3917	126	180	2012-02-24 13:26:32.985188-05
3920	128	180	2012-02-24 13:28:15.084923-05
3922	80	183	2012-02-28 15:01:36.746538-05
3925	81	183	2012-02-28 15:01:51.31803-05
3929	83	183	2012-02-28 15:05:47.492317-05
3932	81	183	2012-02-28 15:12:31.466443-05
3936	48	13	2012-02-29 14:13:18.188842-05
3938	81	13	2012-02-29 14:17:03.94298-05
\.


--
-- Data for Name: riskblock_riskblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY riskblock_riskblock (id, no_risk_copy, some_risk_copy, severe_risk_copy) FROM stdin;
1	From your answers, it doesn’t look like you are experiencing serious relationship conflict, but we would like you to continue learning about how to help your family or friends who may experiencing serious relationship conflict or intimate partner violence.	From your answers, it looks like there are some concerns about safety in your relationship. I’d like to ask a few more questions about how you are influenced by the relationship, and then I’d like to go through some steps of safety planning to make sure that you are prepared in case conflict gets out of hand.	From your answers, it looks like there is a serious concern about safety in your relationship. I’d like to ask a few more questions about how you are influenced by the relationship, and then I’d like to go through some steps of safety planning to make sure that you are prepared in case conflict gets out of hand. 
\.


--
-- Data for Name: servicesblock_narroweddownanswer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY servicesblock_narroweddownanswer (id, user_id, answer_id, question_id) FROM stdin;
5	13	649	241
30	15	\N	241
35	172	\N	241
31	162	\N	241
34	171	644	241
36	177	646	241
37	178	652	241
38	179	649	241
11	8	642	241
3	124	\N	241
39	180	643	241
1	5	647	241
40	109	\N	241
\.


--
-- Data for Name: servicesblock_serviceprovider; Type: TABLE DATA; Schema: public; Owner: -
--

COPY servicesblock_serviceprovider (id, issue_id, name, phone, url, address, map_image, description) FROM stdin;
2	641	housing help	housing help	housing help	housing help	images/columbiamap.jpg	\N
5	648	Safe Horizon	1-800-621-HOPE (4673) Domestic Violence hotline 	http://www.safehorizon.org/index/what-we-do-2/counseling--support-groups-56.html			Safe Horizon offers free individual or group counseling for women who are at least 13 years old. Couples counseling is not available. 
6	648	Sanctuary for Families	(212)-349-6009 extension 221 Receptionist	http://www.sanctuaryforfamilies.org/index.php?option=com_content&task=view&id=189&Itemid=221			Individual and group counseling sessions are offered.
7	648	STEPS to End Family Violence	(646)-315-7623 Clinical Supervisor	http://www.egscf.org/services/steps/clinical-services/			Taking STEPS provides individual and group services depending on need. Crisis counseling and safety planning are also available. 
8	648	Greenhope	(212)-996-8633	http://www.greenhope.org/programs/program_services.shtml			Greenhope’s programs provide individual counseling around the issues of domestic violence, and an on-going domestic violence group facilitated by a social worker. 
9	649	Safe Horizon	1-800-621-HOPE (4673) Domestic Violence hotline 	http://www.safehorizon.org/index/what-we-do-2/domestic-violence-53.html#domestic_violence_shelters			Safe Horizon is New York City’s largest provider of domestic violence residences for battered women and men, with more than 700 beds available throughout the five boroughs. 
10	649	Sanctuary for Families	(212)-349–6009 extension 221 Receptionist	http://www.sanctuaryforfamilies.org/index.php?option=com_content&task=view&id=34&Itemid=63			Sanctuary runs several small shelters in the outer boroughs of New York City for domestic violence survivors and their children who no longer have a safe place to stay free from violence. Clinical, legal, and advocacy services are offered on-site.
13	650	STEPS to End Family Violence	(646)-315-7605 or (646)-315-7637 for Legal Services	http://www.egscf.org/services/steps/legal-services/			Provides education about court processes, help with representing yourself in court, and direct legal representation are provided by STEPS staff. STEPS has expertise working with women who have a criminal justice or substance use history.
11	650	Safe Horizon	1-800-621-HOPE (4673) Domestic Violence hotline 	http://www.safehorizon.org/index/get-help-8/for-legal-services-15.html			Services provide free legal information and advice to domestic violence victims with family and immigration law-related matters and direct legal representation.
12	650	Sanctuary for Families	(212)-349–6009 extension 221 Receptionist 	http://www.sanctuaryforfamilies.org/index.php?option=com_content&task=view&id=140&Itemid=163			Legal staff can provide help in getting orders of protection in family court and by providing legal representation or consultation.
15	647	Mercy Center	(718)-993-2789	http://www.mercycenterbronx.org/Parenting.htm			Provides anger management and parenting classes. 
14	650	Greenhope	(212)-996-8633	http://www.greenhope.org/programs/program_services.shtml			Provides support services and education about legal rights and negotiating systems such as parole, probation, and family and drug treatment courts. 
16	647	Palladia Inc.	(646) 401-9700 Comprehensive Treatment Institute – Bronx 	http://www.palladiainc.org/Public/Default.aspx?Housing=150			Groups are available on topics of healthy relationships and substance use recovery, anger management, parenting, and many other topics. 
17	647	Palladia Inc.	(212)-360-7116 Comprehensive Treatment Institute – Harlem 	http://www.palladiainc.org/Public/Default.aspx?Housing=74			Groups are available on topics of healthy relationships and substance use recovery, anger management, parenting, and many other topics. 
18	647	Fortune Society	(212)-691-7554	http://fortunesociety.org/get-help/family-services/			Fortune’s Family Services clients learn to build healthy relationships with loved ones through participation in intensive programs, services, and workshops. 
34	651	Reverend Herbert Daughter, The House of the Lord Church	718-596-1991		415 Atlantic Ave; Brooklyn NY 11217		
19	656	Mercy Center	(718)-993-2789	http://www.mercycenterbronx.org/Business.htm			Mercy Center offers multiple skill-building classes including introductory keyboarding, word processing, Excel, and office training to help in gaining employment. 
20	656	Greenhope	(212)-996-8633	http://www.greenhope.org/programs/program_services.shtml			Provides individual employment counseling and job training groups. 
21	656	Fortune Society	(212)-691-7554	http://fortunesociety.org/get-help/employment-services/			The Employment Services program is designed to meet the needs of job seekers with criminal records. 
22	641	Coalition for the Homeless	(212)-776-2012	http://www.coalitionforthehomeless.org/programs/crisis-intervention			The Crisis Intervention Program provides case management services on a first come, first serve basis, including assistance with government benefits, housing applications, and mental health and addiction treatment referrals, as well as one time grants for food, subway fare, diapers, baby formula, school supplies, identification, medication, and work uniforms. 
23	641	Catholic Charities	1-888-744-7900 Hotline	http://www.catholiccharitiesny.org/what-we-do/feeding-the-hungry-and-sheltering-the-homeless/feeding-more-information/#emergency_shelters			Eviction Prevention and shelter services are supplied to those who meet eligibility criteria.  
24	642	Greenhope	(212)-996-8633	http://www.greenhope.org/programs/program_services.shtml			Provides on and off-site academic training for GED preparation and other educational and vocational training. 
25	643	Mercy Center	(718)-993-2789	http://www.mercycenterbronx.org/support_groups.htm			Groups are available for spirituality; yoga; salsa, swing, and meringue dancing; movie discussions; meditation; and Capacitor method of stress management. 
35	644	New York Foundling	1-888-435-7553				Operates a nursery where women can take their children aged 0-10 any day or time to stay temporarily when in a state of crisis. Also operates a hotline where parents receive crisis counseling, parenting support, and referrals as needed.
26	645	Safe Horizon Counseling Center	(347)-328-8110 	http://www.safehorizon.org/index/what-we-do-2/safe-horizon-counseling-center-66.html			Safe Horizon offers a long-term therapy service that runs on a sliding-fee scale based on the participant’s income and this clinic also accepts most types of insurance. 
27	645	Sanctuary for Families	(212) 349 - 6009 x. 221	http://www.sanctuaryforfamilies.org/index.php?option=com_content&task=view&id=189&Itemid=221			Individual and group counseling sessions are offered.
28	646	Palladia Inc.	(646) 401-9700 Comprehensive Treatment Institute – Bronx 	http://www.palladiainc.org/Public/Default.aspx?Housing=150			The Day, Evening and Aftercare program provides intensive outpatient and services which consist of alcohol/drug education, individual counseling, recreational activities, vocational assistance, medical referral services, HIV/AIDS Education, snacks, and carfare. Groups are also available for a variety of topics.
29	646	Palladia Inc.	(212)-360-7116 Comprehensive Treatment Institute – Harlem 	http://www.palladiainc.org/Public/Default.aspx?Housing=74			Provides relapse prevention counseling; early recovery; crisis intervention; driving while intoxicated (DWI) screening, assessments and education groups; men's only and women's only groups; anger management; vocational guidance; medical referrals; HIV/AIDS Education; childcare; wellness information; spirituality; snacks; and carfare. 
30	646	Greenhope	(212)-996-8633	http://www.greenhope.org/programs/program_services.shtml			Greenhope provides services to residential and day treatment/outpatient clients. Substance abuse counseling is offered in individual and group settings. 
31	646	Fortune Society	(212)-691-7554	http://fortunesociety.org/get-help/substance-abuse-treatment/			Fortune Society offers outpatient substance abuse treatment that has a holistic approach geared towards the overall improvement of each client’s mental, emotional, and physical well-being. Clients receive assessment and orientation, intensive individual and group counseling, and lifetime aftercare. 
32	652	Ackerman Institute	(212)-879-4900 extension 122 Intake Office	http://www.ackerman.org/posts/view/107-couples-and-family-therapy---treatment			The Ackerman Institute Treatment Center helps couples and families with problems including, but not limited to, substance abuse, school difficulties, child and adolescent problems, marital issues, divorce, death, learning disabilities, family violence, child abuse and incest, and chronic medical illness including AIDS. 
33	652	Fortune Society	(212)-691-7554	http://fortunesociety.org/get-help/family-services/			Fortune Society provides individual and couples counseling as well as many other family services including programs and workshops on healthy relationships, parenting skills, mediation and conflict resolution, and more. 
\.


--
-- Data for Name: servicesblock_servicesblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY servicesblock_servicesblock (id, description, page_type) FROM stdin;
2	Second drill-down	page_2
1	services drill down 1	page_1
3	Services recap	page_2
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
26	servicesblock	0002_auto__add_narroweddownanswer	2012-01-04 20:04:47.632814-05
27	servicesblock	0003_auto__add_field_narroweddownanswer_question	2012-01-04 20:04:47.680861-05
28	servicesblock	0004_auto__chg_field_narroweddownanswer_answer	2012-01-04 20:04:47.787099-05
29	servicesblock	0005_auto__add_serviceprovider	2012-01-04 22:50:55.284746-05
30	servicesblock	0006_auto__chg_field_serviceprovider_map_image	2012-01-04 22:50:55.339044-05
31	servicesblock	0007_auto__add_field_servicesblock_page_type	2012-01-04 22:50:55.394861-05
32	pastquizanswersblock	0001_initial	2012-01-11 17:23:50.174589-05
33	pastquizanswersblock	0002_initial	2012-01-11 17:23:50.197406-05
34	wings_main	0003_auto__add_field_participant_created_on	2012-01-18 23:12:53.500895-05
35	servicesblock	0008_auto__add_field_serviceprovider_description	2012-01-26 16:08:05.409607-05
36	wings_main	0004_auto__chg_field_participant_id_string	2012-02-17 18:33:11.014483-05
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeblock (id, error_copy, page_type) FROM stdin;
4		page_3
2	It looks like you haven't entered any names on the tree. There are times in life when you may feel isolated from all your friends and family, but can you think of any people who you would like to reach out to and connect with? This may include extended family members you have lost contact with, neighbors, people you work with, clergy, or service providers. Please try to put at least two names on the tree.	page_2
3	It looks like you haven't entered any names on the tree. There are times in life when you may feel isolated from all your friends and family, but can you think of any people who you would like to reach out to and connect with? This may include extended family members you have lost contact with, neighbors, people you work with, clergy, or service providers. Please try to put at least two names on the tree.	page_3
1	It looks like you haven't entered any names on the tree. There are times in life when you may feel isolated from all your friends and family, but can you think of any people who you would like to reach out to and connect with? This may include extended family members you have lost contact with, neighbors, people you work with, clergy, or service providers. Please try to put at least two names on the tree.	page_1
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
32	1	1
33	1	2
34	1	3
35	1	4
36	1	5
37	2	1
38	2	2
39	2	3
40	2	4
41	2	5
42	4	1
43	4	2
44	4	3
45	4	4
46	4	5
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeblock_editable_support_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeblock_editable_support_types (id, ssnmtreeblock_id, ssnmtreesupporttype_id) FROM stdin;
7	3	1
9	2	2
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeblock_visible_support_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeblock_visible_support_types (id, ssnmtreeblock_id, ssnmtreesupporttype_id) FROM stdin;
10	3	1
11	3	2
13	2	1
14	2	2
15	4	1
16	4	2
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreebox; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreebox (id, pixels_from_top, pixels_from_left, label) FROM stdin;
5	315	30	box_5
4	10	260	box_4
3	30	100	box_3
2	160	300	box_2
1	175	5	box_1
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeperson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeperson (id, user_id, tree_box_id, name) FROM stdin;
221	178	1	Brittany
222	178	2	Jess
223	178	3	Simone
224	178	4	Denise
225	178	5	Eddie
236	182	1	Winnie
11	109	1	asdf
237	182	2	Dad
12	109	2	
238	182	3	Gregg
13	109	3	asdfas
239	182	4	
14	109	4	asdf
240	182	5	Sam
15	109	5	
211	172	1	
51	8	1	Name 1
212	172	2	
52	8	2	
213	172	3	
53	8	3	Marc
214	172	4	
54	8	4	Name 2
215	172	5	
55	8	5	Name 3
6	13	1	Gina
7	13	2	Helen
8	13	3	Tom
231	180	1	Augustine
232	180	2	Danica
9	13	4	Janet
233	180	3	Gertrude
234	180	4	Tina
10	13	5	Marge
235	180	5	Andre
191	162	1	
192	162	2	
193	162	3	
194	162	4	
195	162	5	
216	177	1	dawn
217	177	2	brittany
218	177	3	denise
176	15	1	
206	171	1	
177	15	2	
178	15	3	
207	171	2	person 3
219	177	4	jess
208	171	3	person 1
179	15	4	
209	171	4	person 2
220	177	5	stacey
180	15	5	
210	171	5	
2	5	1	
1	5	2	
3	5	3	
4	5	4	i
5	5	5	
226	179	1	
227	179	2	Mom
228	179	3	
229	179	4	Denise
230	179	5	
\.


--
-- Data for Name: ssnmtreeblock_ssnmtreeperson_support_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ssnmtreeblock_ssnmtreeperson_support_types (id, ssnmtreeperson_id, ssnmtreesupporttype_id) FROM stdin;
146	207	2
147	208	2
148	208	1
149	209	1
150	9	2
151	216	2
12	10	1
13	6	2
152	217	2
153	218	2
154	219	2
155	220	2
156	216	1
157	217	1
158	218	1
159	219	1
160	220	1
161	221	2
162	222	2
163	223	2
26	7	2
27	8	1
164	221	1
165	222	1
166	224	1
167	225	1
168	227	2
169	229	2
170	229	1
35	4	1
36	4	2
171	232	2
172	233	2
173	235	2
174	231	1
175	232	1
176	233	1
177	234	1
44	55	1
178	236	2
179	237	2
182	236	1
183	237	1
184	238	1
185	239	1
186	238	2
127	51	2
129	51	1
130	53	1
140	7	1
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

COPY wings_main_participant (id, id_string, user_id, current_section_id, created_on) FROM stdin;
122	123123123122	183	165	2012-02-24 14:30:25.305772-05
118	127224124597	179	222	2012-02-24 12:46:00.219071-05
111	121212121212	172	150	2012-02-21 10:03:06.021687-05
112	123456789123	\N	\N	2012-02-22 11:33:32.053789-05
113	123456789124	\N	\N	2012-02-24 12:44:49.46585-05
114	111111111111	\N	\N	2012-02-24 12:45:09.449992-05
116	123456789125	\N	\N	2012-02-24 12:45:24.584669-05
121	454545454545	184	161	2012-02-24 12:52:50.759434-05
120	989898989898	181	52	2012-02-24 12:47:58.475451-05
119	122224124115	180	222	2012-02-24 12:47:29.774845-05
117	248248248248	177	222	2012-02-24 12:45:44.851891-05
110	999999999999	171	222	2012-02-20 14:03:42.445361-05
115	343434343434	178	222	2012-02-24 12:45:22.489268-05
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
-- Name: pastquizanswersblock_pastquizanswersblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pastquizanswersblock_pastquizanswersblock
    ADD CONSTRAINT pastquizanswersblock_pastquizanswersblock_pkey PRIMARY KEY (id);


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
-- Name: servicesblock_narroweddownanswer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY servicesblock_narroweddownanswer
    ADD CONSTRAINT servicesblock_narroweddownanswer_pkey PRIMARY KEY (id);


--
-- Name: servicesblock_serviceprovider_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY servicesblock_serviceprovider
    ADD CONSTRAINT servicesblock_serviceprovider_pkey PRIMARY KEY (id);


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
-- Name: servicesblock_narroweddownanswer_answer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX servicesblock_narroweddownanswer_answer_id ON servicesblock_narroweddownanswer USING btree (answer_id);


--
-- Name: servicesblock_narroweddownanswer_question_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX servicesblock_narroweddownanswer_question_id ON servicesblock_narroweddownanswer USING btree (question_id);


--
-- Name: servicesblock_narroweddownanswer_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX servicesblock_narroweddownanswer_user_id ON servicesblock_narroweddownanswer USING btree (user_id);


--
-- Name: servicesblock_serviceprovider_issue_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX servicesblock_serviceprovider_issue_id ON servicesblock_serviceprovider USING btree (issue_id);


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
-- Name: answer_id_refs_id_1ff19272f276894c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY servicesblock_narroweddownanswer
    ADD CONSTRAINT answer_id_refs_id_1ff19272f276894c FOREIGN KEY (answer_id) REFERENCES quizblock_answer(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: issue_id_refs_id_331b37a41cee64cd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY servicesblock_serviceprovider
    ADD CONSTRAINT issue_id_refs_id_331b37a41cee64cd FOREIGN KEY (issue_id) REFERENCES quizblock_answer(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: question_id_refs_id_11e9e3519cf31efc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY servicesblock_narroweddownanswer
    ADD CONSTRAINT question_id_refs_id_11e9e3519cf31efc FOREIGN KEY (question_id) REFERENCES quizblock_question(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: user_id_refs_id_72646c863a48d3a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY servicesblock_narroweddownanswer
    ADD CONSTRAINT user_id_refs_id_72646c863a48d3a6 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

