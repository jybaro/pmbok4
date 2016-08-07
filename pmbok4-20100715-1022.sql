--
-- PostgreSQL database dump
--

-- Started on 2010-07-15 10:23:05 ECT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1518 (class 1259 OID 16718)
-- Dependencies: 1812 1813 6
-- Name: documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    name character varying(100),
    description text,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now(),
    related integer,
    nombre character varying(1000),
    descripcion text,
    notes text
);


--
-- TOC entry 1519 (class 1259 OID 16726)
-- Dependencies: 1518 6
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1899 (class 0 OID 0)
-- Dependencies: 1519
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- TOC entry 1900 (class 0 OID 0)
-- Dependencies: 1519
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('documents_id_seq', 89, true);


--
-- TOC entry 1520 (class 1259 OID 16728)
-- Dependencies: 1815 1816 1817 6
-- Name: inputs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE inputs (
    id integer NOT NULL,
    document_id integer,
    process_id integer,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now(),
    is_key smallint DEFAULT 0 NOT NULL
);


--
-- TOC entry 1521 (class 1259 OID 16734)
-- Dependencies: 1520 6
-- Name: inputs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1901 (class 0 OID 0)
-- Dependencies: 1521
-- Name: inputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inputs_id_seq OWNED BY inputs.id;


--
-- TOC entry 1902 (class 0 OID 0)
-- Dependencies: 1521
-- Name: inputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('inputs_id_seq', 206, true);


--
-- TOC entry 1522 (class 1259 OID 16736)
-- Dependencies: 1819 1820 6
-- Name: knowledge_areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE knowledge_areas (
    id integer NOT NULL,
    name character varying(100),
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now(),
    orden integer
);


--
-- TOC entry 1523 (class 1259 OID 16741)
-- Dependencies: 1522 6
-- Name: knowledge_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE knowledge_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1903 (class 0 OID 0)
-- Dependencies: 1523
-- Name: knowledge_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE knowledge_areas_id_seq OWNED BY knowledge_areas.id;


--
-- TOC entry 1904 (class 0 OID 0)
-- Dependencies: 1523
-- Name: knowledge_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('knowledge_areas_id_seq', 9, true);


--
-- TOC entry 1524 (class 1259 OID 16743)
-- Dependencies: 1822 1823 1824 6
-- Name: outputs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE outputs (
    id integer NOT NULL,
    document_id integer,
    process_id integer,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now(),
    is_key smallint DEFAULT 0 NOT NULL
);


--
-- TOC entry 1525 (class 1259 OID 16749)
-- Dependencies: 6 1524
-- Name: outputs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1905 (class 0 OID 0)
-- Dependencies: 1525
-- Name: outputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE outputs_id_seq OWNED BY outputs.id;


--
-- TOC entry 1906 (class 0 OID 0)
-- Dependencies: 1525
-- Name: outputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('outputs_id_seq', 132, true);


--
-- TOC entry 1526 (class 1259 OID 16751)
-- Dependencies: 1826 1827 6
-- Name: process_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE process_groups (
    id integer NOT NULL,
    name character varying(100),
    orden integer,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now()
);


--
-- TOC entry 1527 (class 1259 OID 16756)
-- Dependencies: 6 1526
-- Name: process_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE process_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1907 (class 0 OID 0)
-- Dependencies: 1527
-- Name: process_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE process_groups_id_seq OWNED BY process_groups.id;


--
-- TOC entry 1908 (class 0 OID 0)
-- Dependencies: 1527
-- Name: process_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('process_groups_id_seq', 5, true);


--
-- TOC entry 1528 (class 1259 OID 16758)
-- Dependencies: 1829 1830 6
-- Name: processes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE processes (
    id integer NOT NULL,
    name character varying(100),
    description text,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now(),
    orden integer,
    knowledge_area_id integer,
    process_group_id integer,
    nombre character varying(1000),
    descripcion text,
    notes text
);


--
-- TOC entry 1529 (class 1259 OID 16766)
-- Dependencies: 6 1528
-- Name: processes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1909 (class 0 OID 0)
-- Dependencies: 1529
-- Name: processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE processes_id_seq OWNED BY processes.id;


--
-- TOC entry 1910 (class 0 OID 0)
-- Dependencies: 1529
-- Name: processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('processes_id_seq', 43, true);


--
-- TOC entry 1530 (class 1259 OID 16768)
-- Dependencies: 6
-- Name: processes_tools; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE processes_tools (
    process_id integer NOT NULL,
    tool_id integer NOT NULL
);


--
-- TOC entry 1531 (class 1259 OID 16771)
-- Dependencies: 1832 1833 6
-- Name: terms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE terms (
    id integer NOT NULL,
    name character varying,
    description text,
    nombre character varying(1000),
    descripcion text,
    acronym character varying(100),
    acronimo character varying(100),
    related integer,
    synonym integer,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now(),
    notes text
);


--
-- TOC entry 1532 (class 1259 OID 16779)
-- Dependencies: 6 1531
-- Name: terms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE terms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1911 (class 0 OID 0)
-- Dependencies: 1532
-- Name: terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE terms_id_seq OWNED BY terms.id;


--
-- TOC entry 1912 (class 0 OID 0)
-- Dependencies: 1532
-- Name: terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('terms_id_seq', 1, false);


--
-- TOC entry 1533 (class 1259 OID 16781)
-- Dependencies: 1835 1836 1837 6
-- Name: tools; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tools (
    id integer NOT NULL,
    name character varying(1000),
    description text,
    nombre character varying(1000),
    descripcion text,
    notes text,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone DEFAULT now(),
    is_key smallint DEFAULT 0 NOT NULL
);


--
-- TOC entry 1534 (class 1259 OID 16790)
-- Dependencies: 1533 6
-- Name: tools_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1913 (class 0 OID 0)
-- Dependencies: 1534
-- Name: tools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tools_id_seq OWNED BY tools.id;


--
-- TOC entry 1914 (class 0 OID 0)
-- Dependencies: 1534
-- Name: tools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tools_id_seq', 134, true);


--
-- TOC entry 1814 (class 2604 OID 16792)
-- Dependencies: 1519 1518
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- TOC entry 1818 (class 2604 OID 16793)
-- Dependencies: 1521 1520
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE inputs ALTER COLUMN id SET DEFAULT nextval('inputs_id_seq'::regclass);


--
-- TOC entry 1821 (class 2604 OID 16794)
-- Dependencies: 1523 1522
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE knowledge_areas ALTER COLUMN id SET DEFAULT nextval('knowledge_areas_id_seq'::regclass);


--
-- TOC entry 1825 (class 2604 OID 16795)
-- Dependencies: 1525 1524
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE outputs ALTER COLUMN id SET DEFAULT nextval('outputs_id_seq'::regclass);


--
-- TOC entry 1828 (class 2604 OID 16796)
-- Dependencies: 1527 1526
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE process_groups ALTER COLUMN id SET DEFAULT nextval('process_groups_id_seq'::regclass);


--
-- TOC entry 1831 (class 2604 OID 16797)
-- Dependencies: 1529 1528
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE processes ALTER COLUMN id SET DEFAULT nextval('processes_id_seq'::regclass);


--
-- TOC entry 1834 (class 2604 OID 16798)
-- Dependencies: 1532 1531
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE terms ALTER COLUMN id SET DEFAULT nextval('terms_id_seq'::regclass);


--
-- TOC entry 1838 (class 2604 OID 16799)
-- Dependencies: 1534 1533
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tools ALTER COLUMN id SET DEFAULT nextval('tools_id_seq'::regclass);


