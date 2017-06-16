--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.2
-- Dumped by pg_dump version 9.1.2
-- Started on 2012-07-20 13:34:20

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 254 (class 3079 OID 11639)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 254
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 164 (class 1259 OID 91219)
-- Dependencies: 5
-- Name: admin_tools_dashboard_preferences; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE admin_tools_dashboard_preferences (
    id integer NOT NULL,
    user_id integer NOT NULL,
    data text NOT NULL,
    dashboard_id character varying(100) NOT NULL
);


ALTER TABLE public.admin_tools_dashboard_preferences OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 91217)
-- Dependencies: 5 164
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE admin_tools_dashboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_tools_dashboard_preferences_id_seq OWNER TO postgres;

--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 163
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE admin_tools_dashboard_preferences_id_seq OWNED BY admin_tools_dashboard_preferences.id;


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 163
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('admin_tools_dashboard_preferences_id_seq', 3, true);


--
-- TOC entry 162 (class 1259 OID 91208)
-- Dependencies: 5
-- Name: admin_tools_menu_bookmark; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE admin_tools_menu_bookmark (
    id integer NOT NULL,
    user_id integer NOT NULL,
    url character varying(255) NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.admin_tools_menu_bookmark OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 91206)
-- Dependencies: 5 162
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE admin_tools_menu_bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_tools_menu_bookmark_id_seq OWNER TO postgres;

--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 161
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE admin_tools_menu_bookmark_id_seq OWNED BY admin_tools_menu_bookmark.id;


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 161
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('admin_tools_menu_bookmark_id_seq', 1, false);


--
-- TOC entry 170 (class 1259 OID 91255)
-- Dependencies: 5
-- Name: auth_group; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 91253)
-- Dependencies: 170 5
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 168 (class 1259 OID 91240)
-- Dependencies: 5
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 91238)
-- Dependencies: 5 168
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 178 (class 1259 OID 91330)
-- Dependencies: 5
-- Name: auth_message; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 91328)
-- Dependencies: 5 178
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO postgres;

--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 177
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 177
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- TOC entry 166 (class 1259 OID 91230)
-- Dependencies: 5
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 91228)
-- Dependencies: 5 166
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('auth_permission_id_seq', 132, true);


--
-- TOC entry 176 (class 1259 OID 91300)
-- Dependencies: 5
-- Name: auth_user; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 91285)
-- Dependencies: 5
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 91283)
-- Dependencies: 174 5
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 175 (class 1259 OID 91298)
-- Dependencies: 5 176
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- TOC entry 172 (class 1259 OID 91270)
-- Dependencies: 5
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 91268)
-- Dependencies: 5 172
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 202 (class 1259 OID 91518)
-- Dependencies: 5
-- Name: configuration_configmodel; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE configuration_configmodel (
    id integer NOT NULL,
    percent_lessons integer NOT NULL,
    duration_registration integer NOT NULL,
    cost_registration integer NOT NULL,
    duration_extension integer NOT NULL,
    cost_extension integer NOT NULL,
    cost_analysis integer NOT NULL,
    free_lessons integer NOT NULL,
    quantity_formulas integer NOT NULL,
    duration_training_unregistered_user integer NOT NULL,
    plan_lessons integer NOT NULL,
    plan_formulas integer NOT NULL
);


ALTER TABLE public.configuration_configmodel OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 91516)
-- Dependencies: 202 5
-- Name: configuration_configmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE configuration_configmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuration_configmodel_id_seq OWNER TO postgres;

--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 201
-- Name: configuration_configmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE configuration_configmodel_id_seq OWNED BY configuration_configmodel.id;


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 201
-- Name: configuration_configmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('configuration_configmodel_id_seq', 1, false);


--
-- TOC entry 185 (class 1259 OID 91377)
-- Dependencies: 2158 5
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 91375)
-- Dependencies: 185 5
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 184
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 184
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 54, true);


--
-- TOC entry 180 (class 1259 OID 91346)
-- Dependencies: 5
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 91344)
-- Dependencies: 5 180
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 179
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 179
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('django_content_type_id_seq', 44, true);


--
-- TOC entry 181 (class 1259 OID 91359)
-- Dependencies: 5
-- Name: django_session; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 91369)
-- Dependencies: 5
-- Name: django_site; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 91367)
-- Dependencies: 183 5
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 182
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 182
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- TOC entry 248 (class 1259 OID 91899)
-- Dependencies: 5
-- Name: invitefriend_friend; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE invitefriend_friend (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.invitefriend_friend OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 91897)
-- Dependencies: 5 248
-- Name: invitefriend_friend_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE invitefriend_friend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invitefriend_friend_id_seq OWNER TO postgres;

--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 247
-- Name: invitefriend_friend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE invitefriend_friend_id_seq OWNED BY invitefriend_friend.id;


--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 247
-- Name: invitefriend_friend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('invitefriend_friend_id_seq', 1, true);


--
-- TOC entry 189 (class 1259 OID 91410)
-- Dependencies: 5
-- Name: mformulas_formula; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE mformulas_formula (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    tex character varying(500) NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.mformulas_formula OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 91408)
-- Dependencies: 189 5
-- Name: mformulas_formula_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE mformulas_formula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mformulas_formula_id_seq OWNER TO postgres;

--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 188
-- Name: mformulas_formula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE mformulas_formula_id_seq OWNED BY mformulas_formula.id;


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 188
-- Name: mformulas_formula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('mformulas_formula_id_seq', 6, true);


--
-- TOC entry 195 (class 1259 OID 91464)
-- Dependencies: 5
-- Name: mformulas_formulataskanswer; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE mformulas_formulataskanswer (
    id integer NOT NULL,
    question_id integer,
    answer_tex character varying(500) NOT NULL,
    is_true boolean NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.mformulas_formulataskanswer OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 91462)
-- Dependencies: 5 195
-- Name: mformulas_formulataskanswer_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE mformulas_formulataskanswer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mformulas_formulataskanswer_id_seq OWNER TO postgres;

--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 194
-- Name: mformulas_formulataskanswer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE mformulas_formulataskanswer_id_seq OWNED BY mformulas_formulataskanswer.id;


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 194
-- Name: mformulas_formulataskanswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('mformulas_formulataskanswer_id_seq', 8, true);


--
-- TOC entry 193 (class 1259 OID 91448)
-- Dependencies: 5
-- Name: mformulas_formulataskquestion; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE mformulas_formulataskquestion (
    id integer NOT NULL,
    formula_id integer NOT NULL,
    question text NOT NULL,
    question_tex character varying(500) NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.mformulas_formulataskquestion OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 91446)
-- Dependencies: 193 5
-- Name: mformulas_formulataskquestion_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE mformulas_formulataskquestion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mformulas_formulataskquestion_id_seq OWNER TO postgres;

--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 192
-- Name: mformulas_formulataskquestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE mformulas_formulataskquestion_id_seq OWNED BY mformulas_formulataskquestion.id;


--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 192
-- Name: mformulas_formulataskquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('mformulas_formulataskquestion_id_seq', 6, true);


--
-- TOC entry 191 (class 1259 OID 91437)
-- Dependencies: 5
-- Name: mformulas_primitiveofformulatask; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE mformulas_primitiveofformulatask (
    id integer NOT NULL,
    expression character varying(500) NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.mformulas_primitiveofformulatask OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 91435)
-- Dependencies: 191 5
-- Name: mformulas_primitiveofformulatask_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE mformulas_primitiveofformulatask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mformulas_primitiveofformulatask_id_seq OWNER TO postgres;

--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 190
-- Name: mformulas_primitiveofformulatask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE mformulas_primitiveofformulatask_id_seq OWNED BY mformulas_primitiveofformulatask.id;


--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 190
-- Name: mformulas_primitiveofformulatask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('mformulas_primitiveofformulatask_id_seq', 2, true);


--
-- TOC entry 253 (class 1259 OID 92019)
-- Dependencies: 5
-- Name: mformulas_searchformula; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE mformulas_searchformula (
    id integer NOT NULL,
    formula_id integer NOT NULL,
    link character varying(500) NOT NULL,
    model_name character varying(500) NOT NULL,
    field_name character varying(500) NOT NULL,
    obj_id integer NOT NULL
);


ALTER TABLE public.mformulas_searchformula OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 92017)
-- Dependencies: 253 5
-- Name: mformulas_searchformula_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE mformulas_searchformula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mformulas_searchformula_id_seq OWNER TO postgres;

--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 252
-- Name: mformulas_searchformula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE mformulas_searchformula_id_seq OWNED BY mformulas_searchformula.id;


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 252
-- Name: mformulas_searchformula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('mformulas_searchformula_id_seq', 330, true);


--
-- TOC entry 246 (class 1259 OID 91888)
-- Dependencies: 5
-- Name: news_news_article; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE news_news_article (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    image character varying(100),
    announcement text NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.news_news_article OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 91886)
-- Dependencies: 246 5
-- Name: news_news_article_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE news_news_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_news_article_id_seq OWNER TO postgres;

--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 245
-- Name: news_news_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE news_news_article_id_seq OWNED BY news_news_article.id;


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 245
-- Name: news_news_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('news_news_article_id_seq', 1, false);


--
-- TOC entry 200 (class 1259 OID 91505)
-- Dependencies: 5
-- Name: onlineuser_onlinedayuser; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE onlineuser_onlinedayuser (
    id integer NOT NULL,
    user_id integer NOT NULL,
    day date NOT NULL,
    last_activity timestamp with time zone,
    duration_of_visits numeric(5,2) NOT NULL
);


ALTER TABLE public.onlineuser_onlinedayuser OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 91503)
-- Dependencies: 200 5
-- Name: onlineuser_onlinedayuser_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE onlineuser_onlinedayuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.onlineuser_onlinedayuser_id_seq OWNER TO postgres;

--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 199
-- Name: onlineuser_onlinedayuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE onlineuser_onlinedayuser_id_seq OWNED BY onlineuser_onlinedayuser.id;


--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 199
-- Name: onlineuser_onlinedayuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('onlineuser_onlinedayuser_id_seq', 5, true);


--
-- TOC entry 198 (class 1259 OID 91490)
-- Dependencies: 5
-- Name: profiles_useranonymous; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE profiles_useranonymous (
    id integer NOT NULL,
    user_id integer,
    anonymous character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.profiles_useranonymous OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 91488)
-- Dependencies: 5 198
-- Name: profiles_useranonymous_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE profiles_useranonymous_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_useranonymous_id_seq OWNER TO postgres;

--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 197
-- Name: profiles_useranonymous_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE profiles_useranonymous_id_seq OWNED BY profiles_useranonymous.id;


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 197
-- Name: profiles_useranonymous_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('profiles_useranonymous_id_seq', 81, true);


--
-- TOC entry 196 (class 1259 OID 91478)
-- Dependencies: 5
-- Name: profiles_userprofile; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE profiles_userprofile (
    user_id integer NOT NULL,
    balance numeric(5,2) NOT NULL,
    level integer NOT NULL
);


ALTER TABLE public.profiles_userprofile OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 91399)
-- Dependencies: 5
-- Name: project_article; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE project_article (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.project_article OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 91397)
-- Dependencies: 5 187
-- Name: project_article_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE project_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_article_id_seq OWNER TO postgres;

--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 186
-- Name: project_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE project_article_id_seq OWNED BY project_article.id;


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 186
-- Name: project_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('project_article_id_seq', 1, false);


--
-- TOC entry 250 (class 1259 OID 91912)
-- Dependencies: 5
-- Name: statistics_statisticsdayuser; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE statistics_statisticsdayuser (
    id integer NOT NULL,
    user_id integer NOT NULL,
    day date NOT NULL,
    subject_id integer NOT NULL,
    lessons_visited integer NOT NULL,
    lessons_learned integer NOT NULL,
    tasks_attempts integer NOT NULL,
    tasks_correct integer NOT NULL,
    use_attempts integer NOT NULL,
    offsets_attempts integer NOT NULL,
    offsets_correct integer NOT NULL,
    added_formulas integer NOT NULL,
    learned_formulas integer NOT NULL
);


ALTER TABLE public.statistics_statisticsdayuser OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 91910)
-- Dependencies: 250 5
-- Name: statistics_statisticsdayuser_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE statistics_statisticsdayuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statistics_statisticsdayuser_id_seq OWNER TO postgres;

--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 249
-- Name: statistics_statisticsdayuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE statistics_statisticsdayuser_id_seq OWNED BY statistics_statisticsdayuser.id;


--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 249
-- Name: statistics_statisticsdayuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('statistics_statisticsdayuser_id_seq', 1, true);


--
-- TOC entry 212 (class 1259 OID 91584)
-- Dependencies: 5
-- Name: subject_complexity; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_complexity (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_complexity OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 91582)
-- Dependencies: 5 212
-- Name: subject_complexity_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_complexity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_complexity_id_seq OWNER TO postgres;

--
-- TOC entry 2525 (class 0 OID 0)
-- Dependencies: 211
-- Name: subject_complexity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_complexity_id_seq OWNED BY subject_complexity.id;


--
-- TOC entry 2526 (class 0 OID 0)
-- Dependencies: 211
-- Name: subject_complexity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_complexity_id_seq', 3, true);


--
-- TOC entry 214 (class 1259 OID 91595)
-- Dependencies: 5
-- Name: subject_lesson; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_lesson (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(50) NOT NULL,
    text text NOT NULL,
    subject_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    teacher_id integer NOT NULL,
    level integer NOT NULL,
    complexity_id integer NOT NULL,
    video character varying(100),
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_lesson OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 91593)
-- Dependencies: 214 5
-- Name: subject_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_lesson_id_seq OWNER TO postgres;

--
-- TOC entry 2527 (class 0 OID 0)
-- Dependencies: 213
-- Name: subject_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_lesson_id_seq OWNED BY subject_lesson.id;


--
-- TOC entry 2528 (class 0 OID 0)
-- Dependencies: 213
-- Name: subject_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_lesson_id_seq', 3, true);


--
-- TOC entry 216 (class 1259 OID 91621)
-- Dependencies: 5
-- Name: subject_lesson_task; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_lesson_task (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    task_id integer NOT NULL,
    text_solution text NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_lesson_task OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 91619)
