--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2018-02-19 22:19:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2154 (class 1262 OID 16394)
-- Name: HospitalDatabase; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "HospitalDatabase" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Greek_Greece.1253' LC_CTYPE = 'Greek_Greece.1253';


ALTER DATABASE "HospitalDatabase" OWNER TO postgres;

\connect "HospitalDatabase"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 16415)
-- Name: appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE appointment (
    id integer NOT NULL,
    patientamka character varying(12) NOT NULL,
    doctoramka character varying(12) NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL
);


ALTER TABLE appointment OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16413)
-- Name: appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE appointment_id_seq OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 187
-- Name: appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE appointment_id_seq OWNED BY appointment.id;


--
-- TOC entry 186 (class 1259 OID 16403)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE doctors (
    amka character varying(12) NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    speciality character varying(20) NOT NULL,
    region character varying(20) NOT NULL,
    email character varying(20) NOT NULL,
    telephone character varying(10)
);


ALTER TABLE doctors OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16431)
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schedule (
    amka character varying(12) NOT NULL,
    monday boolean[] NOT NULL,
    tuesday boolean[] NOT NULL,
    wednesday boolean[] NOT NULL,
    thursday boolean[] NOT NULL,
    friday boolean[] NOT NULL
);


ALTER TABLE schedule OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16395)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    amka character varying(12) NOT NULL,
    password text NOT NULL,
    usertype character varying(6)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2015 (class 2604 OID 16418)
-- Name: appointment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointment ALTER COLUMN id SET DEFAULT nextval('appointment_id_seq'::regclass);


--
-- TOC entry 2148 (class 0 OID 16415)
-- Dependencies: 188
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 187
-- Name: appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appointment_id_seq', 1, false);


--
-- TOC entry 2146 (class 0 OID 16403)
-- Dependencies: 186
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2149 (class 0 OID 16431)
-- Dependencies: 189
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2145 (class 0 OID 16395)
-- Dependencies: 185
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (amka, password, usertype) VALUES ('1312312312', '12312312312', 'user');
INSERT INTO users (amka, password, usertype) VALUES ('123456789', '12345', 'user');


--
-- TOC entry 2017 (class 2606 OID 16402)
-- Name: users PKusers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "PKusers" PRIMARY KEY (amka);


--
-- TOC entry 2021 (class 2606 OID 16420)
-- Name: appointment appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (id);


--
-- TOC entry 2019 (class 2606 OID 16407)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (amka);


--
-- TOC entry 2023 (class 2606 OID 16438)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (amka);


--
-- TOC entry 2025 (class 2606 OID 16421)
-- Name: appointment appointment_doctorAmka_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT "appointment_doctorAmka_fkey" FOREIGN KEY (doctoramka) REFERENCES doctors(amka) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2026 (class 2606 OID 16426)
-- Name: appointment appointment_patientAmka_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT "appointment_patientAmka_fkey" FOREIGN KEY (patientamka) REFERENCES users(amka) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2024 (class 2606 OID 16408)
-- Name: doctors doctors_amka_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_amka_fkey FOREIGN KEY (amka) REFERENCES users(amka);


--
-- TOC entry 2027 (class 2606 OID 16439)
-- Name: schedule schedule_amka_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_amka_fkey FOREIGN KEY (amka) REFERENCES doctors(amka) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-02-19 22:19:01

--
-- PostgreSQL database dump complete
--