--
-- TOC entry 1885 (class 0 OID 16718)
-- Dependencies: 1518
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (58, 'Work performance information', '', '2009-11-11 13:50:19.984-05', '2009-11-12 23:52:40-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (2, 'Business case', '', '2009-11-10 23:22:56.671-05', '2009-11-10 23:22:56.671-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (74, 'Work performance measurements', '', '2009-11-11 22:28:29.031-05', '2009-11-12 23:53:13-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (4, 'Enterprise environmental factors', '', '2009-11-10 23:23:33.218-05', '2009-11-10 23:23:33.218-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (5, 'Organizational process assets', '', '2009-11-10 23:23:58.812-05', '2009-11-10 23:23:58.812-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (73, 'Accepted deliverables', '', '2009-11-11 22:25:15.546-05', '2009-11-12 23:55:09-05', 57, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (72, 'Validated deliverables', '', '2009-11-11 22:24:14.453-05', '2009-11-12 23:55:47-05', 57, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (71, 'Change requests status updates', '', '2009-11-11 16:08:41.531-05', '2009-11-12 23:56:22-05', 55, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (11, 'Project management plan', '', '2009-11-11 00:05:05.437-05', '2009-11-11 00:05:05.437-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (12, 'Requirements documentation', '', '2009-11-11 00:05:30.687-05', '2009-11-11 00:05:30.687-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (56, 'Approved change requests', '', '2009-11-11 13:48:54.078-05', '2009-11-12 23:56:47-05', 55, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (63, 'Enterprise environmental factors updates', '', '2009-11-11 14:01:56.921-05', '2009-11-12 23:57:09-05', 4, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (60, 'Organizational process assets updates', '', '2009-11-11 13:53:49.421-05', '2009-11-12 23:57:38-05', 5, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (15, 'Project scope statement', '', '2009-11-11 02:24:31.625-05', '2009-11-12 23:58:48-05', 19, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (47, 'Risk register updates', '', '2009-11-11 11:51:20.718-05', '2009-11-13 00:00:01-05', 32, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (23, 'Project schedule network diagrams', '', '2009-11-11 02:27:49.015-05', '2009-11-11 02:27:49.015-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (28, 'Project schedule', '', '2009-11-11 05:53:50.734-05', '2009-11-11 05:53:50.734-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (30, 'Schedule data', '', '2009-11-11 05:55:09.25-05', '2009-11-11 05:55:09.25-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (17, 'WBS', '', '2009-11-11 02:25:29.437-05', '2009-11-12 23:08:15-05', 19, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (18, 'WBS dictionary', '', '2009-11-11 02:25:46.078-05', '2009-11-12 23:08:49-05', 19, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (46, 'Project documents', '', '2009-11-11 11:48:13.281-05', '2009-11-11 11:48:13.281-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (48, 'Risk-related contract decisions', '', '2009-11-11 11:56:23.125-05', '2009-11-11 11:56:23.125-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (52, 'Procurement statement of work', '', '2009-11-11 13:39:59.109-05', '2009-11-11 13:39:59.109-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (53, 'Make-or-buy decisions', '', '2009-11-11 13:40:28.218-05', '2009-11-11 13:40:28.218-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (55, 'Change requests', '', '2009-11-11 13:44:22.343-05', '2009-11-11 13:44:22.343-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (57, 'Deliverables', '', '2009-11-11 13:49:45.062-05', '2009-11-11 13:49:45.062-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (61, 'Project staff assignments', '', '2009-11-11 13:57:25.875-05', '2009-11-11 13:57:49-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (69, 'Selected sellers', '', '2009-11-11 14:17:45.265-05', '2009-11-11 14:17:45.265-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (70, 'Procurement contract award', '', '2009-11-11 14:18:29.125-05', '2009-11-11 14:18:29.125-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (76, 'Validated changes', '', '2009-11-11 22:41:34.25-05', '2009-11-11 22:41:34.25-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (77, 'Final product, service or result transition', '', '2009-11-11 22:57:36.093-05', '2009-11-11 22:57:36.093-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (78, 'Closed procurements', '', '2009-11-11 22:59:47.14-05', '2009-11-11 22:59:47.14-05', NULL, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (49, 'Project management plan updates', '', '2009-11-11 11:57:06.578-05', '2009-11-12 18:06:40-05', 11, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (21, 'Activity attributes', '', '2009-11-11 02:27:01.906-05', '2009-11-12 23:22:59-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (33, 'Activity cost estimates', '', '2009-11-11 05:59:32.25-05', '2009-11-12 23:24:11-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (16, 'Project document updates', '', '2009-11-11 02:25:00.921-05', '2009-11-12 23:24:28-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (20, 'Activity list', '', '2009-11-11 02:26:42.875-05', '2009-11-12 23:25:00-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (83, 'Assumption log', NULL, '2009-11-12 23:25:40.328-05', '2009-11-12 23:25:40.328-05', 46, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (34, 'Basis of estimates', '', '2009-11-11 06:00:09.703-05', '2009-11-12 23:26:09-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (66, 'Change log', '', '2009-11-11 14:11:02.906-05', '2009-11-12 23:26:28-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (3, 'Contract', '', '2009-11-10 23:23:11.203-05', '2009-11-12 23:27:07-05', 35, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (35, 'Contracts', '', '2009-11-11 10:37:11.015-05', '2009-11-12 23:27:34-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (6, 'Project charter', '', '2009-11-10 23:24:13.484-05', '2009-11-12 23:28:14-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (27, 'Activity duration estimates', '', '2009-11-11 05:49:41.921-05', '2009-11-12 23:29:01-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (75, 'Budget forecasts', '', '2009-11-11 22:35:46.031-05', '2009-11-12 23:29:41-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (65, 'Issue log', '', '2009-11-11 14:10:38.046-05', '2009-11-12 23:29:55-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (22, 'Milestone list', '', '2009-11-11 02:27:15.671-05', '2009-11-12 23:31:10-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (64, 'Performance reports', '', '2009-11-11 14:05:30.765-05', '2009-11-12 23:32:18-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (37, 'Project funding requirements', '', '2009-11-11 10:39:16.5-05', '2009-11-12 23:32:38-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (68, 'Seller proposals', '', '2009-11-11 14:16:08.781-05', '2009-11-12 23:33:07-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (7, 'Procurement documents', '', '2009-11-10 23:24:37.937-05', '2009-11-12 23:33:43-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (84, 'Project organizational structure', NULL, '2009-11-12 23:35:04.312-05', '2009-11-12 23:35:04.312-05', 46, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (59, 'Quality control measurements', '', '2009-11-11 13:53:02.515-05', '2009-11-12 23:35:40-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (40, 'Quality checklists', '', '2009-11-11 10:46:12.531-05', '2009-11-12 23:36:03-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (39, 'Quality metrics', '', '2009-11-11 10:45:40.984-05', '2009-11-12 23:36:26-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (85, 'Responsibility assigment matrix', NULL, '2009-11-12 23:37:51.718-05', '2009-11-12 23:37:51.718-05', 46, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (14, 'Requirements traceability matrix', '', '2009-11-11 00:06:15.171-05', '2009-11-12 23:38:14-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (26, 'Resource breakdown structure', '', '2009-11-11 05:46:02.125-05', '2009-11-12 23:38:38-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (24, 'Resource calendars', '', '2009-11-11 05:41:23.968-05', '2009-11-12 23:39:41-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (25, 'Activity resource requirements', '', '2009-11-11 05:43:02.671-05', '2009-11-12 23:40:33-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (32, 'Risk register', '', '2009-11-11 05:58:18.984-05', '2009-11-12 23:41:06-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (86, 'Roles and responsibilities', NULL, '2009-11-12 23:42:03.437-05', '2009-11-12 23:42:03.437-05', 46, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (67, 'Qualified seller list', '', '2009-11-11 14:15:28.296-05', '2009-11-12 23:43:47-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (54, 'Source selection criteria', '', '2009-11-11 13:43:29.281-05', '2009-11-12 23:44:40-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (88, 'Stakeholder analysis', NULL, '2009-11-12 23:47:24.437-05', '2009-11-12 23:47:24.437-05', 46, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (9, 'Stakeholder management strategy', '', '2009-11-10 23:25:44.39-05', '2009-11-12 23:47:44-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (8, 'Stakeholder register', '', '2009-11-10 23:25:12.093-05', '2009-11-12 23:48:07-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (89, 'Stakeholder requirements', NULL, '2009-11-12 23:48:45.453-05', '2009-11-12 23:48:45.453-05', 46, NULL, NULL, NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (1, 'Project statement of work', '', '2009-11-10 23:22:34.25-05', '2009-11-12 23:49:30-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (50, 'Teaming agreements', '', '2009-11-11 11:59:26.453-05', '2009-11-12 23:49:52-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (62, 'Team performance assessments', '', '2009-11-11 14:01:20.593-05', '2009-11-12 23:50:12-05', 46, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (10, 'Outputs from planning processes', '', '2009-11-11 00:04:43.64-05', '2009-11-20 07:17:12-05', 11, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (13, 'Requirements management plan', '', '2009-11-11 00:05:53.625-05', '2009-11-20 07:18:17-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (79, 'Change management plan', '', '2009-11-12 23:09:41.546-05', '2009-11-20 19:22:08-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (80, 'Configuration management plan', '', '2009-11-12 23:10:44.125-05', '2009-11-20 19:22:43-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (82, 'Scope management plan', '', '2009-11-12 23:21:50.5-05', '2009-11-20 19:23:59-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (44, 'Schedule management plan', '', '2009-11-11 11:44:06.234-05', '2009-11-20 19:24:20-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (43, 'Cost management plan', '', '2009-11-11 11:43:22.484-05', '2009-11-20 19:24:43-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (38, 'Quality management plan', '', '2009-11-11 10:45:12.468-05', '2009-11-20 19:25:05-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (41, 'Process improvement plan', '', '2009-11-11 10:48:12.546-05', '2009-11-20 19:25:35-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (31, 'Human resource plan', '', '2009-11-11 05:57:33.671-05', '2009-11-20 19:25:59-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (42, 'Communications management plan', '', '2009-11-11 10:53:13.687-05', '2009-11-20 19:26:18-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (45, 'Risk management plan', '', '2009-11-11 11:45:25.593-05', '2009-11-20 19:26:45-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (51, 'Procurement management plan', '', '2009-11-11 13:39:23.281-05', '2009-11-20 19:27:08-05', 51, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (19, 'Scope baseline', '', '2009-11-11 02:26:03.937-05', '2009-11-20 19:27:30-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (36, 'Cost performance baseline', '', '2009-11-11 10:38:26.781-05', '2009-11-20 19:28:01-05', 10, '', '', NULL);
INSERT INTO documents (id, name, description, created, modified, related, nombre, descripcion, notes) VALUES (29, 'Schedule baseline', '', '2009-11-11 05:54:25.75-05', '2009-11-20 19:28:30-05', 10, '', '', NULL);


--
-- TOC entry 1886 (class 0 OID 16728)
-- Dependencies: 1520
-- Data for Name: inputs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (3, 3, 2, '2009-11-10 23:28:32.75-05', '2009-11-10 23:28:32.75-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (4, 4, 2, '2009-11-10 23:28:51.875-05', '2009-11-10 23:28:51.875-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (5, 5, 2, '2009-11-10 23:29:16.515-05', '2009-11-10 23:29:16.515-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (6, 6, 3, '2009-11-10 23:50:00.531-05', '2009-11-10 23:50:00.531-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (7, 7, 3, '2009-11-10 23:53:15.984-05', '2009-11-10 23:53:15.984-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (8, 4, 3, '2009-11-10 23:58:28.281-05', '2009-11-10 23:58:28.281-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (9, 5, 3, '2009-11-10 23:58:59.265-05', '2009-11-10 23:58:59.265-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (10, 6, 4, '2009-11-11 00:07:23.484-05', '2009-11-11 00:07:23.484-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (11, 10, 4, '2009-11-11 00:07:48.828-05', '2009-11-11 00:07:48.828-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (12, 4, 4, '2009-11-11 00:08:11.765-05', '2009-11-11 00:08:11.765-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (13, 5, 4, '2009-11-11 00:08:52.234-05', '2009-11-11 00:08:52.234-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (14, 6, 5, '2009-11-11 00:10:49.062-05', '2009-11-11 00:10:49.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (16, 6, 6, '2009-11-11 02:28:36.796-05', '2009-11-11 02:28:36.796-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (17, 12, 6, '2009-11-11 02:29:37.187-05', '2009-11-11 02:29:37.187-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (18, 5, 6, '2009-11-11 02:30:05.078-05', '2009-11-11 02:30:05.078-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (19, 15, 7, '2009-11-11 02:55:47.375-05', '2009-11-11 02:55:47.375-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (20, 12, 7, '2009-11-11 02:56:15.5-05', '2009-11-11 02:56:15.5-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (21, 5, 7, '2009-11-11 02:56:48.437-05', '2009-11-11 02:56:48.437-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (23, 4, 8, '2009-11-11 03:00:08.39-05', '2009-11-11 03:00:08.39-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (24, 5, 8, '2009-11-11 03:00:18.671-05', '2009-11-11 03:00:18.671-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (26, 21, 9, '2009-11-11 04:59:27.218-05', '2009-11-11 04:59:27.218-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (27, 22, 9, '2009-11-11 04:59:44.609-05', '2009-11-11 04:59:44.609-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (28, 15, 9, '2009-11-11 05:00:02.203-05', '2009-11-11 05:00:02.203-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (29, 5, 9, '2009-11-11 05:00:14.39-05', '2009-11-11 05:00:14.39-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (30, 20, 10, '2009-11-11 05:38:29.812-05', '2009-11-11 05:38:29.812-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (31, 21, 10, '2009-11-11 05:38:49.671-05', '2009-11-11 05:38:49.671-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (32, 24, 10, '2009-11-11 05:41:40.39-05', '2009-11-11 05:41:40.39-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (33, 4, 10, '2009-11-11 05:41:54.875-05', '2009-11-11 05:41:54.875-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (34, 5, 10, '2009-11-11 05:42:11.859-05', '2009-11-11 05:42:11.859-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (36, 21, 11, '2009-11-11 05:47:33-05', '2009-11-11 05:47:33-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (39, 15, 11, '2009-11-11 05:48:14.515-05', '2009-11-11 05:48:14.515-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (40, 4, 11, '2009-11-11 05:48:32.218-05', '2009-11-11 05:48:32.218-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (41, 5, 11, '2009-11-11 05:48:47.781-05', '2009-11-11 05:48:47.781-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (43, 21, 12, '2009-11-11 05:50:50.921-05', '2009-11-11 05:50:50.921-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (45, 25, 12, '2009-11-11 05:51:23.765-05', '2009-11-11 05:51:23.765-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (47, 27, 12, '2009-11-11 05:51:55.765-05', '2009-11-11 05:51:55.765-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (48, 15, 12, '2009-11-11 05:52:14.218-05', '2009-11-11 05:52:14.218-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (49, 4, 12, '2009-11-11 05:52:30.078-05', '2009-11-11 05:52:30.078-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (50, 5, 12, '2009-11-11 05:52:47.671-05', '2009-11-11 05:52:47.671-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (51, 19, 13, '2009-11-11 05:56:26.593-05', '2009-11-11 05:56:26.593-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (52, 28, 13, '2009-11-11 05:56:49.093-05', '2009-11-11 05:56:49.093-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (53, 31, 13, '2009-11-11 05:57:39.453-05', '2009-11-11 05:57:39.453-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (54, 32, 13, '2009-11-11 05:58:23.687-05', '2009-11-11 05:58:23.687-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (55, 4, 13, '2009-11-11 05:58:40.468-05', '2009-11-11 05:58:40.468-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (56, 5, 13, '2009-11-11 05:58:55.312-05', '2009-11-11 05:58:55.312-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (57, 33, 14, '2009-11-11 10:35:29.234-05', '2009-11-11 10:35:29.234-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (58, 34, 14, '2009-11-11 10:35:41.14-05', '2009-11-11 10:35:41.14-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (59, 19, 14, '2009-11-11 10:35:55.515-05', '2009-11-11 10:35:55.515-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (60, 28, 14, '2009-11-11 10:36:10.5-05', '2009-11-11 10:36:10.5-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (61, 24, 14, '2009-11-11 10:36:22.671-05', '2009-11-11 10:36:22.671-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (62, 35, 14, '2009-11-11 10:37:16.734-05', '2009-11-11 10:37:16.734-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (63, 5, 14, '2009-11-11 10:37:33.875-05', '2009-11-11 10:37:33.875-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (64, 19, 15, '2009-11-11 10:40:21.671-05', '2009-11-11 10:40:21.671-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (65, 8, 15, '2009-11-11 10:40:37.718-05', '2009-11-11 10:40:37.718-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (66, 36, 15, '2009-11-11 10:41:01.062-05', '2009-11-11 10:41:01.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (67, 29, 15, '2009-11-11 10:41:19.328-05', '2009-11-11 10:41:19.328-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (68, 32, 15, '2009-11-11 10:44:03.562-05', '2009-11-11 10:44:03.562-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (69, 4, 15, '2009-11-11 10:44:18.39-05', '2009-11-11 10:44:18.39-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (70, 5, 15, '2009-11-11 10:44:32.843-05', '2009-11-11 10:44:32.843-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (71, 25, 16, '2009-11-11 10:49:23.64-05', '2009-11-11 10:49:23.64-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (72, 4, 16, '2009-11-11 10:49:46.531-05', '2009-11-11 10:49:46.531-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (73, 5, 16, '2009-11-11 10:50:08.062-05', '2009-11-11 10:50:08.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (74, 8, 17, '2009-11-11 10:51:31.796-05', '2009-11-11 10:51:31.796-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (75, 9, 17, '2009-11-11 10:51:51.687-05', '2009-11-11 10:51:51.687-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (76, 4, 17, '2009-11-11 10:52:08.437-05', '2009-11-11 10:52:08.437-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (77, 5, 17, '2009-11-11 10:52:22.671-05', '2009-11-11 10:52:22.671-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (78, 15, 18, '2009-11-11 11:41:56.015-05', '2009-11-11 11:41:56.015-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (79, 43, 18, '2009-11-11 11:43:26.062-05', '2009-11-11 11:43:26.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (80, 44, 18, '2009-11-11 11:44:13.25-05', '2009-11-11 11:44:13.25-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (81, 42, 18, '2009-11-11 11:44:22.156-05', '2009-11-11 11:44:22.156-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (82, 4, 18, '2009-11-11 11:44:32.812-05', '2009-11-11 11:44:32.812-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (83, 5, 18, '2009-11-11 11:44:40.828-05', '2009-11-11 11:44:40.828-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (84, 45, 19, '2009-11-11 11:45:56.968-05', '2009-11-11 11:45:56.968-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (86, 27, 19, '2009-11-11 11:46:22.75-05', '2009-11-11 11:46:22.75-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (88, 8, 19, '2009-11-11 11:46:54.921-05', '2009-11-11 11:46:54.921-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (89, 43, 19, '2009-11-11 11:47:09.687-05', '2009-11-11 11:47:09.687-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (90, 44, 19, '2009-11-11 11:47:21.578-05', '2009-11-11 11:47:21.578-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (91, 38, 19, '2009-11-11 11:47:35.843-05', '2009-11-11 11:47:35.843-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (92, 46, 19, '2009-11-11 11:48:16.812-05', '2009-11-11 11:48:16.812-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (93, 4, 19, '2009-11-11 11:48:31.953-05', '2009-11-11 11:48:31.953-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (94, 5, 19, '2009-11-11 11:48:45.953-05', '2009-11-11 11:48:45.953-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (95, 32, 20, '2009-11-11 11:49:49.593-05', '2009-11-11 11:49:49.593-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (96, 45, 20, '2009-11-11 11:50:10.187-05', '2009-11-11 11:50:10.187-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (97, 15, 20, '2009-11-11 11:50:24.421-05', '2009-11-11 11:50:24.421-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (98, 5, 20, '2009-11-11 11:50:48.625-05', '2009-11-11 11:50:48.625-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (99, 32, 21, '2009-11-11 11:52:50.078-05', '2009-11-11 11:52:50.078-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (100, 45, 21, '2009-11-11 11:52:59.328-05', '2009-11-11 11:52:59.328-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (101, 43, 21, '2009-11-11 11:53:10.39-05', '2009-11-11 11:53:10.39-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (102, 44, 21, '2009-11-11 11:53:20.656-05', '2009-11-11 11:53:20.656-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (103, 5, 21, '2009-11-11 11:53:35.125-05', '2009-11-11 11:53:35.125-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (104, 32, 22, '2009-11-11 11:55:26.171-05', '2009-11-11 11:55:26.171-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (105, 45, 22, '2009-11-11 11:55:36.515-05', '2009-11-11 11:55:36.515-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (106, 19, 23, '2009-11-11 11:58:29.828-05', '2009-11-11 11:58:29.828-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (109, 32, 23, '2009-11-11 11:59:50.234-05', '2009-11-11 11:59:50.234-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (110, 48, 23, '2009-11-11 12:01:13.625-05', '2009-11-11 12:01:13.625-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (111, 25, 23, '2009-11-11 12:01:28.296-05', '2009-11-11 12:01:28.296-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (112, 28, 23, '2009-11-11 12:01:44.453-05', '2009-11-11 12:01:44.453-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (113, 33, 23, '2009-11-11 12:01:52.89-05', '2009-11-11 12:01:52.89-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (114, 36, 23, '2009-11-11 13:38:09.109-05', '2009-11-11 13:38:09.109-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (115, 4, 23, '2009-11-11 13:38:23.25-05', '2009-11-11 13:38:23.25-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (116, 5, 23, '2009-11-11 13:38:40.656-05', '2009-11-11 13:38:40.656-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (118, 56, 24, '2009-11-11 13:48:58.109-05', '2009-11-11 13:48:58.109-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (119, 4, 24, '2009-11-11 13:49:11.062-05', '2009-11-11 13:49:11.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (120, 5, 24, '2009-11-11 13:49:19.343-05', '2009-11-11 13:49:19.343-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (44, 23, 12, '2009-11-11 05:51:09.609-05', '2009-12-10 03:55:58-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (46, 24, 12, '2009-11-11 05:51:39.593-05', '2009-12-10 03:56:11-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (87, 19, 19, '2009-11-11 11:46:43.156-05', '2009-12-10 06:35:08-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (107, 12, 23, '2009-11-11 11:58:41.937-05', '2009-12-10 07:16:08-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (108, 50, 23, '2009-11-11 11:59:31.734-05', '2009-12-10 07:17:20-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (1, 1, 2, '2009-11-10 23:27:36.89-05', '2009-12-10 07:34:46-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (2, 2, 2, '2009-11-10 23:28:06.765-05', '2009-12-10 07:34:53-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (117, 11, 24, '2009-11-11 13:48:18.546-05', '2009-12-10 07:36:02-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (15, 8, 5, '2009-11-11 00:11:07.875-05', '2009-12-10 07:37:47-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (22, 19, 8, '2009-11-11 02:59:57.109-05', '2009-12-10 07:53:04-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (25, 20, 9, '2009-11-11 04:59:08.125-05', '2009-12-10 08:03:25-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (35, 20, 11, '2009-11-11 05:47:17.812-05', '2009-12-10 08:13:23-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (37, 25, 11, '2009-11-11 05:47:41.781-05', '2009-12-10 08:13:37-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (38, 24, 11, '2009-11-11 05:47:57.203-05', '2009-12-10 08:13:46-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (121, 11, 25, '2009-11-11 13:52:04.421-05', '2009-11-11 13:52:04.421-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (122, 39, 25, '2009-11-11 13:52:14.296-05', '2009-11-11 13:52:14.296-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (123, 58, 25, '2009-11-11 13:52:24.484-05', '2009-11-11 13:52:24.484-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (125, 11, 26, '2009-11-11 13:56:21.546-05', '2009-11-11 13:56:21.546-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (126, 4, 26, '2009-11-11 13:56:34.937-05', '2009-11-11 13:56:34.937-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (127, 5, 26, '2009-11-11 13:56:46.875-05', '2009-11-11 13:56:46.875-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (128, 61, 27, '2009-11-11 14:00:18.015-05', '2009-11-11 14:00:18.015-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (129, 11, 27, '2009-11-11 14:00:29.421-05', '2009-11-11 14:00:29.421-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (130, 24, 27, '2009-11-11 14:00:40.906-05', '2009-11-11 14:00:40.906-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (131, 61, 28, '2009-11-11 14:04:31.921-05', '2009-11-11 14:04:31.921-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (132, 11, 28, '2009-11-11 14:04:44.64-05', '2009-11-11 14:04:44.64-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (133, 62, 28, '2009-11-11 14:05:00.015-05', '2009-11-11 14:05:00.015-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (134, 64, 28, '2009-11-11 14:05:35.312-05', '2009-11-11 14:05:35.312-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (135, 5, 28, '2009-11-11 14:05:53.437-05', '2009-11-11 14:05:53.437-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (136, 11, 29, '2009-11-11 14:07:55.437-05', '2009-11-11 14:07:55.437-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (137, 64, 29, '2009-11-11 14:08:09.437-05', '2009-11-11 14:08:09.437-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (138, 5, 29, '2009-11-11 14:08:23.593-05', '2009-11-11 14:08:23.593-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (139, 8, 30, '2009-11-11 14:09:54.5-05', '2009-11-11 14:09:54.5-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (141, 11, 30, '2009-11-11 14:10:19.687-05', '2009-11-11 14:10:19.687-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (142, 65, 30, '2009-11-11 14:10:42.875-05', '2009-11-11 14:10:42.875-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (143, 66, 30, '2009-11-11 14:11:09.921-05', '2009-11-11 14:11:09.921-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (144, 5, 30, '2009-11-11 14:11:24.031-05', '2009-11-11 14:11:24.031-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (145, 11, 31, '2009-11-11 14:13:48.093-05', '2009-11-11 14:13:48.093-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (146, 7, 31, '2009-11-11 14:14:25.218-05', '2009-11-11 14:14:25.218-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (147, 54, 31, '2009-11-11 14:14:48.14-05', '2009-11-11 14:14:48.14-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (149, 68, 31, '2009-11-11 14:16:11.484-05', '2009-11-11 14:16:11.484-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (150, 46, 31, '2009-11-11 14:16:28.89-05', '2009-11-11 14:16:28.89-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (151, 53, 31, '2009-11-11 14:16:43.109-05', '2009-11-11 14:16:43.109-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (152, 50, 31, '2009-11-11 14:16:59.656-05', '2009-11-11 14:16:59.656-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (153, 5, 31, '2009-11-11 14:17:13.703-05', '2009-11-11 14:17:13.703-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (154, 11, 32, '2009-11-11 16:00:19.796-05', '2009-11-11 16:00:19.796-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (156, 4, 32, '2009-11-11 16:00:52.265-05', '2009-11-11 16:00:52.265-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (157, 5, 32, '2009-11-11 16:01:04.062-05', '2009-11-11 16:01:04.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (158, 11, 33, '2009-11-11 16:06:51-05', '2009-11-11 16:06:51-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (159, 58, 33, '2009-11-11 16:07:04.437-05', '2009-11-11 16:07:04.437-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (160, 55, 33, '2009-11-11 16:07:16.593-05', '2009-11-11 16:07:16.593-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (161, 4, 33, '2009-11-11 16:07:27.687-05', '2009-11-11 16:07:27.687-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (162, 5, 33, '2009-11-11 16:07:43.406-05', '2009-11-11 16:07:43.406-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (163, 11, 34, '2009-11-11 22:23:05.531-05', '2009-11-11 22:23:05.531-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (164, 12, 34, '2009-11-11 22:23:28.531-05', '2009-11-11 22:23:28.531-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (165, 14, 34, '2009-11-11 22:23:43-05', '2009-11-11 22:23:43-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (166, 72, 34, '2009-11-11 22:24:26.14-05', '2009-11-11 22:24:26.14-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (167, 11, 35, '2009-11-11 22:26:33.968-05', '2009-11-11 22:26:33.968-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (169, 12, 35, '2009-11-11 22:27:03.906-05', '2009-11-11 22:27:03.906-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (170, 14, 35, '2009-11-11 22:27:19.765-05', '2009-11-11 22:27:19.765-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (171, 5, 35, '2009-11-11 22:27:33.25-05', '2009-11-11 22:27:33.25-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (172, 11, 36, '2009-11-11 22:30:39.062-05', '2009-11-11 22:30:39.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (174, 58, 36, '2009-11-11 22:31:05.203-05', '2009-11-11 22:31:05.203-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (175, 5, 36, '2009-11-11 22:31:37.046-05', '2009-11-11 22:31:37.046-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (178, 58, 37, '2009-11-11 22:34:39.015-05', '2009-11-11 22:34:39.015-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (179, 5, 37, '2009-11-11 22:35:00-05', '2009-11-11 22:35:00-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (180, 11, 38, '2009-11-11 22:39:01.796-05', '2009-11-11 22:39:01.796-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (184, 56, 38, '2009-11-11 22:40:05.765-05', '2009-11-11 22:40:05.765-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (186, 5, 38, '2009-11-11 22:40:28.109-05', '2009-11-11 22:40:28.109-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (187, 11, 39, '2009-11-11 22:44:03.937-05', '2009-11-11 22:44:03.937-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (188, 58, 39, '2009-11-11 22:44:18.343-05', '2009-11-11 22:44:18.343-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (190, 75, 39, '2009-11-11 22:44:43.953-05', '2009-11-11 22:44:43.953-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (191, 5, 39, '2009-11-11 22:45:01.656-05', '2009-11-11 22:45:01.656-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (192, 32, 40, '2009-11-11 22:47:09.359-05', '2009-11-11 22:47:09.359-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (193, 11, 40, '2009-11-11 22:47:26.296-05', '2009-11-11 22:47:26.296-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (194, 58, 40, '2009-11-11 22:47:33.125-05', '2009-11-11 22:47:33.125-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (195, 64, 40, '2009-11-11 22:48:10.296-05', '2009-11-11 22:48:10.296-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (196, 7, 41, '2009-11-11 22:50:30.796-05', '2009-11-11 22:50:30.796-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (197, 11, 41, '2009-11-11 22:50:48.781-05', '2009-11-11 22:50:48.781-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (198, 3, 41, '2009-11-11 22:51:06.421-05', '2009-11-11 22:51:06.421-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (199, 64, 41, '2009-11-11 22:51:28.468-05', '2009-11-11 22:51:28.468-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (200, 56, 41, '2009-11-11 22:51:50.625-05', '2009-11-11 22:51:50.625-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (201, 58, 41, '2009-11-11 22:52:08.046-05', '2009-11-11 22:52:08.046-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (202, 11, 42, '2009-11-11 22:56:06.687-05', '2009-11-11 22:56:06.687-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (203, 73, 42, '2009-11-11 22:56:20.765-05', '2009-11-11 22:56:20.765-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (204, 5, 42, '2009-11-11 22:56:31.5-05', '2009-11-11 22:56:31.5-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (205, 11, 43, '2009-11-11 22:58:59.859-05', '2009-11-11 22:58:59.859-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (206, 7, 43, '2009-11-11 22:59:18.062-05', '2009-11-11 22:59:18.062-05', 0);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (42, 20, 12, '2009-11-11 05:50:40.14-05', '2009-12-10 03:52:05-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (173, 28, 36, '2009-11-11 22:30:50.64-05', '2009-12-10 04:07:13-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (176, 11, 37, '2009-11-11 22:34:04.406-05', '2009-12-10 04:27:17-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (177, 37, 37, '2009-11-11 22:34:21.015-05', '2009-12-10 04:27:25-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (124, 59, 25, '2009-11-11 13:53:07.062-05', '2009-12-10 05:27:15-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (181, 39, 38, '2009-11-11 22:39:13.062-05', '2009-12-10 05:39:26-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (182, 40, 38, '2009-11-11 22:39:35.437-05', '2009-12-10 05:39:33-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (183, 74, 38, '2009-11-11 22:39:46.875-05', '2009-12-10 05:39:42-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (185, 57, 38, '2009-11-11 22:40:17.031-05', '2009-12-10 05:39:51-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (140, 9, 30, '2009-11-11 14:10:09.484-05', '2009-12-10 06:26:18-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (189, 74, 39, '2009-11-11 22:44:26.218-05', '2009-12-10 06:30:03-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (85, 33, 19, '2009-11-11 11:46:14.89-05', '2009-12-10 06:34:59-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (148, 67, 31, '2009-11-11 14:15:31.343-05', '2009-12-10 07:21:37-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (155, 64, 32, '2009-11-11 16:00:33.484-05', '2009-12-10 07:36:39-05', 1);
INSERT INTO inputs (id, document_id, process_id, created, modified, is_key) VALUES (168, 58, 35, '2009-11-11 22:26:47.937-05', '2009-12-10 07:50:41-05', 1);


--
-- TOC entry 1887 (class 0 OID 16736)
-- Dependencies: 1522
-- Data for Name: knowledge_areas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (1, 'Integration', '2009-11-10 19:56:56-05', '2009-11-10 19:56:56-05', 40);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (2, 'Scope', '2009-11-10 19:57:27.593-05', '2009-11-10 19:57:27.593-05', 50);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (3, 'Time', '2009-11-10 19:57:33.5-05', '2009-11-10 19:57:33.5-05', 60);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (4, 'Cost', '2009-11-10 19:57:35.796-05', '2009-11-10 19:57:35.796-05', 70);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (5, 'Quality', '2009-11-10 19:57:40.453-05', '2009-11-10 19:57:40.453-05', 80);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (6, 'Human Resources', '2009-11-10 19:57:51.312-05', '2009-11-10 19:57:51.312-05', 90);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (7, 'Communications', '2009-11-10 19:58:03.468-05', '2009-11-10 19:58:03.468-05', 100);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (8, 'Risk', '2009-11-10 19:58:08.875-05', '2009-11-10 19:58:08.875-05', 110);
INSERT INTO knowledge_areas (id, name, created, modified, orden) VALUES (9, 'Procurements', '2009-11-10 19:58:17.828-05', '2009-11-10 19:58:17.828-05', 120);


--
-- TOC entry 1888 (class 0 OID 16743)
-- Dependencies: 1524
-- Data for Name: outputs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (6, 13, 5, '2009-11-11 00:11:46.265-05', '2009-11-11 00:11:46.265-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (9, 16, 6, '2009-11-11 02:31:32.328-05', '2009-11-11 02:31:32.328-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (13, 16, 7, '2009-11-11 02:58:51.406-05', '2009-11-11 02:58:51.406-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (15, 21, 8, '2009-11-11 03:00:57.046-05', '2009-11-11 03:00:57.046-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (16, 22, 8, '2009-11-11 03:01:12.062-05', '2009-11-11 03:01:12.062-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (18, 16, 9, '2009-11-11 05:00:49.437-05', '2009-11-11 05:00:49.437-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (21, 16, 10, '2009-11-11 05:46:35.546-05', '2009-11-11 05:46:35.546-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (23, 16, 11, '2009-11-11 05:50:13.125-05', '2009-11-11 05:50:13.125-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (26, 30, 12, '2009-11-11 05:55:15.984-05', '2009-11-11 05:55:15.984-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (27, 16, 12, '2009-11-11 05:55:31.765-05', '2009-11-11 05:55:31.765-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (29, 34, 13, '2009-11-11 06:00:14.109-05', '2009-11-11 06:00:14.109-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (30, 16, 13, '2009-11-11 06:00:28.64-05', '2009-11-11 06:00:28.64-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (33, 16, 14, '2009-11-11 10:39:38.609-05', '2009-11-11 10:39:38.609-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (41, 16, 17, '2009-11-11 11:41:16.671-05', '2009-11-11 11:41:16.671-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (43, 32, 19, '2009-11-11 11:49:20.046-05', '2009-11-11 11:49:20.046-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (44, 47, 20, '2009-11-11 11:51:24-05', '2009-11-11 11:51:24-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (45, 47, 21, '2009-11-11 11:53:59.078-05', '2009-11-11 11:53:59.078-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (46, 47, 22, '2009-11-11 11:55:48.171-05', '2009-11-11 11:55:48.171-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (47, 48, 22, '2009-11-11 11:56:25.984-05', '2009-11-11 11:56:25.984-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (48, 49, 22, '2009-11-11 11:57:10.703-05', '2009-11-11 11:57:10.703-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (49, 16, 22, '2009-11-11 11:57:33.687-05', '2009-11-11 11:57:33.687-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (55, 55, 23, '2009-11-11 13:44:25.656-05', '2009-11-11 13:44:25.656-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (58, 55, 24, '2009-11-11 13:50:45.875-05', '2009-11-11 13:50:45.875-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (59, 49, 24, '2009-11-11 13:51:02.875-05', '2009-11-11 13:51:02.875-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (60, 16, 24, '2009-11-11 13:51:15.906-05', '2009-11-11 13:51:15.906-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (61, 60, 25, '2009-11-11 13:53:55.875-05', '2009-11-11 13:53:55.875-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (63, 49, 25, '2009-11-11 13:54:27.296-05', '2009-11-11 13:54:27.296-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (64, 16, 25, '2009-11-11 13:54:45.671-05', '2009-11-11 13:54:45.671-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (67, 49, 26, '2009-11-11 13:59:36.531-05', '2009-11-11 13:59:36.531-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (69, 63, 27, '2009-11-11 14:02:49.921-05', '2009-11-11 14:02:49.921-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (70, 63, 28, '2009-11-11 14:06:27.843-05', '2009-11-11 14:06:27.843-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (71, 60, 28, '2009-11-11 14:06:40.468-05', '2009-11-11 14:06:40.468-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (72, 55, 28, '2009-11-11 14:06:58.187-05', '2009-11-11 14:06:58.187-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (73, 49, 28, '2009-11-11 14:07:17.531-05', '2009-11-11 14:07:17.531-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (74, 60, 29, '2009-11-11 14:08:41.953-05', '2009-11-11 14:08:41.953-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (75, 60, 30, '2009-11-11 14:11:52.562-05', '2009-11-11 14:11:52.562-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (76, 55, 30, '2009-11-11 14:12:04.265-05', '2009-11-11 14:12:04.265-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (77, 49, 30, '2009-11-11 14:12:21.421-05', '2009-11-11 14:12:21.421-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (78, 16, 30, '2009-11-11 14:12:33.984-05', '2009-11-11 14:12:33.984-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (81, 24, 31, '2009-11-11 14:18:47.859-05', '2009-11-11 14:18:47.859-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (82, 55, 31, '2009-11-11 14:19:06.187-05', '2009-11-11 14:19:06.187-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (83, 49, 31, '2009-11-11 14:19:29.828-05', '2009-11-11 14:19:29.828-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (84, 16, 31, '2009-11-11 15:59:19.875-05', '2009-11-11 15:59:19.875-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (85, 55, 32, '2009-11-11 16:01:31.109-05', '2009-11-11 16:01:31.109-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (86, 49, 32, '2009-11-11 16:01:44.843-05', '2009-11-11 16:01:44.843-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (87, 16, 32, '2009-11-11 16:02:02.515-05', '2009-11-11 16:02:02.515-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (88, 71, 33, '2009-11-11 16:08:44.578-05', '2009-11-11 16:08:44.578-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (89, 49, 33, '2009-11-11 16:09:00.859-05', '2009-11-11 16:09:00.859-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (90, 16, 33, '2009-11-11 16:09:23.171-05', '2009-11-11 16:09:23.171-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (92, 55, 34, '2009-11-11 22:25:36.89-05', '2009-11-11 22:25:36.89-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (93, 16, 34, '2009-11-11 22:25:53.828-05', '2009-11-11 22:25:53.828-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (95, 60, 35, '2009-11-11 22:28:49.859-05', '2009-11-11 22:28:49.859-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (96, 55, 35, '2009-11-11 22:29:04.406-05', '2009-11-11 22:29:04.406-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (97, 49, 35, '2009-11-11 22:29:27.968-05', '2009-11-11 22:29:27.968-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (98, 16, 35, '2009-11-11 22:29:38.984-05', '2009-11-11 22:29:38.984-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (100, 60, 36, '2009-11-11 22:32:28.171-05', '2009-11-11 22:32:28.171-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (102, 49, 36, '2009-11-11 22:32:56.64-05', '2009-11-11 22:32:56.64-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (103, 16, 36, '2009-11-11 22:33:14.406-05', '2009-11-11 22:33:14.406-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (106, 60, 37, '2009-11-11 22:36:10.953-05', '2009-11-11 22:36:10.953-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (107, 55, 37, '2009-11-11 22:36:25.718-05', '2009-11-11 22:36:25.718-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (108, 49, 37, '2009-11-11 22:36:37.421-05', '2009-11-11 22:36:37.421-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (109, 16, 37, '2009-11-11 22:36:57.203-05', '2009-11-11 22:36:57.203-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (110, 59, 38, '2009-11-11 22:41:01.062-05', '2009-11-11 22:41:01.062-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (111, 76, 38, '2009-11-11 22:41:39.734-05', '2009-11-11 22:41:39.734-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (113, 60, 38, '2009-11-11 22:42:21.218-05', '2009-11-11 22:42:21.218-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (114, 55, 38, '2009-11-11 22:42:31.921-05', '2009-11-11 22:42:31.921-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (115, 49, 38, '2009-11-11 22:42:46.203-05', '2009-11-11 22:42:46.203-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (116, 16, 38, '2009-11-11 22:43:01.093-05', '2009-11-11 22:43:01.093-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (118, 60, 39, '2009-11-11 22:45:46.125-05', '2009-11-11 22:45:46.125-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (119, 55, 39, '2009-11-11 22:45:56.671-05', '2009-11-11 22:45:56.671-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (120, 47, 40, '2009-11-11 22:48:29.812-05', '2009-11-11 22:48:29.812-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (25, 29, 12, '2009-11-11 05:54:31.031-05', '2009-12-10 04:06:30-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (99, 74, 36, '2009-11-11 22:32:13.234-05', '2009-12-10 04:11:53-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (28, 33, 13, '2009-11-11 05:59:36.718-05', '2009-12-10 04:22:32-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (31, 36, 14, '2009-11-11 10:38:33.328-05', '2009-12-10 04:26:09-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (32, 37, 14, '2009-11-11 10:39:22-05', '2009-12-10 04:26:22-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (104, 74, 37, '2009-11-11 22:35:13.187-05', '2009-12-10 04:29:30-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (105, 75, 37, '2009-11-11 22:35:50.328-05', '2009-12-10 04:29:39-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (34, 38, 15, '2009-11-11 10:45:16.421-05', '2009-12-10 04:59:23-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (35, 39, 15, '2009-11-11 10:45:44.64-05', '2009-12-10 04:59:30-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (36, 40, 15, '2009-11-11 10:46:19.984-05', '2009-12-10 04:59:39-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (37, 41, 15, '2009-11-11 10:48:16.89-05', '2009-12-10 04:59:46-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (62, 55, 25, '2009-11-11 13:54:12.156-05', '2009-12-10 05:29:01-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (38, 16, 15, '2009-11-11 10:48:35.171-05', '2009-12-10 05:00:06-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (112, 72, 38, '2009-11-11 22:42:03.671-05', '2009-12-10 05:44:02-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (39, 31, 16, '2009-11-11 10:50:51.296-05', '2009-12-10 05:48:43-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (65, 61, 26, '2009-11-11 13:57:31.031-05', '2009-12-10 05:50:36-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (66, 24, 26, '2009-11-11 13:59:12.656-05', '2009-12-10 05:50:43-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (68, 62, 27, '2009-11-11 14:01:28.515-05', '2009-12-10 05:56:39-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (3, 9, 3, '2009-11-10 23:59:39.171-05', '2009-12-10 06:09:44-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (40, 42, 17, '2009-11-11 10:53:19.343-05', '2009-12-10 06:21:38-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (117, 64, 39, '2009-11-11 22:45:28.187-05', '2009-12-10 06:31:50-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (42, 45, 18, '2009-11-11 11:45:29.75-05', '2009-12-10 06:33:50-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (50, 51, 23, '2009-11-11 13:39:26.625-05', '2009-12-10 07:19:54-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (51, 52, 23, '2009-11-11 13:40:01.593-05', '2009-12-10 07:20:03-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (52, 53, 23, '2009-11-11 13:40:35.14-05', '2009-12-10 07:20:12-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (53, 7, 23, '2009-11-11 13:40:55.046-05', '2009-12-10 07:20:19-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (54, 54, 23, '2009-11-11 13:43:32.062-05', '2009-12-10 07:20:29-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (79, 69, 31, '2009-11-11 14:17:54.796-05', '2009-12-10 07:24:16-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (80, 70, 31, '2009-11-11 14:18:36.468-05', '2009-12-10 07:24:27-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (1, 6, 2, '2009-11-10 23:29:44.687-05', '2009-12-10 07:35:10-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (4, 11, 4, '2009-11-11 00:09:49.812-05', '2009-12-10 07:35:26-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (56, 57, 24, '2009-11-11 13:49:48.14-05', '2009-12-10 07:36:09-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (57, 58, 24, '2009-11-11 13:50:24.906-05', '2009-12-10 07:36:18-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (5, 12, 5, '2009-11-11 00:11:28.328-05', '2009-12-10 07:47:59-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (8, 15, 6, '2009-11-11 02:30:57.078-05', '2009-12-10 07:48:38-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (12, 19, 7, '2009-11-11 02:58:35.421-05', '2009-12-10 07:49:38-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (10, 17, 7, '2009-11-11 02:58:02.234-05', '2009-12-10 07:49:23-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (11, 18, 7, '2009-11-11 02:58:19.546-05', '2009-12-10 07:49:27-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (91, 73, 34, '2009-11-11 22:25:18.734-05', '2009-12-10 07:50:17-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (94, 74, 35, '2009-11-11 22:28:34.906-05', '2009-12-10 07:51:12-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (14, 20, 8, '2009-11-11 03:00:42.046-05', '2009-12-10 07:59:49-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (17, 23, 9, '2009-11-11 05:00:34.859-05', '2009-12-10 08:04:36-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (19, 25, 10, '2009-11-11 05:45:13-05', '2009-12-10 08:08:04-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (20, 26, 10, '2009-11-11 05:46:09.39-05', '2009-12-10 08:08:17-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (22, 27, 11, '2009-11-11 05:49:47.234-05', '2009-12-10 08:16:18-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (121, 60, 40, '2009-11-11 22:48:44.015-05', '2009-11-11 22:48:44.015-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (122, 55, 40, '2009-11-11 22:48:59.046-05', '2009-11-11 22:48:59.046-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (123, 49, 40, '2009-11-11 22:49:13.468-05', '2009-11-11 22:49:13.468-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (124, 16, 40, '2009-11-11 22:49:33.046-05', '2009-11-11 22:49:33.046-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (126, 60, 41, '2009-11-11 22:53:17.812-05', '2009-11-11 22:53:17.812-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (127, 55, 41, '2009-11-11 22:53:26.578-05', '2009-11-11 22:53:26.578-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (128, 49, 41, '2009-11-11 22:53:38.609-05', '2009-11-11 22:53:38.609-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (130, 60, 42, '2009-11-11 22:57:55.796-05', '2009-11-11 22:57:55.796-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (132, 60, 43, '2009-11-11 23:00:03.953-05', '2009-11-11 23:00:03.953-05', 0);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (24, 28, 12, '2009-11-11 05:53:55.734-05', '2009-12-10 04:05:39-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (101, 55, 36, '2009-11-11 22:32:46.75-05', '2009-12-10 04:12:03-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (2, 8, 3, '2009-11-10 23:59:18.421-05', '2009-12-10 06:09:30-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (125, 7, 41, '2009-11-11 22:52:55.843-05', '2009-12-10 07:28:43-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (131, 78, 43, '2009-11-11 22:59:49.781-05', '2009-12-10 07:31:15-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (129, 77, 42, '2009-11-11 22:57:38.437-05', '2009-12-10 07:37:19-05', 1);
INSERT INTO outputs (id, document_id, process_id, created, modified, is_key) VALUES (7, 14, 5, '2009-11-11 00:12:04.187-05', '2009-12-10 07:48:06-05', 1);


--
-- TOC entry 1889 (class 0 OID 16751)
-- Dependencies: 1526
-- Data for Name: process_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO process_groups (id, name, orden, created, modified) VALUES (1, 'Initiating', 10, '2009-11-10 19:59:01.703-05', '2009-11-10 19:59:01.703-05');
INSERT INTO process_groups (id, name, orden, created, modified) VALUES (2, 'Planning', 20, '2009-11-10 19:59:05.921-05', '2009-11-10 19:59:05.921-05');
INSERT INTO process_groups (id, name, orden, created, modified) VALUES (3, 'Executing', 30, '2009-11-10 19:59:09.015-05', '2009-11-10 19:59:09.015-05');
INSERT INTO process_groups (id, name, orden, created, modified) VALUES (4, 'Monitoring & Controlling', 40, '2009-11-10 19:59:19.406-05', '2009-11-10 19:59:19.406-05');
INSERT INTO process_groups (id, name, orden, created, modified) VALUES (5, 'Closing', 50, '2009-11-10 19:59:22.125-05', '2009-11-10 19:59:22.125-05');


--
-- TOC entry 1890 (class 0 OID 16758)
-- Dependencies: 1528
-- Data for Name: processes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (2, 'Develop Project Charter', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 410, 1, 1, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (3, 'Identify Stakeholders', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1010, 7, 1, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (4, 'Develop Project Management Plan', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 420, 1, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (5, 'Collect Requirements', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 510, 2, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (6, 'Define Scope', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 520, 2, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (7, 'Create WBS', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 530, 2, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (8, 'Define Activities', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 610, 3, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (9, 'Sequence Activities', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 620, 3, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (10, 'Estimate Activity Resources', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 630, 3, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (11, 'Estimate Activity Durations', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 640, 3, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (12, 'Develop Schedule', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 650, 3, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (13, 'Estimate Costs', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 710, 4, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (14, 'Determine Budget', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 720, 4, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (15, 'Plan Quality', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 810, 5, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (16, 'Develop Human Resource Plan', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 910, 6, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (17, 'Plan Communications', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1020, 7, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (18, 'Plan Risk Management', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1110, 8, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (19, 'Identify Risks', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1120, 8, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (20, 'Perform Qualitative Risk Analysis', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1130, 8, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (21, 'Perform Quantitative Risk Analysis', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1140, 8, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (22, 'Plan Risk Responses', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1150, 8, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (23, 'Plan Procurements', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1210, 9, 2, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (24, 'Direct and Manage Project Execution', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 430, 1, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (25, 'Perform Quality Assurance', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 820, 5, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (26, 'Acquire Project Team', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 920, 6, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (27, 'Develop Project Team', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 930, 6, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (28, 'Manage Project Team', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 940, 6, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (29, 'Distribute Information', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1030, 7, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (30, 'Manage Stakeholder Expectations', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1040, 7, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (31, 'Conduct Procurements', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1220, 9, 3, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (32, 'Monitor and controll Project Work', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 440, 1, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (33, 'Perform Integrated Change Control', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 450, 1, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (34, 'Verify Scope', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 540, 2, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (35, 'Control Scope', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 550, 2, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (36, 'Control Schedule', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 660, 3, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (37, 'Control Costs', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 730, 4, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (38, 'Perform Quality Control', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 830, 5, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (39, 'Report Performance', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1050, 7, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (40, 'Monitor and Control Risks', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1160, 8, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (41, 'Administer Procurements', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1230, 9, 4, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (42, 'Close Project or Phase', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 460, 1, 5, NULL, NULL, NULL);
INSERT INTO processes (id, name, description, created, modified, orden, knowledge_area_id, process_group_id, nombre, descripcion, notes) VALUES (43, 'Close Procurements', NULL, '2009-11-10 21:46:25.609-05', '2009-11-10 21:46:25.609-05', 1240, 9, 5, NULL, NULL, NULL);


--
-- TOC entry 1891 (class 0 OID 16768)
-- Dependencies: 1530
-- Data for Name: processes_tools; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO processes_tools (process_id, tool_id) VALUES (21, 107);
INSERT INTO processes_tools (process_id, tool_id) VALUES (21, 108);
INSERT INTO processes_tools (process_id, tool_id) VALUES (21, 109);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 34);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 35);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 36);
INSERT INTO processes_tools (process_id, tool_id) VALUES (24, 6);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 37);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 37);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 38);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 38);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 39);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 39);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 40);
INSERT INTO processes_tools (process_id, tool_id) VALUES (33, 7);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 40);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 41);
INSERT INTO processes_tools (process_id, tool_id) VALUES (12, 41);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 30);
INSERT INTO processes_tools (process_id, tool_id) VALUES (11, 30);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 31);
INSERT INTO processes_tools (process_id, tool_id) VALUES (5, 8);
INSERT INTO processes_tools (process_id, tool_id) VALUES (5, 9);
INSERT INTO processes_tools (process_id, tool_id) VALUES (11, 31);
INSERT INTO processes_tools (process_id, tool_id) VALUES (5, 11);
INSERT INTO processes_tools (process_id, tool_id) VALUES (5, 12);
INSERT INTO processes_tools (process_id, tool_id) VALUES (5, 13);
INSERT INTO processes_tools (process_id, tool_id) VALUES (5, 14);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 28);
INSERT INTO processes_tools (process_id, tool_id) VALUES (10, 28);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 32);
INSERT INTO processes_tools (process_id, tool_id) VALUES (11, 32);
INSERT INTO processes_tools (process_id, tool_id) VALUES (6, 15);
INSERT INTO processes_tools (process_id, tool_id) VALUES (6, 16);
INSERT INTO processes_tools (process_id, tool_id) VALUES (6, 10);
INSERT INTO processes_tools (process_id, tool_id) VALUES (5, 10);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 45);
INSERT INTO processes_tools (process_id, tool_id) VALUES (22, 110);
INSERT INTO processes_tools (process_id, tool_id) VALUES (8, 17);
INSERT INTO processes_tools (process_id, tool_id) VALUES (7, 17);
INSERT INTO processes_tools (process_id, tool_id) VALUES (8, 20);
INSERT INTO processes_tools (process_id, tool_id) VALUES (8, 21);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 46);
INSERT INTO processes_tools (process_id, tool_id) VALUES (14, 47);
INSERT INTO processes_tools (process_id, tool_id) VALUES (22, 111);
INSERT INTO processes_tools (process_id, tool_id) VALUES (22, 112);
INSERT INTO processes_tools (process_id, tool_id) VALUES (9, 22);
INSERT INTO processes_tools (process_id, tool_id) VALUES (9, 23);
INSERT INTO processes_tools (process_id, tool_id) VALUES (9, 24);
INSERT INTO processes_tools (process_id, tool_id) VALUES (9, 25);
INSERT INTO processes_tools (process_id, tool_id) VALUES (14, 48);
INSERT INTO processes_tools (process_id, tool_id) VALUES (10, 26);
INSERT INTO processes_tools (process_id, tool_id) VALUES (10, 27);
INSERT INTO processes_tools (process_id, tool_id) VALUES (40, 113);
INSERT INTO processes_tools (process_id, tool_id) VALUES (40, 114);
INSERT INTO processes_tools (process_id, tool_id) VALUES (40, 115);
INSERT INTO processes_tools (process_id, tool_id) VALUES (40, 116);
INSERT INTO processes_tools (process_id, tool_id) VALUES (40, 33);
INSERT INTO processes_tools (process_id, tool_id) VALUES (14, 33);
INSERT INTO processes_tools (process_id, tool_id) VALUES (14, 49);
INSERT INTO processes_tools (process_id, tool_id) VALUES (37, 50);
INSERT INTO processes_tools (process_id, tool_id) VALUES (37, 51);
INSERT INTO processes_tools (process_id, tool_id) VALUES (37, 52);
INSERT INTO processes_tools (process_id, tool_id) VALUES (37, 42);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 42);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 33);
INSERT INTO processes_tools (process_id, tool_id) VALUES (11, 33);
INSERT INTO processes_tools (process_id, tool_id) VALUES (40, 117);
INSERT INTO processes_tools (process_id, tool_id) VALUES (37, 29);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 29);
INSERT INTO processes_tools (process_id, tool_id) VALUES (10, 29);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 53);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 44);
INSERT INTO processes_tools (process_id, tool_id) VALUES (13, 44);
INSERT INTO processes_tools (process_id, tool_id) VALUES (23, 118);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 55);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 56);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 59);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 60);
INSERT INTO processes_tools (process_id, tool_id) VALUES (25, 61);
INSERT INTO processes_tools (process_id, tool_id) VALUES (25, 62);
INSERT INTO processes_tools (process_id, tool_id) VALUES (25, 63);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 64);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 54);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 54);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 58);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 58);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 65);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 66);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 67);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 68);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 57);
INSERT INTO processes_tools (process_id, tool_id) VALUES (15, 57);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 18);
INSERT INTO processes_tools (process_id, tool_id) VALUES (34, 18);
INSERT INTO processes_tools (process_id, tool_id) VALUES (38, 69);
INSERT INTO processes_tools (process_id, tool_id) VALUES (16, 70);
INSERT INTO processes_tools (process_id, tool_id) VALUES (16, 71);
INSERT INTO processes_tools (process_id, tool_id) VALUES (16, 72);
INSERT INTO processes_tools (process_id, tool_id) VALUES (26, 73);
INSERT INTO processes_tools (process_id, tool_id) VALUES (26, 74);
INSERT INTO processes_tools (process_id, tool_id) VALUES (26, 75);
INSERT INTO processes_tools (process_id, tool_id) VALUES (26, 76);
INSERT INTO processes_tools (process_id, tool_id) VALUES (27, 78);
INSERT INTO processes_tools (process_id, tool_id) VALUES (27, 79);
INSERT INTO processes_tools (process_id, tool_id) VALUES (27, 80);
INSERT INTO processes_tools (process_id, tool_id) VALUES (27, 81);
INSERT INTO processes_tools (process_id, tool_id) VALUES (27, 82);
INSERT INTO processes_tools (process_id, tool_id) VALUES (28, 83);
INSERT INTO processes_tools (process_id, tool_id) VALUES (28, 84);
INSERT INTO processes_tools (process_id, tool_id) VALUES (28, 85);
INSERT INTO processes_tools (process_id, tool_id) VALUES (28, 86);
INSERT INTO processes_tools (process_id, tool_id) VALUES (3, 87);
INSERT INTO processes_tools (process_id, tool_id) VALUES (17, 88);
INSERT INTO processes_tools (process_id, tool_id) VALUES (17, 89);
INSERT INTO processes_tools (process_id, tool_id) VALUES (17, 90);
INSERT INTO processes_tools (process_id, tool_id) VALUES (23, 119);
INSERT INTO processes_tools (process_id, tool_id) VALUES (31, 120);
INSERT INTO processes_tools (process_id, tool_id) VALUES (31, 121);
INSERT INTO processes_tools (process_id, tool_id) VALUES (29, 92);
INSERT INTO processes_tools (process_id, tool_id) VALUES (31, 122);
INSERT INTO processes_tools (process_id, tool_id) VALUES (31, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (23, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (30, 77);
INSERT INTO processes_tools (process_id, tool_id) VALUES (28, 77);
INSERT INTO processes_tools (process_id, tool_id) VALUES (27, 77);
INSERT INTO processes_tools (process_id, tool_id) VALUES (30, 93);
INSERT INTO processes_tools (process_id, tool_id) VALUES (39, 19);
INSERT INTO processes_tools (process_id, tool_id) VALUES (37, 19);
INSERT INTO processes_tools (process_id, tool_id) VALUES (36, 19);
INSERT INTO processes_tools (process_id, tool_id) VALUES (35, 19);
INSERT INTO processes_tools (process_id, tool_id) VALUES (39, 94);
INSERT INTO processes_tools (process_id, tool_id) VALUES (39, 91);
INSERT INTO processes_tools (process_id, tool_id) VALUES (30, 91);
INSERT INTO processes_tools (process_id, tool_id) VALUES (29, 91);
INSERT INTO processes_tools (process_id, tool_id) VALUES (17, 91);
INSERT INTO processes_tools (process_id, tool_id) VALUES (39, 95);
INSERT INTO processes_tools (process_id, tool_id) VALUES (18, 96);
INSERT INTO processes_tools (process_id, tool_id) VALUES (19, 97);
INSERT INTO processes_tools (process_id, tool_id) VALUES (19, 98);
INSERT INTO processes_tools (process_id, tool_id) VALUES (19, 99);
INSERT INTO processes_tools (process_id, tool_id) VALUES (19, 100);
INSERT INTO processes_tools (process_id, tool_id) VALUES (19, 101);
INSERT INTO processes_tools (process_id, tool_id) VALUES (19, 102);
INSERT INTO processes_tools (process_id, tool_id) VALUES (22, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (21, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (20, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (19, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (3, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (14, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (11, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (10, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (8, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (6, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (42, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (33, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (32, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (20, 103);
INSERT INTO processes_tools (process_id, tool_id) VALUES (20, 104);
INSERT INTO processes_tools (process_id, tool_id) VALUES (20, 105);
INSERT INTO processes_tools (process_id, tool_id) VALUES (20, 106);
INSERT INTO processes_tools (process_id, tool_id) VALUES (24, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (2, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (4, 5);
INSERT INTO processes_tools (process_id, tool_id) VALUES (31, 123);
INSERT INTO processes_tools (process_id, tool_id) VALUES (31, 124);
INSERT INTO processes_tools (process_id, tool_id) VALUES (31, 125);
INSERT INTO processes_tools (process_id, tool_id) VALUES (41, 126);
INSERT INTO processes_tools (process_id, tool_id) VALUES (41, 127);
INSERT INTO processes_tools (process_id, tool_id) VALUES (41, 128);
INSERT INTO processes_tools (process_id, tool_id) VALUES (41, 129);
INSERT INTO processes_tools (process_id, tool_id) VALUES (41, 130);
INSERT INTO processes_tools (process_id, tool_id) VALUES (41, 131);
INSERT INTO processes_tools (process_id, tool_id) VALUES (43, 133);
INSERT INTO processes_tools (process_id, tool_id) VALUES (43, 134);
INSERT INTO processes_tools (process_id, tool_id) VALUES (43, 132);
INSERT INTO processes_tools (process_id, tool_id) VALUES (41, 132);


--
-- TOC entry 1892 (class 0 OID 16771)
-- Dependencies: 1531
-- Data for Name: terms; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1893 (class 0 OID 16781)
-- Dependencies: 1533
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (53, 'Cost-Beneficts Analysis', NULL, NULL, NULL, NULL, '2009-12-10 04:56:16-05', '2009-12-10 04:56:16-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (44, 'Cost of Quality', NULL, NULL, NULL, NULL, '2009-12-10 04:19:16-05', '2009-12-10 04:56:23-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (55, 'Benchmarking', NULL, NULL, NULL, NULL, '2009-12-10 04:57:05-05', '2009-12-10 04:57:05-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (56, 'Design of Experiments', NULL, NULL, NULL, NULL, '2009-12-10 04:57:33-05', '2009-12-10 04:57:33-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (6, 'Project Management Information System', NULL, NULL, NULL, NULL, '2009-12-10 03:05:37-05', '2009-12-10 03:05:37-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (59, 'Propietary Quality Management Methodologies', NULL, NULL, NULL, NULL, '2009-12-10 04:58:46-05', '2009-12-10 04:58:46-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (60, 'Additional Quality Planning Tools', NULL, NULL, NULL, NULL, '2009-12-10 04:59:13-05', '2009-12-10 04:59:13-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (7, 'Change Control Meetings', NULL, NULL, NULL, NULL, '2009-12-10 03:07:42-05', '2009-12-10 03:07:42-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (61, 'Plan Quality and Perform Quality Control Tools and Techniques', NULL, NULL, NULL, NULL, '2009-12-10 05:28:21-05', '2009-12-10 05:28:21-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (8, 'Interviews', NULL, NULL, NULL, NULL, '2009-12-10 03:11:00-05', '2009-12-10 03:11:00-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (9, 'Focus Groups', NULL, NULL, NULL, NULL, '2009-12-10 03:11:15-05', '2009-12-10 03:11:15-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (11, 'Group Creativity Techniques', NULL, NULL, NULL, NULL, '2009-12-10 03:12:06-05', '2009-12-10 03:12:06-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (12, 'Questionnaires and Surveys', NULL, NULL, NULL, NULL, '2009-12-10 03:12:51-05', '2009-12-10 03:12:51-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (13, 'Observation', NULL, NULL, NULL, NULL, '2009-12-10 03:13:07-05', '2009-12-10 03:13:07-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (14, 'Prototypes', NULL, NULL, NULL, NULL, '2009-12-10 03:13:20-05', '2009-12-10 03:13:20-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (62, 'Quality Audits', NULL, NULL, NULL, NULL, '2009-12-10 05:28:36-05', '2009-12-10 05:28:36-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (15, 'Product Analysis', NULL, NULL, NULL, NULL, '2009-12-10 03:14:06-05', '2009-12-10 03:14:06-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (16, 'Alternatives Identification', NULL, NULL, NULL, NULL, '2009-12-10 03:14:33-05', '2009-12-10 03:14:33-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (10, 'Facilitated Workshops', NULL, NULL, NULL, NULL, '2009-12-10 03:11:37-05', '2009-12-10 03:14:55-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (17, 'Decomposition', NULL, NULL, NULL, NULL, '2009-12-10 03:15:22-05', '2009-12-10 03:17:17-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (20, 'Rolling Wave Planning', NULL, NULL, NULL, NULL, '2009-12-10 03:17:39-05', '2009-12-10 03:17:39-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (21, 'Templates', NULL, NULL, NULL, NULL, '2009-12-10 03:17:51-05', '2009-12-10 03:17:51-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (63, 'Process Analysis', NULL, NULL, NULL, NULL, '2009-12-10 05:28:49-05', '2009-12-10 05:28:49-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (22, 'Precedence Diagramming Method (PDM)', NULL, NULL, NULL, NULL, '2009-12-10 03:18:56-05', '2009-12-10 03:18:56-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (23, 'Dependency Determination', NULL, NULL, NULL, NULL, '2009-12-10 03:19:37-05', '2009-12-10 03:19:37-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (24, 'Apply Leads and Lags', NULL, NULL, NULL, NULL, '2009-12-10 03:20:29-05', '2009-12-10 03:20:29-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (25, 'Schedule Network Templates', NULL, NULL, NULL, NULL, '2009-12-10 03:21:56-05', '2009-12-10 03:21:56-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (64, 'Cause and Effect Diagrams', NULL, NULL, NULL, NULL, '2009-12-10 05:40:19-05', '2009-12-10 05:40:19-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (26, 'Alternatives Analysis', NULL, NULL, NULL, NULL, '2009-12-10 03:23:16-05', '2009-12-10 03:23:16-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (27, 'Published Estimating Data', NULL, NULL, NULL, NULL, '2009-12-10 03:40:06-05', '2009-12-10 03:40:06-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (54, 'Control Charts', NULL, NULL, NULL, NULL, '2009-12-10 04:56:41-05', '2009-12-10 05:40:34-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (34, 'Schedule Network Analysis', NULL, NULL, NULL, NULL, '2009-12-10 04:00:23-05', '2009-12-10 04:00:23-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (35, 'Critical Path Method (CPM)', NULL, NULL, NULL, NULL, '2009-12-10 04:00:51-05', '2009-12-10 04:00:51-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (36, 'Critical Chain Method', NULL, NULL, NULL, NULL, '2009-12-10 04:01:12-05', '2009-12-10 04:01:12-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (58, 'Flowcharting', NULL, NULL, NULL, NULL, '2009-12-10 04:58:07-05', '2009-12-10 05:40:45-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (65, 'Histogram', NULL, NULL, NULL, NULL, '2009-12-10 05:41:30-05', '2009-12-10 05:41:30-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (37, 'Resource Leveling', NULL, NULL, NULL, NULL, '2009-12-10 04:01:31-05', '2009-12-10 04:09:43-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (38, 'What-If Scenario Analysis (Monte Carlo Analysis)', NULL, NULL, NULL, NULL, '2009-12-10 04:02:42-05', '2009-12-10 04:09:50-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (39, 'Adjusting Leads and Lags', NULL, NULL, NULL, NULL, '2009-12-10 04:03:17-05', '2009-12-10 04:10:19-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (40, 'Schedule Compression', NULL, NULL, NULL, NULL, '2009-12-10 04:03:51-05', '2009-12-10 04:11:09-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (41, 'Scheduling Tool', NULL, NULL, NULL, NULL, '2009-12-10 04:05:19-05', '2009-12-10 04:11:23-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (30, 'Analogous Estimating', NULL, NULL, NULL, NULL, '2009-12-10 03:42:06-05', '2009-12-10 04:17:27-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (31, 'Parametric Estimating', NULL, NULL, NULL, NULL, '2009-12-10 03:42:23-05', '2009-12-10 04:17:52-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (28, 'Bottom-Up Estimating', NULL, NULL, NULL, NULL, '2009-12-10 03:40:23-05', '2009-12-10 04:18:04-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (32, 'Three-Point Estimates', NULL, NULL, NULL, NULL, '2009-12-10 03:42:48-05', '2009-12-10 04:18:13-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (66, 'Pareto Chart', NULL, NULL, NULL, NULL, '2009-12-10 05:42:21-05', '2009-12-10 05:42:21-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (45, 'Project Management Estimating Software', NULL, NULL, NULL, NULL, '2009-12-10 04:19:48-05', '2009-12-10 04:19:48-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (46, 'Vendor Bid Analysis', NULL, NULL, NULL, NULL, '2009-12-10 04:20:32-05', '2009-12-10 04:20:32-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (47, 'Cost Aggregation', NULL, NULL, NULL, NULL, '2009-12-10 04:23:16-05', '2009-12-10 04:23:16-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (88, 'Communication Requirements Analysis', NULL, NULL, NULL, NULL, '2009-12-10 06:10:29-05', '2009-12-10 06:10:29-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (48, 'Historical Relationships', NULL, NULL, NULL, NULL, '2009-12-10 04:25:37-05', '2009-12-10 04:25:37-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (49, 'Funding Limit Reconciliation', NULL, NULL, NULL, NULL, '2009-12-10 04:25:55-05', '2009-12-10 04:25:55-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (50, 'Earned Value Measurement', NULL, NULL, NULL, NULL, '2009-12-10 04:27:46-05', '2009-12-10 04:27:46-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (51, 'Forecasting', NULL, NULL, NULL, NULL, '2009-12-10 04:27:55-05', '2009-12-10 04:27:55-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (52, 'TCPI', NULL, NULL, NULL, NULL, '2009-12-10 04:28:05-05', '2009-12-10 04:28:05-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (42, 'Performance Reviews', NULL, NULL, NULL, NULL, '2009-12-10 04:07:38-05', '2009-12-10 04:28:35-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (94, 'Forecasting Methods', NULL, NULL, NULL, NULL, '2009-12-10 06:31:11-05', '2009-12-10 06:31:11-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (29, 'Project Management Software', NULL, NULL, NULL, NULL, '2009-12-10 03:40:43-05', '2009-12-10 04:29:22-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (67, 'Run Chart', NULL, NULL, NULL, NULL, '2009-12-10 05:42:36-05', '2009-12-10 05:42:36-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (68, 'Scatter Diagram', NULL, NULL, NULL, NULL, '2009-12-10 05:42:52-05', '2009-12-10 05:42:52-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (57, 'Statistical Sampling', NULL, NULL, NULL, NULL, '2009-12-10 04:57:49-05', '2009-12-10 05:43:09-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (18, 'Inspection', NULL, NULL, NULL, NULL, '2009-12-10 03:15:54-05', '2009-12-10 05:43:23-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (69, 'Approved Change Request Review', NULL, NULL, NULL, NULL, '2009-12-10 05:43:49-05', '2009-12-10 05:43:49-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (70, 'Organizational Charts and Position Descriptions', NULL, NULL, NULL, NULL, '2009-12-10 05:45:16-05', '2009-12-10 05:45:16-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (71, 'Networking', NULL, NULL, NULL, NULL, '2009-12-10 05:48:09-05', '2009-12-10 05:48:09-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (72, 'Organizational Theory', NULL, NULL, NULL, NULL, '2009-12-10 05:48:24-05', '2009-12-10 05:48:24-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (73, 'Pre-assigment', NULL, NULL, NULL, NULL, '2009-12-10 05:49:16-05', '2009-12-10 05:49:16-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (74, 'Negotiation', NULL, NULL, NULL, NULL, '2009-12-10 05:49:52-05', '2009-12-10 05:49:52-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (75, 'Acquisition', NULL, NULL, NULL, NULL, '2009-12-10 05:50:10-05', '2009-12-10 05:50:10-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (76, 'Virtual Teams', NULL, NULL, NULL, NULL, '2009-12-10 05:50:24-05', '2009-12-10 05:50:24-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (78, 'Training', NULL, NULL, NULL, NULL, '2009-12-10 05:51:55-05', '2009-12-10 05:51:55-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (79, 'Team-Building Activities', NULL, NULL, NULL, NULL, '2009-12-10 05:52:16-05', '2009-12-10 05:52:16-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (80, 'Ground Rules', NULL, NULL, NULL, NULL, '2009-12-10 05:52:31-05', '2009-12-10 05:52:31-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (81, 'Co-Location', NULL, NULL, NULL, NULL, '2009-12-10 05:52:45-05', '2009-12-10 05:52:45-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (82, 'Recognition and Rewards (Theories of Motivation)', NULL, NULL, NULL, NULL, '2009-12-10 05:53:18-05', '2009-12-10 05:53:18-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (83, 'Observation and Conversation', NULL, NULL, NULL, NULL, '2009-12-10 05:58:34-05', '2009-12-10 05:58:34-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (84, 'Project Personal Appraisals', NULL, NULL, NULL, NULL, '2009-12-10 05:59:10-05', '2009-12-10 05:59:10-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (85, 'Conflict Management', NULL, NULL, NULL, NULL, '2009-12-10 05:59:26-05', '2009-12-10 05:59:26-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (86, 'Issue Log', NULL, NULL, NULL, NULL, '2009-12-10 06:04:26-05', '2009-12-10 06:04:26-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (93, 'Management Skills', NULL, NULL, NULL, NULL, '2009-12-10 06:28:32-05', '2009-12-10 06:28:32-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (87, 'Stakeholder Analysis', NULL, NULL, NULL, NULL, '2009-12-10 06:09:06-05', '2009-12-10 06:09:06-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (5, 'Expert Judgment', NULL, NULL, NULL, NULL, '2009-12-10 02:16:00-05', '2009-12-10 07:23:08-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (89, 'Communication Technology', NULL, NULL, NULL, NULL, '2009-12-10 06:10:56-05', '2009-12-10 06:10:56-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (90, 'Communication Models', NULL, NULL, NULL, NULL, '2009-12-10 06:11:11-05', '2009-12-10 06:11:11-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (77, 'Interpersonal Skills (Soft Skills)', NULL, NULL, NULL, NULL, '2009-12-10 05:51:44-05', '2009-12-10 06:26:58-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (92, 'Information Distribution Tools', NULL, NULL, NULL, NULL, '2009-12-10 06:24:46-05', '2009-12-10 06:24:46-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (33, 'Reserve Analysis', NULL, NULL, NULL, NULL, '2009-12-10 03:44:06-05', '2009-12-10 07:13:34-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (19, 'Variance Analysis', NULL, NULL, NULL, NULL, '2009-12-10 03:16:36-05', '2009-12-10 06:30:29-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (91, 'Communication Methods', NULL, NULL, NULL, NULL, '2009-12-10 06:19:43-05', '2009-12-10 06:31:20-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (95, 'Reporting Systems', NULL, NULL, NULL, NULL, '2009-12-10 06:31:42-05', '2009-12-10 06:31:42-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (96, 'Planning Meetings and Analysis', NULL, NULL, NULL, NULL, '2009-12-10 06:33:43-05', '2009-12-10 06:33:43-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (97, 'Documentation Reviews', NULL, NULL, NULL, NULL, '2009-12-10 06:35:43-05', '2009-12-10 06:35:43-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (98, 'Information Gathering Techniques', NULL, NULL, NULL, NULL, '2009-12-10 06:36:13-05', '2009-12-10 06:36:13-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (99, 'Checklist Analysis', NULL, NULL, NULL, NULL, '2009-12-10 06:36:35-05', '2009-12-10 06:36:35-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (100, 'Assumptions Analysis', NULL, NULL, NULL, NULL, '2009-12-10 06:37:09-05', '2009-12-10 06:37:09-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (101, 'Diagramming Techniques', NULL, NULL, NULL, NULL, '2009-12-10 06:37:28-05', '2009-12-10 06:37:28-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (102, 'Strengths, Weaknesses, Opportunities and Threats (SWOT) Analysis', NULL, NULL, NULL, NULL, '2009-12-10 06:38:43-05', '2009-12-10 06:38:43-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (103, 'Risk Probability and Impact Assessment / Probability and Impact Matrix (PIM)', NULL, NULL, NULL, NULL, '2009-12-10 06:40:48-05', '2009-12-10 06:40:48-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (104, 'Risk Data Quality Assessment', NULL, NULL, NULL, NULL, '2009-12-10 06:41:15-05', '2009-12-10 06:41:15-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (105, 'Risk Categorization', NULL, NULL, NULL, NULL, '2009-12-10 06:41:38-05', '2009-12-10 06:41:38-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (106, 'Risk Urgency Assessment', NULL, NULL, NULL, NULL, '2009-12-10 06:42:02-05', '2009-12-10 06:42:02-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (107, 'Data Gathering and Representation Techniques', NULL, NULL, NULL, NULL, '2009-12-10 06:43:32-05', '2009-12-10 06:43:32-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (108, 'Probability Distributions', NULL, NULL, NULL, NULL, '2009-12-10 06:43:50-05', '2009-12-10 06:43:50-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (109, 'Quantitative Risk Analysis and Modeling Techniques', NULL, NULL, NULL, NULL, '2009-12-10 06:45:01-05', '2009-12-10 06:45:01-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (110, 'Strategies for Negative Risks, or Threats', NULL, NULL, NULL, NULL, '2009-12-10 07:07:44-05', '2009-12-10 07:07:44-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (111, 'Strategies for Positive Risks, or Opportunities', NULL, NULL, NULL, NULL, '2009-12-10 07:08:10-05', '2009-12-10 07:08:10-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (112, 'Contingent Response Strategies', NULL, NULL, NULL, NULL, '2009-12-10 07:08:37-05', '2009-12-10 07:08:37-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (113, 'Risk Reassessment', NULL, NULL, NULL, NULL, '2009-12-10 07:11:01-05', '2009-12-10 07:11:01-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (114, 'Risk Audits', NULL, NULL, NULL, NULL, '2009-12-10 07:11:51-05', '2009-12-10 07:11:51-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (115, 'Variance and Trends Analysis', NULL, NULL, NULL, NULL, '2009-12-10 07:12:28-05', '2009-12-10 07:12:28-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (116, 'Thecnical Performance Measurements', NULL, NULL, NULL, NULL, '2009-12-10 07:13:08-05', '2009-12-10 07:13:08-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (117, 'Status Meetings', NULL, NULL, NULL, NULL, '2009-12-10 07:14:09-05', '2009-12-10 07:14:09-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (118, 'Make-or-Buy Analysis', NULL, NULL, NULL, NULL, '2009-12-10 07:17:52-05', '2009-12-10 07:17:52-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (119, 'Contract Types', NULL, NULL, NULL, NULL, '2009-12-10 07:18:25-05', '2009-12-10 07:18:25-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (120, 'Bidder Conferences', NULL, NULL, NULL, NULL, '2009-12-10 07:21:59-05', '2009-12-10 07:21:59-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (121, 'Proposal Evaluation Techniques', NULL, NULL, NULL, NULL, '2009-12-10 07:22:36-05', '2009-12-10 07:22:36-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (122, 'Independent Estimates', NULL, NULL, NULL, NULL, '2009-12-10 07:22:52-05', '2009-12-10 07:22:52-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (123, 'Advertising', NULL, NULL, NULL, NULL, '2009-12-10 07:23:23-05', '2009-12-10 07:23:23-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (124, 'Internet Search', NULL, NULL, NULL, NULL, '2009-12-10 07:23:43-05', '2009-12-10 07:23:43-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (125, 'Procurement Negotiations', NULL, NULL, NULL, NULL, '2009-12-10 07:24:05-05', '2009-12-10 07:24:05-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (126, 'Contract Change Control System', NULL, NULL, NULL, NULL, '2009-12-10 07:25:18-05', '2009-12-10 07:25:18-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (127, 'Procurement Performance Reviews', NULL, NULL, NULL, NULL, '2009-12-10 07:25:39-05', '2009-12-10 07:25:39-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (128, 'Inspections and Audits', NULL, NULL, NULL, NULL, '2009-12-10 07:26:02-05', '2009-12-10 07:26:02-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (129, 'Performance Reporting', NULL, NULL, NULL, NULL, '2009-12-10 07:26:30-05', '2009-12-10 07:26:30-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (130, 'Payment Systems', NULL, NULL, NULL, NULL, '2009-12-10 07:26:52-05', '2009-12-10 07:26:52-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (131, 'Claims Administration', NULL, NULL, NULL, NULL, '2009-12-10 07:27:31-05', '2009-12-10 07:27:31-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (133, 'Procurement Audits', NULL, NULL, NULL, NULL, '2009-12-10 07:29:55-05', '2009-12-10 07:29:55-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (134, 'Negotiated Settlements', NULL, NULL, NULL, NULL, '2009-12-10 07:30:22-05', '2009-12-10 07:30:22-05', 0);
INSERT INTO tools (id, name, description, nombre, descripcion, notes, created, modified, is_key) VALUES (132, 'Records Management System', NULL, NULL, NULL, NULL, '2009-12-10 07:27:50-05', '2009-12-10 07:31:05-05', 0);


--
-- TOC entry 1841 (class 2606 OID 16801)
-- Dependencies: 1518 1518
-- Name: pk_documents; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT pk_documents PRIMARY KEY (id);


--
-- TOC entry 1847 (class 2606 OID 16803)
-- Dependencies: 1520 1520
-- Name: pk_inputs; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inputs
    ADD CONSTRAINT pk_inputs PRIMARY KEY (id);


--
-- TOC entry 1851 (class 2606 OID 16805)
-- Dependencies: 1522 1522
-- Name: pk_knowledge_areas; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY knowledge_areas
    ADD CONSTRAINT pk_knowledge_areas PRIMARY KEY (id);


--
-- TOC entry 1855 (class 2606 OID 16807)
-- Dependencies: 1524 1524
-- Name: pk_outputs; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outputs
    ADD CONSTRAINT pk_outputs PRIMARY KEY (id);


--
-- TOC entry 1859 (class 2606 OID 16809)
-- Dependencies: 1526 1526
-- Name: pk_process_groups; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY process_groups
    ADD CONSTRAINT pk_process_groups PRIMARY KEY (id);


--
-- TOC entry 1863 (class 2606 OID 16811)
-- Dependencies: 1528 1528
-- Name: pk_processes; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY processes
    ADD CONSTRAINT pk_processes PRIMARY KEY (id);


--
-- TOC entry 1867 (class 2606 OID 16813)
-- Dependencies: 1530 1530 1530
-- Name: pk_processes_tools; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY processes_tools
    ADD CONSTRAINT pk_processes_tools PRIMARY KEY (process_id, tool_id);


--
-- TOC entry 1871 (class 2606 OID 16815)
-- Dependencies: 1531 1531
-- Name: pk_terms; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY terms
    ADD CONSTRAINT pk_terms PRIMARY KEY (id);


--
-- TOC entry 1875 (class 2606 OID 16817)
-- Dependencies: 1533 1533
-- Name: pk_tools; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tools
    ADD CONSTRAINT pk_tools PRIMARY KEY (id);


--
-- TOC entry 1843 (class 2606 OID 16819)
-- Dependencies: 1518 1518
-- Name: uk_documents_name; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT uk_documents_name UNIQUE (name);


--
-- TOC entry 1849 (class 2606 OID 16821)
-- Dependencies: 1520 1520 1520
-- Name: uk_inputs; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inputs
    ADD CONSTRAINT uk_inputs UNIQUE (document_id, process_id);


--
-- TOC entry 1857 (class 2606 OID 16823)
-- Dependencies: 1524 1524 1524
-- Name: uk_outputs; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outputs
    ADD CONSTRAINT uk_outputs UNIQUE (document_id, process_id);


--
-- TOC entry 1865 (class 2606 OID 16825)
-- Dependencies: 1528 1528
-- Name: uk_processes_name; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY processes
    ADD CONSTRAINT uk_processes_name UNIQUE (name);


--
-- TOC entry 1873 (class 2606 OID 16827)
-- Dependencies: 1531 1531
-- Name: uk_terms_name; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY terms
    ADD CONSTRAINT uk_terms_name UNIQUE (name);


--
-- TOC entry 1839 (class 1259 OID 16828)
-- Dependencies: 1518
-- Name: fki_documents_related; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_documents_related ON documents USING btree (related);


--
-- TOC entry 1844 (class 1259 OID 16829)
-- Dependencies: 1520
-- Name: fki_inputs_documents; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_inputs_documents ON inputs USING btree (document_id);


--
-- TOC entry 1845 (class 1259 OID 16830)
-- Dependencies: 1520
-- Name: fki_inputs_processes; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_inputs_processes ON inputs USING btree (process_id);


--
-- TOC entry 1852 (class 1259 OID 16831)
-- Dependencies: 1524
-- Name: fki_outputs_documents; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_outputs_documents ON outputs USING btree (document_id);


--
-- TOC entry 1853 (class 1259 OID 16832)
-- Dependencies: 1524
-- Name: fki_outputs_processes; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_outputs_processes ON outputs USING btree (process_id);


--
-- TOC entry 1860 (class 1259 OID 16833)
-- Dependencies: 1528
-- Name: fki_processes_knowledge_areas; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_processes_knowledge_areas ON processes USING btree (knowledge_area_id);


--
-- TOC entry 1861 (class 1259 OID 16834)
-- Dependencies: 1528
-- Name: fki_processes_process_groups; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_processes_process_groups ON processes USING btree (process_group_id);


--
-- TOC entry 1868 (class 1259 OID 16835)
-- Dependencies: 1531
-- Name: fki_terms_related; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_terms_related ON terms USING btree (related);


--
-- TOC entry 1869 (class 1259 OID 16836)
-- Dependencies: 1531
-- Name: fki_terms_synonym; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_terms_synonym ON terms USING btree (synonym);


--
-- TOC entry 1876 (class 2606 OID 16837)
-- Dependencies: 1518 1840 1518
-- Name: fk_documents_related; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT fk_documents_related FOREIGN KEY (related) REFERENCES documents(id);


--
-- TOC entry 1877 (class 2606 OID 16842)
-- Dependencies: 1520 1840 1518
-- Name: fk_inputs_documents; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inputs
    ADD CONSTRAINT fk_inputs_documents FOREIGN KEY (document_id) REFERENCES documents(id) ON UPDATE CASCADE;


--
-- TOC entry 1878 (class 2606 OID 16847)
-- Dependencies: 1520 1528 1862
-- Name: fk_inputs_processes; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inputs
    ADD CONSTRAINT fk_inputs_processes FOREIGN KEY (process_id) REFERENCES processes(id) ON UPDATE CASCADE;


--
-- TOC entry 1879 (class 2606 OID 16852)
-- Dependencies: 1524 1518 1840
-- Name: fk_outputs_documents; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outputs
    ADD CONSTRAINT fk_outputs_documents FOREIGN KEY (document_id) REFERENCES documents(id) ON UPDATE CASCADE;


--
-- TOC entry 1880 (class 2606 OID 16857)
-- Dependencies: 1528 1524 1862
-- Name: fk_outputs_processes; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outputs
    ADD CONSTRAINT fk_outputs_processes FOREIGN KEY (process_id) REFERENCES processes(id) ON UPDATE CASCADE;


--
-- TOC entry 1881 (class 2606 OID 16862)
-- Dependencies: 1528 1522 1850
-- Name: fk_processes_knowledge_areas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY processes
    ADD CONSTRAINT fk_processes_knowledge_areas FOREIGN KEY (knowledge_area_id) REFERENCES knowledge_areas(id) ON UPDATE CASCADE;


--
-- TOC entry 1882 (class 2606 OID 16867)
-- Dependencies: 1528 1526 1858
-- Name: fk_processes_process_groups; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY processes
    ADD CONSTRAINT fk_processes_process_groups FOREIGN KEY (process_group_id) REFERENCES process_groups(id) ON UPDATE CASCADE;


--
-- TOC entry 1883 (class 2606 OID 16872)
-- Dependencies: 1531 1531 1870
-- Name: fk_terms_related; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terms
    ADD CONSTRAINT fk_terms_related FOREIGN KEY (related) REFERENCES terms(id) ON UPDATE CASCADE;


--
-- TOC entry 1884 (class 2606 OID 16877)
-- Dependencies: 1870 1531 1531
-- Name: fk_terms_synonym; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terms
    ADD CONSTRAINT fk_terms_synonym FOREIGN KEY (synonym) REFERENCES terms(id) ON UPDATE CASCADE;


--
-- TOC entry 1898 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-07-15 10:23:05 ECT

--
-- PostgreSQL database dump complete
--