-- Dependencies: 5 216
-- Name: subject_lesson_task_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_lesson_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_lesson_task_id_seq OWNER TO postgres;

--
-- TOC entry 2529 (class 0 OID 0)
-- Dependencies: 215
-- Name: subject_lesson_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_lesson_task_id_seq OWNED BY subject_lesson_task.id;


--
-- TOC entry 2530 (class 0 OID 0)
-- Dependencies: 215
-- Name: subject_lesson_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_lesson_task_id_seq', 2, true);


--
-- TOC entry 220 (class 1259 OID 91658)
-- Dependencies: 5
-- Name: subject_leveltaskuse; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_leveltaskuse (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_leveltaskuse OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 91656)
-- Dependencies: 5 220
-- Name: subject_leveltaskuse_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_leveltaskuse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_leveltaskuse_id_seq OWNER TO postgres;

--
-- TOC entry 2531 (class 0 OID 0)
-- Dependencies: 219
-- Name: subject_leveltaskuse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_leveltaskuse_id_seq OWNED BY subject_leveltaskuse.id;


--
-- TOC entry 2532 (class 0 OID 0)
-- Dependencies: 219
-- Name: subject_leveltaskuse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_leveltaskuse_id_seq', 3, true);


--
-- TOC entry 224 (class 1259 OID 91692)
-- Dependencies: 5
-- Name: subject_offset; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_offset (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(50) NOT NULL,
    text text NOT NULL,
    subject_id integer NOT NULL,
    "time" time without time zone NOT NULL,
    level integer NOT NULL,
    percent integer NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_offset OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 91690)
-- Dependencies: 224 5
-- Name: subject_offset_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_offset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_offset_id_seq OWNER TO postgres;

--
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 223
-- Name: subject_offset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_offset_id_seq OWNED BY subject_offset.id;


--
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 223
-- Name: subject_offset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_offset_id_seq', 2, true);


--
-- TOC entry 226 (class 1259 OID 91708)
-- Dependencies: 5
-- Name: subject_offset_task; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_offset_task (
    id integer NOT NULL,
    offset_id integer NOT NULL,
    task_id integer NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_offset_task OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 91706)
-- Dependencies: 5 226
-- Name: subject_offset_task_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_offset_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_offset_task_id_seq OWNER TO postgres;

--
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 225
-- Name: subject_offset_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_offset_task_id_seq OWNED BY subject_offset_task.id;


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 225
-- Name: subject_offset_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_offset_task_id_seq', 2, true);


--
-- TOC entry 206 (class 1259 OID 91541)
-- Dependencies: 5
-- Name: subject_subject; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_subject (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(50) NOT NULL,
    text text NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_subject OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 91539)
-- Dependencies: 206 5
-- Name: subject_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_subject_id_seq OWNER TO postgres;

--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 205
-- Name: subject_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_subject_id_seq OWNED BY subject_subject.id;


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 205
-- Name: subject_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_subject_id_seq', 2, true);


--
-- TOC entry 204 (class 1259 OID 91526)
-- Dependencies: 5
-- Name: subject_subject_sites; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_subject_sites (
    id integer NOT NULL,
    subject_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.subject_subject_sites OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 91524)
-- Dependencies: 5 204
-- Name: subject_subject_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_subject_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_subject_sites_id_seq OWNER TO postgres;

--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 203
-- Name: subject_subject_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_subject_sites_id_seq OWNED BY subject_subject_sites.id;


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 203
-- Name: subject_subject_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_subject_sites_id_seq', 2, true);


--
-- TOC entry 208 (class 1259 OID 91557)
-- Dependencies: 5
-- Name: subject_task; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_task (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(50) NOT NULL,
    text_task text NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_task OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 91555)
-- Dependencies: 208 5
-- Name: subject_task_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_task_id_seq OWNER TO postgres;

--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 207
-- Name: subject_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_task_id_seq OWNED BY subject_task.id;


--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 207
-- Name: subject_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_task_id_seq', 3, true);


--
-- TOC entry 218 (class 1259 OID 91642)
-- Dependencies: 5
-- Name: subject_use; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_use (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(50) NOT NULL,
    text text NOT NULL,
    subject_id integer NOT NULL,
    "time" time without time zone NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_use OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 91640)
-- Dependencies: 5 218
-- Name: subject_use_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_use_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_use_id_seq OWNER TO postgres;

--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 217
-- Name: subject_use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_use_id_seq OWNED BY subject_use.id;


--
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 217
-- Name: subject_use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_use_id_seq', 1, true);


--
-- TOC entry 222 (class 1259 OID 91669)
-- Dependencies: 5
-- Name: subject_use_task; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_use_task (
    id integer NOT NULL,
    "USE_id" integer NOT NULL,
    task_id integer NOT NULL,
    level_task_use_id integer NOT NULL,
    quantity_point integer NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_use_task OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 91667)
-- Dependencies: 5 222
-- Name: subject_use_task_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_use_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_use_task_id_seq OWNER TO postgres;

--
-- TOC entry 2545 (class 0 OID 0)
-- Dependencies: 221
-- Name: subject_use_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_use_task_id_seq OWNED BY subject_use_task.id;


--
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 221
-- Name: subject_use_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_use_task_id_seq', 1, true);


--
-- TOC entry 240 (class 1259 OID 91839)
-- Dependencies: 5
-- Name: subject_user_dictionary; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_user_dictionary (
    id integer NOT NULL,
    user_id integer NOT NULL,
    subject_id integer NOT NULL,
    formula_id integer NOT NULL,
    date_addition date NOT NULL
);


ALTER TABLE public.subject_user_dictionary OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 91837)
-- Dependencies: 5 240
-- Name: subject_user_dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_user_dictionary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_user_dictionary_id_seq OWNER TO postgres;

--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 239
-- Name: subject_user_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_user_dictionary_id_seq OWNED BY subject_user_dictionary.id;


--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 239
-- Name: subject_user_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_user_dictionary_id_seq', 9, true);


--
-- TOC entry 228 (class 1259 OID 91726)
-- Dependencies: 5
-- Name: subject_user_userlesson; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_user_userlesson (
    id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer NOT NULL,
    is_development boolean NOT NULL,
    is_mastered boolean NOT NULL,
    is_bookmark boolean NOT NULL,
    percent integer NOT NULL,
    date_development date,
    date_mastered date,
    date_bookmark date
);


ALTER TABLE public.subject_user_userlesson OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 91724)
-- Dependencies: 5 228
-- Name: subject_user_userlesson_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_user_userlesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_user_userlesson_id_seq OWNER TO postgres;

--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 227
-- Name: subject_user_userlesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_user_userlesson_id_seq OWNED BY subject_user_userlesson.id;


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 227
-- Name: subject_user_userlesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_user_userlesson_id_seq', 3, true);


--
-- TOC entry 232 (class 1259 OID 91767)
-- Dependencies: 5
-- Name: subject_user_useroffset; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_user_useroffset (
    id integer NOT NULL,
    user_id integer NOT NULL,
    offset_id integer NOT NULL,
    is_executed boolean NOT NULL,
    date_delivery date NOT NULL,
    number_attempts integer NOT NULL,
    true_number_attempts integer NOT NULL
);


ALTER TABLE public.subject_user_useroffset OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 91765)
-- Dependencies: 5 232
-- Name: subject_user_useroffset_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_user_useroffset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_user_useroffset_id_seq OWNER TO postgres;

--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 231
-- Name: subject_user_useroffset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_user_useroffset_id_seq OWNED BY subject_user_useroffset.id;


--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 231
-- Name: subject_user_useroffset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_user_useroffset_id_seq', 1, true);


--
-- TOC entry 230 (class 1259 OID 91744)
-- Dependencies: 5
-- Name: subject_user_usertask; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_user_usertask (
    id integer NOT NULL,
    user_id integer NOT NULL,
    task_id integer NOT NULL,
    lesson_id integer NOT NULL,
    is_executed boolean NOT NULL,
    date_development date NOT NULL,
    number_attempts integer NOT NULL,
    true_number_attempts integer NOT NULL
);


ALTER TABLE public.subject_user_usertask OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 91742)
-- Dependencies: 5 230
-- Name: subject_user_usertask_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_user_usertask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_user_usertask_id_seq OWNER TO postgres;

--
-- TOC entry 2553 (class 0 OID 0)
-- Dependencies: 229
-- Name: subject_user_usertask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_user_usertask_id_seq OWNED BY subject_user_usertask.id;


--
-- TOC entry 2554 (class 0 OID 0)
-- Dependencies: 229
-- Name: subject_user_usertask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_user_usertask_id_seq', 2, true);


--
-- TOC entry 234 (class 1259 OID 91785)
-- Dependencies: 5
-- Name: subject_user_usertaskoffset; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_user_usertaskoffset (
    id integer NOT NULL,
    task_id integer NOT NULL,
    user_task_offset_id integer NOT NULL,
    is_executed boolean NOT NULL,
    number_attempts integer NOT NULL,
    true_number_attempts integer NOT NULL
);


ALTER TABLE public.subject_user_usertaskoffset OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 91783)
-- Dependencies: 234 5
-- Name: subject_user_usertaskoffset_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_user_usertaskoffset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_user_usertaskoffset_id_seq OWNER TO postgres;

--
-- TOC entry 2555 (class 0 OID 0)
-- Dependencies: 233
-- Name: subject_user_usertaskoffset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_user_usertaskoffset_id_seq OWNED BY subject_user_usertaskoffset.id;


--
-- TOC entry 2556 (class 0 OID 0)
-- Dependencies: 233
-- Name: subject_user_usertaskoffset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_user_usertaskoffset_id_seq', 1, true);


--
-- TOC entry 238 (class 1259 OID 91821)
-- Dependencies: 5
-- Name: subject_user_usertaskuse; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_user_usertaskuse (
    id integer NOT NULL,
    task_id integer NOT NULL,
    user_use_id integer NOT NULL,
    is_executed boolean NOT NULL,
    number_attempts integer NOT NULL,
    true_number_attempts integer NOT NULL
);


ALTER TABLE public.subject_user_usertaskuse OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 91819)
-- Dependencies: 238 5
-- Name: subject_user_usertaskuse_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_user_usertaskuse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_user_usertaskuse_id_seq OWNER TO postgres;

--
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 237
-- Name: subject_user_usertaskuse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_user_usertaskuse_id_seq OWNED BY subject_user_usertaskuse.id;


--
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 237
-- Name: subject_user_usertaskuse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_user_usertaskuse_id_seq', 3, true);


--
-- TOC entry 236 (class 1259 OID 91803)
-- Dependencies: 5
-- Name: subject_user_useruse; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_user_useruse (
    id integer NOT NULL,
    user_id integer NOT NULL,
    use_id integer NOT NULL,
    is_executed boolean NOT NULL,
    date_delivery date NOT NULL,
    number_attempts integer NOT NULL,
    true_number_attempts integer NOT NULL
);


ALTER TABLE public.subject_user_useruse OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 91801)
-- Dependencies: 236 5
-- Name: subject_user_useruse_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_user_useruse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_user_useruse_id_seq OWNER TO postgres;

--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 235
-- Name: subject_user_useruse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_user_useruse_id_seq OWNED BY subject_user_useruse.id;


--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 235
-- Name: subject_user_useruse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_user_useruse_id_seq', 1, true);


--
-- TOC entry 210 (class 1259 OID 91568)
-- Dependencies: 5
-- Name: subject_versionanswer; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE subject_versionanswer (
    id integer NOT NULL,
    answer text NOT NULL,
    task_id integer NOT NULL,
    type_answer character varying(50) NOT NULL,
    is_correctly boolean NOT NULL,
    is_active boolean NOT NULL,
    sort integer NOT NULL
);


ALTER TABLE public.subject_versionanswer OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 91566)
-- Dependencies: 5 210
-- Name: subject_versionanswer_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE subject_versionanswer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_versionanswer_id_seq OWNER TO postgres;

--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 209
-- Name: subject_versionanswer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE subject_versionanswer_id_seq OWNED BY subject_versionanswer.id;


--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 209
-- Name: subject_versionanswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('subject_versionanswer_id_seq', 4, true);


--
-- TOC entry 251 (class 1259 OID 91928)
-- Dependencies: 5
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 91862)
-- Dependencies: 5
-- Name: training_trainingformulas; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE training_trainingformulas (
    id integer NOT NULL,
    dictionary_id integer NOT NULL,
    last_attempt timestamp with time zone,
    number_attempts integer NOT NULL,
    right_answers integer NOT NULL,
    is_right_last_answer boolean NOT NULL,
    is_learned boolean NOT NULL
);


ALTER TABLE public.training_trainingformulas OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 91860)
-- Dependencies: 5 242
-- Name: training_trainingformulas_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE training_trainingformulas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_trainingformulas_id_seq OWNER TO postgres;

--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 241
-- Name: training_trainingformulas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE training_trainingformulas_id_seq OWNED BY training_trainingformulas.id;


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 241
-- Name: training_trainingformulas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('training_trainingformulas_id_seq', 6, true);


--
-- TOC entry 244 (class 1259 OID 91875)
-- Dependencies: 5
-- Name: training_trainingonlinedayuser; Type: TABLE; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE TABLE training_trainingonlinedayuser (
    id integer NOT NULL,
    user_id integer NOT NULL,
    day date NOT NULL,
    last_activity timestamp with time zone,
    duration_of_visits numeric(5,2) NOT NULL
);


ALTER TABLE public.training_trainingonlinedayuser OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 91873)
-- Dependencies: 5 244
-- Name: training_trainingonlinedayuser_id_seq; Type: SEQUENCE; Schema: public; Owner: fmsh
--

CREATE SEQUENCE training_trainingonlinedayuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_trainingonlinedayuser_id_seq OWNER TO postgres;

--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 243
-- Name: training_trainingonlinedayuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fmsh
--

ALTER SEQUENCE training_trainingonlinedayuser_id_seq OWNED BY training_trainingonlinedayuser.id;


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 243
-- Name: training_trainingonlinedayuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fmsh
--

SELECT pg_catalog.setval('training_trainingonlinedayuser_id_seq', 3, true);


--
-- TOC entry 2147 (class 2604 OID 91222)
-- Dependencies: 164 163 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE admin_tools_dashboard_preferences ALTER COLUMN id SET DEFAULT nextval('admin_tools_dashboard_preferences_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 91211)
-- Dependencies: 162 161 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE admin_tools_menu_bookmark ALTER COLUMN id SET DEFAULT nextval('admin_tools_menu_bookmark_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 91258)
-- Dependencies: 169 170 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 91243)
-- Dependencies: 167 168 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 91333)
-- Dependencies: 178 177 178
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 91233)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 91303)
-- Dependencies: 176 175 176
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 91288)
-- Dependencies: 173 174 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 91273)
-- Dependencies: 172 171 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2166 (class 2604 OID 91521)
-- Dependencies: 202 201 202
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE configuration_configmodel ALTER COLUMN id SET DEFAULT nextval('configuration_configmodel_id_seq'::regclass);


--
-- TOC entry 2157 (class 2604 OID 91380)
-- Dependencies: 184 185 185
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 91349)
-- Dependencies: 180 179 180
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 91372)
-- Dependencies: 182 183 183
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 91902)
-- Dependencies: 247 248 248
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE invitefriend_friend ALTER COLUMN id SET DEFAULT nextval('invitefriend_friend_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 91413)
-- Dependencies: 189 188 189
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE mformulas_formula ALTER COLUMN id SET DEFAULT nextval('mformulas_formula_id_seq'::regclass);


--
-- TOC entry 2163 (class 2604 OID 91467)
-- Dependencies: 194 195 195
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE mformulas_formulataskanswer ALTER COLUMN id SET DEFAULT nextval('mformulas_formulataskanswer_id_seq'::regclass);


--
-- TOC entry 2162 (class 2604 OID 91451)
-- Dependencies: 192 193 193
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE mformulas_formulataskquestion ALTER COLUMN id SET DEFAULT nextval('mformulas_formulataskquestion_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 91440)
-- Dependencies: 191 190 191
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE mformulas_primitiveofformulatask ALTER COLUMN id SET DEFAULT nextval('mformulas_primitiveofformulatask_id_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 92022)
-- Dependencies: 252 253 253
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE mformulas_searchformula ALTER COLUMN id SET DEFAULT nextval('mformulas_searchformula_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 91891)
-- Dependencies: 246 245 246
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE news_news_article ALTER COLUMN id SET DEFAULT nextval('news_news_article_id_seq'::regclass);


--
-- TOC entry 2165 (class 2604 OID 91508)
-- Dependencies: 199 200 200
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE onlineuser_onlinedayuser ALTER COLUMN id SET DEFAULT nextval('onlineuser_onlinedayuser_id_seq'::regclass);


--
-- TOC entry 2164 (class 2604 OID 91493)
-- Dependencies: 198 197 198
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE profiles_useranonymous ALTER COLUMN id SET DEFAULT nextval('profiles_useranonymous_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 91402)
-- Dependencies: 187 186 187
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE project_article ALTER COLUMN id SET DEFAULT nextval('project_article_id_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 91915)
-- Dependencies: 250 249 250
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE statistics_statisticsdayuser ALTER COLUMN id SET DEFAULT nextval('statistics_statisticsdayuser_id_seq'::regclass);


--
-- TOC entry 2171 (class 2604 OID 91587)
-- Dependencies: 212 211 212
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_complexity ALTER COLUMN id SET DEFAULT nextval('subject_complexity_id_seq'::regclass);


--
-- TOC entry 2172 (class 2604 OID 91598)
-- Dependencies: 213 214 214
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_lesson ALTER COLUMN id SET DEFAULT nextval('subject_lesson_id_seq'::regclass);


--
-- TOC entry 2173 (class 2604 OID 91624)
-- Dependencies: 216 215 216
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_lesson_task ALTER COLUMN id SET DEFAULT nextval('subject_lesson_task_id_seq'::regclass);


--
-- TOC entry 2175 (class 2604 OID 91661)
-- Dependencies: 219 220 220
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_leveltaskuse ALTER COLUMN id SET DEFAULT nextval('subject_leveltaskuse_id_seq'::regclass);


--
-- TOC entry 2177 (class 2604 OID 91695)
-- Dependencies: 223 224 224
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_offset ALTER COLUMN id SET DEFAULT nextval('subject_offset_id_seq'::regclass);


--
-- TOC entry 2178 (class 2604 OID 91711)
-- Dependencies: 225 226 226
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_offset_task ALTER COLUMN id SET DEFAULT nextval('subject_offset_task_id_seq'::regclass);


--
-- TOC entry 2168 (class 2604 OID 91544)
-- Dependencies: 205 206 206
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_subject ALTER COLUMN id SET DEFAULT nextval('subject_subject_id_seq'::regclass);


--
-- TOC entry 2167 (class 2604 OID 91529)
-- Dependencies: 203 204 204
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_subject_sites ALTER COLUMN id SET DEFAULT nextval('subject_subject_sites_id_seq'::regclass);


--
-- TOC entry 2169 (class 2604 OID 91560)
-- Dependencies: 207 208 208
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_task ALTER COLUMN id SET DEFAULT nextval('subject_task_id_seq'::regclass);


--
-- TOC entry 2174 (class 2604 OID 91645)
-- Dependencies: 217 218 218
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_use ALTER COLUMN id SET DEFAULT nextval('subject_use_id_seq'::regclass);


--
-- TOC entry 2176 (class 2604 OID 91672)
-- Dependencies: 221 222 222
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_use_task ALTER COLUMN id SET DEFAULT nextval('subject_use_task_id_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 91842)
-- Dependencies: 240 239 240
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_user_dictionary ALTER COLUMN id SET DEFAULT nextval('subject_user_dictionary_id_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 91729)
-- Dependencies: 227 228 228
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_user_userlesson ALTER COLUMN id SET DEFAULT nextval('subject_user_userlesson_id_seq'::regclass);


--
-- TOC entry 2181 (class 2604 OID 91770)
-- Dependencies: 231 232 232
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_user_useroffset ALTER COLUMN id SET DEFAULT nextval('subject_user_useroffset_id_seq'::regclass);


--
-- TOC entry 2180 (class 2604 OID 91747)
-- Dependencies: 229 230 230
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_user_usertask ALTER COLUMN id SET DEFAULT nextval('subject_user_usertask_id_seq'::regclass);


--
-- TOC entry 2182 (class 2604 OID 91788)
-- Dependencies: 233 234 234
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_user_usertaskoffset ALTER COLUMN id SET DEFAULT nextval('subject_user_usertaskoffset_id_seq'::regclass);


--
-- TOC entry 2184 (class 2604 OID 91824)
-- Dependencies: 238 237 238
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_user_usertaskuse ALTER COLUMN id SET DEFAULT nextval('subject_user_usertaskuse_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 91806)
-- Dependencies: 236 235 236
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_user_useruse ALTER COLUMN id SET DEFAULT nextval('subject_user_useruse_id_seq'::regclass);


--
-- TOC entry 2170 (class 2604 OID 91571)
-- Dependencies: 209 210 210
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE subject_versionanswer ALTER COLUMN id SET DEFAULT nextval('subject_versionanswer_id_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 91865)
-- Dependencies: 242 241 242
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE training_trainingformulas ALTER COLUMN id SET DEFAULT nextval('training_trainingformulas_id_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 91878)
-- Dependencies: 243 244 244
-- Name: id; Type: DEFAULT; Schema: public; Owner: fmsh
--

ALTER TABLE training_trainingonlinedayuser ALTER COLUMN id SET DEFAULT nextval('training_trainingonlinedayuser_id_seq'::regclass);


--
-- TOC entry 2424 (class 0 OID 91219)
-- Dependencies: 164
-- Data for Name: admin_tools_dashboard_preferences; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO admin_tools_dashboard_preferences (id, user_id, data, dashboard_id) VALUES (1, 1, '{}', 'dashboard');
INSERT INTO admin_tools_dashboard_preferences (id, user_id, data, dashboard_id) VALUES (2, 1, '{}', 'mformulas-dashboard');
INSERT INTO admin_tools_dashboard_preferences (id, user_id, data, dashboard_id) VALUES (3, 1, '{}', 'subject-dashboard');


--
-- TOC entry 2423 (class 0 OID 91208)
-- Dependencies: 162
-- Data for Name: admin_tools_menu_bookmark; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2427 (class 0 OID 91255)
-- Dependencies: 170
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2426 (class 0 OID 91240)
-- Dependencies: 168
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2431 (class 0 OID 91330)
-- Dependencies: 178
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2425 (class 0 OID 91230)
-- Dependencies: 166
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add bookmark', 1, 'add_bookmark');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change bookmark', 1, 'change_bookmark');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete bookmark', 1, 'delete_bookmark');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add dashboard preferences', 2, 'add_dashboardpreferences');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change dashboard preferences', 2, 'change_dashboardpreferences');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete dashboard preferences', 2, 'delete_dashboardpreferences');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add group', 4, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change group', 4, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete group', 4, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 5, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 5, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 5, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add message', 6, 'add_message');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change message', 6, 'change_message');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete message', 6, 'delete_message');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add content type', 7, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change content type', 7, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete content type', 7, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add session', 8, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change session', 8, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete session', 8, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add site', 9, 'add_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change site', 9, 'change_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete site', 9, 'delete_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add log entry', 10, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change log entry', 10, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete log entry', 10, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add статья', 11, 'add_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change статья', 11, 'change_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete статья', 11, 'delete_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add formula', 12, 'add_formula');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change formula', 12, 'change_formula');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete formula', 12, 'delete_formula');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add search formula', 13, 'add_searchformula');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change search formula', 13, 'change_searchformula');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete search formula', 13, 'delete_searchformula');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add primitive of formula', 14, 'add_primitiveofformulatask');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change primitive of formula', 14, 'change_primitiveofformulatask');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete primitive of formula', 14, 'delete_primitiveofformulatask');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add formula task question', 15, 'add_formulataskquestion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change formula task question', 15, 'change_formulataskquestion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete formula task question', 15, 'delete_formulataskquestion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add formula task answer', 16, 'add_formulataskanswer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change formula task answer', 16, 'change_formulataskanswer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete formula task answer', 16, 'delete_formulataskanswer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add profile user', 17, 'add_userprofile');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change profile user', 17, 'change_userprofile');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete profile user', 17, 'delete_userprofile');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add user - anonymous', 18, 'add_useranonymous');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change user - anonymous', 18, 'change_useranonymous');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete user - anonymous', 18, 'delete_useranonymous');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add online user', 19, 'add_onlinedayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change online user', 19, 'change_onlinedayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete online user', 19, 'delete_onlinedayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can add configuration', 20, 'add_configmodel');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can change configuration', 20, 'change_configmodel');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can delete configuration', 20, 'delete_configmodel');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add subject', 21, 'add_subject');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change subject', 21, 'change_subject');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete subject', 21, 'delete_subject');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can add task', 22, 'add_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can change task', 22, 'change_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can delete task', 22, 'delete_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can add version answer', 23, 'add_versionanswer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can change version answer', 23, 'change_versionanswer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can delete version answer', 23, 'delete_versionanswer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can add complexity', 24, 'add_complexity');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can change complexity', 24, 'change_complexity');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can delete complexity', 24, 'delete_complexity');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (73, 'Can add lesson', 25, 'add_lesson');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (74, 'Can change lesson', 25, 'change_lesson');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (75, 'Can delete lesson', 25, 'delete_lesson');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (76, 'Can add lesson task', 26, 'add_lesson_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (77, 'Can change lesson task', 26, 'change_lesson_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (78, 'Can delete lesson task', 26, 'delete_lesson_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (79, 'Can add USE', 27, 'add_use');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (80, 'Can change USE', 27, 'change_use');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (81, 'Can delete USE', 27, 'delete_use');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (82, 'Can add level task use', 28, 'add_leveltaskuse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (83, 'Can change level task use', 28, 'change_leveltaskuse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (84, 'Can delete level task use', 28, 'delete_leveltaskuse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (85, 'Can add USEs task', 29, 'add_use_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (86, 'Can change USEs task', 29, 'change_use_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (87, 'Can delete USEs task', 29, 'delete_use_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (88, 'Can add offset', 30, 'add_offset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (89, 'Can change offset', 30, 'change_offset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (90, 'Can delete offset', 30, 'delete_offset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (91, 'Can add offset task', 31, 'add_offset_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (92, 'Can change offset task', 31, 'change_offset_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (93, 'Can delete offset task', 31, 'delete_offset_task');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (94, 'Can add user lesson', 32, 'add_userlesson');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (95, 'Can change user lesson', 32, 'change_userlesson');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (96, 'Can delete user lesson', 32, 'delete_userlesson');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (97, 'Can add user task', 33, 'add_usertask');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (98, 'Can change user task', 33, 'change_usertask');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (99, 'Can delete user task', 33, 'delete_usertask');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (100, 'Can add user offset', 34, 'add_useroffset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (101, 'Can change user offset', 34, 'change_useroffset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (102, 'Can delete user offset', 34, 'delete_useroffset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (103, 'Can add user offset', 35, 'add_usertaskoffset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (104, 'Can change user offset', 35, 'change_usertaskoffset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (105, 'Can delete user offset', 35, 'delete_usertaskoffset');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (106, 'Can add user use', 36, 'add_useruse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (107, 'Can change user use', 36, 'change_useruse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (108, 'Can delete user use', 36, 'delete_useruse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (109, 'Can add user task use', 37, 'add_usertaskuse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (110, 'Can change user task use', 37, 'change_usertaskuse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (111, 'Can delete user task use', 37, 'delete_usertaskuse');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (112, 'Can add dictionary', 38, 'add_dictionary');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (113, 'Can change dictionary', 38, 'change_dictionary');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (114, 'Can delete dictionary', 38, 'delete_dictionary');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (115, 'Can add training formula', 39, 'add_trainingformulas');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (116, 'Can change training formula', 39, 'change_trainingformulas');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (117, 'Can delete training formula', 39, 'delete_trainingformulas');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (118, 'Can add online user', 40, 'add_trainingonlinedayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (119, 'Can change online user', 40, 'change_trainingonlinedayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (120, 'Can delete online user', 40, 'delete_trainingonlinedayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (121, 'Can add actions article', 41, 'add_news_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (122, 'Can change actions article', 41, 'change_news_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (123, 'Can delete actions article', 41, 'delete_news_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (124, 'Can add friend', 42, 'add_friend');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (125, 'Can change friend', 42, 'change_friend');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (126, 'Can delete friend', 42, 'delete_friend');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (127, 'Can add statistics of the user', 43, 'add_statisticsdayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (128, 'Can change statistics of the user', 43, 'change_statisticsdayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (129, 'Can delete statistics of the user', 43, 'delete_statisticsdayuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (130, 'Can add kv store', 44, 'add_kvstore');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (131, 'Can change kv store', 44, 'change_kvstore');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (132, 'Can delete kv store', 44, 'delete_kvstore');


--
-- TOC entry 2430 (class 0 OID 91300)
-- Dependencies: 176
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) VALUES (2, 'test', 'Иванов', 'Петр', 'qwe@qwe.qwe', 'sha1$e6ccf$5ac134ab7ec35e4e31f1ef3d20a777aa975e455d', false, true, false, '2012-04-18 14:16:26+04', '2012-04-18 14:16:26+04');
INSERT INTO auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) VALUES (1, 'admin', '', '', 'gva@tomuniversal.ru', 'sha1$85f17$7bba070904d0c6d125c6368fe2fab608c1cfb52c', true, true, true, '2012-07-10 07:31:52.505+04', '2012-04-18 13:35:24+04');


--
-- TOC entry 2429 (class 0 OID 91285)
-- Dependencies: 174
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2428 (class 0 OID 91270)
-- Dependencies: 172
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2444 (class 0 OID 91518)
-- Dependencies: 202
-- Data for Name: configuration_configmodel; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO configuration_configmodel (id, percent_lessons, duration_registration, cost_registration, duration_extension, cost_extension, cost_analysis, free_lessons, quantity_formulas, duration_training_unregistered_user, plan_lessons, plan_formulas) VALUES (1, 50, 30, 500, 30, 300, 50, 5, 10, 20, 1, 5);


--
-- TOC entry 2435 (class 0 OID 91377)
-- Dependencies: 185
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (1, '2012-04-18 13:35:53.924+04', 1, 14, '1', '[0-9]+', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (2, '2012-04-18 13:36:01.488+04', 1, 14, '2', '\\frac\{.+?\}\{.+?\}', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (3, '2012-04-18 13:36:17.813+04', 1, 16, '1', '0', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (4, '2012-04-18 13:36:23.268+04', 1, 16, '2', '1', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (5, '2012-04-18 13:37:28.622+04', 1, 12, '1', 'ф1', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (6, '2012-04-18 13:37:47.441+04', 1, 12, '2', 'ф2', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (7, '2012-04-18 13:37:59.015+04', 1, 12, '3', 'ф3', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (8, '2012-04-18 13:38:14.214+04', 1, 12, '4', 'ф4', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (9, '2012-04-18 13:38:26.814+04', 1, 12, '5', 'ф5', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (10, '2012-04-18 13:40:17.492+04', 1, 21, '1', 'Математика', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (11, '2012-04-18 13:40:23.176+04', 1, 21, '2', 'Физика', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (12, '2012-04-18 13:40:47.183+04', 1, 24, '1', 'Легко', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (13, '2012-04-18 13:40:52.243+04', 1, 24, '2', 'Средне', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (14, '2012-04-18 13:40:57.586+04', 1, 24, '3', 'Сложно', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (15, '2012-04-18 13:42:19.956+04', 1, 25, '1', 'Урок 1 по математике', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (16, '2012-04-18 13:42:46.037+04', 1, 25, '2', 'Урок 2 по математике', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (17, '2012-04-18 13:43:04.075+04', 1, 25, '3', 'Урок 1 по физике', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (18, '2012-04-18 13:44:03.84+04', 1, 25, '1', 'Урок 1 по математике', 2, 'Изменен text.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (19, '2012-04-18 13:44:25.403+04', 1, 28, '1', 'А', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (20, '2012-04-18 13:44:28.872+04', 1, 28, '2', 'Б', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (21, '2012-04-18 13:44:31.046+04', 1, 28, '3', 'С', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (22, '2012-04-18 13:46:51.352+04', 1, 22, '1', 'Задача 1 по математике', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (23, '2012-04-18 13:47:04.713+04', 1, 22, '1', 'Задача 1 по математике', 2, 'Добавлен вариант ответа "Ответ 2".');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (24, '2012-04-18 13:47:52.224+04', 1, 22, '2', 'Задача 2 по математике', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (25, '2012-04-18 13:49:37.846+04', 1, 30, '1', 'Зачет 1', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (26, '2012-04-18 13:50:17.493+04', 1, 30, '2', 'Зачет 2', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (27, '2012-04-18 13:53:37.152+04', 1, 22, '1', 'Задача 1 по математике', 2, 'Добавлен поле относящиеся к зачету "Offset_Task object".');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (28, '2012-04-18 13:54:39.811+04', 1, 22, '2', 'Задача 2 по математике', 2, 'Добавлен поле относящиеся к зачету "Offset_Task object".');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (29, '2012-04-18 13:56:08.985+04', 1, 22, '2', 'Задача 2 по математике', 2, 'Ни одно поле не изменено.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (30, '2012-04-18 13:56:38.116+04', 1, 27, '1', 'ЕГЭ', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (31, '2012-04-18 13:57:15.52+04', 1, 22, '3', 'Задача по егэ', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (32, '2012-04-18 13:57:31.374+04', 1, 22, '3', 'Задача по егэ', 2, 'Добавлен вариант ответа "Ответ".');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (33, '2012-04-18 14:09:22.308+04', 1, 5, '1', 'admin', 2, 'Изменены level для profile user "admin".');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (34, '2012-04-18 14:13:13.583+04', 1, 38, '1', 'Dictionary object', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (35, '2012-04-18 14:13:19.313+04', 1, 38, '2', 'Dictionary object', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (36, '2012-04-18 14:13:25.57+04', 1, 38, '3', 'Dictionary object', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (37, '2012-04-18 14:13:31.396+04', 1, 38, '4', 'Dictionary object', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (38, '2012-04-18 14:13:37.285+04', 1, 38, '5', 'Dictionary object', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (39, '2012-04-18 14:15:28.334+04', 1, 38, '5', 'Dictionary object', 3, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (40, '2012-04-18 14:15:28.355+04', 1, 38, '4', 'Dictionary object', 3, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (41, '2012-04-18 14:15:28.359+04', 1, 38, '3', 'Dictionary object', 3, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (42, '2012-04-18 14:15:28.362+04', 1, 38, '2', 'Dictionary object', 3, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (43, '2012-04-18 14:15:28.364+04', 1, 38, '1', 'Dictionary object', 3, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (44, '2012-04-18 14:16:26.771+04', 1, 5, '2', 'test', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (45, '2012-04-18 14:16:47.851+04', 1, 5, '2', 'test', 2, 'Изменен first_name,last_name и email.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (46, '2012-04-19 06:10:59.886+04', 1, 43, '1', 'admin / 18.04.2012 / Математика', 1, '');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (47, '2012-04-19 07:14:28.51+04', 1, 25, '2', 'Урок 2 по математике', 2, 'Изменен text.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (48, '2012-04-19 07:15:23.887+04', 1, 22, '2', 'Задача 2 по математике', 2, 'Изменен text_task. Изменены answer для вариант ответа "Ответ 11&nbsp;<a id="mformulas_link_4" href="/formula/click/4/">{{mformulas:4}}</a>".');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (49, '2012-04-19 09:11:03.342+04', 1, 25, '3', 'Урок 1 по физике', 2, 'Изменен text.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (50, '2012-04-19 09:12:42.937+04', 1, 25, '2', 'Урок 2 по математике', 2, 'Изменен text.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (51, '2012-04-19 11:37:27.597+04', 1, 25, '2', 'Урок 2 по математике', 2, 'Изменен video.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (52, '2012-04-19 11:51:23.411+04', 1, 25, '2', 'Урок 2 по математике', 2, 'Изменен video.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (53, '2012-04-19 12:57:43.943+04', 1, 25, '1', 'Урок 1 по математике', 2, 'Изменен video.');
INSERT INTO django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) VALUES (54, '2012-07-10 10:57:30.077+04', 1, 12, '6', 'ф6', 1, '');


--
-- TOC entry 2432 (class 0 OID 91346)
-- Dependencies: 180
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO django_content_type (id, name, app_label, model) VALUES (1, 'bookmark', 'menu', 'bookmark');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (2, 'dashboard preferences', 'dashboard', 'dashboardpreferences');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (3, 'permission', 'auth', 'permission');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (4, 'group', 'auth', 'group');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (5, 'user', 'auth', 'user');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (6, 'message', 'auth', 'message');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (7, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (8, 'session', 'sessions', 'session');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (9, 'site', 'sites', 'site');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (10, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (11, 'статья', 'project', 'article');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (12, 'formula', 'mformulas', 'formula');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (13, 'search formula', 'mformulas', 'searchformula');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (14, 'primitive of formula', 'mformulas', 'primitiveofformulatask');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (15, 'formula task question', 'mformulas', 'formulataskquestion');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (16, 'formula task answer', 'mformulas', 'formulataskanswer');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (17, 'profile user', 'profiles', 'userprofile');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (18, 'user - anonymous', 'profiles', 'useranonymous');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (19, 'online user', 'onlineuser', 'onlinedayuser');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (20, 'configuration', 'configuration', 'configmodel');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (21, 'subject', 'subject', 'subject');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (22, 'task', 'subject', 'task');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (23, 'version answer', 'subject', 'versionanswer');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (24, 'complexity', 'subject', 'complexity');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (25, 'lesson', 'subject', 'lesson');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (26, 'lesson task', 'subject', 'lesson_task');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (27, 'USE', 'subject', 'use');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (28, 'level task use', 'subject', 'leveltaskuse');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (29, 'USEs task', 'subject', 'use_task');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (30, 'offset', 'subject', 'offset');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (31, 'offset task', 'subject', 'offset_task');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (32, 'user lesson', 'subject_user', 'userlesson');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (33, 'user task', 'subject_user', 'usertask');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (34, 'user offset', 'subject_user', 'useroffset');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (35, 'user offset', 'subject_user', 'usertaskoffset');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (36, 'user use', 'subject_user', 'useruse');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (37, 'user task use', 'subject_user', 'usertaskuse');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (38, 'dictionary', 'subject_user', 'dictionary');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (39, 'training formula', 'training', 'trainingformulas');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (40, 'online user', 'training', 'trainingonlinedayuser');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (41, 'actions article', 'news', 'news_article');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (42, 'friend', 'invitefriend', 'friend');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (43, 'statistics of the user', 'statistics', 'statisticsdayuser');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (44, 'kv store', 'thumbnail', 'kvstore');


--
-- TOC entry 2433 (class 0 OID 91359)
-- Dependencies: 181
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('42e8612945088bb5758e446cc9093901', 'MDhlMzMyMTczODc4NmVlZGI0MjkwYjEyMzFjNmY0MGJhNTNiODEwMTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2012-05-02 13:35:34.022+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('e9e0de09c0143cd5054349eceaeca94c', 'MDhlMzMyMTczODc4NmVlZGI0MjkwYjEyMzFjNmY0MGJhNTNiODEwMTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2012-07-24 06:29:33.257+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('63433738ecff4e67c1e056ca2b647630', 'MDhlMzMyMTczODc4NmVlZGI0MjkwYjEyMzFjNmY0MGJhNTNiODEwMTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2012-07-24 07:31:52.509+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('e52b12bc9adbb07e6d166bc7a3d01d40', 'ZDcyMTAyMWM0ZGM3YjljODgyYjc5Mzc0MWUzZTFiODkyOGI0MzFhZDqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2012-07-24 10:57:03.234+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('8470809eb44885d67947ce4f4a360973', 'ZDcyMTAyMWM0ZGM3YjljODgyYjc5Mzc0MWUzZTFiODkyOGI0MzFhZDqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2012-07-24 10:57:08.293+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('da0215f885bd8e397801791a063433bd', 'ZDcyMTAyMWM0ZGM3YjljODgyYjc5Mzc0MWUzZTFiODkyOGI0MzFhZDqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2012-07-24 10:57:09.296+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ce99fc5f3d68ba1773b8ef9f95a8d994', 'ZDcyMTAyMWM0ZGM3YjljODgyYjc5Mzc0MWUzZTFiODkyOGI0MzFhZDqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2012-07-24 10:57:17.427+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2b28d1a500309a232e81ffb7256bcbf5', 'ZDcyMTAyMWM0ZGM3YjljODgyYjc5Mzc0MWUzZTFiODkyOGI0MzFhZDqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2012-07-24 10:57:18.328+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('b3bce95e23fe4286bb120541e0a06fb0', 'ZDcyMTAyMWM0ZGM3YjljODgyYjc5Mzc0MWUzZTFiODkyOGI0MzFhZDqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2012-07-24 10:57:30.42+04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5f6eda1f92fd6b9d847578542a06871c', 'ZDcyMTAyMWM0ZGM3YjljODgyYjc5Mzc0MWUzZTFiODkyOGI0MzFhZDqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2012-07-24 10:57:31.311+04');


--
-- TOC entry 2434 (class 0 OID 91369)
-- Dependencies: 183
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO django_site (id, domain, name) VALUES (1, 'example.com', 'example.com');


--
-- TOC entry 2467 (class 0 OID 91899)
-- Dependencies: 248
-- Data for Name: invitefriend_friend; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO invitefriend_friend (id, user_id, email, created_at) VALUES (1, 1, 'qwe@qwe.qwe', '2012-04-18 14:16:55.885+04');


--
-- TOC entry 2437 (class 0 OID 91410)
-- Dependencies: 189
-- Data for Name: mformulas_formula; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO mformulas_formula (id, title, tex, is_active, sort) VALUES (1, 'ф1', 'a^2 + b^2 = c^2', true, 0);
INSERT INTO mformulas_formula (id, title, tex, is_active, sort) VALUES (2, 'ф2', '\frac{(a+b )^2}{4} - \frac{(a-b )^2}{4} = ab', true, 0);
INSERT INTO mformulas_formula (id, title, tex, is_active, sort) VALUES (3, 'ф3', 'f\{x,y\}=(x^2+y^2)^2', true, 0);
INSERT INTO mformulas_formula (id, title, tex, is_active, sort) VALUES (4, 'ф4', '(x + \frac{1}{x})^2  ', true, 0);
INSERT INTO mformulas_formula (id, title, tex, is_active, sort) VALUES (5, 'ф5', '\sqrt{x+1}', true, 0);
INSERT INTO mformulas_formula (id, title, tex, is_active, sort) VALUES (6, 'ф6', '(x + \frac{1}{x})^3', true, 0);


--
-- TOC entry 2440 (class 0 OID 91464)
-- Dependencies: 195
-- Data for Name: mformulas_formulataskanswer; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (1, NULL, '0', false, true, 0);
INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (2, NULL, '1', false, true, 0);
INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (3, 1, '2', true, true, 0);
INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (4, 2, '4', true, true, 0);
INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (5, 3, '2', true, true, 0);
INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (6, 4, '\frac{1}{x}', true, true, 0);
INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (7, 5, '1', true, true, 0);
INSERT INTO mformulas_formulataskanswer (id, question_id, answer_tex, is_true, is_active, sort) VALUES (8, 6, '\frac{1}{x}', true, true, 0);


--
-- TOC entry 2439 (class 0 OID 91448)
-- Dependencies: 193
-- Data for Name: mformulas_formulataskquestion; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO mformulas_formulataskquestion (id, formula_id, question, question_tex, is_active, sort) VALUES (1, 1, 'Specify the right answer', 'a^2 + b^? = c^2', true, 0);
INSERT INTO mformulas_formulataskquestion (id, formula_id, question, question_tex, is_active, sort) VALUES (2, 2, 'Specify the right answer', '\frac{(a+b )^2}{?} - \frac{(a-b )^2}{4} = ab', true, 0);
INSERT INTO mformulas_formulataskquestion (id, formula_id, question, question_tex, is_active, sort) VALUES (3, 3, 'Specify the right answer', 'f\{x,y\}=(x^2+y^2)^?', true, 0);
INSERT INTO mformulas_formulataskquestion (id, formula_id, question, question_tex, is_active, sort) VALUES (4, 4, 'Specify the right answer', '(x + ?)^2  ', true, 0);
INSERT INTO mformulas_formulataskquestion (id, formula_id, question, question_tex, is_active, sort) VALUES (5, 5, 'Specify the right answer', '\sqrt{x+?}', true, 0);
INSERT INTO mformulas_formulataskquestion (id, formula_id, question, question_tex, is_active, sort) VALUES (6, 6, 'Specify the right answer', '(x + ?)^3', true, 0);


--
-- TOC entry 2438 (class 0 OID 91437)
-- Dependencies: 191
-- Data for Name: mformulas_primitiveofformulatask; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO mformulas_primitiveofformulatask (id, expression, is_active, sort) VALUES (1, '[0-9]+', true, 0);
INSERT INTO mformulas_primitiveofformulatask (id, expression, is_active, sort) VALUES (2, '\\frac\{.+?\}\{.+?\}', true, 0);


--
-- TOC entry 2470 (class 0 OID 92019)
-- Dependencies: 253
-- Data for Name: mformulas_searchformula; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (313, 1, '/subjects/lesson/matematika/urok-1-po-matematike/', 'Lesson', 'text', 1);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (314, 2, '/subjects/lesson/matematika/urok-1-po-matematike/', 'Lesson', 'text', 1);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (315, 3, '/subjects/lesson/matematika/urok-1-po-matematike/', 'Lesson', 'text', 1);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (316, 4, '/subjects/lesson/matematika/urok-1-po-matematike/', 'Lesson', 'text', 1);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (317, 5, '/subjects/lesson/matematika/urok-1-po-matematike/', 'Lesson', 'text', 1);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (318, 2, '/subjects/lesson/matematika/urok-2-po-matematike/', 'Lesson', 'text', 2);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (319, 5, '/subjects/lesson/matematika/urok-2-po-matematike/', 'Lesson', 'text', 2);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (320, 5, '/subjects/lesson/matematika/urok-2-po-matematike/', 'Lesson', 'text', 2);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (321, 1, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (322, 1, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (323, 1, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (324, 1, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (325, 1, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (326, 2, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (327, 1, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (328, 1, '/subjects/lesson/fizika/urok-1-po-fizike/', 'Lesson', 'text', 3);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (329, 3, '/subjects/task/zadacha-2-po-matematike/', 'Task', 'text_task', 2);
INSERT INTO mformulas_searchformula (id, formula_id, link, model_name, field_name, obj_id) VALUES (330, 4, '', 'VersionAnswer', 'answer', 3);


--
-- TOC entry 2466 (class 0 OID 91888)
-- Dependencies: 246
-- Data for Name: news_news_article; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2443 (class 0 OID 91505)
-- Dependencies: 200
-- Data for Name: onlineuser_onlinedayuser; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO onlineuser_onlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (1, 1, '2012-04-18', '2012-04-18 16:51:57.813+04', 11.19);
INSERT INTO onlineuser_onlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (5, 1, '2012-07-10', '2012-07-10 11:33:21.013+04', 0.71);
INSERT INTO onlineuser_onlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (3, 4, '2012-07-09', '2012-07-09 11:27:36.423+04', 0.86);
INSERT INTO onlineuser_onlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (4, 5, '2012-07-10', '2012-07-10 07:20:12.619+04', 0.32);
INSERT INTO onlineuser_onlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (2, 1, '2012-04-19', '2012-04-19 13:17:10.569+04', 20.28);


--
-- TOC entry 2442 (class 0 OID 91490)
-- Dependencies: 198
-- Data for Name: profiles_useranonymous; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (1, 1, '', '2012-04-18 13:35:24.639+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (2, NULL, '1604121306037263704882', '2012-04-18 13:35:32.49+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (3, 2, '', '2012-04-18 14:16:26.767+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (4, NULL, '0907121251453017843717', '2012-07-09 09:51:45.606+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (5, NULL, '1007120929227505637793', '2012-07-10 06:29:22.291+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (6, NULL, '1007121356554770588149', '2012-07-10 10:56:55.605+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (7, NULL, '1007121356568680533805', '2012-07-10 10:56:56.26+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (8, NULL, '1007121356566096606082', '2012-07-10 10:56:56.726+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (9, NULL, '1007121357034162544239', '2012-07-10 10:57:03.223+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (10, NULL, '1007121357044522736122', '2012-07-10 10:57:04.759+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (11, NULL, '1007121357083901101940', '2012-07-10 10:57:08.283+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (12, NULL, '1007121357095598053048', '2012-07-10 10:57:09.287+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (13, NULL, '1007121357104872155752', '2012-07-10 10:57:10.495+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (14, NULL, '1007121357177949785112', '2012-07-10 10:57:17.418+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (15, NULL, '1007121357185601723370', '2012-07-10 10:57:18.317+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (16, NULL, '1007121357188089847488', '2012-07-10 10:57:18.789+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (17, NULL, '1007121357309747102319', '2012-07-10 10:57:30.411+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (18, NULL, '1007121357310423724712', '2012-07-10 10:57:31.302+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (19, NULL, '1007121357325090842379', '2012-07-10 10:57:32.028+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (20, NULL, '1007121413552724572103', '2012-07-10 11:13:55.292+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (21, NULL, '1007121413554700915856', '2012-07-10 11:13:55.763+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (22, NULL, '1007121413557350830273', '2012-07-10 11:13:55.932+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (23, NULL, '1007121413563138789363', '2012-07-10 11:13:56.114+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (24, NULL, '1007121413569447736468', '2012-07-10 11:13:56.298+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (25, NULL, '1007121413561636132566', '2012-07-10 11:13:56.59+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (26, NULL, '1007121415277497077897', '2012-07-10 11:15:27.308+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (27, NULL, '1007121415270556508212', '2012-07-10 11:15:27.793+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (28, NULL, '1007121415280674613480', '2012-07-10 11:15:28.271+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (29, NULL, '1007121415288258527257', '2012-07-10 11:15:28.452+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (30, NULL, '1007121415284172336511', '2012-07-10 11:15:28.62+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (31, NULL, '1007121415280323308760', '2012-07-10 11:15:28.9+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (32, NULL, '1007121415292022647271', '2012-07-10 11:15:29.148+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (33, NULL, '1007121415500846530582', '2012-07-10 11:15:50.165+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (34, NULL, '1007121415516852211604', '2012-07-10 11:15:51.102+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (35, NULL, '1007121415517723034971', '2012-07-10 11:15:51.66+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (36, NULL, '1007121415510359301692', '2012-07-10 11:15:51.831+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (37, NULL, '1007121415525599329997', '2012-07-10 11:15:52.135+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (38, NULL, '1007121415529654610782', '2012-07-10 11:15:52.394+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (39, NULL, '1007121415523045397642', '2012-07-10 11:15:52.669+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (40, NULL, '1007121416043519873200', '2012-07-10 11:16:04.649+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (41, NULL, '1007121416343704613143', '2012-07-10 11:16:34.677+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (42, NULL, '1007121416350495734845', '2012-07-10 14:16:35.429+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (43, NULL, '1007121416367388677916', '2012-07-10 11:16:36.131+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (44, NULL, '1007121416408060360245', '2012-07-10 11:16:40.227+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (45, NULL, '1007121416409344186215', '2012-07-10 11:16:40.594+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (46, NULL, '1007121416420840977190', '2012-07-10 11:16:42.115+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (47, NULL, '1007121416420024324357', '2012-07-10 11:16:42.536+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (48, NULL, '1007121416430439559099', '2012-07-10 11:16:43.82+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (49, NULL, '1007121416443590526292', '2012-07-10 11:16:44.294+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (50, NULL, '1007121416475115836374', '2012-07-10 11:16:47.296+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (51, NULL, '1007121416480310145353', '2012-07-10 11:16:48.07+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (52, NULL, '1007121416482270690773', '2012-07-10 11:16:48.648+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (53, NULL, '1007121416489453575193', '2012-07-10 11:16:48.937+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (54, NULL, '1007121416500364063739', '2012-07-10 11:16:50.37+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (55, NULL, '1007121416507205169999', '2012-07-10 11:16:50.991+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (56, NULL, '1007121416516124287009', '2012-07-10 11:16:51.196+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (57, NULL, '1007121416524802169063', '2012-07-10 11:16:52.93+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (58, NULL, '1007121416547243552392', '2012-07-10 11:16:54.014+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (59, NULL, '1007121416543233704636', '2012-07-10 11:16:54.21+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (60, NULL, '1007121416558458817771', '2012-07-10 11:16:55.011+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (61, NULL, '1007121416554457911161', '2012-07-10 11:16:55.516+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (62, NULL, '1007121416554721638149', '2012-07-10 11:16:55.748+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (63, NULL, '1007121416583933666811', '2012-07-10 11:16:58.515+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (64, NULL, '1007121416580823800121', '2012-07-10 11:16:58.738+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (65, NULL, '1007121416594836214429', '2012-07-10 11:16:59.471+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (66, NULL, '1007121417004188674322', '2012-07-10 11:17:00.91+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (67, NULL, '1007121417018889054597', '2012-07-10 11:17:01.456+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (68, NULL, '1007121417018495322583', '2012-07-10 11:17:01.661+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (69, NULL, '1007121417048690724659', '2012-07-10 11:17:04.356+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (70, NULL, '1007121417043057301498', '2012-07-10 11:17:04.563+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (71, NULL, '1007121417077585005570', '2012-07-10 11:17:07.296+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (72, NULL, '1007121417072331533131', '2012-07-10 11:17:07.708+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (73, NULL, '1007121417094596780392', '2012-07-10 11:17:09.085+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (74, NULL, '1007121417092461592095', '2012-07-10 11:17:09.509+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (75, NULL, '1007121417111636645040', '2012-07-10 11:17:11.013+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (76, NULL, '1007121417113411008609', '2012-07-10 11:17:11.444+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (77, NULL, '1007121417130415387570', '2012-07-10 11:17:13.948+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (78, NULL, '1007121417150408703076', '2012-07-10 11:17:15.132+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (79, NULL, '1007121417170216984372', '2012-07-10 11:17:17.031+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (80, NULL, '1007121417178998212549', '2012-07-10 11:17:17.486+04');
INSERT INTO profiles_useranonymous (id, user_id, anonymous, date) VALUES (81, NULL, '1007121417204241930880', '2012-07-10 11:17:20.473+04');


--
-- TOC entry 2441 (class 0 OID 91478)
-- Dependencies: 196
-- Data for Name: profiles_userprofile; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO profiles_userprofile (user_id, balance, level) VALUES (1, 0.00, 1);
INSERT INTO profiles_userprofile (user_id, balance, level) VALUES (2, 0.00, 1);


--
-- TOC entry 2436 (class 0 OID 91399)
-- Dependencies: 187
-- Data for Name: project_article; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2468 (class 0 OID 91912)
-- Dependencies: 250
-- Data for Name: statistics_statisticsdayuser; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO statistics_statisticsdayuser (id, user_id, day, subject_id, lessons_visited, lessons_learned, tasks_attempts, tasks_correct, use_attempts, offsets_attempts, offsets_correct, added_formulas, learned_formulas) VALUES (1, 1, '2012-04-18', 1, 6, 5, 9, 2, 5, 1, 1, 7, 7);


--
-- TOC entry 2449 (class 0 OID 91584)
-- Dependencies: 212
-- Data for Name: subject_complexity; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_complexity (id, title, is_active, sort) VALUES (1, 'Легко', true, 0);
INSERT INTO subject_complexity (id, title, is_active, sort) VALUES (2, 'Средне', true, 0);
INSERT INTO subject_complexity (id, title, is_active, sort) VALUES (3, 'Сложно', true, 0);


--
-- TOC entry 2450 (class 0 OID 91595)
-- Dependencies: 214
-- Data for Name: subject_lesson; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_lesson (id, title, slug, text, subject_id, date, teacher_id, level, complexity_id, video, is_active, sort) VALUES (3, 'Урок 1 по физике', 'urok-1-po-fizike', '<p><a id="mformulas_link_1" href="/formula/click/1/">{{mformulas:1}}{{mformulas:1}}{{mformulas:1}}</a>{{mformulas:1}}</p>
<p>{{mformulas:1}}{{mformulas:2}}<a id="mformulas_link_1" href="/formula/click/1/">{{mformulas:1}}</a>{{mformulas:1}}</p>', 2, '2012-04-18 13:35:28+04', 1, 1, 1, '', true, 0);
INSERT INTO subject_lesson (id, title, slug, text, subject_id, date, teacher_id, level, complexity_id, video, is_active, sort) VALUES (2, 'Урок 2 по математике', 'urok-2-po-matematike', '<p><a id="mformulas_link_2" href="/formula/click/2/">{{mformulas:2}}</a></p>
<p>{{mformulas:5}}<a id="mformulas_link_5" href="/formula/click/5/">{{mformulas:5}}</a></p>', 1, '2012-04-18 13:35:28+04', 1, 1, 2, 'upload/lesson/video/video.mp4', true, 0);
INSERT INTO subject_lesson (id, title, slug, text, subject_id, date, teacher_id, level, complexity_id, video, is_active, sort) VALUES (1, 'Урок 1 по математике', 'urok-1-po-matematike', '<p>Текст</p>
<p><a href="/formula/click/1/">{{mformulas:1}}</a><a id="mformulas_link_2" href="/formula/click/2/">{{mformulas:2}}</a><a id="mformulas_link_3" href="/formula/click/3/">{{mformulas:3}}</a><a id="mformulas_link_4" href="/formula/click/4/">{{mformulas:4}}</a><a id="mformulas_link_5" href="/formula/click/5/">{{mformulas:5}}</a></p>', 1, '2012-04-18 13:35:28+04', 1, 1, 1, 'upload/lesson/video/messikakarona.flv', true, 0);


--
-- TOC entry 2451 (class 0 OID 91621)
-- Dependencies: 216
-- Data for Name: subject_lesson_task; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_lesson_task (id, lesson_id, task_id, text_solution, is_active, sort) VALUES (1, 1, 1, 'Текст разбора задачи', true, 0);
INSERT INTO subject_lesson_task (id, lesson_id, task_id, text_solution, is_active, sort) VALUES (2, 1, 2, 'Решение второй задачи', true, 0);


--
-- TOC entry 2453 (class 0 OID 91658)
-- Dependencies: 220
-- Data for Name: subject_leveltaskuse; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_leveltaskuse (id, title, is_active, sort) VALUES (1, 'А', true, 0);
INSERT INTO subject_leveltaskuse (id, title, is_active, sort) VALUES (2, 'Б', true, 0);
INSERT INTO subject_leveltaskuse (id, title, is_active, sort) VALUES (3, 'С', true, 0);


--
-- TOC entry 2455 (class 0 OID 91692)
-- Dependencies: 224
-- Data for Name: subject_offset; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_offset (id, title, slug, text, subject_id, "time", level, percent, is_active, sort) VALUES (1, 'Зачет 1', 'zachet-1', 'Текст зачета', 1, '00:45:00', 1, 90, true, 0);
INSERT INTO subject_offset (id, title, slug, text, subject_id, "time", level, percent, is_active, sort) VALUES (2, 'Зачет 2', 'zachet-2', 'Текст зачета', 1, '00:50:00', 1, 30, true, 0);


--
-- TOC entry 2456 (class 0 OID 91708)
-- Dependencies: 226
-- Data for Name: subject_offset_task; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_offset_task (id, offset_id, task_id, is_active, sort) VALUES (1, 1, 1, true, 0);
INSERT INTO subject_offset_task (id, offset_id, task_id, is_active, sort) VALUES (2, 2, 2, true, 0);


--
-- TOC entry 2446 (class 0 OID 91541)
-- Dependencies: 206
-- Data for Name: subject_subject; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_subject (id, title, slug, text, is_active, sort) VALUES (1, 'Математика', 'matematika', '', true, 0);
INSERT INTO subject_subject (id, title, slug, text, is_active, sort) VALUES (2, 'Физика', 'fizika', '', true, 0);


--
-- TOC entry 2445 (class 0 OID 91526)
-- Dependencies: 204
-- Data for Name: subject_subject_sites; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_subject_sites (id, subject_id, site_id) VALUES (1, 1, 1);
INSERT INTO subject_subject_sites (id, subject_id, site_id) VALUES (2, 2, 1);


--
-- TOC entry 2447 (class 0 OID 91557)
-- Dependencies: 208
-- Data for Name: subject_task; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_task (id, title, slug, text_task, is_active, sort) VALUES (1, 'Задача 1 по математике', 'zadacha-1-po-matematike', 'Текст задачи', true, 0);
INSERT INTO subject_task (id, title, slug, text_task, is_active, sort) VALUES (3, 'Задача по егэ', 'zadacha-po-ege', 'текст задачи', true, 0);
INSERT INTO subject_task (id, title, slug, text_task, is_active, sort) VALUES (2, 'Задача 2 по математике', 'zadacha-2-po-matematike', 'Текст второй задачи&nbsp;<a id="mformulas_link_3" href="/formula/click/3/">{{mformulas:3}}</a>', true, 0);


--
-- TOC entry 2452 (class 0 OID 91642)
-- Dependencies: 218
-- Data for Name: subject_use; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_use (id, title, slug, text, subject_id, "time", is_active, sort) VALUES (1, 'ЕГЭ', 'ege', 'Текст егэ', 2, '00:56:33', true, 0);


--
-- TOC entry 2454 (class 0 OID 91669)
-- Dependencies: 222
-- Data for Name: subject_use_task; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_use_task (id, "USE_id", task_id, level_task_use_id, quantity_point, is_active, sort) VALUES (1, 1, 3, 1, 50, true, 0);


--
-- TOC entry 2463 (class 0 OID 91839)
-- Dependencies: 240
-- Data for Name: subject_user_dictionary; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_user_dictionary (id, user_id, subject_id, formula_id, date_addition) VALUES (6, 1, 1, 1, '2012-04-18');
INSERT INTO subject_user_dictionary (id, user_id, subject_id, formula_id, date_addition) VALUES (7, 1, 1, 2, '2012-04-18');
INSERT INTO subject_user_dictionary (id, user_id, subject_id, formula_id, date_addition) VALUES (8, 1, 1, 3, '2012-04-18');
INSERT INTO subject_user_dictionary (id, user_id, subject_id, formula_id, date_addition) VALUES (9, 1, 1, 5, '2012-04-19');


--
-- TOC entry 2457 (class 0 OID 91726)
-- Dependencies: 228
-- Data for Name: subject_user_userlesson; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_user_userlesson (id, user_id, lesson_id, is_development, is_mastered, is_bookmark, percent, date_development, date_mastered, date_bookmark) VALUES (1, 1, 1, true, true, false, 100, '2012-04-18', '2012-04-18', '2012-04-18');
INSERT INTO subject_user_userlesson (id, user_id, lesson_id, is_development, is_mastered, is_bookmark, percent, date_development, date_mastered, date_bookmark) VALUES (3, 1, 2, true, true, true, 9540, '2012-04-18', '2012-04-18', '2012-04-18');
INSERT INTO subject_user_userlesson (id, user_id, lesson_id, is_development, is_mastered, is_bookmark, percent, date_development, date_mastered, date_bookmark) VALUES (2, 1, 3, true, true, false, 900, '2012-04-18', '2012-04-18', '2012-04-18');


--
-- TOC entry 2459 (class 0 OID 91767)
-- Dependencies: 232
-- Data for Name: subject_user_useroffset; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_user_useroffset (id, user_id, offset_id, is_executed, date_delivery, number_attempts, true_number_attempts) VALUES (1, 1, 2, true, '2012-04-18', 1, 1);


--
-- TOC entry 2458 (class 0 OID 91744)
-- Dependencies: 230
-- Data for Name: subject_user_usertask; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_user_usertask (id, user_id, task_id, lesson_id, is_executed, date_development, number_attempts, true_number_attempts) VALUES (1, 1, 1, 1, true, '2012-04-18', 1, 1);
INSERT INTO subject_user_usertask (id, user_id, task_id, lesson_id, is_executed, date_development, number_attempts, true_number_attempts) VALUES (2, 1, 2, 1, true, '2012-04-18', 1, 1);


--
-- TOC entry 2460 (class 0 OID 91785)
-- Dependencies: 234
-- Data for Name: subject_user_usertaskoffset; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2462 (class 0 OID 91821)
-- Dependencies: 238
-- Data for Name: subject_user_usertaskuse; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_user_usertaskuse (id, task_id, user_use_id, is_executed, number_attempts, true_number_attempts) VALUES (3, 3, 1, false, 0, 0);


--
-- TOC entry 2461 (class 0 OID 91803)
-- Dependencies: 236
-- Data for Name: subject_user_useruse; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_user_useruse (id, user_id, use_id, is_executed, date_delivery, number_attempts, true_number_attempts) VALUES (1, 1, 1, false, '2012-04-18', 0, 0);


--
-- TOC entry 2448 (class 0 OID 91568)
-- Dependencies: 210
-- Data for Name: subject_versionanswer; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO subject_versionanswer (id, answer, task_id, type_answer, is_correctly, is_active, sort) VALUES (1, 'Ответ 1', 1, 'checkbox', false, true, 0);
INSERT INTO subject_versionanswer (id, answer, task_id, type_answer, is_correctly, is_active, sort) VALUES (2, 'Ответ 2', 1, 'checkbox', true, true, 0);
INSERT INTO subject_versionanswer (id, answer, task_id, type_answer, is_correctly, is_active, sort) VALUES (4, 'Ответ', 3, 'text', false, true, 0);
INSERT INTO subject_versionanswer (id, answer, task_id, type_answer, is_correctly, is_active, sort) VALUES (3, 'Ответ 11&nbsp;<a id="mformulas_link_4" href="/formula/click/4/">{{mformulas:4}}</a>', 2, 'radio', true, true, 0);


--
-- TOC entry 2469 (class 0 OID 91928)
-- Dependencies: 251
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: fmsh
--



--
-- TOC entry 2464 (class 0 OID 91862)
-- Dependencies: 242
-- Data for Name: training_trainingformulas; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO training_trainingformulas (id, dictionary_id, last_attempt, number_attempts, right_answers, is_right_last_answer, is_learned) VALUES (5, 6, '2012-07-10 11:16:52.96+04', 2, 1, true, false);
INSERT INTO training_trainingformulas (id, dictionary_id, last_attempt, number_attempts, right_answers, is_right_last_answer, is_learned) VALUES (6, 7, '2012-07-10 11:16:59.503+04', 2, 1, true, false);


--
-- TOC entry 2465 (class 0 OID 91875)
-- Dependencies: 244
-- Data for Name: training_trainingonlinedayuser; Type: TABLE DATA; Schema: public; Owner: fmsh
--

INSERT INTO training_trainingonlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (1, 1, '2012-04-18', '2012-04-18 14:18:42.889+04', 0.59);
INSERT INTO training_trainingonlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (2, 4, '2012-07-09', '2012-07-09 09:52:55.934+04', 0.05);
INSERT INTO training_trainingonlinedayuser (id, user_id, day, last_activity, duration_of_visits) VALUES (3, 1, '2012-07-10', '2012-07-10 11:17:04.58+04', 0.19);


--
-- TOC entry 2196 (class 2606 OID 91227)
-- Dependencies: 164 164
-- Name: admin_tools_dashboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2193 (class 2606 OID 91216)
-- Dependencies: 162 162
-- Name: admin_tools_menu_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT admin_tools_menu_bookmark_pkey PRIMARY KEY (id);


--
-- TOC entry 2210 (class 2606 OID 91262)
-- Dependencies: 170 170
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2205 (class 2606 OID 91247)
-- Dependencies: 168 168 168
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 2208 (class 2606 OID 91245)
-- Dependencies: 168 168
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2212 (class 2606 OID 91260)
-- Dependencies: 170 170
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2230 (class 2606 OID 91338)
-- Dependencies: 178 178
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 91237)
-- Dependencies: 166 166 166
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 2202 (class 2606 OID 91235)
-- Dependencies: 166 166
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 91290)
-- Dependencies: 174 174
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2224 (class 2606 OID 91292)
-- Dependencies: 174 174 174
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 2226 (class 2606 OID 91305)
-- Dependencies: 176 176
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2215 (class 2606 OID 91275)
-- Dependencies: 172 172
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 91277)
-- Dependencies: 172 172 172
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 2228 (class 2606 OID 91307)
-- Dependencies: 176 176
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2267 (class 2606 OID 91523)
-- Dependencies: 202 202
-- Name: configuration_configmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY configuration_configmodel
    ADD CONSTRAINT configuration_configmodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 91386)
-- Dependencies: 185 185
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2233 (class 2606 OID 91353)
-- Dependencies: 180 180 180
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- TOC entry 2235 (class 2606 OID 91351)
-- Dependencies: 180 180
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2238 (class 2606 OID 91366)
-- Dependencies: 181 181
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2240 (class 2606 OID 91374)
-- Dependencies: 183 183
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 91904)
-- Dependencies: 248 248
-- Name: invitefriend_friend_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY invitefriend_friend
    ADD CONSTRAINT invitefriend_friend_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 91418)
-- Dependencies: 189 189
-- Name: mformulas_formula_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY mformulas_formula
    ADD CONSTRAINT mformulas_formula_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 91472)
-- Dependencies: 195 195
-- Name: mformulas_formulataskanswer_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY mformulas_formulataskanswer
    ADD CONSTRAINT mformulas_formulataskanswer_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 91456)
-- Dependencies: 193 193
-- Name: mformulas_formulataskquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY mformulas_formulataskquestion
    ADD CONSTRAINT mformulas_formulataskquestion_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 91445)
-- Dependencies: 191 191
-- Name: mformulas_primitiveofformulatask_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY mformulas_primitiveofformulatask
    ADD CONSTRAINT mformulas_primitiveofformulatask_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 92027)
-- Dependencies: 253 253
-- Name: mformulas_searchformula_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY mformulas_searchformula
    ADD CONSTRAINT mformulas_searchformula_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 91896)
-- Dependencies: 246 246
-- Name: news_news_article_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY news_news_article
    ADD CONSTRAINT news_news_article_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 91510)
-- Dependencies: 200 200
-- Name: onlineuser_onlinedayuser_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY onlineuser_onlinedayuser
    ADD CONSTRAINT onlineuser_onlinedayuser_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 91495)
-- Dependencies: 198 198
-- Name: profiles_useranonymous_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY profiles_useranonymous
    ADD CONSTRAINT profiles_useranonymous_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 91497)
-- Dependencies: 198 198
-- Name: profiles_useranonymous_user_id_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY profiles_useranonymous
    ADD CONSTRAINT profiles_useranonymous_user_id_key UNIQUE (user_id);


--
-- TOC entry 2258 (class 2606 OID 91482)
-- Dependencies: 196 196
-- Name: profiles_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY profiles_userprofile
    ADD CONSTRAINT profiles_userprofile_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2246 (class 2606 OID 91407)
-- Dependencies: 187 187
-- Name: project_article_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY project_article
    ADD CONSTRAINT project_article_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 91917)
-- Dependencies: 250 250
-- Name: statistics_statisticsdayuser_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY statistics_statisticsdayuser
    ADD CONSTRAINT statistics_statisticsdayuser_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 91592)
-- Dependencies: 212 212
-- Name: subject_complexity_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_complexity
    ADD CONSTRAINT subject_complexity_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 91603)
-- Dependencies: 214 214
-- Name: subject_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_lesson
    ADD CONSTRAINT subject_lesson_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 91629)
-- Dependencies: 216 216
-- Name: subject_lesson_task_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_lesson_task
    ADD CONSTRAINT subject_lesson_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 91666)
-- Dependencies: 220 220
-- Name: subject_leveltaskuse_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_leveltaskuse
    ADD CONSTRAINT subject_leveltaskuse_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 91700)
-- Dependencies: 224 224
-- Name: subject_offset_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_offset
    ADD CONSTRAINT subject_offset_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 91713)
-- Dependencies: 226 226
-- Name: subject_offset_task_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_offset_task
    ADD CONSTRAINT subject_offset_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2275 (class 2606 OID 91549)
-- Dependencies: 206 206
-- Name: subject_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_subject
    ADD CONSTRAINT subject_subject_pkey PRIMARY KEY (id);


--
-- TOC entry 2269 (class 2606 OID 91531)
-- Dependencies: 204 204
-- Name: subject_subject_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_subject_sites
    ADD CONSTRAINT subject_subject_sites_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 91533)
-- Dependencies: 204 204 204
-- Name: subject_subject_sites_subject_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_subject_sites
    ADD CONSTRAINT subject_subject_sites_subject_id_site_id_key UNIQUE (subject_id, site_id);


--
-- TOC entry 2279 (class 2606 OID 91565)
-- Dependencies: 208 208
-- Name: subject_task_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_task
    ADD CONSTRAINT subject_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 91650)
-- Dependencies: 218 218
-- Name: subject_use_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_use
    ADD CONSTRAINT subject_use_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 91674)
-- Dependencies: 222 222
-- Name: subject_use_task_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_use_task
    ADD CONSTRAINT subject_use_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 91844)
-- Dependencies: 240 240
-- Name: subject_user_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_user_dictionary
    ADD CONSTRAINT subject_user_dictionary_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 91731)
-- Dependencies: 228 228
-- Name: subject_user_userlesson_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_user_userlesson
    ADD CONSTRAINT subject_user_userlesson_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 91772)
-- Dependencies: 232 232
-- Name: subject_user_useroffset_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_user_useroffset
    ADD CONSTRAINT subject_user_useroffset_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 91749)
-- Dependencies: 230 230
-- Name: subject_user_usertask_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_user_usertask
    ADD CONSTRAINT subject_user_usertask_pkey PRIMARY KEY (id);


--
-- TOC entry 2333 (class 2606 OID 91790)
-- Dependencies: 234 234
-- Name: subject_user_usertaskoffset_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_user_usertaskoffset
    ADD CONSTRAINT subject_user_usertaskoffset_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 91826)
-- Dependencies: 238 238
-- Name: subject_user_usertaskuse_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_user_usertaskuse
    ADD CONSTRAINT subject_user_usertaskuse_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 91808)
-- Dependencies: 236 236
-- Name: subject_user_useruse_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_user_useruse
    ADD CONSTRAINT subject_user_useruse_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 91576)
-- Dependencies: 210 210
-- Name: subject_versionanswer_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY subject_versionanswer
    ADD CONSTRAINT subject_versionanswer_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 91935)
-- Dependencies: 251 251
-- Name: thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- TOC entry 2351 (class 2606 OID 91867)
-- Dependencies: 242 242
-- Name: training_trainingformulas_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY training_trainingformulas
    ADD CONSTRAINT training_trainingformulas_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 91880)
-- Dependencies: 244 244
-- Name: training_trainingonlinedayuser_pkey; Type: CONSTRAINT; Schema: public; Owner: fmsh; Tablespace: 
--

ALTER TABLE ONLY training_trainingonlinedayuser
    ADD CONSTRAINT training_trainingonlinedayuser_pkey PRIMARY KEY (id);


--
-- TOC entry 2197 (class 1259 OID 91937)
-- Dependencies: 164
-- Name: admin_tools_dashboard_preferences_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX admin_tools_dashboard_preferences_user_id ON admin_tools_dashboard_preferences USING btree (user_id);


--
-- TOC entry 2194 (class 1259 OID 91936)
-- Dependencies: 162
-- Name: admin_tools_menu_bookmark_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX admin_tools_menu_bookmark_user_id ON admin_tools_menu_bookmark USING btree (user_id);


--
-- TOC entry 2203 (class 1259 OID 91939)
-- Dependencies: 168
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2206 (class 1259 OID 91940)
-- Dependencies: 168
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2231 (class 1259 OID 91945)
-- Dependencies: 178
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- TOC entry 2198 (class 1259 OID 91938)
-- Dependencies: 166
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2219 (class 1259 OID 91944)
-- Dependencies: 174
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2222 (class 1259 OID 91943)
-- Dependencies: 174
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2213 (class 1259 OID 91942)
-- Dependencies: 172
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2216 (class 1259 OID 91941)
-- Dependencies: 172
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2241 (class 1259 OID 91948)
-- Dependencies: 185
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2244 (class 1259 OID 91947)
-- Dependencies: 185
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- TOC entry 2236 (class 1259 OID 91946)
-- Dependencies: 181
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- TOC entry 2359 (class 1259 OID 91996)
-- Dependencies: 248
-- Name: invitefriend_friend_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX invitefriend_friend_user_id ON invitefriend_friend USING btree (user_id);


--
-- TOC entry 2256 (class 1259 OID 91951)
-- Dependencies: 195
-- Name: mformulas_formulataskanswer_question_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX mformulas_formulataskanswer_question_id ON mformulas_formulataskanswer USING btree (question_id);


--
-- TOC entry 2251 (class 1259 OID 91950)
-- Dependencies: 193
-- Name: mformulas_formulataskquestion_formula_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX mformulas_formulataskquestion_formula_id ON mformulas_formulataskquestion USING btree (formula_id);


--
-- TOC entry 2366 (class 1259 OID 92033)
-- Dependencies: 253
-- Name: mformulas_searchformula_formula_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX mformulas_searchformula_formula_id ON mformulas_searchformula USING btree (formula_id);


--
-- TOC entry 2265 (class 1259 OID 91952)
-- Dependencies: 200
-- Name: onlineuser_onlinedayuser_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX onlineuser_onlinedayuser_user_id ON onlineuser_onlinedayuser USING btree (user_id);


--
-- TOC entry 2362 (class 1259 OID 91998)
-- Dependencies: 250
-- Name: statistics_statisticsdayuser_subject_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX statistics_statisticsdayuser_subject_id ON statistics_statisticsdayuser USING btree (subject_id);


--
-- TOC entry 2363 (class 1259 OID 91997)
-- Dependencies: 250
-- Name: statistics_statisticsdayuser_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX statistics_statisticsdayuser_user_id ON statistics_statisticsdayuser USING btree (user_id);


--
-- TOC entry 2287 (class 1259 OID 91964)
-- Dependencies: 214
-- Name: subject_lesson_complexity_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_lesson_complexity_id ON subject_lesson USING btree (complexity_id);


--
-- TOC entry 2290 (class 1259 OID 91960)
-- Dependencies: 214
-- Name: subject_lesson_slug; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_lesson_slug ON subject_lesson USING btree (slug);


--
-- TOC entry 2291 (class 1259 OID 91961)
-- Dependencies: 214
-- Name: subject_lesson_slug_like; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_lesson_slug_like ON subject_lesson USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2292 (class 1259 OID 91962)
-- Dependencies: 214
-- Name: subject_lesson_subject_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_lesson_subject_id ON subject_lesson USING btree (subject_id);


--
-- TOC entry 2294 (class 1259 OID 91965)
-- Dependencies: 216
-- Name: subject_lesson_task_lesson_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_lesson_task_lesson_id ON subject_lesson_task USING btree (lesson_id);


--
-- TOC entry 2297 (class 1259 OID 91966)
-- Dependencies: 216
-- Name: subject_lesson_task_task_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_lesson_task_task_id ON subject_lesson_task USING btree (task_id);


--
-- TOC entry 2293 (class 1259 OID 91963)
-- Dependencies: 214
-- Name: subject_lesson_teacher_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_lesson_teacher_id ON subject_lesson USING btree (teacher_id);


--
-- TOC entry 2312 (class 1259 OID 91973)
-- Dependencies: 224
-- Name: subject_offset_slug; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_offset_slug ON subject_offset USING btree (slug);


--
-- TOC entry 2313 (class 1259 OID 91974)
-- Dependencies: 224
-- Name: subject_offset_slug_like; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_offset_slug_like ON subject_offset USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2314 (class 1259 OID 91975)
-- Dependencies: 224
-- Name: subject_offset_subject_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_offset_subject_id ON subject_offset USING btree (subject_id);


--
-- TOC entry 2315 (class 1259 OID 91976)
-- Dependencies: 226
-- Name: subject_offset_task_offset_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_offset_task_offset_id ON subject_offset_task USING btree (offset_id);


--
-- TOC entry 2318 (class 1259 OID 91977)
-- Dependencies: 226
-- Name: subject_offset_task_task_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_offset_task_task_id ON subject_offset_task USING btree (task_id);


--
-- TOC entry 2270 (class 1259 OID 91954)
-- Dependencies: 204
-- Name: subject_subject_sites_site_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_subject_sites_site_id ON subject_subject_sites USING btree (site_id);


--
-- TOC entry 2271 (class 1259 OID 91953)
-- Dependencies: 204
-- Name: subject_subject_sites_subject_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_subject_sites_subject_id ON subject_subject_sites USING btree (subject_id);


--
-- TOC entry 2276 (class 1259 OID 91955)
-- Dependencies: 206
-- Name: subject_subject_slug; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_subject_slug ON subject_subject USING btree (slug);


--
-- TOC entry 2277 (class 1259 OID 91956)
-- Dependencies: 206
-- Name: subject_subject_slug_like; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_subject_slug_like ON subject_subject USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2280 (class 1259 OID 91957)
-- Dependencies: 208
-- Name: subject_task_slug; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_task_slug ON subject_task USING btree (slug);


--
-- TOC entry 2281 (class 1259 OID 91958)
-- Dependencies: 208
-- Name: subject_task_slug_like; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_task_slug_like ON subject_task USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2300 (class 1259 OID 91967)
-- Dependencies: 218
-- Name: subject_use_slug; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_use_slug ON subject_use USING btree (slug);


--
-- TOC entry 2301 (class 1259 OID 91968)
-- Dependencies: 218
-- Name: subject_use_slug_like; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_use_slug_like ON subject_use USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2302 (class 1259 OID 91969)
-- Dependencies: 218
-- Name: subject_use_subject_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_use_subject_id ON subject_use USING btree (subject_id);


--
-- TOC entry 2305 (class 1259 OID 91970)
-- Dependencies: 222
-- Name: subject_use_task_USE_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX "subject_use_task_USE_id" ON subject_use_task USING btree ("USE_id");


--
-- TOC entry 2306 (class 1259 OID 91972)
-- Dependencies: 222
-- Name: subject_use_task_level_task_use_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_use_task_level_task_use_id ON subject_use_task USING btree (level_task_use_id);


--
-- TOC entry 2309 (class 1259 OID 91971)
-- Dependencies: 222
-- Name: subject_use_task_task_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_use_task_task_id ON subject_use_task USING btree (task_id);


--
-- TOC entry 2344 (class 1259 OID 91993)
-- Dependencies: 240
-- Name: subject_user_dictionary_formula_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_dictionary_formula_id ON subject_user_dictionary USING btree (formula_id);


--
-- TOC entry 2347 (class 1259 OID 91992)
-- Dependencies: 240
-- Name: subject_user_dictionary_subject_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_dictionary_subject_id ON subject_user_dictionary USING btree (subject_id);


--
-- TOC entry 2348 (class 1259 OID 91991)
-- Dependencies: 240
-- Name: subject_user_dictionary_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_dictionary_user_id ON subject_user_dictionary USING btree (user_id);


--
-- TOC entry 2319 (class 1259 OID 91979)
-- Dependencies: 228
-- Name: subject_user_userlesson_lesson_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_userlesson_lesson_id ON subject_user_userlesson USING btree (lesson_id);


--
-- TOC entry 2322 (class 1259 OID 91978)
-- Dependencies: 228
-- Name: subject_user_userlesson_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_userlesson_user_id ON subject_user_userlesson USING btree (user_id);


--
-- TOC entry 2328 (class 1259 OID 91984)
-- Dependencies: 232
-- Name: subject_user_useroffset_offset_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_useroffset_offset_id ON subject_user_useroffset USING btree (offset_id);


--
-- TOC entry 2331 (class 1259 OID 91983)
-- Dependencies: 232
-- Name: subject_user_useroffset_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_useroffset_user_id ON subject_user_useroffset USING btree (user_id);


--
-- TOC entry 2323 (class 1259 OID 91982)
-- Dependencies: 230
-- Name: subject_user_usertask_lesson_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_usertask_lesson_id ON subject_user_usertask USING btree (lesson_id);


--
-- TOC entry 2326 (class 1259 OID 91981)
-- Dependencies: 230
-- Name: subject_user_usertask_task_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_usertask_task_id ON subject_user_usertask USING btree (task_id);


--
-- TOC entry 2327 (class 1259 OID 91980)
-- Dependencies: 230
-- Name: subject_user_usertask_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_usertask_user_id ON subject_user_usertask USING btree (user_id);


--
-- TOC entry 2334 (class 1259 OID 91985)
-- Dependencies: 234
-- Name: subject_user_usertaskoffset_task_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_usertaskoffset_task_id ON subject_user_usertaskoffset USING btree (task_id);


--
-- TOC entry 2335 (class 1259 OID 91986)
-- Dependencies: 234
-- Name: subject_user_usertaskoffset_user_task_offset_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_usertaskoffset_user_task_offset_id ON subject_user_usertaskoffset USING btree (user_task_offset_id);


--
-- TOC entry 2342 (class 1259 OID 91989)
-- Dependencies: 238
-- Name: subject_user_usertaskuse_task_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_usertaskuse_task_id ON subject_user_usertaskuse USING btree (task_id);


--
-- TOC entry 2343 (class 1259 OID 91990)
-- Dependencies: 238
-- Name: subject_user_usertaskuse_user_use_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_usertaskuse_user_use_id ON subject_user_usertaskuse USING btree (user_use_id);


--
-- TOC entry 2338 (class 1259 OID 91988)
-- Dependencies: 236
-- Name: subject_user_useruse_use_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_useruse_use_id ON subject_user_useruse USING btree (use_id);


--
-- TOC entry 2339 (class 1259 OID 91987)
-- Dependencies: 236
-- Name: subject_user_useruse_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_user_useruse_user_id ON subject_user_useruse USING btree (user_id);


--
-- TOC entry 2284 (class 1259 OID 91959)
-- Dependencies: 210
-- Name: subject_versionanswer_task_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX subject_versionanswer_task_id ON subject_versionanswer USING btree (task_id);


--
-- TOC entry 2349 (class 1259 OID 91994)
-- Dependencies: 242
-- Name: training_trainingformulas_dictionary_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX training_trainingformulas_dictionary_id ON training_trainingformulas USING btree (dictionary_id);


--
-- TOC entry 2354 (class 1259 OID 91995)
-- Dependencies: 244
-- Name: training_trainingonlinedayuser_user_id; Type: INDEX; Schema: public; Owner: fmsh; Tablespace: 
--

CREATE INDEX training_trainingonlinedayuser_user_id ON training_trainingonlinedayuser USING btree (user_id);


--
-- TOC entry 2372 (class 2606 OID 91248)
-- Dependencies: 166 168 2201
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2378 (class 2606 OID 91339)
-- Dependencies: 178 2225 176
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2376 (class 2606 OID 91293)
-- Dependencies: 2211 170 174
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2374 (class 2606 OID 91278)
-- Dependencies: 172 166 2201
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2371 (class 2606 OID 91354)
-- Dependencies: 166 2234 180
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2380 (class 2606 OID 91392)
-- Dependencies: 180 185 2234
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2379 (class 2606 OID 91387)
-- Dependencies: 176 185 2225
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2373 (class 2606 OID 91263)
-- Dependencies: 168 170 2211
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2419 (class 2606 OID 91905)
-- Dependencies: 248 2225 176
-- Name: invitefriend_friend_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY invitefriend_friend
    ADD CONSTRAINT invitefriend_friend_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2382 (class 2606 OID 91473)
-- Dependencies: 193 2252 195
-- Name: mformulas_formulataskanswer_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY mformulas_formulataskanswer
    ADD CONSTRAINT mformulas_formulataskanswer_question_id_fkey FOREIGN KEY (question_id) REFERENCES mformulas_formulataskquestion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2381 (class 2606 OID 91457)
-- Dependencies: 193 2247 189
-- Name: mformulas_formulataskquestion_formula_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY mformulas_formulataskquestion
    ADD CONSTRAINT mformulas_formulataskquestion_formula_id_fkey FOREIGN KEY (formula_id) REFERENCES mformulas_formula(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2422 (class 2606 OID 92028)
-- Dependencies: 2247 189 253
-- Name: mformulas_searchformula_formula_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY mformulas_searchformula
    ADD CONSTRAINT mformulas_searchformula_formula_id_fkey FOREIGN KEY (formula_id) REFERENCES mformulas_formula(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2385 (class 2606 OID 91511)
-- Dependencies: 198 200 2259
-- Name: onlineuser_onlinedayuser_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY onlineuser_onlinedayuser
    ADD CONSTRAINT onlineuser_onlinedayuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2384 (class 2606 OID 91498)
-- Dependencies: 2225 176 198
-- Name: profiles_useranonymous_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY profiles_useranonymous
    ADD CONSTRAINT profiles_useranonymous_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2383 (class 2606 OID 91483)
-- Dependencies: 196 176 2225
-- Name: profiles_userprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY profiles_userprofile
    ADD CONSTRAINT profiles_userprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2421 (class 2606 OID 91923)
-- Dependencies: 250 2274 206
-- Name: statistics_statisticsdayuser_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY statistics_statisticsdayuser
    ADD CONSTRAINT statistics_statisticsdayuser_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES subject_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2420 (class 2606 OID 91918)
-- Dependencies: 250 2259 198
-- Name: statistics_statisticsdayuser_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY statistics_statisticsdayuser
    ADD CONSTRAINT statistics_statisticsdayuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2387 (class 2606 OID 91550)
-- Dependencies: 2274 206 204
-- Name: subject_id_refs_id_546e2a84; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_subject_sites
    ADD CONSTRAINT subject_id_refs_id_546e2a84 FOREIGN KEY (subject_id) REFERENCES subject_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2391 (class 2606 OID 91614)
-- Dependencies: 212 214 2285
-- Name: subject_lesson_complexity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_lesson
    ADD CONSTRAINT subject_lesson_complexity_id_fkey FOREIGN KEY (complexity_id) REFERENCES subject_complexity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2389 (class 2606 OID 91604)
-- Dependencies: 206 214 2274
-- Name: subject_lesson_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_lesson
    ADD CONSTRAINT subject_lesson_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES subject_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2392 (class 2606 OID 91630)
-- Dependencies: 216 214 2288
-- Name: subject_lesson_task_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_lesson_task
    ADD CONSTRAINT subject_lesson_task_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES subject_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2393 (class 2606 OID 91635)
-- Dependencies: 216 208 2278
-- Name: subject_lesson_task_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_lesson_task
    ADD CONSTRAINT subject_lesson_task_task_id_fkey FOREIGN KEY (task_id) REFERENCES subject_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2390 (class 2606 OID 91609)
-- Dependencies: 176 2225 214
-- Name: subject_lesson_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_lesson
    ADD CONSTRAINT subject_lesson_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2398 (class 2606 OID 91701)
-- Dependencies: 206 224 2274
-- Name: subject_offset_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_offset
    ADD CONSTRAINT subject_offset_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES subject_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2399 (class 2606 OID 91714)
-- Dependencies: 2310 224 226
-- Name: subject_offset_task_offset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_offset_task
    ADD CONSTRAINT subject_offset_task_offset_id_fkey FOREIGN KEY (offset_id) REFERENCES subject_offset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2400 (class 2606 OID 91719)
-- Dependencies: 226 208 2278
-- Name: subject_offset_task_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_offset_task
    ADD CONSTRAINT subject_offset_task_task_id_fkey FOREIGN KEY (task_id) REFERENCES subject_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2386 (class 2606 OID 91534)
-- Dependencies: 204 183 2239
-- Name: subject_subject_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_subject_sites
    ADD CONSTRAINT subject_subject_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2394 (class 2606 OID 91651)
-- Dependencies: 218 206 2274
-- Name: subject_use_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_use
    ADD CONSTRAINT subject_use_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES subject_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2395 (class 2606 OID 91675)
-- Dependencies: 222 2298 218
-- Name: subject_use_task_USE_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_use_task
    ADD CONSTRAINT "subject_use_task_USE_id_fkey" FOREIGN KEY ("USE_id") REFERENCES subject_use(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2397 (class 2606 OID 91685)
-- Dependencies: 220 222 2303
-- Name: subject_use_task_level_task_use_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_use_task
    ADD CONSTRAINT subject_use_task_level_task_use_id_fkey FOREIGN KEY (level_task_use_id) REFERENCES subject_leveltaskuse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2396 (class 2606 OID 91680)
-- Dependencies: 222 2278 208
-- Name: subject_use_task_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_use_task
    ADD CONSTRAINT subject_use_task_task_id_fkey FOREIGN KEY (task_id) REFERENCES subject_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2416 (class 2606 OID 91855)
-- Dependencies: 189 2247 240
-- Name: subject_user_dictionary_formula_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_dictionary
    ADD CONSTRAINT subject_user_dictionary_formula_id_fkey FOREIGN KEY (formula_id) REFERENCES mformulas_formula(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2415 (class 2606 OID 91850)
-- Dependencies: 240 206 2274
-- Name: subject_user_dictionary_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_dictionary
    ADD CONSTRAINT subject_user_dictionary_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES subject_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2414 (class 2606 OID 91845)
-- Dependencies: 2259 198 240
-- Name: subject_user_dictionary_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_dictionary
    ADD CONSTRAINT subject_user_dictionary_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2402 (class 2606 OID 91737)
-- Dependencies: 228 2288 214
-- Name: subject_user_userlesson_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_userlesson
    ADD CONSTRAINT subject_user_userlesson_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES subject_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2401 (class 2606 OID 91732)
-- Dependencies: 228 198 2259
-- Name: subject_user_userlesson_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_userlesson
    ADD CONSTRAINT subject_user_userlesson_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2407 (class 2606 OID 91778)
-- Dependencies: 224 2310 232
-- Name: subject_user_useroffset_offset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_useroffset
    ADD CONSTRAINT subject_user_useroffset_offset_id_fkey FOREIGN KEY (offset_id) REFERENCES subject_offset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2406 (class 2606 OID 91773)
-- Dependencies: 198 2259 232
-- Name: subject_user_useroffset_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_useroffset
    ADD CONSTRAINT subject_user_useroffset_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2405 (class 2606 OID 91760)
-- Dependencies: 2288 230 214
-- Name: subject_user_usertask_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_usertask
    ADD CONSTRAINT subject_user_usertask_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES subject_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2404 (class 2606 OID 91755)
-- Dependencies: 208 2278 230
-- Name: subject_user_usertask_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_usertask
    ADD CONSTRAINT subject_user_usertask_task_id_fkey FOREIGN KEY (task_id) REFERENCES subject_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2403 (class 2606 OID 91750)
-- Dependencies: 198 2259 230
-- Name: subject_user_usertask_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_usertask
    ADD CONSTRAINT subject_user_usertask_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2408 (class 2606 OID 91791)
-- Dependencies: 2278 234 208
-- Name: subject_user_usertaskoffset_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_usertaskoffset
    ADD CONSTRAINT subject_user_usertaskoffset_task_id_fkey FOREIGN KEY (task_id) REFERENCES subject_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2409 (class 2606 OID 91796)
-- Dependencies: 232 234 2329
-- Name: subject_user_usertaskoffset_user_task_offset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_usertaskoffset
    ADD CONSTRAINT subject_user_usertaskoffset_user_task_offset_id_fkey FOREIGN KEY (user_task_offset_id) REFERENCES subject_user_useroffset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2412 (class 2606 OID 91827)
-- Dependencies: 208 2278 238
-- Name: subject_user_usertaskuse_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_usertaskuse
    ADD CONSTRAINT subject_user_usertaskuse_task_id_fkey FOREIGN KEY (task_id) REFERENCES subject_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2413 (class 2606 OID 91832)
-- Dependencies: 238 2336 236
-- Name: subject_user_usertaskuse_user_use_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_usertaskuse
    ADD CONSTRAINT subject_user_usertaskuse_user_use_id_fkey FOREIGN KEY (user_use_id) REFERENCES subject_user_useruse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2411 (class 2606 OID 91814)
-- Dependencies: 236 218 2298
-- Name: subject_user_useruse_use_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_useruse
    ADD CONSTRAINT subject_user_useruse_use_id_fkey FOREIGN KEY (use_id) REFERENCES subject_use(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2410 (class 2606 OID 91809)
-- Dependencies: 236 2259 198
-- Name: subject_user_useruse_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_user_useruse
    ADD CONSTRAINT subject_user_useruse_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2388 (class 2606 OID 91577)
-- Dependencies: 2278 208 210
-- Name: subject_versionanswer_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY subject_versionanswer
    ADD CONSTRAINT subject_versionanswer_task_id_fkey FOREIGN KEY (task_id) REFERENCES subject_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2417 (class 2606 OID 91868)
-- Dependencies: 242 2345 240
-- Name: training_trainingformulas_dictionary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY training_trainingformulas
    ADD CONSTRAINT training_trainingformulas_dictionary_id_fkey FOREIGN KEY (dictionary_id) REFERENCES subject_user_dictionary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2418 (class 2606 OID 91881)
-- Dependencies: 244 2259 198
-- Name: training_trainingonlinedayuser_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY training_trainingonlinedayuser
    ADD CONSTRAINT training_trainingonlinedayuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles_useranonymous(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2369 (class 2606 OID 91308)
-- Dependencies: 2225 176 162
-- Name: user_id_refs_id_63b2844f; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT user_id_refs_id_63b2844f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2370 (class 2606 OID 91313)
-- Dependencies: 176 164 2225
-- Name: user_id_refs_id_7b78c8a; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT user_id_refs_id_7b78c8a FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2377 (class 2606 OID 91323)
-- Dependencies: 2225 174 176
-- Name: user_id_refs_id_7ceef80f; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_7ceef80f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2375 (class 2606 OID 91318)
-- Dependencies: 172 176 2225
-- Name: user_id_refs_id_dfbab7d; Type: FK CONSTRAINT; Schema: public; Owner: fmsh
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_dfbab7d FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-07-20 13:34:29

--
-- PostgreSQL database dump complete
--

