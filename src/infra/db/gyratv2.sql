--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 17.5

-- Started on 2025-12-17 11:47:29 +05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 310 (class 1259 OID 10312503)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "fullName" character varying DEFAULT ''::character varying NOT NULL,
    company character varying DEFAULT ''::character varying NOT NULL,
    "streetLine1" character varying NOT NULL,
    "streetLine2" character varying DEFAULT ''::character varying NOT NULL,
    city character varying DEFAULT ''::character varying NOT NULL,
    province character varying DEFAULT ''::character varying NOT NULL,
    "postalCode" character varying DEFAULT ''::character varying NOT NULL,
    "phoneNumber" character varying DEFAULT ''::character varying NOT NULL,
    "defaultShippingAddress" boolean DEFAULT false NOT NULL,
    "defaultBillingAddress" boolean DEFAULT false NOT NULL,
    id integer NOT NULL,
    "customerId" integer,
    "countryId" integer
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 10312502)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.address_id_seq OWNER TO postgres;

--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 309
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- TOC entry 312 (class 1259 OID 10312525)
-- Name: administrator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrator (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "emailAddress" character varying NOT NULL,
    id integer NOT NULL,
    "userId" integer
);


ALTER TABLE public.administrator OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 10312524)
-- Name: administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.administrator_id_seq OWNER TO postgres;

--
-- TOC entry 4781 (class 0 OID 0)
-- Dependencies: 311
-- Name: administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrator_id_seq OWNED BY public.administrator.id;


--
-- TOC entry 246 (class 1259 OID 10312089)
-- Name: asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    "mimeType" character varying NOT NULL,
    width integer DEFAULT 0 NOT NULL,
    height integer DEFAULT 0 NOT NULL,
    "fileSize" integer NOT NULL,
    source character varying NOT NULL,
    preview character varying NOT NULL,
    "focalPoint" text,
    id integer NOT NULL
);


ALTER TABLE public.asset OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 10312734)
-- Name: asset_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_channels_channel (
    "assetId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.asset_channels_channel OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 10312088)
-- Name: asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asset_id_seq OWNER TO postgres;

--
-- TOC entry 4782 (class 0 OID 0)
-- Dependencies: 245
-- Name: asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_id_seq OWNED BY public.asset.id;


--
-- TOC entry 340 (class 1259 OID 10312727)
-- Name: asset_tags_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_tags_tag (
    "assetId" integer NOT NULL,
    "tagId" integer NOT NULL
);


ALTER TABLE public.asset_tags_tag OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 10312439)
-- Name: authentication_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_method (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    identifier character varying,
    "passwordHash" character varying,
    "verificationToken" character varying,
    "passwordResetToken" character varying,
    "identifierChangeToken" character varying,
    "pendingIdentifier" character varying,
    strategy character varying,
    "externalIdentifier" character varying,
    metadata text,
    id integer NOT NULL,
    type character varying NOT NULL,
    "userId" integer
);


ALTER TABLE public.authentication_method OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 10312438)
-- Name: authentication_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authentication_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authentication_method_id_seq OWNER TO postgres;

--
-- TOC entry 4783 (class 0 OID 0)
-- Dependencies: 299
-- Name: authentication_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authentication_method_id_seq OWNED BY public.authentication_method.id;


--
-- TOC entry 324 (class 1259 OID 10312602)
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    token character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    "defaultLanguageCode" character varying NOT NULL,
    "availableLanguageCodes" text,
    "defaultCurrencyCode" character varying NOT NULL,
    "availableCurrencyCodes" text,
    "trackInventory" boolean DEFAULT true NOT NULL,
    "outOfStockThreshold" integer DEFAULT 0 NOT NULL,
    "pricesIncludeTax" boolean NOT NULL,
    id integer NOT NULL,
    "sellerId" integer,
    "defaultTaxZoneId" integer,
    "defaultShippingZoneId" integer
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 10312601)
-- Name: channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.channel_id_seq OWNER TO postgres;

--
-- TOC entry 4784 (class 0 OID 0)
-- Dependencies: 323
-- Name: channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_id_seq OWNED BY public.channel.id;


--
-- TOC entry 220 (class 1259 OID 10311930)
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "isRoot" boolean DEFAULT false NOT NULL,
    "position" integer NOT NULL,
    "isPrivate" boolean DEFAULT false NOT NULL,
    filters text NOT NULL,
    "inheritFilters" boolean DEFAULT true NOT NULL,
    id integer NOT NULL,
    "parentId" integer,
    "featuredAssetId" integer
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 10311906)
-- Name: collection_asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "assetId" integer NOT NULL,
    "position" integer NOT NULL,
    "collectionId" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.collection_asset OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 10311905)
-- Name: collection_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collection_asset_id_seq OWNER TO postgres;

--
-- TOC entry 4785 (class 0 OID 0)
-- Dependencies: 215
-- Name: collection_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_asset_id_seq OWNED BY public.collection_asset.id;


--
-- TOC entry 335 (class 1259 OID 10312692)
-- Name: collection_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_channels_channel (
    "collectionId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.collection_channels_channel OWNER TO postgres;

--
-- TOC entry 357 (class 1259 OID 10312846)
-- Name: collection_closure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_closure (
    id_ancestor integer NOT NULL,
    id_descendant integer NOT NULL
);


ALTER TABLE public.collection_closure OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 10311929)
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collection_id_seq OWNER TO postgres;

--
-- TOC entry 4786 (class 0 OID 0)
-- Dependencies: 219
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- TOC entry 334 (class 1259 OID 10312685)
-- Name: collection_product_variants_product_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_product_variants_product_variant (
    "collectionId" integer NOT NULL,
    "productVariantId" integer NOT NULL
);


ALTER TABLE public.collection_product_variants_product_variant OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 10311917)
-- Name: collection_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    description text NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.collection_translation OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 10311916)
-- Name: collection_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collection_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4787 (class 0 OID 0)
-- Dependencies: 217
-- Name: collection_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_translation_id_seq OWNED BY public.collection_translation.id;


--
-- TOC entry 308 (class 1259 OID 10312490)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    title character varying,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "phoneNumber" character varying,
    "emailAddress" character varying NOT NULL,
    id integer NOT NULL,
    "userId" integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 355 (class 1259 OID 10312832)
-- Name: customer_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_channels_channel (
    "customerId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.customer_channels_channel OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 10312428)
-- Name: customer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_group (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.customer_group OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 10312427)
-- Name: customer_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_group_id_seq OWNER TO postgres;

--
-- TOC entry 4788 (class 0 OID 0)
-- Dependencies: 297
-- Name: customer_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_group_id_seq OWNED BY public.customer_group.id;


--
-- TOC entry 354 (class 1259 OID 10312825)
-- Name: customer_groups_customer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_groups_customer_group (
    "customerId" integer NOT NULL,
    "customerGroupId" integer NOT NULL
);


ALTER TABLE public.customer_groups_customer_group OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 10312489)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 307
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 224 (class 1259 OID 10311957)
-- Name: facet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facet (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "isPrivate" boolean DEFAULT false NOT NULL,
    code character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.facet OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 10312699)
-- Name: facet_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facet_channels_channel (
    "facetId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.facet_channels_channel OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 10311956)
-- Name: facet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facet_id_seq OWNER TO postgres;

--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 223
-- Name: facet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facet_id_seq OWNED BY public.facet.id;


--
-- TOC entry 222 (class 1259 OID 10311945)
-- Name: facet_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facet_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.facet_translation OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 10311944)
-- Name: facet_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facet_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facet_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 221
-- Name: facet_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facet_translation_id_seq OWNED BY public.facet_translation.id;


--
-- TOC entry 228 (class 1259 OID 10311983)
-- Name: facet_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facet_value (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    id integer NOT NULL,
    "facetId" integer NOT NULL
);


ALTER TABLE public.facet_value OWNER TO postgres;

--
-- TOC entry 337 (class 1259 OID 10312706)
-- Name: facet_value_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facet_value_channels_channel (
    "facetValueId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.facet_value_channels_channel OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 10311982)
-- Name: facet_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facet_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facet_value_id_seq OWNER TO postgres;

--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 227
-- Name: facet_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facet_value_id_seq OWNED BY public.facet_value.id;


--
-- TOC entry 226 (class 1259 OID 10311971)
-- Name: facet_value_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facet_value_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.facet_value_translation OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 10311970)
-- Name: facet_value_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facet_value_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facet_value_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 225
-- Name: facet_value_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facet_value_translation_id_seq OWNED BY public.facet_value_translation.id;


--
-- TOC entry 250 (class 1259 OID 10312118)
-- Name: fulfillment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    state character varying NOT NULL,
    "trackingCode" character varying DEFAULT ''::character varying NOT NULL,
    method character varying NOT NULL,
    "handlerCode" character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.fulfillment OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 10312117)
-- Name: fulfillment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fulfillment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fulfillment_id_seq OWNER TO postgres;

--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 249
-- Name: fulfillment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fulfillment_id_seq OWNED BY public.fulfillment.id;


--
-- TOC entry 314 (class 1259 OID 10312540)
-- Name: global_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_settings (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "availableLanguages" text NOT NULL,
    "trackInventory" boolean DEFAULT true NOT NULL,
    "outOfStockThreshold" integer DEFAULT 0 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.global_settings OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 10312539)
-- Name: global_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.global_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.global_settings_id_seq OWNER TO postgres;

--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 313
-- Name: global_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_settings_id_seq OWNED BY public.global_settings.id;


--
-- TOC entry 326 (class 1259 OID 10312623)
-- Name: history_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_entry (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    type character varying NOT NULL,
    "isPublic" boolean NOT NULL,
    data text NOT NULL,
    id integer NOT NULL,
    discriminator character varying NOT NULL,
    "administratorId" integer,
    "customerId" integer,
    "orderId" integer
);


ALTER TABLE public.history_entry OWNER TO postgres;

--
-- TOC entry 325 (class 1259 OID 10312622)
-- Name: history_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.history_entry_id_seq OWNER TO postgres;

--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 325
-- Name: history_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_entry_id_seq OWNED BY public.history_entry.id;


--
-- TOC entry 328 (class 1259 OID 10312637)
-- Name: job_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_record (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "queueName" character varying NOT NULL,
    data text,
    state character varying NOT NULL,
    progress integer NOT NULL,
    result text,
    error character varying,
    "startedAt" timestamp(6) without time zone,
    "settledAt" timestamp(6) without time zone,
    "isSettled" boolean NOT NULL,
    retries integer NOT NULL,
    attempts integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.job_record OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 10312649)
-- Name: job_record_buffer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_record_buffer (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "bufferId" character varying NOT NULL,
    job text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.job_record_buffer OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 10312648)
-- Name: job_record_buffer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_record_buffer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_record_buffer_id_seq OWNER TO postgres;

--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 329
-- Name: job_record_buffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_record_buffer_id_seq OWNED BY public.job_record_buffer.id;


--
-- TOC entry 327 (class 1259 OID 10312636)
-- Name: job_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_record_id_seq OWNER TO postgres;

--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 327
-- Name: job_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_record_id_seq OWNED BY public.job_record.id;


--
-- TOC entry 359 (class 1259 OID 10316517)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 10316516)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 358
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 270 (class 1259 OID 10312240)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    type character varying DEFAULT 'Regular'::character varying NOT NULL,
    code character varying NOT NULL,
    state character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "orderPlacedAt" timestamp without time zone,
    "couponCodes" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "billingAddress" text NOT NULL,
    "currencyCode" character varying NOT NULL,
    id integer NOT NULL,
    "aggregateOrderId" integer,
    "customerId" integer,
    "taxZoneId" integer,
    "subTotal" integer NOT NULL,
    "subTotalWithTax" integer NOT NULL,
    shipping integer DEFAULT 0 NOT NULL,
    "shippingWithTax" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 10312769)
-- Name: order_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_channels_channel (
    "orderId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.order_channels_channel OWNER TO postgres;

--
-- TOC entry 345 (class 1259 OID 10312762)
-- Name: order_fulfillments_fulfillment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_fulfillments_fulfillment (
    "orderId" integer NOT NULL,
    "fulfillmentId" integer NOT NULL
);


ALTER TABLE public.order_fulfillments_fulfillment OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 10312239)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO postgres;

--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 269
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- TOC entry 276 (class 1259 OID 10312284)
-- Name: order_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    quantity integer NOT NULL,
    "orderPlacedQuantity" integer DEFAULT 0 NOT NULL,
    "listPriceIncludesTax" boolean NOT NULL,
    adjustments text NOT NULL,
    "taxLines" text NOT NULL,
    id integer NOT NULL,
    "sellerChannelId" integer,
    "shippingLineId" integer,
    "productVariantId" integer NOT NULL,
    "taxCategoryId" integer,
    "initialListPrice" integer,
    "listPrice" integer NOT NULL,
    "featuredAssetId" integer,
    "orderId" integer
);


ALTER TABLE public.order_line OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 10312283)
-- Name: order_line_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_line_id_seq OWNER TO postgres;

--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 275
-- Name: order_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_line_id_seq OWNED BY public.order_line.id;


--
-- TOC entry 248 (class 1259 OID 10312102)
-- Name: order_line_reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line_reference (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    quantity integer NOT NULL,
    id integer NOT NULL,
    "fulfillmentId" integer,
    "modificationId" integer,
    "orderLineId" integer NOT NULL,
    "refundId" integer,
    discriminator character varying NOT NULL
);


ALTER TABLE public.order_line_reference OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 10312101)
-- Name: order_line_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_line_reference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_line_reference_id_seq OWNER TO postgres;

--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 247
-- Name: order_line_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_line_reference_id_seq OWNED BY public.order_line_reference.id;


--
-- TOC entry 258 (class 1259 OID 10312167)
-- Name: order_modification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_modification (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    note character varying NOT NULL,
    "shippingAddressChange" text,
    "billingAddressChange" text,
    id integer NOT NULL,
    "priceChange" integer NOT NULL,
    "orderId" integer,
    "paymentId" integer,
    "refundId" integer
);


ALTER TABLE public.order_modification OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 10312166)
-- Name: order_modification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_modification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_modification_id_seq OWNER TO postgres;

--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 257
-- Name: order_modification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_modification_id_seq OWNED BY public.order_modification.id;


--
-- TOC entry 344 (class 1259 OID 10312755)
-- Name: order_promotions_promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_promotions_promotion (
    "orderId" integer NOT NULL,
    "promotionId" integer NOT NULL
);


ALTER TABLE public.order_promotions_promotion OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 10312142)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    method character varying NOT NULL,
    state character varying NOT NULL,
    "errorMessage" character varying,
    "transactionId" character varying,
    metadata text NOT NULL,
    id integer NOT NULL,
    amount integer NOT NULL,
    "orderId" integer
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 10312141)
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_id_seq OWNER TO postgres;

--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 253
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- TOC entry 318 (class 1259 OID 10312565)
-- Name: payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying DEFAULT ''::character varying NOT NULL,
    enabled boolean NOT NULL,
    checker text,
    handler text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.payment_method OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 10312839)
-- Name: payment_method_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method_channels_channel (
    "paymentMethodId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.payment_method_channels_channel OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 10312564)
-- Name: payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_method_id_seq OWNER TO postgres;

--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 317
-- Name: payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_method_id_seq OWNED BY public.payment_method.id;


--
-- TOC entry 316 (class 1259 OID 10312553)
-- Name: payment_method_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.payment_method_translation OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 10312552)
-- Name: payment_method_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_method_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_method_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 315
-- Name: payment_method_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_method_translation_id_seq OWNED BY public.payment_method_translation.id;


--
-- TOC entry 242 (class 1259 OID 10312067)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    enabled boolean DEFAULT true NOT NULL,
    id integer NOT NULL,
    "featuredAssetId" integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 10312043)
-- Name: product_asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "assetId" integer NOT NULL,
    "position" integer NOT NULL,
    "productId" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.product_asset OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 10312042)
-- Name: product_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_asset_id_seq OWNER TO postgres;

--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 237
-- Name: product_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_asset_id_seq OWNED BY public.product_asset.id;


--
-- TOC entry 339 (class 1259 OID 10312720)
-- Name: product_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_channels_channel (
    "productId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.product_channels_channel OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 10312713)
-- Name: product_facet_values_facet_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_facet_values_facet_value (
    "productId" integer NOT NULL,
    "facetValueId" integer NOT NULL
);


ALTER TABLE public.product_facet_values_facet_value OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 10312066)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 241
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 232 (class 1259 OID 10312007)
-- Name: product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    code character varying NOT NULL,
    id integer NOT NULL,
    "groupId" integer NOT NULL
);


ALTER TABLE public.product_option OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 10312031)
-- Name: product_option_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_group (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    code character varying NOT NULL,
    id integer NOT NULL,
    "productId" integer
);


ALTER TABLE public.product_option_group OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 10312030)
-- Name: product_option_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_option_group_id_seq OWNER TO postgres;

--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 235
-- Name: product_option_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_group_id_seq OWNED BY public.product_option_group.id;


--
-- TOC entry 234 (class 1259 OID 10312019)
-- Name: product_option_group_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_group_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_option_group_translation OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 10312018)
-- Name: product_option_group_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_group_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_option_group_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 233
-- Name: product_option_group_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_group_translation_id_seq OWNED BY public.product_option_group_translation.id;


--
-- TOC entry 231 (class 1259 OID 10312006)
-- Name: product_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_option_id_seq OWNER TO postgres;

--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_id_seq OWNED BY public.product_option.id;


--
-- TOC entry 230 (class 1259 OID 10311995)
-- Name: product_option_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_option_translation OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 10311994)
-- Name: product_option_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_option_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_option_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_translation_id_seq OWNED BY public.product_option_translation.id;


--
-- TOC entry 240 (class 1259 OID 10312054)
-- Name: product_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    description text NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_translation OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 10312053)
-- Name: product_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 239
-- Name: product_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_translation_id_seq OWNED BY public.product_translation.id;


--
-- TOC entry 286 (class 1259 OID 10312349)
-- Name: product_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    enabled boolean DEFAULT true NOT NULL,
    sku character varying NOT NULL,
    "outOfStockThreshold" integer DEFAULT 0 NOT NULL,
    "useGlobalOutOfStockThreshold" boolean DEFAULT true NOT NULL,
    "trackInventory" character varying DEFAULT 'INHERIT'::character varying NOT NULL,
    id integer NOT NULL,
    "featuredAssetId" integer,
    "taxCategoryId" integer,
    "productId" integer
);


ALTER TABLE public.product_variant OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 10312314)
-- Name: product_variant_asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "assetId" integer NOT NULL,
    "position" integer NOT NULL,
    "productVariantId" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.product_variant_asset OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 10312313)
-- Name: product_variant_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variant_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_variant_asset_id_seq OWNER TO postgres;

--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 279
-- Name: product_variant_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variant_asset_id_seq OWNED BY public.product_variant_asset.id;


--
-- TOC entry 350 (class 1259 OID 10312797)
-- Name: product_variant_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_channels_channel (
    "productVariantId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.product_variant_channels_channel OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 10312790)
-- Name: product_variant_facet_values_facet_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_facet_values_facet_value (
    "productVariantId" integer NOT NULL,
    "facetValueId" integer NOT NULL
);


ALTER TABLE public.product_variant_facet_values_facet_value OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 10312348)
-- Name: product_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_variant_id_seq OWNER TO postgres;

--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 285
-- Name: product_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variant_id_seq OWNED BY public.product_variant.id;


--
-- TOC entry 348 (class 1259 OID 10312783)
-- Name: product_variant_options_product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_options_product_option (
    "productVariantId" integer NOT NULL,
    "productOptionId" integer NOT NULL
);


ALTER TABLE public.product_variant_options_product_option OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 10312325)
-- Name: product_variant_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_price (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "currencyCode" character varying NOT NULL,
    id integer NOT NULL,
    "channelId" integer,
    price integer NOT NULL,
    "variantId" integer
);


ALTER TABLE public.product_variant_price OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 10312324)
-- Name: product_variant_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variant_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_variant_price_id_seq OWNER TO postgres;

--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 281
-- Name: product_variant_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variant_price_id_seq OWNED BY public.product_variant_price.id;


--
-- TOC entry 284 (class 1259 OID 10312337)
-- Name: product_variant_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_variant_translation OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 10312336)
-- Name: product_variant_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variant_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_variant_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 283
-- Name: product_variant_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variant_translation_id_seq OWNED BY public.product_variant_translation.id;


--
-- TOC entry 262 (class 1259 OID 10312191)
-- Name: promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "startsAt" timestamp without time zone,
    "endsAt" timestamp without time zone,
    "couponCode" character varying,
    "perCustomerUsageLimit" integer,
    "usageLimit" integer,
    enabled boolean NOT NULL,
    conditions text NOT NULL,
    actions text NOT NULL,
    "priorityScore" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.promotion OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 10312741)
-- Name: promotion_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_channels_channel (
    "promotionId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.promotion_channels_channel OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 10312190)
-- Name: promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_id_seq OWNER TO postgres;

--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 261
-- Name: promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_id_seq OWNED BY public.promotion.id;


--
-- TOC entry 260 (class 1259 OID 10312179)
-- Name: promotion_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.promotion_translation OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 10312178)
-- Name: promotion_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 259
-- Name: promotion_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_translation_id_seq OWNED BY public.promotion_translation.id;


--
-- TOC entry 252 (class 1259 OID 10312130)
-- Name: refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refund (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    method character varying NOT NULL,
    reason character varying,
    state character varying NOT NULL,
    "transactionId" character varying,
    metadata text NOT NULL,
    id integer NOT NULL,
    "paymentId" integer NOT NULL,
    items integer NOT NULL,
    shipping integer NOT NULL,
    adjustment integer NOT NULL,
    total integer NOT NULL
);


ALTER TABLE public.refund OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 10312129)
-- Name: refund_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refund_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refund_id_seq OWNER TO postgres;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 251
-- Name: refund_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refund_id_seq OWNED BY public.refund.id;


--
-- TOC entry 292 (class 1259 OID 10312391)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    type character varying NOT NULL,
    enabled boolean NOT NULL,
    id integer NOT NULL,
    "parentId" integer,
    discriminator character varying NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 10312390)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.region_id_seq OWNER TO postgres;

--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 291
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- TOC entry 290 (class 1259 OID 10312379)
-- Name: region_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.region_translation OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 10312378)
-- Name: region_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.region_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 289
-- Name: region_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_translation_id_seq OWNED BY public.region_translation.id;


--
-- TOC entry 302 (class 1259 OID 10312452)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    description character varying NOT NULL,
    permissions text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 10312811)
-- Name: role_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_channels_channel (
    "roleId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.role_channels_channel OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 10312451)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 301
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 332 (class 1259 OID 10312660)
-- Name: scheduled_task_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scheduled_task_record (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "taskId" character varying NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    "lockedAt" timestamp(3) without time zone,
    "lastExecutedAt" timestamp(3) without time zone,
    "manuallyTriggeredAt" timestamp(3) without time zone,
    "lastResult" json,
    id integer NOT NULL
);


ALTER TABLE public.scheduled_task_record OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 10312659)
-- Name: scheduled_task_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scheduled_task_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scheduled_task_record_id_seq OWNER TO postgres;

--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 331
-- Name: scheduled_task_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scheduled_task_record_id_seq OWNED BY public.scheduled_task_record.id;


--
-- TOC entry 333 (class 1259 OID 10312673)
-- Name: search_index_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_index_item (
    "languageCode" character varying NOT NULL,
    enabled boolean NOT NULL,
    "productName" character varying NOT NULL,
    "productVariantName" character varying NOT NULL,
    description text NOT NULL,
    slug character varying NOT NULL,
    sku character varying NOT NULL,
    "facetIds" text NOT NULL,
    "facetValueIds" text NOT NULL,
    "collectionIds" text NOT NULL,
    "collectionSlugs" text NOT NULL,
    "channelIds" text NOT NULL,
    "productPreview" character varying NOT NULL,
    "productPreviewFocalPoint" text,
    "productVariantPreview" character varying NOT NULL,
    "productVariantPreviewFocalPoint" text,
    "inStock" boolean DEFAULT true NOT NULL,
    "productInStock" boolean DEFAULT true NOT NULL,
    "productVariantId" integer NOT NULL,
    "channelId" integer NOT NULL,
    "productId" integer NOT NULL,
    "productAssetId" integer,
    "productVariantAssetId" integer,
    price integer NOT NULL,
    "priceWithTax" integer NOT NULL
);


ALTER TABLE public.search_index_item OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 10312577)
-- Name: seller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seller (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.seller OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 10312576)
-- Name: seller_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seller_id_seq OWNER TO postgres;

--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 319
-- Name: seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seller_id_seq OWNED BY public.seller.id;


--
-- TOC entry 304 (class 1259 OID 10312463)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    token character varying NOT NULL,
    expires timestamp without time zone NOT NULL,
    invalidated boolean NOT NULL,
    "authenticationStrategy" character varying,
    id integer NOT NULL,
    "activeOrderId" integer,
    "activeChannelId" integer,
    type character varying NOT NULL,
    "userId" integer
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 10312462)
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.session_id_seq OWNER TO postgres;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 303
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- TOC entry 322 (class 1259 OID 10312588)
-- Name: settings_store_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings_store_entry (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    key character varying NOT NULL,
    value json,
    scope character varying,
    id integer NOT NULL
);


ALTER TABLE public.settings_store_entry OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 10312587)
-- Name: settings_store_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_store_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_store_entry_id_seq OWNER TO postgres;

--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 321
-- Name: settings_store_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_store_entry_id_seq OWNED BY public.settings_store_entry.id;


--
-- TOC entry 268 (class 1259 OID 10312227)
-- Name: shipping_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_line (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "listPriceIncludesTax" boolean NOT NULL,
    adjustments text NOT NULL,
    "taxLines" text NOT NULL,
    id integer NOT NULL,
    "shippingMethodId" integer NOT NULL,
    "listPrice" integer NOT NULL,
    "orderId" integer
);


ALTER TABLE public.shipping_line OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 10312226)
-- Name: shipping_line_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_line_id_seq OWNER TO postgres;

--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 267
-- Name: shipping_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_line_id_seq OWNED BY public.shipping_line.id;


--
-- TOC entry 266 (class 1259 OID 10312216)
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    code character varying NOT NULL,
    checker text NOT NULL,
    calculator text NOT NULL,
    "fulfillmentHandlerCode" character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.shipping_method OWNER TO postgres;

--
-- TOC entry 343 (class 1259 OID 10312748)
-- Name: shipping_method_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method_channels_channel (
    "shippingMethodId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.shipping_method_channels_channel OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 10312215)
-- Name: shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_method_id_seq OWNER TO postgres;

--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 265
-- Name: shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_method_id_seq OWNED BY public.shipping_method.id;


--
-- TOC entry 264 (class 1259 OID 10312202)
-- Name: shipping_method_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.shipping_method_translation OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 10312201)
-- Name: shipping_method_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_method_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_method_translation_id_seq OWNER TO postgres;

--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 263
-- Name: shipping_method_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_method_translation_id_seq OWNED BY public.shipping_method_translation.id;


--
-- TOC entry 278 (class 1259 OID 10312302)
-- Name: stock_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_level (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "stockOnHand" integer NOT NULL,
    "stockAllocated" integer NOT NULL,
    id integer NOT NULL,
    "productVariantId" integer NOT NULL,
    "stockLocationId" integer NOT NULL
);


ALTER TABLE public.stock_level OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 10312301)
-- Name: stock_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_level_id_seq OWNER TO postgres;

--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 277
-- Name: stock_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_level_id_seq OWNED BY public.stock_level.id;


--
-- TOC entry 272 (class 1259 OID 10312259)
-- Name: stock_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_location (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.stock_location OWNER TO postgres;

--
-- TOC entry 347 (class 1259 OID 10312776)
-- Name: stock_location_channels_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_location_channels_channel (
    "stockLocationId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.stock_location_channels_channel OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 10312258)
-- Name: stock_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_location_id_seq OWNER TO postgres;

--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 271
-- Name: stock_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_location_id_seq OWNED BY public.stock_location.id;


--
-- TOC entry 274 (class 1259 OID 10312270)
-- Name: stock_movement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_movement (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    type character varying NOT NULL,
    quantity integer NOT NULL,
    id integer NOT NULL,
    "stockLocationId" integer NOT NULL,
    discriminator character varying NOT NULL,
    "productVariantId" integer,
    "orderLineId" integer
);


ALTER TABLE public.stock_movement OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 10312269)
-- Name: stock_movement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_movement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_movement_id_seq OWNER TO postgres;

--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 273
-- Name: stock_movement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_movement_id_seq OWNED BY public.stock_movement.id;


--
-- TOC entry 256 (class 1259 OID 10312154)
-- Name: surcharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surcharge (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    description character varying NOT NULL,
    "listPriceIncludesTax" boolean NOT NULL,
    sku character varying NOT NULL,
    "taxLines" text NOT NULL,
    id integer NOT NULL,
    "listPrice" integer NOT NULL,
    "orderId" integer,
    "orderModificationId" integer
);


ALTER TABLE public.surcharge OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 10312153)
-- Name: surcharge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.surcharge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.surcharge_id_seq OWNER TO postgres;

--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 255
-- Name: surcharge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.surcharge_id_seq OWNED BY public.surcharge.id;


--
-- TOC entry 244 (class 1259 OID 10312078)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    value character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 10312077)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_id_seq OWNER TO postgres;

--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 243
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- TOC entry 288 (class 1259 OID 10312367)
-- Name: tax_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_category (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.tax_category OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 10312366)
-- Name: tax_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_category_id_seq OWNER TO postgres;

--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 287
-- Name: tax_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_category_id_seq OWNED BY public.tax_category.id;


--
-- TOC entry 296 (class 1259 OID 10312414)
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_rate (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    enabled boolean NOT NULL,
    value numeric(5,2) NOT NULL,
    id integer NOT NULL,
    "categoryId" integer,
    "zoneId" integer,
    "customerGroupId" integer
);


ALTER TABLE public.tax_rate OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 10312413)
-- Name: tax_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_rate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_rate_id_seq OWNER TO postgres;

--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 295
-- Name: tax_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_rate_id_seq OWNED BY public.tax_rate.id;


--
-- TOC entry 306 (class 1259 OID 10312478)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    identifier character varying NOT NULL,
    verified boolean DEFAULT false NOT NULL,
    "lastLogin" timestamp without time zone,
    id integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 10312477)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 305
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 353 (class 1259 OID 10312818)
-- Name: user_roles_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles_role (
    "userId" integer NOT NULL,
    "roleId" integer NOT NULL
);


ALTER TABLE public.user_roles_role OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 10312403)
-- Name: zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zone (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.zone OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 10312402)
-- Name: zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zone_id_seq OWNER TO postgres;

--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 293
-- Name: zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zone_id_seq OWNED BY public.zone.id;


--
-- TOC entry 351 (class 1259 OID 10312804)
-- Name: zone_members_region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zone_members_region (
    "zoneId" integer NOT NULL,
    "regionId" integer NOT NULL
);


ALTER TABLE public.zone_members_region OWNER TO postgres;

--
-- TOC entry 4011 (class 2604 OID 10312517)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- TOC entry 4014 (class 2604 OID 10312530)
-- Name: administrator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator ALTER COLUMN id SET DEFAULT nextval('public.administrator_id_seq'::regclass);


--
-- TOC entry 3892 (class 2604 OID 10312096)
-- Name: asset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset ALTER COLUMN id SET DEFAULT nextval('public.asset_id_seq'::regclass);


--
-- TOC entry 3986 (class 2604 OID 10312444)
-- Name: authentication_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_method ALTER COLUMN id SET DEFAULT nextval('public.authentication_method_id_seq'::regclass);


--
-- TOC entry 4038 (class 2604 OID 10312610)
-- Name: channel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel ALTER COLUMN id SET DEFAULT nextval('public.channel_id_seq'::regclass);


--
-- TOC entry 3849 (class 2604 OID 10311938)
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- TOC entry 3840 (class 2604 OID 10311911)
-- Name: collection_asset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_asset ALTER COLUMN id SET DEFAULT nextval('public.collection_asset_id_seq'::regclass);


--
-- TOC entry 3843 (class 2604 OID 10311922)
-- Name: collection_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_translation ALTER COLUMN id SET DEFAULT nextval('public.collection_translation_id_seq'::regclass);


--
-- TOC entry 3999 (class 2604 OID 10312495)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3983 (class 2604 OID 10312433)
-- Name: customer_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group ALTER COLUMN id SET DEFAULT nextval('public.customer_group_id_seq'::regclass);


--
-- TOC entry 3856 (class 2604 OID 10311963)
-- Name: facet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet ALTER COLUMN id SET DEFAULT nextval('public.facet_id_seq'::regclass);


--
-- TOC entry 3852 (class 2604 OID 10311950)
-- Name: facet_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_translation ALTER COLUMN id SET DEFAULT nextval('public.facet_translation_id_seq'::regclass);


--
-- TOC entry 3862 (class 2604 OID 10311988)
-- Name: facet_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value ALTER COLUMN id SET DEFAULT nextval('public.facet_value_id_seq'::regclass);


--
-- TOC entry 3859 (class 2604 OID 10311976)
-- Name: facet_value_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value_translation ALTER COLUMN id SET DEFAULT nextval('public.facet_value_translation_id_seq'::regclass);


--
-- TOC entry 3899 (class 2604 OID 10312124)
-- Name: fulfillment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment ALTER COLUMN id SET DEFAULT nextval('public.fulfillment_id_seq'::regclass);


--
-- TOC entry 4019 (class 2604 OID 10312547)
-- Name: global_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_settings ALTER COLUMN id SET DEFAULT nextval('public.global_settings_id_seq'::regclass);


--
-- TOC entry 4041 (class 2604 OID 10312628)
-- Name: history_entry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_entry ALTER COLUMN id SET DEFAULT nextval('public.history_entry_id_seq'::regclass);


--
-- TOC entry 4044 (class 2604 OID 10312642)
-- Name: job_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_record ALTER COLUMN id SET DEFAULT nextval('public.job_record_id_seq'::regclass);


--
-- TOC entry 4047 (class 2604 OID 10312654)
-- Name: job_record_buffer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_record_buffer ALTER COLUMN id SET DEFAULT nextval('public.job_record_buffer_id_seq'::regclass);


--
-- TOC entry 4054 (class 2604 OID 10316520)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3933 (class 2604 OID 10312247)
-- Name: order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- TOC entry 3945 (class 2604 OID 10312290)
-- Name: order_line id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line ALTER COLUMN id SET DEFAULT nextval('public.order_line_id_seq'::regclass);


--
-- TOC entry 3895 (class 2604 OID 10312107)
-- Name: order_line_reference id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_reference ALTER COLUMN id SET DEFAULT nextval('public.order_line_reference_id_seq'::regclass);


--
-- TOC entry 3911 (class 2604 OID 10312172)
-- Name: order_modification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modification ALTER COLUMN id SET DEFAULT nextval('public.order_modification_id_seq'::regclass);


--
-- TOC entry 3905 (class 2604 OID 10312147)
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- TOC entry 4026 (class 2604 OID 10312571)
-- Name: payment_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method ALTER COLUMN id SET DEFAULT nextval('public.payment_method_id_seq'::regclass);


--
-- TOC entry 4022 (class 2604 OID 10312558)
-- Name: payment_method_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method_translation ALTER COLUMN id SET DEFAULT nextval('public.payment_method_translation_id_seq'::regclass);


--
-- TOC entry 3884 (class 2604 OID 10312073)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3877 (class 2604 OID 10312048)
-- Name: product_asset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_asset ALTER COLUMN id SET DEFAULT nextval('public.product_asset_id_seq'::regclass);


--
-- TOC entry 3868 (class 2604 OID 10312012)
-- Name: product_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option ALTER COLUMN id SET DEFAULT nextval('public.product_option_id_seq'::regclass);


--
-- TOC entry 3874 (class 2604 OID 10312036)
-- Name: product_option_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group ALTER COLUMN id SET DEFAULT nextval('public.product_option_group_id_seq'::regclass);


--
-- TOC entry 3871 (class 2604 OID 10312024)
-- Name: product_option_group_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group_translation ALTER COLUMN id SET DEFAULT nextval('public.product_option_group_translation_id_seq'::regclass);


--
-- TOC entry 3865 (class 2604 OID 10312000)
-- Name: product_option_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_translation ALTER COLUMN id SET DEFAULT nextval('public.product_option_translation_id_seq'::regclass);


--
-- TOC entry 3880 (class 2604 OID 10312059)
-- Name: product_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translation ALTER COLUMN id SET DEFAULT nextval('public.product_translation_id_seq'::regclass);


--
-- TOC entry 3964 (class 2604 OID 10312358)
-- Name: product_variant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant ALTER COLUMN id SET DEFAULT nextval('public.product_variant_id_seq'::regclass);


--
-- TOC entry 3951 (class 2604 OID 10312319)
-- Name: product_variant_asset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_asset ALTER COLUMN id SET DEFAULT nextval('public.product_variant_asset_id_seq'::regclass);


--
-- TOC entry 3954 (class 2604 OID 10312330)
-- Name: product_variant_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_price ALTER COLUMN id SET DEFAULT nextval('public.product_variant_price_id_seq'::regclass);


--
-- TOC entry 3957 (class 2604 OID 10312342)
-- Name: product_variant_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_translation ALTER COLUMN id SET DEFAULT nextval('public.product_variant_translation_id_seq'::regclass);


--
-- TOC entry 3917 (class 2604 OID 10312196)
-- Name: promotion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_id_seq'::regclass);


--
-- TOC entry 3914 (class 2604 OID 10312184)
-- Name: promotion_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_translation ALTER COLUMN id SET DEFAULT nextval('public.promotion_translation_id_seq'::regclass);


--
-- TOC entry 3902 (class 2604 OID 10312135)
-- Name: refund id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund ALTER COLUMN id SET DEFAULT nextval('public.refund_id_seq'::regclass);


--
-- TOC entry 3974 (class 2604 OID 10312396)
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- TOC entry 3971 (class 2604 OID 10312384)
-- Name: region_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_translation ALTER COLUMN id SET DEFAULT nextval('public.region_translation_id_seq'::regclass);


--
-- TOC entry 3989 (class 2604 OID 10312457)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 4051 (class 2604 OID 10312666)
-- Name: scheduled_task_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_task_record ALTER COLUMN id SET DEFAULT nextval('public.scheduled_task_record_id_seq'::regclass);


--
-- TOC entry 4029 (class 2604 OID 10312582)
-- Name: seller id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller ALTER COLUMN id SET DEFAULT nextval('public.seller_id_seq'::regclass);


--
-- TOC entry 3992 (class 2604 OID 10312468)
-- Name: session id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- TOC entry 4032 (class 2604 OID 10312593)
-- Name: settings_store_entry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings_store_entry ALTER COLUMN id SET DEFAULT nextval('public.settings_store_entry_id_seq'::regclass);


--
-- TOC entry 3928 (class 2604 OID 10312232)
-- Name: shipping_line id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_line ALTER COLUMN id SET DEFAULT nextval('public.shipping_line_id_seq'::regclass);


--
-- TOC entry 3925 (class 2604 OID 10312221)
-- Name: shipping_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_id_seq'::regclass);


--
-- TOC entry 3922 (class 2604 OID 10312209)
-- Name: shipping_method_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_translation ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_translation_id_seq'::regclass);


--
-- TOC entry 3948 (class 2604 OID 10312307)
-- Name: stock_level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_level ALTER COLUMN id SET DEFAULT nextval('public.stock_level_id_seq'::regclass);


--
-- TOC entry 3938 (class 2604 OID 10312264)
-- Name: stock_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location ALTER COLUMN id SET DEFAULT nextval('public.stock_location_id_seq'::regclass);


--
-- TOC entry 3941 (class 2604 OID 10312275)
-- Name: stock_movement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movement ALTER COLUMN id SET DEFAULT nextval('public.stock_movement_id_seq'::regclass);


--
-- TOC entry 3908 (class 2604 OID 10312159)
-- Name: surcharge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surcharge ALTER COLUMN id SET DEFAULT nextval('public.surcharge_id_seq'::regclass);


--
-- TOC entry 3887 (class 2604 OID 10312083)
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- TOC entry 3968 (class 2604 OID 10312373)
-- Name: tax_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_category ALTER COLUMN id SET DEFAULT nextval('public.tax_category_id_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 10312419)
-- Name: tax_rate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate ALTER COLUMN id SET DEFAULT nextval('public.tax_rate_id_seq'::regclass);


--
-- TOC entry 3996 (class 2604 OID 10312484)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3977 (class 2604 OID 10312408)
-- Name: zone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zone ALTER COLUMN id SET DEFAULT nextval('public.zone_id_seq'::regclass);


--
-- TOC entry 4725 (class 0 OID 10312503)
-- Dependencies: 310
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address ("createdAt", "updatedAt", "fullName", company, "streetLine1", "streetLine2", city, province, "postalCode", "phoneNumber", "defaultShippingAddress", "defaultBillingAddress", id, "customerId", "countryId") FROM stdin;
\.


--
-- TOC entry 4727 (class 0 OID 10312525)
-- Dependencies: 312
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrator ("createdAt", "updatedAt", "deletedAt", "firstName", "lastName", "emailAddress", id, "userId") FROM stdin;
2025-12-17 10:13:54.676514	2025-12-17 10:13:54.676514	\N	Super	Admin	admin	1	1
\.


--
-- TOC entry 4661 (class 0 OID 10312089)
-- Dependencies: 246
-- Data for Name: asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset ("createdAt", "updatedAt", name, type, "mimeType", width, height, "fileSize", source, preview, "focalPoint", id) FROM stdin;
2025-12-17 10:13:55.25267	2025-12-17 10:13:55.25267	derick-david-409858-unsplash.jpg	IMAGE	image/jpeg	1600	1200	44525	source/b6/derick-david-409858-unsplash.jpg	preview/71/derick-david-409858-unsplash__preview.jpg	\N	1
2025-12-17 10:13:55.298245	2025-12-17 10:13:55.298245	kelly-sikkema-685291-unsplash.jpg	IMAGE	image/jpeg	1600	1067	47714	source/5a/kelly-sikkema-685291-unsplash.jpg	preview/b8/kelly-sikkema-685291-unsplash__preview.jpg	\N	2
2025-12-17 10:13:55.31337	2025-12-17 10:13:55.31337	oscar-ivan-esquivel-arteaga-687447-unsplash.jpg	IMAGE	image/jpeg	1600	1071	76870	source/0b/oscar-ivan-esquivel-arteaga-687447-unsplash.jpg	preview/a1/oscar-ivan-esquivel-arteaga-687447-unsplash__preview.jpg	\N	3
2025-12-17 10:13:55.32863	2025-12-17 10:13:55.32863	daniel-korpai-1302051-unsplash.jpg	IMAGE	image/jpeg	1280	1600	201064	source/28/daniel-korpai-1302051-unsplash.jpg	preview/d2/daniel-korpai-1302051-unsplash__preview.jpg	\N	4
2025-12-17 10:13:55.34218	2025-12-17 10:13:55.34218	alexandru-acea-686569-unsplash.jpg	IMAGE	image/jpeg	1067	1600	71196	source/e8/alexandru-acea-686569-unsplash.jpg	preview/9c/alexandru-acea-686569-unsplash__preview.jpg	\N	5
2025-12-17 10:13:55.359321	2025-12-17 10:13:55.359321	liam-briese-1128307-unsplash.jpg	IMAGE	image/jpeg	1600	1067	120523	source/2e/liam-briese-1128307-unsplash.jpg	preview/58/liam-briese-1128307-unsplash__preview.jpg	\N	6
2025-12-17 10:13:55.378191	2025-12-17 10:13:55.378191	florian-olivo-1166419-unsplash.jpg	IMAGE	image/jpeg	1067	1600	73904	source/63/florian-olivo-1166419-unsplash.jpg	preview/5a/florian-olivo-1166419-unsplash__preview.jpg	\N	7
2025-12-17 10:13:55.399205	2025-12-17 10:13:55.399205	vincent-botta-736919-unsplash.jpg	IMAGE	image/jpeg	1600	1200	87075	source/59/vincent-botta-736919-unsplash.jpg	preview/96/vincent-botta-736919-unsplash__preview.jpg	\N	8
2025-12-17 10:13:55.423137	2025-12-17 10:13:55.423137	juan-gomez-674574-unsplash.jpg	IMAGE	image/jpeg	1600	1060	60470	source/b8/juan-gomez-674574-unsplash.jpg	preview/09/juan-gomez-674574-unsplash__preview.jpg	\N	9
2025-12-17 10:13:55.436486	2025-12-17 10:13:55.436486	thomas-q-1229169-unsplash.jpg	IMAGE	image/jpeg	1600	1600	94113	source/86/thomas-q-1229169-unsplash.jpg	preview/7b/thomas-q-1229169-unsplash__preview.jpg	\N	10
2025-12-17 10:13:55.446682	2025-12-17 10:13:55.446682	adam-birkett-239153-unsplash.jpg	IMAGE	image/jpeg	1067	1600	17676	source/3c/adam-birkett-239153-unsplash.jpg	preview/64/adam-birkett-239153-unsplash__preview.jpg	\N	11
2025-12-17 10:13:55.465961	2025-12-17 10:13:55.465961	eniko-kis-663725-unsplash.jpg	IMAGE	image/jpeg	1600	1067	42943	source/1d/eniko-kis-663725-unsplash.jpg	preview/b5/eniko-kis-663725-unsplash__preview.jpg	\N	12
2025-12-17 10:13:55.481121	2025-12-17 10:13:55.481121	brandi-redd-104140-unsplash.jpg	IMAGE	image/jpeg	1600	1110	91458	source/21/brandi-redd-104140-unsplash.jpg	preview/9b/brandi-redd-104140-unsplash__preview.jpg	\N	13
2025-12-17 10:13:55.494154	2025-12-17 10:13:55.494154	jonathan-talbert-697262-unsplash.jpg	IMAGE	image/jpeg	1067	1600	103011	source/69/jonathan-talbert-697262-unsplash.jpg	preview/3c/jonathan-talbert-697262-unsplash__preview.jpg	\N	14
2025-12-17 10:13:55.505327	2025-12-17 10:13:55.505327	zoltan-tasi-423051-unsplash.jpg	IMAGE	image/jpeg	1067	1600	49099	source/92/zoltan-tasi-423051-unsplash.jpg	preview/21/zoltan-tasi-423051-unsplash__preview.jpg	\N	15
2025-12-17 10:13:55.522426	2025-12-17 10:13:55.522426	jakob-owens-274337-unsplash.jpg	IMAGE	image/jpeg	1600	1067	213089	source/cf/jakob-owens-274337-unsplash.jpg	preview/5b/jakob-owens-274337-unsplash__preview.jpg	\N	16
2025-12-17 10:13:55.536539	2025-12-17 10:13:55.536539	patrick-brinksma-663044-unsplash.jpg	IMAGE	image/jpeg	1600	1067	190811	source/0f/patrick-brinksma-663044-unsplash.jpg	preview/bc/patrick-brinksma-663044-unsplash__preview.jpg	\N	17
2025-12-17 10:13:55.572196	2025-12-17 10:13:55.572196	chuttersnap-324234-unsplash.jpg	IMAGE	image/jpeg	1600	1068	118442	source/df/chuttersnap-324234-unsplash.jpg	preview/95/chuttersnap-324234-unsplash__preview.jpg	\N	18
2025-12-17 10:13:55.581524	2025-12-17 10:13:55.581524	robert-shunev-528016-unsplash.jpg	IMAGE	image/jpeg	1600	1067	36204	source/9e/robert-shunev-528016-unsplash.jpg	preview/9d/robert-shunev-528016-unsplash__preview.jpg	\N	19
2025-12-17 10:13:55.61434	2025-12-17 10:13:55.61434	alexander-andrews-260988-unsplash.jpg	IMAGE	image/jpeg	1050	1600	65460	source/f8/alexander-andrews-260988-unsplash.jpg	preview/ef/alexander-andrews-260988-unsplash__preview.jpg	\N	20
2025-12-17 10:13:55.627839	2025-12-17 10:13:55.627839	mikkel-bech-748940-unsplash.jpg	IMAGE	image/jpeg	1600	1130	62785	source/29/mikkel-bech-748940-unsplash.jpg	preview/2f/mikkel-bech-748940-unsplash__preview.jpg	\N	21
2025-12-17 10:13:55.661831	2025-12-17 10:13:55.661831	stoica-ionela-530966-unsplash.jpg	IMAGE	image/jpeg	1600	1600	50995	source/b1/stoica-ionela-530966-unsplash.jpg	preview/34/stoica-ionela-530966-unsplash__preview.jpg	\N	22
2025-12-17 10:13:55.677449	2025-12-17 10:13:55.677449	neonbrand-428982-unsplash.jpg	IMAGE	image/jpeg	1600	1332	169677	source/3c/neonbrand-428982-unsplash.jpg	preview/4f/neonbrand-428982-unsplash__preview.jpg	\N	23
2025-12-17 10:13:55.692624	2025-12-17 10:13:55.692624	michael-guite-571169-unsplash.jpg	IMAGE	image/jpeg	1600	1067	240247	source/ab/michael-guite-571169-unsplash.jpg	preview/96/michael-guite-571169-unsplash__preview.jpg	\N	24
2025-12-17 10:13:55.717695	2025-12-17 10:13:55.717695	max-tarkhov-737999-unsplash.jpg	IMAGE	image/jpeg	1600	1280	192508	source/ed/max-tarkhov-737999-unsplash.jpg	preview/35/max-tarkhov-737999-unsplash__preview.jpg	\N	25
2025-12-17 10:13:55.775441	2025-12-17 10:13:55.775441	nik-shuliahin-619349-unsplash.jpg	IMAGE	image/jpeg	1600	1020	130437	source/87/nik-shuliahin-619349-unsplash.jpg	preview/d6/nik-shuliahin-619349-unsplash__preview.jpg	\N	26
2025-12-17 10:13:55.794499	2025-12-17 10:13:55.794499	ben-hershey-574483-unsplash.jpg	IMAGE	image/jpeg	1600	1070	77118	source/f3/ben-hershey-574483-unsplash.jpg	preview/30/ben-hershey-574483-unsplash__preview.jpg	\N	27
2025-12-17 10:13:55.814716	2025-12-17 10:13:55.814716	tommy-bebo-600358-unsplash.jpg	IMAGE	image/jpeg	1067	1600	262335	source/ac/tommy-bebo-600358-unsplash.jpg	preview/0f/tommy-bebo-600358-unsplash__preview.jpg	\N	28
2025-12-17 10:13:55.828783	2025-12-17 10:13:55.828783	chuttersnap-584518-unsplash.jpg	IMAGE	image/jpeg	1600	1068	76330	source/20/chuttersnap-584518-unsplash.jpg	preview/ed/chuttersnap-584518-unsplash__preview.jpg	\N	29
2025-12-17 10:13:55.881502	2025-12-17 10:13:55.881502	imani-clovis-234736-unsplash.jpg	IMAGE	image/jpeg	1600	1600	99111	source/de/imani-clovis-234736-unsplash.jpg	preview/0f/imani-clovis-234736-unsplash__preview.jpg	\N	30
2025-12-17 10:13:55.910389	2025-12-17 10:13:55.910389	xavier-teo-469050-unsplash.jpg	IMAGE	image/jpeg	1200	1600	167599	source/5c/xavier-teo-469050-unsplash.jpg	preview/3c/xavier-teo-469050-unsplash__preview.jpg	\N	31
2025-12-17 10:13:55.931498	2025-12-17 10:13:55.931498	thomas-serer-420833-unsplash.jpg	IMAGE	image/jpeg	1600	1223	78999	source/55/thomas-serer-420833-unsplash.jpg	preview/a2/thomas-serer-420833-unsplash__preview.jpg	\N	32
2025-12-17 10:13:55.94834	2025-12-17 10:13:55.94834	nikolai-chernichenko-1299748-unsplash.jpg	IMAGE	image/jpeg	1600	1067	56282	source/01/nikolai-chernichenko-1299748-unsplash.jpg	preview/00/nikolai-chernichenko-1299748-unsplash__preview.jpg	\N	33
2025-12-17 10:13:55.967897	2025-12-17 10:13:55.967897	mitch-lensink-256007-unsplash.jpg	IMAGE	image/jpeg	1600	1067	154988	source/2b/mitch-lensink-256007-unsplash.jpg	preview/aa/mitch-lensink-256007-unsplash__preview.jpg	\N	34
2025-12-17 10:13:55.991741	2025-12-17 10:13:55.991741	charles-deluvio-695736-unsplash.jpg	IMAGE	image/jpeg	1600	1600	54419	source/92/charles-deluvio-695736-unsplash.jpg	preview/78/charles-deluvio-695736-unsplash__preview.jpg	\N	35
2025-12-17 10:13:56.0068	2025-12-17 10:13:56.0068	natalia-y-345738-unsplash.jpg	IMAGE	image/jpeg	900	1600	97819	source/17/natalia-y-345738-unsplash.jpg	preview/14/natalia-y-345738-unsplash__preview.jpg	\N	36
2025-12-17 10:13:56.02458	2025-12-17 10:13:56.02458	alex-rodriguez-santibanez-200278-unsplash.jpg	IMAGE	image/jpeg	1600	1067	176280	source/ff/alex-rodriguez-santibanez-200278-unsplash.jpg	preview/5b/alex-rodriguez-santibanez-200278-unsplash__preview.jpg	\N	37
2025-12-17 10:13:56.0712	2025-12-17 10:13:56.0712	annie-spratt-78044-unsplash.jpg	IMAGE	image/jpeg	1115	1600	173536	source/f1/annie-spratt-78044-unsplash.jpg	preview/81/annie-spratt-78044-unsplash__preview.jpg	\N	40
2025-12-17 10:13:56.097122	2025-12-17 10:13:56.097122	mark-tegethoff-667351-unsplash.jpg	IMAGE	image/jpeg	1600	1200	79857	source/e6/mark-tegethoff-667351-unsplash.jpg	preview/f3/mark-tegethoff-667351-unsplash__preview.jpg	\N	42
2025-12-17 10:13:56.109757	2025-12-17 10:13:56.109757	vincent-liu-525429-unsplash.jpg	IMAGE	image/jpeg	1600	1067	77358	source/10/vincent-liu-525429-unsplash.jpg	preview/44/vincent-liu-525429-unsplash__preview.jpg	\N	43
2025-12-17 10:13:56.163821	2025-12-17 10:13:56.163821	paul-weaver-1120584-unsplash.jpg	IMAGE	image/jpeg	1600	1067	65612	source/14/paul-weaver-1120584-unsplash.jpg	preview/3e/paul-weaver-1120584-unsplash__preview.jpg	\N	47
2025-12-17 10:13:56.206886	2025-12-17 10:13:56.206886	kari-shea-398668-unsplash.jpg	IMAGE	image/jpeg	1048	1500	181352	source/4f/kari-shea-398668-unsplash.jpg	preview/3b/kari-shea-398668-unsplash__preview.jpg	\N	50
2025-12-17 10:13:56.248822	2025-12-17 10:13:56.248822	benjamin-voros-310026-unsplash.jpg	IMAGE	image/jpeg	1200	1600	218391	source/7a/benjamin-voros-310026-unsplash.jpg	preview/72/benjamin-voros-310026-unsplash__preview.jpg	\N	53
2025-12-17 10:13:56.037664	2025-12-17 10:13:56.037664	silvia-agrasar-227575-unsplash.jpg	IMAGE	image/jpeg	1600	1063	119654	source/d5/silvia-agrasar-227575-unsplash.jpg	preview/29/silvia-agrasar-227575-unsplash__preview.jpg	\N	38
2025-12-17 10:13:56.05388	2025-12-17 10:13:56.05388	caleb-george-536388-unsplash.jpg	IMAGE	image/jpeg	1200	1600	184968	source/f0/caleb-george-536388-unsplash.jpg	preview/6d/caleb-george-536388-unsplash__preview.jpg	\N	39
2025-12-17 10:13:56.083469	2025-12-17 10:13:56.083469	zoltan-kovacs-642412-unsplash.jpg	IMAGE	image/jpeg	1067	1600	72752	source/e3/zoltan-kovacs-642412-unsplash.jpg	preview/88/zoltan-kovacs-642412-unsplash__preview.jpg	\N	41
2025-12-17 10:13:56.128449	2025-12-17 10:13:56.128449	neslihan-gunaydin-3493-unsplash.jpg	IMAGE	image/jpeg	1600	1067	152486	source/01/neslihan-gunaydin-3493-unsplash.jpg	preview/7d/neslihan-gunaydin-3493-unsplash__preview.jpg	\N	44
2025-12-17 10:13:56.138551	2025-12-17 10:13:56.138551	florian-klauer-14840-unsplash.jpg	IMAGE	image/jpeg	800	1200	17149	source/a9/florian-klauer-14840-unsplash.jpg	preview/ef/florian-klauer-14840-unsplash__preview.jpg	\N	45
2025-12-17 10:13:56.151908	2025-12-17 10:13:56.151908	nathan-fertig-249917-unsplash.jpg	IMAGE	image/jpeg	1600	1067	113855	source/68/nathan-fertig-249917-unsplash.jpg	preview/69/nathan-fertig-249917-unsplash__preview.jpg	\N	46
2025-12-17 10:13:56.177833	2025-12-17 10:13:56.177833	pierre-chatel-innocenti-483198-unsplash.jpg	IMAGE	image/jpeg	1600	1067	32036	source/39/pierre-chatel-innocenti-483198-unsplash.jpg	preview/5f/pierre-chatel-innocenti-483198-unsplash__preview.jpg	\N	48
2025-12-17 10:13:56.190443	2025-12-17 10:13:56.190443	abel-y-costa-716024-unsplash.jpg	IMAGE	image/jpeg	1600	1067	103392	source/46/abel-y-costa-716024-unsplash.jpg	preview/40/abel-y-costa-716024-unsplash__preview.jpg	\N	49
2025-12-17 10:13:56.220576	2025-12-17 10:13:56.220576	andres-jasso-220776-unsplash.jpg	IMAGE	image/jpeg	1600	1104	100927	source/f1/andres-jasso-220776-unsplash.jpg	preview/09/andres-jasso-220776-unsplash__preview.jpg	\N	51
2025-12-17 10:13:56.232819	2025-12-17 10:13:56.232819	ruslan-bardash-351288-unsplash.jpg	IMAGE	image/jpeg	1067	1600	47113	source/95/ruslan-bardash-351288-unsplash.jpg	preview/d0/ruslan-bardash-351288-unsplash__preview.jpg	\N	52
2025-12-17 10:13:56.262047	2025-12-17 10:13:56.262047	jean-philippe-delberghe-1400011-unsplash.jpg	IMAGE	image/jpeg	1067	1600	64529	source/94/jean-philippe-delberghe-1400011-unsplash.jpg	preview/b1/jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N	54
\.


--
-- TOC entry 4756 (class 0 OID 10312734)
-- Dependencies: 341
-- Data for Name: asset_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_channels_channel ("assetId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
\.


--
-- TOC entry 4755 (class 0 OID 10312727)
-- Dependencies: 340
-- Data for Name: asset_tags_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_tags_tag ("assetId", "tagId") FROM stdin;
\.


--
-- TOC entry 4715 (class 0 OID 10312439)
-- Dependencies: 300
-- Data for Name: authentication_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_method ("createdAt", "updatedAt", identifier, "passwordHash", "verificationToken", "passwordResetToken", "identifierChangeToken", "pendingIdentifier", strategy, "externalIdentifier", metadata, id, type, "userId") FROM stdin;
2025-12-17 10:13:54.669634	2025-12-17 10:13:54.673059	admin	$2b$12$iw5XqhEV6ussrKXVX27po.xOxsz9UD5o2BKWe3UbFk5sd77nL4daS	\N	\N	\N	\N	\N	\N	\N	1	NativeAuthenticationMethod	1
\.


--
-- TOC entry 4739 (class 0 OID 10312602)
-- Dependencies: 324
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel ("createdAt", "updatedAt", code, token, description, "defaultLanguageCode", "availableLanguageCodes", "defaultCurrencyCode", "availableCurrencyCodes", "trackInventory", "outOfStockThreshold", "pricesIncludeTax", id, "sellerId", "defaultTaxZoneId", "defaultShippingZoneId") FROM stdin;
2025-12-17 10:13:54.127603	2025-12-17 10:13:55.223963	__default_channel__	6s26u4tjc94xdjbp1c9n		en	en	USD	USD	t	0	f	1	1	2	2
\.


--
-- TOC entry 4635 (class 0 OID 10311930)
-- Dependencies: 220
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection ("createdAt", "updatedAt", "isRoot", "position", "isPrivate", filters, "inheritFilters", id, "parentId", "featuredAssetId") FROM stdin;
2025-12-17 10:13:56.29096	2025-12-17 10:13:56.29096	t	0	f	[]	t	1	\N	\N
2025-12-17 10:13:56.294269	2025-12-17 10:13:56.294269	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[1]"},{"name":"containsAny","value":"false"}]}]	t	2	1	16
2025-12-17 10:13:56.302474	2025-12-17 10:13:56.302474	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[2]"},{"name":"containsAny","value":"false"}]}]	t	3	2	5
2025-12-17 10:13:56.309433	2025-12-17 10:13:56.309433	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[9]"},{"name":"containsAny","value":"false"}]}]	t	4	2	12
2025-12-17 10:13:56.315649	2025-12-17 10:13:56.315649	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[30]"},{"name":"containsAny","value":"false"}]}]	t	5	1	47
2025-12-17 10:13:56.32075	2025-12-17 10:13:56.32075	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[34]"},{"name":"containsAny","value":"false"}]}]	t	6	5	46
2025-12-17 10:13:56.326649	2025-12-17 10:13:56.326649	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[31]"},{"name":"containsAny","value":"false"}]}]	t	7	5	37
2025-12-17 10:13:56.331952	2025-12-17 10:13:56.331952	f	3	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[17]"},{"name":"containsAny","value":"false"}]}]	t	8	1	24
2025-12-17 10:13:56.336442	2025-12-17 10:13:56.336442	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[18]"},{"name":"containsAny","value":"false"}]}]	t	9	8	23
2025-12-17 10:13:56.343224	2025-12-17 10:13:56.343224	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[23]"},{"name":"containsAny","value":"false"}]}]	t	10	8	32
\.


--
-- TOC entry 4631 (class 0 OID 10311906)
-- Dependencies: 216
-- Data for Name: collection_asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_asset ("createdAt", "updatedAt", "assetId", "position", "collectionId", id) FROM stdin;
2025-12-17 10:13:56.296503	2025-12-17 10:13:56.296503	16	0	2	1
2025-12-17 10:13:56.304351	2025-12-17 10:13:56.304351	5	0	3	2
2025-12-17 10:13:56.311109	2025-12-17 10:13:56.311109	12	0	4	3
2025-12-17 10:13:56.317466	2025-12-17 10:13:56.317466	47	0	5	4
2025-12-17 10:13:56.321811	2025-12-17 10:13:56.321811	46	0	6	5
2025-12-17 10:13:56.328134	2025-12-17 10:13:56.328134	37	0	7	6
2025-12-17 10:13:56.332976	2025-12-17 10:13:56.332976	24	0	8	7
2025-12-17 10:13:56.338423	2025-12-17 10:13:56.338423	23	0	9	8
2025-12-17 10:13:56.345526	2025-12-17 10:13:56.345526	32	0	10	9
\.


--
-- TOC entry 4750 (class 0 OID 10312692)
-- Dependencies: 335
-- Data for Name: collection_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_channels_channel ("collectionId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
\.


--
-- TOC entry 4772 (class 0 OID 10312846)
-- Dependencies: 357
-- Data for Name: collection_closure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_closure (id_ancestor, id_descendant) FROM stdin;
1	1
2	2
1	2
3	3
2	3
1	3
4	4
2	4
1	4
5	5
1	5
6	6
5	6
1	6
7	7
5	7
1	7
8	8
1	8
9	9
8	9
1	9
10	10
8	10
1	10
\.


--
-- TOC entry 4749 (class 0 OID 10312685)
-- Dependencies: 334
-- Data for Name: collection_product_variants_product_variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_product_variants_product_variant ("collectionId", "productVariantId") FROM stdin;
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	9
2	10
2	11
2	12
2	13
2	14
2	15
2	16
2	17
2	18
2	19
2	20
2	21
2	22
2	23
2	24
2	25
2	26
2	27
2	28
2	29
2	30
2	31
2	32
2	33
2	34
3	1
3	2
3	3
3	4
3	5
3	6
3	7
3	8
3	9
3	10
3	11
3	12
3	13
3	14
3	15
3	16
3	17
3	18
3	19
3	20
3	21
3	22
3	23
3	24
3	25
4	26
4	27
4	28
4	29
4	30
4	31
4	32
4	33
4	34
5	67
5	68
5	69
5	70
5	71
5	72
5	73
5	74
5	75
5	76
5	77
5	78
5	79
5	80
5	81
5	82
5	83
5	84
5	85
5	86
5	87
5	88
6	75
6	77
6	78
6	79
6	80
6	81
6	82
6	83
6	84
6	85
6	86
6	87
6	88
7	67
7	68
7	69
7	70
7	71
7	72
7	73
7	74
7	76
8	35
8	36
8	37
8	38
8	39
8	40
8	41
8	42
8	43
8	44
8	45
8	46
8	47
8	48
8	49
8	50
8	51
8	52
8	53
8	54
8	55
8	56
8	57
8	58
8	59
8	60
8	61
8	62
8	63
8	64
8	65
8	66
9	35
9	36
9	37
9	38
9	39
9	40
9	41
9	42
10	43
10	44
10	45
10	46
10	47
10	48
10	49
10	50
10	51
10	52
10	53
10	54
10	55
10	56
10	57
10	58
10	59
10	60
10	61
10	62
10	63
10	64
10	65
10	66
\.


--
-- TOC entry 4633 (class 0 OID 10311917)
-- Dependencies: 218
-- Data for Name: collection_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_translation ("createdAt", "updatedAt", "languageCode", name, slug, description, id, "baseId") FROM stdin;
2025-12-17 10:13:56.290465	2025-12-17 10:13:56.29096	en	__root_collection__	__root_collection__	The root of the Collection tree.	2	1
2025-12-17 10:13:56.288797	2025-12-17 10:13:56.294269	en	Electronics	electronics		1	2
2025-12-17 10:13:56.301098	2025-12-17 10:13:56.302474	en	Computers	computers		3	3
2025-12-17 10:13:56.307945	2025-12-17 10:13:56.309433	en	Camera & Photo	camera-photo		4	4
2025-12-17 10:13:56.314637	2025-12-17 10:13:56.315649	en	Home & Garden	home-garden		5	5
2025-12-17 10:13:56.319879	2025-12-17 10:13:56.32075	en	Furniture	furniture		6	6
2025-12-17 10:13:56.325496	2025-12-17 10:13:56.326649	en	Plants	plants		7	7
2025-12-17 10:13:56.331302	2025-12-17 10:13:56.331952	en	Sports & Outdoor	sports-outdoor		8	8
2025-12-17 10:13:56.335282	2025-12-17 10:13:56.336442	en	Equipment	equipment		9	9
2025-12-17 10:13:56.341865	2025-12-17 10:13:56.343224	en	Footwear	footwear		10	10
\.


--
-- TOC entry 4723 (class 0 OID 10312490)
-- Dependencies: 308
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer ("createdAt", "updatedAt", "deletedAt", title, "firstName", "lastName", "phoneNumber", "emailAddress", id, "userId") FROM stdin;
\.


--
-- TOC entry 4770 (class 0 OID 10312832)
-- Dependencies: 355
-- Data for Name: customer_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_channels_channel ("customerId", "channelId") FROM stdin;
\.


--
-- TOC entry 4713 (class 0 OID 10312428)
-- Dependencies: 298
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_group ("createdAt", "updatedAt", name, id) FROM stdin;
\.


--
-- TOC entry 4769 (class 0 OID 10312825)
-- Dependencies: 354
-- Data for Name: customer_groups_customer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_groups_customer_group ("customerId", "customerGroupId") FROM stdin;
\.


--
-- TOC entry 4639 (class 0 OID 10311957)
-- Dependencies: 224
-- Data for Name: facet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facet ("createdAt", "updatedAt", "isPrivate", code, id) FROM stdin;
2025-12-17 10:13:55.256316	2025-12-17 10:13:55.256316	f	category	1
2025-12-17 10:13:55.262582	2025-12-17 10:13:55.262582	f	brand	2
2025-12-17 10:13:55.835634	2025-12-17 10:13:55.835634	f	color	3
2025-12-17 10:13:55.995348	2025-12-17 10:13:55.995348	f	plant-type	4
\.


--
-- TOC entry 4751 (class 0 OID 10312699)
-- Dependencies: 336
-- Data for Name: facet_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facet_channels_channel ("facetId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
\.


--
-- TOC entry 4637 (class 0 OID 10311945)
-- Dependencies: 222
-- Data for Name: facet_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facet_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2025-12-17 10:13:55.255478	2025-12-17 10:13:55.256316	en	category	1	1
2025-12-17 10:13:55.262112	2025-12-17 10:13:55.262582	en	brand	2	2
2025-12-17 10:13:55.834974	2025-12-17 10:13:55.835634	en	color	3	3
2025-12-17 10:13:55.994961	2025-12-17 10:13:55.995348	en	plant type	4	4
\.


--
-- TOC entry 4643 (class 0 OID 10311983)
-- Dependencies: 228
-- Data for Name: facet_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facet_value ("createdAt", "updatedAt", code, id, "facetId") FROM stdin;
2025-12-17 10:13:55.2589	2025-12-17 10:13:55.2589	electronics	1	1
2025-12-17 10:13:55.260597	2025-12-17 10:13:55.260597	computers	2	1
2025-12-17 10:13:55.264363	2025-12-17 10:13:55.264363	apple	3	2
2025-12-17 10:13:55.314096	2025-12-17 10:13:55.314096	logitech	4	2
2025-12-17 10:13:55.329704	2025-12-17 10:13:55.329704	samsung	5	2
2025-12-17 10:13:55.360027	2025-12-17 10:13:55.360027	corsair	6	2
2025-12-17 10:13:55.378906	2025-12-17 10:13:55.378906	admi	7	2
2025-12-17 10:13:55.400603	2025-12-17 10:13:55.400603	seagate	8	2
2025-12-17 10:13:55.466853	2025-12-17 10:13:55.466853	photo	9	1
2025-12-17 10:13:55.468533	2025-12-17 10:13:55.468533	polaroid	10	2
2025-12-17 10:13:55.481861	2025-12-17 10:13:55.481861	nikkon	11	2
2025-12-17 10:13:55.49479	2025-12-17 10:13:55.49479	agfa	12	2
2025-12-17 10:13:55.506034	2025-12-17 10:13:55.506034	manfrotto	13	2
2025-12-17 10:13:55.523106	2025-12-17 10:13:55.523106	kodak	14	2
2025-12-17 10:13:55.538697	2025-12-17 10:13:55.538697	sony	15	2
2025-12-17 10:13:55.615204	2025-12-17 10:13:55.615204	rolleiflex	16	2
2025-12-17 10:13:55.641743	2025-12-17 10:13:55.641743	sports-outdoor	17	1
2025-12-17 10:13:55.643646	2025-12-17 10:13:55.643646	equipment	18	1
2025-12-17 10:13:55.645403	2025-12-17 10:13:55.645403	pinarello	19	2
2025-12-17 10:13:55.662541	2025-12-17 10:13:55.662541	everlast	20	2
2025-12-17 10:13:55.777937	2025-12-17 10:13:55.777937	nike	21	2
2025-12-17 10:13:55.7956	2025-12-17 10:13:55.7956	wilson	22	2
2025-12-17 10:13:55.829804	2025-12-17 10:13:55.829804	footwear	23	1
2025-12-17 10:13:55.831919	2025-12-17 10:13:55.831919	adidas	24	2
2025-12-17 10:13:55.837788	2025-12-17 10:13:55.837788	blue	25	3
2025-12-17 10:13:55.840066	2025-12-17 10:13:55.840066	pink	26	3
2025-12-17 10:13:55.882868	2025-12-17 10:13:55.882868	black	27	3
2025-12-17 10:13:55.91102	2025-12-17 10:13:55.91102	white	28	3
2025-12-17 10:13:55.968575	2025-12-17 10:13:55.968575	converse	29	2
2025-12-17 10:13:55.992352	2025-12-17 10:13:55.992352	home-garden	30	1
2025-12-17 10:13:55.993531	2025-12-17 10:13:55.993531	plants	31	1
2025-12-17 10:13:55.996547	2025-12-17 10:13:55.996547	indoor	32	4
2025-12-17 10:13:56.009054	2025-12-17 10:13:56.009054	outdoor	33	4
2025-12-17 10:13:56.110914	2025-12-17 10:13:56.110914	furniture	34	1
2025-12-17 10:13:56.113701	2025-12-17 10:13:56.113701	gray	35	3
2025-12-17 10:13:56.164851	2025-12-17 10:13:56.164851	brown	36	3
2025-12-17 10:13:56.191776	2025-12-17 10:13:56.191776	wood	37	3
2025-12-17 10:13:56.269914	2025-12-17 10:13:56.269914	yellow	38	3
2025-12-17 10:13:56.276152	2025-12-17 10:13:56.276152	green	39	3
\.


--
-- TOC entry 4752 (class 0 OID 10312706)
-- Dependencies: 337
-- Data for Name: facet_value_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facet_value_channels_channel ("facetValueId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
\.


--
-- TOC entry 4641 (class 0 OID 10311971)
-- Dependencies: 226
-- Data for Name: facet_value_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facet_value_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2025-12-17 10:13:55.258526	2025-12-17 10:13:55.2589	en	Electronics	1	1
2025-12-17 10:13:55.260364	2025-12-17 10:13:55.260597	en	Computers	2	2
2025-12-17 10:13:55.264093	2025-12-17 10:13:55.264363	en	Apple	3	3
2025-12-17 10:13:55.313871	2025-12-17 10:13:55.314096	en	Logitech	4	4
2025-12-17 10:13:55.329371	2025-12-17 10:13:55.329704	en	Samsung	5	5
2025-12-17 10:13:55.359788	2025-12-17 10:13:55.360027	en	Corsair	6	6
2025-12-17 10:13:55.378658	2025-12-17 10:13:55.378906	en	ADMI	7	7
2025-12-17 10:13:55.399624	2025-12-17 10:13:55.400603	en	Seagate	8	8
2025-12-17 10:13:55.466529	2025-12-17 10:13:55.466853	en	Photo	9	9
2025-12-17 10:13:55.468302	2025-12-17 10:13:55.468533	en	Polaroid	10	10
2025-12-17 10:13:55.481527	2025-12-17 10:13:55.481861	en	Nikkon	11	11
2025-12-17 10:13:55.494545	2025-12-17 10:13:55.49479	en	Agfa	12	12
2025-12-17 10:13:55.505787	2025-12-17 10:13:55.506034	en	Manfrotto	13	13
2025-12-17 10:13:55.522872	2025-12-17 10:13:55.523106	en	Kodak	14	14
2025-12-17 10:13:55.538483	2025-12-17 10:13:55.538697	en	Sony	15	15
2025-12-17 10:13:55.614904	2025-12-17 10:13:55.615204	en	Rolleiflex	16	16
2025-12-17 10:13:55.641423	2025-12-17 10:13:55.641743	en	Sports & Outdoor	17	17
2025-12-17 10:13:55.643248	2025-12-17 10:13:55.643646	en	Equipment	18	18
2025-12-17 10:13:55.645088	2025-12-17 10:13:55.645403	en	Pinarello	19	19
2025-12-17 10:13:55.662289	2025-12-17 10:13:55.662541	en	Everlast	20	20
2025-12-17 10:13:55.777455	2025-12-17 10:13:55.777937	en	Nike	21	21
2025-12-17 10:13:55.795217	2025-12-17 10:13:55.7956	en	Wilson	22	22
2025-12-17 10:13:55.829453	2025-12-17 10:13:55.829804	en	Footwear	23	23
2025-12-17 10:13:55.831526	2025-12-17 10:13:55.831919	en	Adidas	24	24
2025-12-17 10:13:55.837402	2025-12-17 10:13:55.837788	en	blue	25	25
2025-12-17 10:13:55.839503	2025-12-17 10:13:55.840066	en	pink	26	26
2025-12-17 10:13:55.882389	2025-12-17 10:13:55.882868	en	black	27	27
2025-12-17 10:13:55.910804	2025-12-17 10:13:55.91102	en	white	28	28
2025-12-17 10:13:55.968347	2025-12-17 10:13:55.968575	en	Converse	29	29
2025-12-17 10:13:55.992151	2025-12-17 10:13:55.992352	en	Home & Garden	30	30
2025-12-17 10:13:55.993341	2025-12-17 10:13:55.993531	en	Plants	31	31
2025-12-17 10:13:55.996351	2025-12-17 10:13:55.996547	en	Indoor	32	32
2025-12-17 10:13:56.00837	2025-12-17 10:13:56.009054	en	Outdoor	33	33
2025-12-17 10:13:56.110529	2025-12-17 10:13:56.110914	en	Furniture	34	34
2025-12-17 10:13:56.113296	2025-12-17 10:13:56.113701	en	gray	35	35
2025-12-17 10:13:56.164479	2025-12-17 10:13:56.164851	en	brown	36	36
2025-12-17 10:13:56.191391	2025-12-17 10:13:56.191776	en	wood	37	37
2025-12-17 10:13:56.269629	2025-12-17 10:13:56.269914	en	yellow	38	38
2025-12-17 10:13:56.275782	2025-12-17 10:13:56.276152	en	green	39	39
\.


--
-- TOC entry 4665 (class 0 OID 10312118)
-- Dependencies: 250
-- Data for Name: fulfillment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment ("createdAt", "updatedAt", state, "trackingCode", method, "handlerCode", id) FROM stdin;
\.


--
-- TOC entry 4729 (class 0 OID 10312540)
-- Dependencies: 314
-- Data for Name: global_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_settings ("createdAt", "updatedAt", "availableLanguages", "trackInventory", "outOfStockThreshold", id) FROM stdin;
2025-12-17 10:13:54.120487	2025-12-17 10:13:54.120487	en	t	0	1
\.


--
-- TOC entry 4741 (class 0 OID 10312623)
-- Dependencies: 326
-- Data for Name: history_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_entry ("createdAt", "updatedAt", type, "isPublic", data, id, discriminator, "administratorId", "customerId", "orderId") FROM stdin;
\.


--
-- TOC entry 4743 (class 0 OID 10312637)
-- Dependencies: 328
-- Data for Name: job_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_record ("createdAt", "updatedAt", "queueName", data, state, progress, result, error, "startedAt", "settledAt", "isSettled", retries, attempts, id) FROM stdin;
2025-12-17 10:13:55.284892	2025-12-17 10:13:55.660202	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[2]}	COMPLETED	100	true	\N	2025-12-17 10:13:55.645	2025-12-17 10:13:55.66	t	0	1	2
2025-12-17 10:13:55.290232	2025-12-17 10:13:56.062931	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[4]}	COMPLETED	100	true	\N	2025-12-17 10:13:56.05	2025-12-17 10:13:56.062	t	0	1	4
2025-12-17 10:13:55.317725	2025-12-17 10:13:56.69349	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[7]}	COMPLETED	100	true	\N	2025-12-17 10:13:56.659	2025-12-17 10:13:56.693	t	0	1	7
2025-12-17 10:13:55.348285	2025-12-17 10:13:57.12168	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[9]}	COMPLETED	100	true	\N	2025-12-17 10:13:57.077	2025-12-17 10:13:57.121	t	0	1	9
2025-12-17 10:13:55.350545	2025-12-17 10:13:57.331345	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[10]}	COMPLETED	100	true	\N	2025-12-17 10:13:57.287	2025-12-17 10:13:57.33	t	0	1	10
2025-12-17 10:13:55.366423	2025-12-17 10:13:57.533426	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[11]}	COMPLETED	100	true	\N	2025-12-17 10:13:57.497	2025-12-17 10:13:57.533	t	0	1	11
2025-12-17 10:13:55.387411	2025-12-17 10:13:58.372522	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[15]}	COMPLETED	100	true	\N	2025-12-17 10:13:58.332	2025-12-17 10:13:58.371	t	0	1	15
2025-12-17 10:13:55.412876	2025-12-17 11:43:11.386154	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[21]}	COMPLETED	100	true	\N	2025-12-17 11:43:11.341	2025-12-17 11:43:11.385	t	0	1	21
2025-12-17 10:13:55.667053	2025-12-17 10:13:55.667053	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[36]}	PENDING	0	\N	\N	\N	\N	f	0	0	36
2025-12-17 10:13:55.280875	2025-12-17 10:13:55.460552	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[1]}	COMPLETED	100	true	\N	2025-12-17 10:13:55.444	2025-12-17 10:13:55.46	t	0	1	1
2025-12-17 10:13:55.389132	2025-12-17 11:43:10.346955	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[16]}	COMPLETED	100	true	\N	2025-12-17 11:43:10.256	2025-12-17 11:43:10.346	t	0	1	16
2025-12-17 10:13:55.41515	2025-12-17 11:43:11.58	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[22]}	COMPLETED	100	true	\N	2025-12-17 11:43:11.549	2025-12-17 11:43:11.579	t	0	1	22
2025-12-17 10:13:55.472941	2025-12-17 10:13:55.472941	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[26]}	PENDING	0	\N	\N	\N	\N	f	0	0	26
2025-12-17 10:13:55.486118	2025-12-17 10:13:55.486118	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[27]}	PENDING	0	\N	\N	\N	\N	f	0	0	27
2025-12-17 10:13:55.498478	2025-12-17 10:13:55.498478	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[28]}	PENDING	0	\N	\N	\N	\N	f	0	0	28
2025-12-17 10:13:55.510182	2025-12-17 10:13:55.510182	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[29]}	PENDING	0	\N	\N	\N	\N	f	0	0	29
2025-12-17 10:13:55.526687	2025-12-17 10:13:55.526687	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[30]}	PENDING	0	\N	\N	\N	\N	f	0	0	30
2025-12-17 10:13:55.564127	2025-12-17 10:13:55.564127	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[31]}	PENDING	0	\N	\N	\N	\N	f	0	0	31
2025-12-17 10:13:55.575121	2025-12-17 10:13:55.575121	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[32]}	PENDING	0	\N	\N	\N	\N	f	0	0	32
2025-12-17 10:13:55.607842	2025-12-17 10:13:55.607842	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[33]}	PENDING	0	\N	\N	\N	\N	f	0	0	33
2025-12-17 10:13:55.620312	2025-12-17 10:13:55.620312	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[34]}	PENDING	0	\N	\N	\N	\N	f	0	0	34
2025-12-17 10:13:55.652658	2025-12-17 10:13:55.652658	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[35]}	PENDING	0	\N	\N	\N	\N	f	0	0	35
2025-12-17 10:13:55.681873	2025-12-17 10:13:55.681873	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[37]}	PENDING	0	\N	\N	\N	\N	f	0	0	37
2025-12-17 10:13:55.747493	2025-12-17 10:13:55.747493	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[39]}	PENDING	0	\N	\N	\N	\N	f	0	0	39
2025-12-17 10:13:55.803286	2025-12-17 10:13:55.803286	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[41]}	PENDING	0	\N	\N	\N	\N	f	0	0	41
2025-12-17 10:13:55.821125	2025-12-17 10:13:55.821125	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[42]}	PENDING	0	\N	\N	\N	\N	f	0	0	42
2025-12-17 10:13:55.864163	2025-12-17 10:13:55.864163	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[44]}	PENDING	0	\N	\N	\N	\N	f	0	0	44
2025-12-17 10:13:55.872002	2025-12-17 10:13:55.872002	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[46]}	PENDING	0	\N	\N	\N	\N	f	0	0	46
2025-12-17 10:13:55.697289	2025-12-17 10:13:55.697289	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[38]}	PENDING	0	\N	\N	\N	\N	f	0	0	38
2025-12-17 10:13:55.785697	2025-12-17 10:13:55.785697	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[40]}	PENDING	0	\N	\N	\N	\N	f	0	0	40
2025-12-17 10:13:55.858843	2025-12-17 10:13:55.858843	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[43]}	PENDING	0	\N	\N	\N	\N	f	0	0	43
2025-12-17 10:13:55.868747	2025-12-17 10:13:55.868747	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[45]}	PENDING	0	\N	\N	\N	\N	f	0	0	45
2025-12-17 10:13:55.287407	2025-12-17 10:13:55.871917	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[3]}	COMPLETED	100	true	\N	2025-12-17 10:13:55.847	2025-12-17 10:13:55.871	t	0	1	3
2025-12-17 10:13:55.892444	2025-12-17 10:13:55.892444	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[47]}	PENDING	0	\N	\N	\N	\N	f	0	0	47
2025-12-17 10:13:55.895925	2025-12-17 10:13:55.895925	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[48]}	PENDING	0	\N	\N	\N	\N	f	0	0	48
2025-12-17 10:13:55.897848	2025-12-17 10:13:55.897848	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[49]}	PENDING	0	\N	\N	\N	\N	f	0	0	49
2025-12-17 10:13:55.899874	2025-12-17 10:13:55.899874	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[50]}	PENDING	0	\N	\N	\N	\N	f	0	0	50
2025-12-17 10:13:55.916627	2025-12-17 10:13:55.916627	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[51]}	PENDING	0	\N	\N	\N	\N	f	0	0	51
2025-12-17 10:13:55.920083	2025-12-17 10:13:55.920083	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[53]}	PENDING	0	\N	\N	\N	\N	f	0	0	53
2025-12-17 10:13:55.936781	2025-12-17 10:13:55.936781	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[55]}	PENDING	0	\N	\N	\N	\N	f	0	0	55
2025-12-17 10:13:55.940048	2025-12-17 10:13:55.940048	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[57]}	PENDING	0	\N	\N	\N	\N	f	0	0	57
2025-12-17 10:13:55.953606	2025-12-17 10:13:55.953606	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[59]}	PENDING	0	\N	\N	\N	\N	f	0	0	59
2025-12-17 10:13:55.957165	2025-12-17 10:13:55.957165	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[61]}	PENDING	0	\N	\N	\N	\N	f	0	0	61
2025-12-17 10:13:55.975162	2025-12-17 10:13:55.975162	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[63]}	PENDING	0	\N	\N	\N	\N	f	0	0	63
2025-12-17 10:13:55.980884	2025-12-17 10:13:55.980884	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[65]}	PENDING	0	\N	\N	\N	\N	f	0	0	65
2025-12-17 10:13:55.999596	2025-12-17 10:13:55.999596	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[67]}	PENDING	0	\N	\N	\N	\N	f	0	0	67
2025-12-17 10:13:55.918336	2025-12-17 10:13:55.918336	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[52]}	PENDING	0	\N	\N	\N	\N	f	0	0	52
2025-12-17 10:13:55.923095	2025-12-17 10:13:55.923095	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[54]}	PENDING	0	\N	\N	\N	\N	f	0	0	54
2025-12-17 10:13:55.938542	2025-12-17 10:13:55.938542	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[56]}	PENDING	0	\N	\N	\N	\N	f	0	0	56
2025-12-17 10:13:55.941691	2025-12-17 10:13:55.941691	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[58]}	PENDING	0	\N	\N	\N	\N	f	0	0	58
2025-12-17 10:13:55.955373	2025-12-17 10:13:55.955373	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[60]}	PENDING	0	\N	\N	\N	\N	f	0	0	60
2025-12-17 10:13:55.958794	2025-12-17 10:13:55.958794	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[62]}	PENDING	0	\N	\N	\N	\N	f	0	0	62
2025-12-17 10:13:55.977593	2025-12-17 10:13:55.977593	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[64]}	PENDING	0	\N	\N	\N	\N	f	0	0	64
2025-12-17 10:13:55.982985	2025-12-17 10:13:55.982985	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[66]}	PENDING	0	\N	\N	\N	\N	f	0	0	66
2025-12-17 10:13:56.01617	2025-12-17 10:13:56.01617	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[68]}	PENDING	0	\N	\N	\N	\N	f	0	0	68
2025-12-17 10:13:56.02983	2025-12-17 10:13:56.02983	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[69]}	PENDING	0	\N	\N	\N	\N	f	0	0	69
2025-12-17 10:13:56.076432	2025-12-17 10:13:56.076432	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[72]}	PENDING	0	\N	\N	\N	\N	f	0	0	72
2025-12-17 10:13:56.10232	2025-12-17 10:13:56.10232	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[74]}	PENDING	0	\N	\N	\N	\N	f	0	0	74
2025-12-17 10:13:56.119416	2025-12-17 10:13:56.119416	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[75]}	PENDING	0	\N	\N	\N	\N	f	0	0	75
2025-12-17 10:13:56.171021	2025-12-17 10:13:56.171021	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[79]}	PENDING	0	\N	\N	\N	\N	f	0	0	79
2025-12-17 10:13:56.212747	2025-12-17 10:13:56.212747	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[82]}	PENDING	0	\N	\N	\N	\N	f	0	0	82
2025-12-17 10:13:56.254948	2025-12-17 10:13:56.254948	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[85]}	PENDING	0	\N	\N	\N	\N	f	0	0	85
2025-12-17 10:13:56.281036	2025-12-17 10:13:56.281036	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[87]}	PENDING	0	\N	\N	\N	\N	f	0	0	87
2025-12-17 10:13:56.311584	2025-12-17 10:13:56.869752	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[4]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:56.845	2025-12-17 10:13:56.868	t	0	1	91
2025-12-17 10:13:56.317928	2025-12-17 10:13:57.067793	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[5]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:57.051	2025-12-17 10:13:57.067	t	0	1	92
2025-12-17 10:13:56.042943	2025-12-17 10:13:56.042943	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[70]}	PENDING	0	\N	\N	\N	\N	f	0	0	70
2025-12-17 10:13:56.062667	2025-12-17 10:13:56.062667	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[71]}	PENDING	0	\N	\N	\N	\N	f	0	0	71
2025-12-17 10:13:55.303516	2025-12-17 10:13:56.265784	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[5]}	COMPLETED	100	true	\N	2025-12-17 10:13:56.252	2025-12-17 10:13:56.265	t	0	1	5
2025-12-17 10:13:56.921117	2025-12-17 10:13:56.921117	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[26,27,28,29,30,31,32,33,34]}	PENDING	0	\N	\N	\N	\N	f	0	0	101
2025-12-17 10:13:57.531059	2025-12-17 10:13:57.531059	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[67,68,69,70,71,72,73,74,76]}	PENDING	0	\N	\N	\N	\N	f	0	0	104
2025-12-17 10:13:56.089312	2025-12-17 10:13:56.089312	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[73]}	PENDING	0	\N	\N	\N	\N	f	0	0	73
2025-12-17 10:13:56.134126	2025-12-17 10:13:56.134126	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[76]}	PENDING	0	\N	\N	\N	\N	f	0	0	76
2025-12-17 10:13:56.14385	2025-12-17 10:13:56.14385	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[77]}	PENDING	0	\N	\N	\N	\N	f	0	0	77
2025-12-17 10:13:56.156933	2025-12-17 10:13:56.156933	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[78]}	PENDING	0	\N	\N	\N	\N	f	0	0	78
2025-12-17 10:13:56.183156	2025-12-17 10:13:56.183156	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[80]}	PENDING	0	\N	\N	\N	\N	f	0	0	80
2025-12-17 10:13:56.197918	2025-12-17 10:13:56.197918	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[81]}	PENDING	0	\N	\N	\N	\N	f	0	0	81
2025-12-17 10:13:56.226318	2025-12-17 10:13:56.226318	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[83]}	PENDING	0	\N	\N	\N	\N	f	0	0	83
2025-12-17 10:13:56.238489	2025-12-17 10:13:56.238489	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[84]}	PENDING	0	\N	\N	\N	\N	f	0	0	84
2025-12-17 10:13:56.275333	2025-12-17 10:13:56.275333	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[86]}	PENDING	0	\N	\N	\N	\N	f	0	0	86
2025-12-17 10:13:56.284984	2025-12-17 10:13:56.284984	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[88]}	PENDING	0	\N	\N	\N	\N	f	0	0	88
2025-12-17 10:13:57.117298	2025-12-17 10:13:57.117298	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88]}	PENDING	0	\N	\N	\N	\N	f	0	0	102
2025-12-17 10:13:55.368519	2025-12-17 10:13:57.743495	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[12]}	COMPLETED	100	true	\N	2025-12-17 10:13:57.705	2025-12-17 10:13:57.742	t	0	1	12
2025-12-17 10:13:57.948213	2025-12-17 10:13:57.948213	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[35,36,37,38,39,40,41,42]}	PENDING	0	\N	\N	\N	\N	f	0	0	106
2025-12-17 10:13:58.157731	2025-12-17 10:13:58.157731	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66]}	PENDING	0	\N	\N	\N	\N	f	0	0	107
2025-12-17 10:13:56.39972	2025-12-17 10:13:56.39972	update-search-index	{"type":"reindex","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_session":{"user":{"id":1,"identifier":"admin","verified":true,"channelPermissions":[]},"id":"__dummy_session_id__","token":"__dummy_session_token__","expires":"2026-12-17T11:13:56.286Z","cacheExpiry":31557600000},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false}}	PENDING	0	\N	\N	\N	\N	f	0	0	98
2025-12-17 10:13:55.334614	2025-12-17 10:13:56.906911	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[8]}	COMPLETED	100	true	\N	2025-12-17 10:13:56.867	2025-12-17 10:13:56.906	t	0	1	8
2025-12-17 10:13:56.297263	2025-12-17 10:13:56.443427	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[2]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:56.431	2025-12-17 10:13:56.443	t	0	1	89
2025-12-17 10:13:55.305714	2025-12-17 10:13:56.471503	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[6]}	COMPLETED	100	true	\N	2025-12-17 10:13:56.455	2025-12-17 10:13:56.471	t	0	1	6
2025-12-17 10:13:56.494664	2025-12-17 10:13:56.494664	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34]}	PENDING	0	\N	\N	\N	\N	f	0	0	99
2025-12-17 10:13:56.304829	2025-12-17 10:13:56.656498	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[3]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:56.637	2025-12-17 10:13:56.656	t	0	1	90
2025-12-17 10:13:56.70771	2025-12-17 10:13:56.70771	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]}	PENDING	0	\N	\N	\N	\N	f	0	0	100
2025-12-17 10:13:56.328528	2025-12-17 10:13:57.481859	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[7]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:57.464	2025-12-17 10:13:57.481	t	0	1	94
2025-12-17 10:13:56.322325	2025-12-17 10:13:57.275875	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[6]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:57.258	2025-12-17 10:13:57.275	t	0	1	93
2025-12-17 10:13:57.325083	2025-12-17 10:13:57.325083	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[75,77,78,79,80,81,82,83,84,85,86,87,88]}	PENDING	0	\N	\N	\N	\N	f	0	0	103
2025-12-17 10:13:56.333255	2025-12-17 10:13:57.686347	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[8]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:57.671	2025-12-17 10:13:57.685	t	0	1	95
2025-12-17 10:13:56.338803	2025-12-17 10:13:57.898154	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[9]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:57.879	2025-12-17 10:13:57.897	t	0	1	96
2025-12-17 10:13:56.345971	2025-12-17 10:13:58.108561	apply-collection-filters	{"ctx":{"languageCode":"en","channelToken":"6s26u4tjc94xdjbp1c9n"},"collectionIds":[10]}	COMPLETED	100	{"processedCollections":1}	\N	2025-12-17 10:13:58.088	2025-12-17 10:13:58.107	t	0	1	97
2025-12-17 10:13:57.736539	2025-12-17 10:13:57.736539	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66]}	PENDING	0	\N	\N	\N	\N	f	0	0	105
2025-12-17 10:13:55.370351	2025-12-17 10:13:57.956391	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[13]}	COMPLETED	100	true	\N	2025-12-17 10:13:57.914	2025-12-17 10:13:57.956	t	0	1	13
2025-12-17 10:13:55.385615	2025-12-17 10:13:58.161443	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[14]}	COMPLETED	100	true	\N	2025-12-17 10:13:58.123	2025-12-17 10:13:58.161	t	0	1	14
2025-12-17 10:13:55.40946	2025-12-17 11:43:10.954122	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[19]}	COMPLETED	100	true	\N	2025-12-17 11:43:10.924	2025-12-17 11:43:10.953	t	0	1	19
2025-12-17 10:13:55.391046	2025-12-17 11:43:10.533577	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[17]}	COMPLETED	100	true	\N	2025-12-17 11:43:10.507	2025-12-17 11:43:10.533	t	0	1	17
2025-12-17 10:13:55.407678	2025-12-17 11:43:10.742795	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[18]}	COMPLETED	100	true	\N	2025-12-17 11:43:10.713	2025-12-17 11:43:10.742	t	0	1	18
2025-12-17 10:13:55.411161	2025-12-17 11:43:11.173788	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[20]}	COMPLETED	100	true	\N	2025-12-17 11:43:11.132	2025-12-17 11:43:11.173	t	0	1	20
2025-12-17 10:13:55.426907	2025-12-17 11:43:11.791128	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[23]}	COMPLETED	100	true	\N	2025-12-17 11:43:11.758	2025-12-17 11:43:11.79	t	0	1	23
2025-12-17 10:13:55.457724	2025-12-17 11:43:12.202036	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[25]}	COMPLETED	100	true	\N	2025-12-17 11:43:12.176	2025-12-17 11:43:12.201	t	0	1	25
2025-12-17 10:13:55.439621	2025-12-17 11:43:11.996669	update-search-index	{"type":"update-variants","ctx":{"_apiType":"admin","_channel":{"token":"6s26u4tjc94xdjbp1c9n","createdAt":"2025-12-17T05:13:54.127Z","updatedAt":"2025-12-17T05:13:55.223Z","code":"__default_channel__","description":"","defaultLanguageCode":"en","availableLanguageCodes":["en"],"defaultCurrencyCode":"USD","availableCurrencyCodes":["USD"],"trackInventory":true,"outOfStockThreshold":0,"pricesIncludeTax":false,"id":1,"sellerId":1,"defaultShippingZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2025-12-17T05:13:54.847Z","updatedAt":"2025-12-17T05:13:54.847Z","name":"Europe","id":2}},"_languageCode":"en","_currencyCode":"USD","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"variantIds":[24]}	COMPLETED	100	true	\N	2025-12-17 11:43:11.967	2025-12-17 11:43:11.996	t	0	1	24
\.


--
-- TOC entry 4745 (class 0 OID 10312649)
-- Dependencies: 330
-- Data for Name: job_record_buffer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_record_buffer ("createdAt", "updatedAt", "bufferId", job, id) FROM stdin;
\.


--
-- TOC entry 4774 (class 0 OID 10316517)
-- Dependencies: 359
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- TOC entry 4685 (class 0 OID 10312240)
-- Dependencies: 270
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" ("createdAt", "updatedAt", type, code, state, active, "orderPlacedAt", "couponCodes", "shippingAddress", "billingAddress", "currencyCode", id, "aggregateOrderId", "customerId", "taxZoneId", "subTotal", "subTotalWithTax", shipping, "shippingWithTax") FROM stdin;
\.


--
-- TOC entry 4761 (class 0 OID 10312769)
-- Dependencies: 346
-- Data for Name: order_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_channels_channel ("orderId", "channelId") FROM stdin;
\.


--
-- TOC entry 4760 (class 0 OID 10312762)
-- Dependencies: 345
-- Data for Name: order_fulfillments_fulfillment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_fulfillments_fulfillment ("orderId", "fulfillmentId") FROM stdin;
\.


--
-- TOC entry 4691 (class 0 OID 10312284)
-- Dependencies: 276
-- Data for Name: order_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_line ("createdAt", "updatedAt", quantity, "orderPlacedQuantity", "listPriceIncludesTax", adjustments, "taxLines", id, "sellerChannelId", "shippingLineId", "productVariantId", "taxCategoryId", "initialListPrice", "listPrice", "featuredAssetId", "orderId") FROM stdin;
\.


--
-- TOC entry 4663 (class 0 OID 10312102)
-- Dependencies: 248
-- Data for Name: order_line_reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_line_reference ("createdAt", "updatedAt", quantity, id, "fulfillmentId", "modificationId", "orderLineId", "refundId", discriminator) FROM stdin;
\.


--
-- TOC entry 4673 (class 0 OID 10312167)
-- Dependencies: 258
-- Data for Name: order_modification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_modification ("createdAt", "updatedAt", note, "shippingAddressChange", "billingAddressChange", id, "priceChange", "orderId", "paymentId", "refundId") FROM stdin;
\.


--
-- TOC entry 4759 (class 0 OID 10312755)
-- Dependencies: 344
-- Data for Name: order_promotions_promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_promotions_promotion ("orderId", "promotionId") FROM stdin;
\.


--
-- TOC entry 4669 (class 0 OID 10312142)
-- Dependencies: 254
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment ("createdAt", "updatedAt", method, state, "errorMessage", "transactionId", metadata, id, amount, "orderId") FROM stdin;
\.


--
-- TOC entry 4733 (class 0 OID 10312565)
-- Dependencies: 318
-- Data for Name: payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_method ("createdAt", "updatedAt", code, enabled, checker, handler, id) FROM stdin;
2025-12-17 10:13:55.221349	2025-12-17 10:13:55.221349	standard-payment	t	\N	{"code":"dummy-payment-handler","args":[{"name":"automaticSettle","value":"false"}]}	1
\.


--
-- TOC entry 4771 (class 0 OID 10312839)
-- Dependencies: 356
-- Data for Name: payment_method_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_method_channels_channel ("paymentMethodId", "channelId") FROM stdin;
1	1
\.


--
-- TOC entry 4731 (class 0 OID 10312553)
-- Dependencies: 316
-- Data for Name: payment_method_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_method_translation ("createdAt", "updatedAt", "languageCode", name, description, id, "baseId") FROM stdin;
2025-12-17 10:13:55.220417	2025-12-17 10:13:55.221349	en	Standard Payment		1	1
\.


--
-- TOC entry 4657 (class 0 OID 10312067)
-- Dependencies: 242
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product ("createdAt", "updatedAt", "deletedAt", enabled, id, "featuredAssetId") FROM stdin;
2025-12-17 10:13:55.268158	2025-12-17 10:13:55.268158	\N	t	1	1
2025-12-17 10:13:55.299063	2025-12-17 10:13:55.299063	\N	t	2	2
2025-12-17 10:13:55.315374	2025-12-17 10:13:55.315374	\N	t	3	3
2025-12-17 10:13:55.331532	2025-12-17 10:13:55.331532	\N	t	4	4
2025-12-17 10:13:55.342947	2025-12-17 10:13:55.342947	\N	t	5	5
2025-12-17 10:13:55.361468	2025-12-17 10:13:55.361468	\N	t	6	6
2025-12-17 10:13:55.380179	2025-12-17 10:13:55.380179	\N	t	7	7
2025-12-17 10:13:55.401949	2025-12-17 10:13:55.401949	\N	t	8	8
2025-12-17 10:13:55.423901	2025-12-17 10:13:55.423901	\N	t	9	9
2025-12-17 10:13:55.43714	2025-12-17 10:13:55.43714	\N	t	10	10
2025-12-17 10:13:55.448687	2025-12-17 10:13:55.448687	\N	t	11	11
2025-12-17 10:13:55.469709	2025-12-17 10:13:55.469709	\N	t	12	12
2025-12-17 10:13:55.483451	2025-12-17 10:13:55.483451	\N	t	13	13
2025-12-17 10:13:55.496105	2025-12-17 10:13:55.496105	\N	t	14	14
2025-12-17 10:13:55.507321	2025-12-17 10:13:55.507321	\N	t	15	15
2025-12-17 10:13:55.524458	2025-12-17 10:13:55.524458	\N	t	16	16
2025-12-17 10:13:55.539969	2025-12-17 10:13:55.539969	\N	t	17	17
2025-12-17 10:13:55.572806	2025-12-17 10:13:55.572806	\N	t	18	18
2025-12-17 10:13:55.582159	2025-12-17 10:13:55.582159	\N	t	19	19
2025-12-17 10:13:55.616968	2025-12-17 10:13:55.616968	\N	t	20	20
2025-12-17 10:13:55.647515	2025-12-17 10:13:55.647515	\N	t	21	21
2025-12-17 10:13:55.664176	2025-12-17 10:13:55.664176	\N	t	22	22
2025-12-17 10:13:55.678568	2025-12-17 10:13:55.678568	\N	t	23	23
2025-12-17 10:13:55.693718	2025-12-17 10:13:55.693718	\N	t	24	24
2025-12-17 10:13:55.735272	2025-12-17 10:13:55.735272	\N	t	25	25
2025-12-17 10:13:55.780749	2025-12-17 10:13:55.780749	\N	t	26	26
2025-12-17 10:13:55.799016	2025-12-17 10:13:55.799016	\N	t	27	27
2025-12-17 10:13:55.816035	2025-12-17 10:13:55.816035	\N	t	28	28
2025-12-17 10:13:55.843855	2025-12-17 10:13:55.843855	\N	t	29	29
2025-12-17 10:13:55.885123	2025-12-17 10:13:55.885123	\N	t	30	30
2025-12-17 10:13:55.912175	2025-12-17 10:13:55.912175	\N	t	31	31
2025-12-17 10:13:55.932134	2025-12-17 10:13:55.932134	\N	t	32	32
2025-12-17 10:13:55.949229	2025-12-17 10:13:55.949229	\N	t	33	33
2025-12-17 10:13:55.969832	2025-12-17 10:13:55.969832	\N	t	34	34
2025-12-17 10:13:55.997558	2025-12-17 10:13:55.997558	\N	t	35	35
2025-12-17 10:13:56.013635	2025-12-17 10:13:56.013635	\N	t	36	36
2025-12-17 10:13:56.026329	2025-12-17 10:13:56.026329	\N	t	37	37
2025-12-17 10:13:56.038989	2025-12-17 10:13:56.038989	\N	t	38	38
2025-12-17 10:13:56.055759	2025-12-17 10:13:56.055759	\N	t	39	39
2025-12-17 10:13:56.072321	2025-12-17 10:13:56.072321	\N	t	40	40
2025-12-17 10:13:56.085194	2025-12-17 10:13:56.085194	\N	t	41	41
2025-12-17 10:13:56.098205	2025-12-17 10:13:56.098205	\N	t	42	42
2025-12-17 10:13:56.115711	2025-12-17 10:13:56.115711	\N	t	43	43
2025-12-17 10:13:56.130281	2025-12-17 10:13:56.130281	\N	t	44	44
2025-12-17 10:13:56.139881	2025-12-17 10:13:56.139881	\N	t	45	45
2025-12-17 10:13:56.153057	2025-12-17 10:13:56.153057	\N	t	46	46
2025-12-17 10:13:56.167236	2025-12-17 10:13:56.167236	\N	t	47	47
2025-12-17 10:13:56.17908	2025-12-17 10:13:56.17908	\N	t	48	48
2025-12-17 10:13:56.194102	2025-12-17 10:13:56.194102	\N	t	49	49
2025-12-17 10:13:56.208053	2025-12-17 10:13:56.208053	\N	t	50	50
2025-12-17 10:13:56.221943	2025-12-17 10:13:56.221943	\N	t	51	51
2025-12-17 10:13:56.233888	2025-12-17 10:13:56.233888	\N	t	52	52
2025-12-17 10:13:56.25017	2025-12-17 10:13:56.25017	\N	t	53	53
2025-12-17 10:13:56.263004	2025-12-17 10:13:56.263004	\N	t	54	54
\.


--
-- TOC entry 4653 (class 0 OID 10312043)
-- Dependencies: 238
-- Data for Name: product_asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_asset ("createdAt", "updatedAt", "assetId", "position", "productId", id) FROM stdin;
2025-12-17 10:13:55.269497	2025-12-17 10:13:55.269497	1	0	1	1
2025-12-17 10:13:55.299713	2025-12-17 10:13:55.299713	2	0	2	2
2025-12-17 10:13:55.315897	2025-12-17 10:13:55.315897	3	0	3	3
2025-12-17 10:13:55.332335	2025-12-17 10:13:55.332335	4	0	4	4
2025-12-17 10:13:55.343499	2025-12-17 10:13:55.343499	5	0	5	5
2025-12-17 10:13:55.362029	2025-12-17 10:13:55.362029	6	0	6	6
2025-12-17 10:13:55.380695	2025-12-17 10:13:55.380695	7	0	7	7
2025-12-17 10:13:55.40251	2025-12-17 10:13:55.40251	8	0	8	8
2025-12-17 10:13:55.424455	2025-12-17 10:13:55.424455	9	0	9	9
2025-12-17 10:13:55.437657	2025-12-17 10:13:55.437657	10	0	10	10
2025-12-17 10:13:55.450694	2025-12-17 10:13:55.450694	11	0	11	11
2025-12-17 10:13:55.470534	2025-12-17 10:13:55.470534	12	0	12	12
2025-12-17 10:13:55.484074	2025-12-17 10:13:55.484074	13	0	13	13
2025-12-17 10:13:55.496651	2025-12-17 10:13:55.496651	14	0	14	14
2025-12-17 10:13:55.508227	2025-12-17 10:13:55.508227	15	0	15	15
2025-12-17 10:13:55.524962	2025-12-17 10:13:55.524962	16	0	16	16
2025-12-17 10:13:55.562219	2025-12-17 10:13:55.562219	17	0	17	17
2025-12-17 10:13:55.573289	2025-12-17 10:13:55.573289	18	0	18	18
2025-12-17 10:13:55.604444	2025-12-17 10:13:55.604444	19	0	19	19
2025-12-17 10:13:55.617741	2025-12-17 10:13:55.617741	20	0	20	20
2025-12-17 10:13:55.649479	2025-12-17 10:13:55.649479	21	0	21	21
2025-12-17 10:13:55.664769	2025-12-17 10:13:55.664769	22	0	22	22
2025-12-17 10:13:55.679283	2025-12-17 10:13:55.679283	23	0	23	23
2025-12-17 10:13:55.694674	2025-12-17 10:13:55.694674	24	0	24	24
2025-12-17 10:13:55.736915	2025-12-17 10:13:55.736915	25	0	25	25
2025-12-17 10:13:55.781825	2025-12-17 10:13:55.781825	26	0	26	26
2025-12-17 10:13:55.800022	2025-12-17 10:13:55.800022	27	0	27	27
2025-12-17 10:13:55.816986	2025-12-17 10:13:55.816986	28	0	28	28
2025-12-17 10:13:55.84508	2025-12-17 10:13:55.84508	29	0	29	29
2025-12-17 10:13:55.885978	2025-12-17 10:13:55.885978	30	0	30	30
2025-12-17 10:13:55.912624	2025-12-17 10:13:55.912624	31	0	31	31
2025-12-17 10:13:55.932666	2025-12-17 10:13:55.932666	32	0	32	32
2025-12-17 10:13:55.949725	2025-12-17 10:13:55.949725	33	0	33	33
2025-12-17 10:13:55.970298	2025-12-17 10:13:55.970298	34	0	34	34
2025-12-17 10:13:55.997995	2025-12-17 10:13:55.997995	35	0	35	35
2025-12-17 10:13:56.014506	2025-12-17 10:13:56.014506	36	0	36	36
2025-12-17 10:13:56.0272	2025-12-17 10:13:56.0272	37	0	37	37
2025-12-17 10:13:56.040037	2025-12-17 10:13:56.040037	38	0	38	38
2025-12-17 10:13:56.058042	2025-12-17 10:13:56.058042	39	0	39	39
2025-12-17 10:13:56.073269	2025-12-17 10:13:56.073269	40	0	40	40
2025-12-17 10:13:56.086343	2025-12-17 10:13:56.086343	41	0	41	41
2025-12-17 10:13:56.099085	2025-12-17 10:13:56.099085	42	0	42	42
2025-12-17 10:13:56.116583	2025-12-17 10:13:56.116583	43	0	43	43
2025-12-17 10:13:56.131175	2025-12-17 10:13:56.131175	44	0	44	44
2025-12-17 10:13:56.140797	2025-12-17 10:13:56.140797	45	0	45	45
2025-12-17 10:13:56.153979	2025-12-17 10:13:56.153979	46	0	46	46
2025-12-17 10:13:56.168111	2025-12-17 10:13:56.168111	47	0	47	47
2025-12-17 10:13:56.180142	2025-12-17 10:13:56.180142	48	0	48	48
2025-12-17 10:13:56.194964	2025-12-17 10:13:56.194964	49	0	49	49
2025-12-17 10:13:56.209071	2025-12-17 10:13:56.209071	50	0	50	50
2025-12-17 10:13:56.222739	2025-12-17 10:13:56.222739	51	0	51	51
2025-12-17 10:13:56.234769	2025-12-17 10:13:56.234769	52	0	52	52
2025-12-17 10:13:56.251171	2025-12-17 10:13:56.251171	53	0	53	53
2025-12-17 10:13:56.264125	2025-12-17 10:13:56.264125	54	0	54	54
\.


--
-- TOC entry 4754 (class 0 OID 10312720)
-- Dependencies: 339
-- Data for Name: product_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_channels_channel ("productId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
\.


--
-- TOC entry 4753 (class 0 OID 10312713)
-- Dependencies: 338
-- Data for Name: product_facet_values_facet_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_facet_values_facet_value ("productId", "facetValueId") FROM stdin;
1	1
1	2
1	3
2	1
2	2
2	3
3	1
3	2
3	4
4	1
4	2
4	5
5	1
5	2
5	5
6	1
6	2
6	6
7	1
7	2
7	7
8	1
8	2
8	8
9	1
9	2
9	6
10	1
10	2
11	1
11	2
12	1
12	9
12	10
13	1
13	9
13	11
14	1
14	9
14	12
15	1
15	9
15	13
16	1
16	9
16	14
17	1
17	9
17	15
18	1
18	9
18	11
19	1
19	9
20	1
20	9
20	16
21	17
21	18
21	19
22	17
22	18
22	20
23	17
23	18
23	20
24	17
24	18
25	17
25	18
26	17
26	18
26	21
27	17
27	18
27	22
28	17
28	18
28	22
29	17
29	23
29	24
29	25
29	26
30	17
30	23
30	21
30	27
31	17
31	23
31	21
31	28
32	17
32	23
32	24
32	28
32	27
33	17
33	23
33	24
33	27
34	17
34	23
34	29
34	27
35	30
35	31
35	32
36	30
36	31
36	33
36	32
37	30
37	31
37	33
38	30
38	31
38	32
39	30
39	31
39	33
40	30
40	31
40	32
41	30
41	31
42	30
42	31
43	30
43	34
43	35
44	30
44	31
45	30
45	34
46	30
46	34
46	35
47	30
47	34
47	36
48	30
48	34
49	30
49	34
49	37
50	30
50	34
50	35
51	30
51	34
51	27
52	30
52	34
52	37
53	30
53	34
53	28
54	30
54	34
\.


--
-- TOC entry 4647 (class 0 OID 10312007)
-- Dependencies: 232
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option ("createdAt", "updatedAt", "deletedAt", code, id, "groupId") FROM stdin;
2025-12-17 10:13:55.271355	2025-12-17 10:13:55.271355	\N	13-inch	1	1
2025-12-17 10:13:55.272171	2025-12-17 10:13:55.272171	\N	15-inch	2	1
2025-12-17 10:13:55.273755	2025-12-17 10:13:55.273755	\N	8gb	3	2
2025-12-17 10:13:55.274336	2025-12-17 10:13:55.274336	\N	16gb	4	2
2025-12-17 10:13:55.30065	2025-12-17 10:13:55.30065	\N	32gb	5	3
2025-12-17 10:13:55.301145	2025-12-17 10:13:55.301145	\N	128gb	6	3
2025-12-17 10:13:55.34442	2025-12-17 10:13:55.34442	\N	24-inch	7	4
2025-12-17 10:13:55.344952	2025-12-17 10:13:55.344952	\N	27-inch	8	4
2025-12-17 10:13:55.363211	2025-12-17 10:13:55.363211	\N	4gb	9	5
2025-12-17 10:13:55.363799	2025-12-17 10:13:55.363799	\N	8gb	10	5
2025-12-17 10:13:55.364315	2025-12-17 10:13:55.364315	\N	16gb	11	5
2025-12-17 10:13:55.381529	2025-12-17 10:13:55.381529	\N	i7-8700	12	6
2025-12-17 10:13:55.381993	2025-12-17 10:13:55.381993	\N	r7-2700	13	6
2025-12-17 10:13:55.383209	2025-12-17 10:13:55.383209	\N	240gb-ssd	14	7
2025-12-17 10:13:55.383621	2025-12-17 10:13:55.383621	\N	120gb-ssd	15	7
2025-12-17 10:13:55.403508	2025-12-17 10:13:55.403508	\N	1tb	16	8
2025-12-17 10:13:55.404005	2025-12-17 10:13:55.404005	\N	2tb	17	8
2025-12-17 10:13:55.404464	2025-12-17 10:13:55.404464	\N	3tb	18	8
2025-12-17 10:13:55.404933	2025-12-17 10:13:55.404933	\N	4tb	19	8
2025-12-17 10:13:55.405354	2025-12-17 10:13:55.405354	\N	6tb	20	8
2025-12-17 10:13:55.848359	2025-12-17 10:13:55.848359	\N	size-40	21	9
2025-12-17 10:13:55.849645	2025-12-17 10:13:55.849645	\N	size-42	22	9
2025-12-17 10:13:55.850825	2025-12-17 10:13:55.850825	\N	size-44	23	9
2025-12-17 10:13:55.853714	2025-12-17 10:13:55.853714	\N	size-46	24	9
2025-12-17 10:13:55.887478	2025-12-17 10:13:55.887478	\N	size-40	25	10
2025-12-17 10:13:55.888162	2025-12-17 10:13:55.888162	\N	size-42	26	10
2025-12-17 10:13:55.888944	2025-12-17 10:13:55.888944	\N	size-44	27	10
2025-12-17 10:13:55.889675	2025-12-17 10:13:55.889675	\N	size-46	28	10
2025-12-17 10:13:55.913684	2025-12-17 10:13:55.913684	\N	size-40	29	11
2025-12-17 10:13:55.914068	2025-12-17 10:13:55.914068	\N	size-42	30	11
2025-12-17 10:13:55.914431	2025-12-17 10:13:55.914431	\N	size-44	31	11
2025-12-17 10:13:55.914792	2025-12-17 10:13:55.914792	\N	size-46	32	11
2025-12-17 10:13:55.933444	2025-12-17 10:13:55.933444	\N	size-40	33	12
2025-12-17 10:13:55.933855	2025-12-17 10:13:55.933855	\N	size-42	34	12
2025-12-17 10:13:55.934273	2025-12-17 10:13:55.934273	\N	size-44	35	12
2025-12-17 10:13:55.934746	2025-12-17 10:13:55.934746	\N	size-46	36	12
2025-12-17 10:13:55.950491	2025-12-17 10:13:55.950491	\N	size-40	37	13
2025-12-17 10:13:55.950883	2025-12-17 10:13:55.950883	\N	size-42	38	13
2025-12-17 10:13:55.951257	2025-12-17 10:13:55.951257	\N	size-44	39	13
2025-12-17 10:13:55.951649	2025-12-17 10:13:55.951649	\N	size-46	40	13
2025-12-17 10:13:55.971838	2025-12-17 10:13:55.971838	\N	size-40	41	14
2025-12-17 10:13:55.972441	2025-12-17 10:13:55.972441	\N	size-42	42	14
2025-12-17 10:13:55.972838	2025-12-17 10:13:55.972838	\N	size-44	43	14
2025-12-17 10:13:55.97325	2025-12-17 10:13:55.97325	\N	size-46	44	14
2025-12-17 10:13:56.266623	2025-12-17 10:13:56.266623	\N	mustard	45	15
2025-12-17 10:13:56.268218	2025-12-17 10:13:56.268218	\N	mint	46	15
2025-12-17 10:13:56.268969	2025-12-17 10:13:56.268969	\N	pearl	47	15
\.


--
-- TOC entry 4651 (class 0 OID 10312031)
-- Dependencies: 236
-- Data for Name: product_option_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_group ("createdAt", "updatedAt", "deletedAt", code, id, "productId") FROM stdin;
2025-12-17 10:13:55.270389	2025-12-17 10:13:55.272692	\N	laptop-screen-size	1	1
2025-12-17 10:13:55.273124	2025-12-17 10:13:55.274773	\N	laptop-ram	2	1
2025-12-17 10:13:55.30015	2025-12-17 10:13:55.301472	\N	tablet-storage	3	2
2025-12-17 10:13:55.343906	2025-12-17 10:13:55.345286	\N	curvy-monitor-monitor-size	4	5
2025-12-17 10:13:55.362549	2025-12-17 10:13:55.364644	\N	high-performance-ram-size	5	6
2025-12-17 10:13:55.381071	2025-12-17 10:13:55.382286	\N	gaming-pc-cpu	6	7
2025-12-17 10:13:55.382764	2025-12-17 10:13:55.383909	\N	gaming-pc-hdd	7	7
2025-12-17 10:13:55.403009	2025-12-17 10:13:55.4057	\N	hard-drive-hdd	8	8
2025-12-17 10:13:55.846087	2025-12-17 10:13:55.854446	\N	ultraboost-running-shoe-size	9	29
2025-12-17 10:13:55.88669	2025-12-17 10:13:55.890134	\N	freerun-running-shoe-size	10	30
2025-12-17 10:13:55.912973	2025-12-17 10:13:55.915089	\N	hi-top-basketball-shoe-size	11	31
2025-12-17 10:13:55.933017	2025-12-17 10:13:55.935014	\N	pureboost-running-shoe-size	12	32
2025-12-17 10:13:55.950076	2025-12-17 10:13:55.951908	\N	runx-running-shoe-size	13	33
2025-12-17 10:13:55.970645	2025-12-17 10:13:55.973511	\N	allstar-sneakers-size	14	34
2025-12-17 10:13:56.265265	2025-12-17 10:13:56.269405	\N	modern-cafe-chair-color	15	54
\.


--
-- TOC entry 4649 (class 0 OID 10312019)
-- Dependencies: 234
-- Data for Name: product_option_group_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_group_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2025-12-17 10:13:55.269988	2025-12-17 10:13:55.270389	en	screen size	1	1
2025-12-17 10:13:55.272847	2025-12-17 10:13:55.273124	en	RAM	2	2
2025-12-17 10:13:55.299948	2025-12-17 10:13:55.30015	en	storage	3	3
2025-12-17 10:13:55.343717	2025-12-17 10:13:55.343906	en	monitor size	4	4
2025-12-17 10:13:55.362248	2025-12-17 10:13:55.362549	en	size	5	5
2025-12-17 10:13:55.380892	2025-12-17 10:13:55.381071	en	cpu	6	6
2025-12-17 10:13:55.382386	2025-12-17 10:13:55.382764	en	HDD	7	7
2025-12-17 10:13:55.402756	2025-12-17 10:13:55.403009	en	HDD	8	8
2025-12-17 10:13:55.845667	2025-12-17 10:13:55.846087	en	size	9	9
2025-12-17 10:13:55.886373	2025-12-17 10:13:55.88669	en	size	10	10
2025-12-17 10:13:55.912805	2025-12-17 10:13:55.912973	en	size	11	11
2025-12-17 10:13:55.932851	2025-12-17 10:13:55.933017	en	size	12	12
2025-12-17 10:13:55.949902	2025-12-17 10:13:55.950076	en	size	13	13
2025-12-17 10:13:55.970466	2025-12-17 10:13:55.970645	en	size	14	14
2025-12-17 10:13:56.264701	2025-12-17 10:13:56.265265	en	color	15	15
\.


--
-- TOC entry 4645 (class 0 OID 10311995)
-- Dependencies: 230
-- Data for Name: product_option_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2025-12-17 10:13:55.270956	2025-12-17 10:13:55.271355	en	13 inch	1	1
2025-12-17 10:13:55.271906	2025-12-17 10:13:55.272171	en	15 inch	2	2
2025-12-17 10:13:55.273504	2025-12-17 10:13:55.273755	en	8GB	3	3
2025-12-17 10:13:55.274115	2025-12-17 10:13:55.274336	en	16GB	4	4
2025-12-17 10:13:55.300454	2025-12-17 10:13:55.30065	en	32GB	5	5
2025-12-17 10:13:55.30095	2025-12-17 10:13:55.301145	en	128GB	6	6
2025-12-17 10:13:55.344214	2025-12-17 10:13:55.34442	en	24 inch	7	7
2025-12-17 10:13:55.344749	2025-12-17 10:13:55.344952	en	27 inch	8	8
2025-12-17 10:13:55.362973	2025-12-17 10:13:55.363211	en	4GB	9	9
2025-12-17 10:13:55.363621	2025-12-17 10:13:55.363799	en	8GB	10	10
2025-12-17 10:13:55.364119	2025-12-17 10:13:55.364315	en	16GB	11	11
2025-12-17 10:13:55.38135	2025-12-17 10:13:55.381529	en	i7-8700	12	12
2025-12-17 10:13:55.381826	2025-12-17 10:13:55.381993	en	R7-2700	13	13
2025-12-17 10:13:55.383038	2025-12-17 10:13:55.383209	en	240GB SSD	14	14
2025-12-17 10:13:55.383455	2025-12-17 10:13:55.383621	en	120GB SSD	15	15
2025-12-17 10:13:55.403306	2025-12-17 10:13:55.403508	en	1TB	16	16
2025-12-17 10:13:55.403818	2025-12-17 10:13:55.404005	en	2TB	17	17
2025-12-17 10:13:55.404284	2025-12-17 10:13:55.404464	en	3TB	18	18
2025-12-17 10:13:55.404747	2025-12-17 10:13:55.404933	en	4TB	19	19
2025-12-17 10:13:55.405187	2025-12-17 10:13:55.405354	en	6TB	20	20
2025-12-17 10:13:55.847635	2025-12-17 10:13:55.848359	en	Size 40	21	21
2025-12-17 10:13:55.849264	2025-12-17 10:13:55.849645	en	Size 42	22	22
2025-12-17 10:13:55.850148	2025-12-17 10:13:55.850825	en	Size 44	23	23
2025-12-17 10:13:55.85226	2025-12-17 10:13:55.853714	en	Size 46	24	24
2025-12-17 10:13:55.887163	2025-12-17 10:13:55.887478	en	Size 40	25	25
2025-12-17 10:13:55.887898	2025-12-17 10:13:55.888162	en	Size 42	26	26
2025-12-17 10:13:55.888642	2025-12-17 10:13:55.888944	en	Size 44	27	27
2025-12-17 10:13:55.88939	2025-12-17 10:13:55.889675	en	Size 46	28	28
2025-12-17 10:13:55.913504	2025-12-17 10:13:55.913684	en	Size 40	29	29
2025-12-17 10:13:55.913922	2025-12-17 10:13:55.914068	en	Size 42	30	30
2025-12-17 10:13:55.914289	2025-12-17 10:13:55.914431	en	Size 44	31	31
2025-12-17 10:13:55.914647	2025-12-17 10:13:55.914792	en	Size 46	32	32
2025-12-17 10:13:55.93328	2025-12-17 10:13:55.933444	en	Size 40	33	33
2025-12-17 10:13:55.933699	2025-12-17 10:13:55.933855	en	Size 42	34	34
2025-12-17 10:13:55.934098	2025-12-17 10:13:55.934273	en	Size 44	35	35
2025-12-17 10:13:55.934554	2025-12-17 10:13:55.934746	en	Size 46	36	36
2025-12-17 10:13:55.950332	2025-12-17 10:13:55.950491	en	Size 40	37	37
2025-12-17 10:13:55.950736	2025-12-17 10:13:55.950883	en	Size 42	38	38
2025-12-17 10:13:55.951109	2025-12-17 10:13:55.951257	en	Size 44	39	39
2025-12-17 10:13:55.9515	2025-12-17 10:13:55.951649	en	Size 46	40	40
2025-12-17 10:13:55.970885	2025-12-17 10:13:55.971838	en	Size 40	41	41
2025-12-17 10:13:55.972129	2025-12-17 10:13:55.972441	en	Size 42	42	42
2025-12-17 10:13:55.972673	2025-12-17 10:13:55.972838	en	Size 44	43	43
2025-12-17 10:13:55.973076	2025-12-17 10:13:55.97325	en	Size 46	44	44
2025-12-17 10:13:56.266128	2025-12-17 10:13:56.266623	en	mustard	45	45
2025-12-17 10:13:56.267921	2025-12-17 10:13:56.268218	en	mint	46	46
2025-12-17 10:13:56.268703	2025-12-17 10:13:56.268969	en	pearl	47	47
\.


--
-- TOC entry 4655 (class 0 OID 10312054)
-- Dependencies: 240
-- Data for Name: product_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_translation ("createdAt", "updatedAt", "languageCode", name, slug, description, id, "baseId") FROM stdin;
2025-12-17 10:13:55.267456	2025-12-17 10:13:55.268158	en	Laptop	laptop	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	1	1
2025-12-17 10:13:55.298809	2025-12-17 10:13:55.299063	en	Tablet	tablet	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted — with touch, a keyboard, or even a pencil. In other words, it wouldn’t really be a "computer." It would be Tablet.	2	2
2025-12-17 10:13:55.315147	2025-12-17 10:13:55.315374	en	Wireless Optical Mouse	cordless-mouse	The Logitech M185 Wireless Optical Mouse is a great device for any computer user, and as Logitech are the global market leaders for these devices, you are also guaranteed absolute reliability. A mouse to be reckoned with!	3	3
2025-12-17 10:13:55.331218	2025-12-17 10:13:55.331532	en	32-Inch Monitor	32-inch-monitor	The UJ59 with Ultra HD resolution has 4x the pixels of Full HD, delivering more screen space and amazingly life-like images. That means you can view documents and webpages with less scrolling, work more comfortably with multiple windows and toolbars, and enjoy photos, videos and games in stunning 4K quality. Note: beverage not included.	4	4
2025-12-17 10:13:55.342683	2025-12-17 10:13:55.342947	en	Curvy Monitor	curvy-monitor	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	5	5
2025-12-17 10:13:55.361223	2025-12-17 10:13:55.361468	en	High Performance RAM	high-performance-ram	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	6	6
2025-12-17 10:13:55.379944	2025-12-17 10:13:55.380179	en	Gaming PC	gaming-pc	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	7	7
2025-12-17 10:13:55.401731	2025-12-17 10:13:55.401949	en	Hard Drive	hard-drive	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	8	8
2025-12-17 10:13:55.423654	2025-12-17 10:13:55.423901	en	Clacky Keyboard	clacky-keyboard	Let all your colleagues know that you are typing on this exclusive, colorful klicky-klacky keyboard. Huge travel on each keypress ensures maximum klack on each and every keystroke.	9	9
2025-12-17 10:13:55.436918	2025-12-17 10:13:55.43714	en	Ethernet Cable	ethernet-cable	5m (metres) Cat.6 network cable (upwards/downwards compatible) | Patch cable | 2 RJ-45 plug | plug with bend protection mantle. High transmission speeds due to operating frequency with up to 250 MHz (in comparison to Cat.5/Cat.5e cable bandwidth of 100 MHz).	10	10
2025-12-17 10:13:55.448216	2025-12-17 10:13:55.448687	en	USB Cable	usb-cable	Solid conductors eliminate strand-interaction distortion and reduce jitter. As the surface is made of high-purity silver, the performance is very close to that of a solid silver cable, but priced much closer to solid copper cable.	11	11
2025-12-17 10:13:55.469404	2025-12-17 10:13:55.469709	en	Instant Camera	instant-camera	With its nostalgic design and simple point-and-shoot functionality, the Instant Camera is the perfect pick to get started with instant photography.	12	12
2025-12-17 10:13:55.483214	2025-12-17 10:13:55.483451	en	Camera Lens	camera-lens	This lens is a Di type lens using an optical system with improved multi-coating designed to function with digital SLR cameras as well as film cameras.	13	13
2025-12-17 10:13:55.49586	2025-12-17 10:13:55.496105	en	Vintage Folding Camera	vintage-folding-camera	This vintage folding camera is so antiquated that you cannot possibly hope to produce actual photographs with it. However, it makes a wonderful decorative piece for the home or office.	14	14
2025-12-17 10:13:55.507091	2025-12-17 10:13:55.507321	en	Tripod	tripod	Capture vivid, professional-style photographs with help from this lightweight tripod. The adjustable-height tripod makes it easy to achieve reliable stability and score just the right angle when going after that award-winning shot.	15	15
2025-12-17 10:13:55.524201	2025-12-17 10:13:55.524458	en	Instamatic Camera	instamatic-camera	This inexpensive point-and-shoot camera uses easy-to-load 126 film cartridges. A built-in flash unit ensure great results, no matter the lighting conditions.	16	16
2025-12-17 10:13:55.539714	2025-12-17 10:13:55.539969	en	Compact Digital Camera	compact-digital-camera	Unleash your creative potential with high-level performance and advanced features such as AI-powered Real-time Eye AF; new, high-precision Real-time Tracking; high-speed continuous shooting and 4K HDR movie-shooting. The camera's innovative AF quickly and reliably detects the position of the subject and then tracks the subject's motion, keeping it in sharp focus.	17	17
2025-12-17 10:13:55.572583	2025-12-17 10:13:55.572806	en	Nikkormat SLR Camera	nikkormat-slr-camera	The Nikkormat FS was brought to market by Nikon in 1965. The lens is a 50mm f1.4 Nikkor. Nice glass, smooth focus and a working diaphragm. A UV filter and a Nikon front lens cap are included with the lens.	18	18
2025-12-17 10:13:55.58191	2025-12-17 10:13:55.582159	en	Compact SLR Camera	compact-slr-camera	Retro styled, portable in size and built around a powerful 24-megapixel APS-C CMOS sensor, this digital camera is the ideal companion for creative everyday photography. Packed full of high spec features such as an advanced hybrid autofocus system able to keep pace with even the most active subjects, a speedy 6fps continuous-shooting mode, high-resolution electronic viewfinder and intuitive swivelling touchscreen, it brings professional image making into everyone’s grasp.	19	19
2025-12-17 10:13:55.616675	2025-12-17 10:13:55.616968	en	Twin Lens Camera	twin-lens-camera	What makes a Rolleiflex TLR so special? Many things. To start, TLR stands for twin lens reflex. “Twin” because there are two lenses. And reflex means that the photographer looks through the lens to view the reflected image of an object or scene on the focusing screen. 	20	20
2025-12-17 10:13:55.647002	2025-12-17 10:13:55.647515	en	Road Bike	road-bike	Featuring a full carbon chassis - complete with cyclocross-specific carbon fork - and a component setup geared for hard use on the race circuit, it's got the low weight, exceptional efficiency and brilliant handling you'll need to stay at the front of the pack.	21	21
2025-12-17 10:13:55.663866	2025-12-17 10:13:55.664176	en	Skipping Rope	skipping-rope	When you're working out you need a quality rope that doesn't tangle at every couple of jumps and with this skipping rope you won't have this problem. The fact that it looks like a pair of tasty frankfurters is merely a bonus.	22	22
2025-12-17 10:13:55.693386	2025-12-17 10:13:55.693718	en	Tent	tent	With tons of space inside (for max. 4 persons), full head height throughout the entire tent and an unusual and striking shape, this tent offers you everything you need.	24	24
2025-12-17 10:13:55.678072	2025-12-17 10:13:55.678568	en	Boxing Gloves	boxing-gloves	Training gloves designed for optimum training. Our gloves promote proper punching technique because they are conformed to the natural shape of your fist. Dense, innovative two-layer foam provides better shock absorbency and full padding on the front, back and wrist to promote proper punching technique.	23	23
2025-12-17 10:13:55.734645	2025-12-17 10:13:55.735272	en	Cruiser Skateboard	cruiser-skateboard	Based on the 1970s iconic shape, but made to a larger 69cm size, with updated, quality component, these skateboards are great for beginners to learn the foot spacing required, and are perfect for all-day cruising.	25	25
2025-12-17 10:13:55.797676	2025-12-17 10:13:55.799016	en	Tennis Ball	tennis-ball	Our dog loves these tennis balls and they last for some time before they eventually either get lost in some field or bush or the covering comes off due to it being used most of the day every day.	27	27
2025-12-17 10:13:55.815618	2025-12-17 10:13:55.816035	en	Basketball	basketball	The Wilson MVP ball is perfect for playing basketball, and improving your skill for hours on end. Designed for new players, it is created with a high-quality rubber suitable for courts, allowing you to get full use during your practices.	28	28
2025-12-17 10:13:55.779981	2025-12-17 10:13:55.780749	en	Football	football	This football features high-contrast graphics for high-visibility during play, while its machine-stitched tpu casing offers consistent performance.	26	26
2025-12-17 10:13:55.843278	2025-12-17 10:13:55.843855	en	Ultraboost Running Shoe	ultraboost-running-shoe	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like it’s propelling you forward, the Running Shoe is ready to push you to victories both large and small	29	29
2025-12-17 10:13:55.884744	2025-12-17 10:13:55.885123	en	Freerun Running Shoe	freerun-running-shoe	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	30	30
2025-12-17 10:13:55.911964	2025-12-17 10:13:55.912175	en	Hi-Top Basketball Shoe	hi-top-basketball-shoe	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	31	31
2025-12-17 10:13:55.931915	2025-12-17 10:13:55.932134	en	Pureboost Running Shoe	pureboost-running-shoe	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	32	32
2025-12-17 10:13:55.948828	2025-12-17 10:13:55.949229	en	RunX Running Shoe	runx-running-shoe	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	33	33
2025-12-17 10:13:55.969599	2025-12-17 10:13:55.969832	en	Allstar Sneakers	allstar-sneakers	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	34	34
2025-12-17 10:13:55.997338	2025-12-17 10:13:55.997558	en	Spiky Cactus	spiky-cactus	A spiky yet elegant house cactus - perfect for the home or office. Origin and habitat: Probably native only to the Andes of Peru	35	35
2025-12-17 10:13:56.012919	2025-12-17 10:13:56.013635	en	Tulip Pot	tulip-pot	Bright crimson red species tulip with black centers, the poppy-like flowers will open up in full sun. Ideal for rock gardens, pots and border edging.	36	36
2025-12-17 10:13:56.025929	2025-12-17 10:13:56.026329	en	Hanging Plant	hanging-plant	Can be found in tropical and sub-tropical America where it grows on the branches of trees, but also on telephone wires and electricity cables and poles that sometimes topple with the weight of these plants. This plant loves a moist and warm air.	37	37
2025-12-17 10:13:56.038597	2025-12-17 10:13:56.038989	en	Aloe Vera	aloe-vera	Decorative Aloe vera makes a lovely house plant. A really trendy plant, Aloe vera is just so easy to care for. Aloe vera sap has been renowned for its remarkable medicinal and cosmetic properties for many centuries and has been used to treat grazes, insect bites and sunburn - it really works.	38	38
2025-12-17 10:13:56.055132	2025-12-17 10:13:56.055759	en	Fern Blechnum Gibbum	fern-blechnum-gibbum	Create a tropical feel in your home with this lush green tree fern, it has decorative leaves and will develop a short slender trunk in time.	39	39
2025-12-17 10:13:56.071892	2025-12-17 10:13:56.072321	en	Assorted Indoor Succulents	assorted-succulents	These assorted succulents come in a variety of different shapes and colours - each with their own unique personality. Succulents grow best in plenty of light: a sunny windowsill would be the ideal spot for them to thrive!	40	40
2025-12-17 10:13:56.097821	2025-12-17 10:13:56.098205	en	Bonsai Tree	bonsai-tree	Excellent semi-evergreen bonsai. Indoors or out but needs some winter protection. All trees sent will leave the nursery in excellent condition and will be of equal quality or better than the photograph shown.	42	42
2025-12-17 10:13:56.115332	2025-12-17 10:13:56.115711	en	Guardian Lion Statue	guardian-lion-statue	Placing it at home or office can bring you fortune and prosperity, guard your house and ward off ill fortune.	43	43
2025-12-17 10:13:56.166866	2025-12-17 10:13:56.167236	en	Leather Sofa	leather-sofa	This premium, tan-brown bonded leather seat is part of the 'chill' sofa range. The lever activated recline feature makes it easy to adjust to any position. This smart, bustle back design with rounded tight padded arms has been designed with your comfort in mind. This well-padded chair has foam pocket sprung seat cushions and fibre-filled back cushions.	47	47
2025-12-17 10:13:56.207665	2025-12-17 10:13:56.208053	en	Comfy Padded Chair	comfy-padded-chair	You sit comfortably thanks to the shaped back. The chair frame is made of solid wood, which is a durable natural material.	50	50
2025-12-17 10:13:56.249545	2025-12-17 10:13:56.25017	en	Bedside Table	bedside-table	Every table is unique, with varying grain pattern and natural colour shifts that are part of the charm of wood.	53	53
2025-12-17 10:13:56.084794	2025-12-17 10:13:56.085194	en	Orchid	orchid	Gloriously elegant. It can go along with any interior as it is a neutral color and the most popular Phalaenopsis overall. 2 to 3 foot stems host large white flowers that can last for over 2 months.	41	41
2025-12-17 10:13:56.129159	2025-12-17 10:13:56.130281	en	Hand Trowel	hand-trowel	Hand trowel for garden cultivating hammer finish epoxy-coated head for improved resistance to rust, scratches, humidity and alkalines in the soil.	44	44
2025-12-17 10:13:56.139442	2025-12-17 10:13:56.139881	en	Balloon Chair	balloon-chair	A charming vintage white wooden chair featuring an extremely spherical pink balloon. The balloon may be detached and used for other purposes, for example as a party decoration.	45	45
2025-12-17 10:13:56.152623	2025-12-17 10:13:56.153057	en	Grey Fabric Sofa	grey-fabric-sofa	Seat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up. The cover is easy to keep clean as it is removable and can be machine washed.	46	46
2025-12-17 10:13:56.178655	2025-12-17 10:13:56.17908	en	Light Shade	light-shade	Modern tapered white polycotton pendant shade with a metallic silver chrome interior finish for maximum light reflection. Reversible gimble so it can be used as a ceiling shade or as a lamp shade.	48	48
2025-12-17 10:13:56.193715	2025-12-17 10:13:56.194102	en	Wooden Side Desk	wooden-side-desk	Drawer stops prevent the drawers from being pulled out too far. Built-in cable management for collecting cables and cords; out of sight but close at hand.	49	49
2025-12-17 10:13:56.221528	2025-12-17 10:13:56.221943	en	Black Eaves Chair	black-eaves-chair	Comfortable to sit on thanks to the bowl-shaped seat and rounded shape of the backrest. No tools are required to assemble the chair, you just click it together with a simple mechanism under the seat.	51	51
2025-12-17 10:13:56.23348	2025-12-17 10:13:56.233888	en	Wooden Stool	wooden-stool	Solid wood is a hardwearing natural material, which can be sanded and surface treated as required.	52	52
2025-12-17 10:13:56.262618	2025-12-17 10:13:56.263004	en	Modern Cafe Chair	modern-cafe-chair	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	54	54
\.


--
-- TOC entry 4701 (class 0 OID 10312349)
-- Dependencies: 286
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant ("createdAt", "updatedAt", "deletedAt", enabled, sku, "outOfStockThreshold", "useGlobalOutOfStockThreshold", "trackInventory", id, "featuredAssetId", "taxCategoryId", "productId") FROM stdin;
2025-12-17 10:13:55.275583	2025-12-17 10:13:55.275583	\N	t	L2201308	0	t	INHERIT	1	\N	1	1
2025-12-17 10:13:55.282198	2025-12-17 10:13:55.282198	\N	t	L2201508	0	t	INHERIT	2	\N	1	1
2025-12-17 10:13:55.285516	2025-12-17 10:13:55.285516	\N	t	L2201316	0	t	INHERIT	3	\N	1	1
2025-12-17 10:13:55.288082	2025-12-17 10:13:55.288082	\N	t	L2201516	0	t	INHERIT	4	\N	1	1
2025-12-17 10:13:55.301796	2025-12-17 10:13:55.301796	\N	t	TBL200032	0	t	INHERIT	5	\N	1	2
2025-12-17 10:13:55.304024	2025-12-17 10:13:55.304024	\N	t	TBL200128	0	t	INHERIT	6	\N	1	2
2025-12-17 10:13:55.316312	2025-12-17 10:13:55.316312	\N	t	834444	0	t	INHERIT	7	\N	1	3
2025-12-17 10:13:55.333107	2025-12-17 10:13:55.333107	\N	t	LU32J590UQUXEN	0	t	INHERIT	8	\N	1	4
2025-12-17 10:13:55.345742	2025-12-17 10:13:55.345742	\N	t	C24F390	0	t	INHERIT	9	\N	1	5
2025-12-17 10:13:55.348879	2025-12-17 10:13:55.348879	\N	t	C27F390	0	t	INHERIT	10	\N	1	5
2025-12-17 10:13:55.364963	2025-12-17 10:13:55.364963	\N	t	CMK32GX4M2AC04	0	t	INHERIT	11	\N	1	6
2025-12-17 10:13:55.3671	2025-12-17 10:13:55.3671	\N	t	CMK32GX4M2AC08	0	t	INHERIT	12	\N	1	6
2025-12-17 10:13:55.368991	2025-12-17 10:13:55.368991	\N	t	CMK32GX4M2AC16	0	t	INHERIT	13	\N	1	6
2025-12-17 10:13:55.384201	2025-12-17 10:13:55.384201	\N	t	CGS480VR1063	0	t	INHERIT	14	\N	1	7
2025-12-17 10:13:55.386093	2025-12-17 10:13:55.386093	\N	t	CGS480VR1064	0	t	INHERIT	15	\N	1	7
2025-12-17 10:13:55.387872	2025-12-17 10:13:55.387872	\N	t	CGS480VR1065	0	t	INHERIT	16	\N	1	7
2025-12-17 10:13:55.389708	2025-12-17 10:13:55.389708	\N	t	CGS480VR1066	0	t	INHERIT	17	\N	1	7
2025-12-17 10:13:55.406057	2025-12-17 10:13:55.406057	\N	t	IHD455T1	0	t	INHERIT	18	\N	1	8
2025-12-17 10:13:55.408159	2025-12-17 10:13:55.408159	\N	t	IHD455T2	0	t	INHERIT	19	\N	1	8
2025-12-17 10:13:55.409889	2025-12-17 10:13:55.409889	\N	t	IHD455T3	0	t	INHERIT	20	\N	1	8
2025-12-17 10:13:55.411602	2025-12-17 10:13:55.411602	\N	t	IHD455T4	0	t	INHERIT	21	\N	1	8
2025-12-17 10:13:55.413389	2025-12-17 10:13:55.413389	\N	t	IHD455T6	0	t	INHERIT	22	\N	1	8
2025-12-17 10:13:55.424931	2025-12-17 10:13:55.424931	\N	t	A4TKLA45535	0	t	INHERIT	23	\N	1	9
2025-12-17 10:13:55.438029	2025-12-17 10:13:55.438029	\N	t	A23334x30	0	t	INHERIT	24	\N	1	10
2025-12-17 10:13:55.453181	2025-12-17 10:13:55.453181	\N	t	USBCIN01.5MI	0	t	INHERIT	25	\N	1	11
2025-12-17 10:13:55.471077	2025-12-17 10:13:55.471077	\N	t	IC22MWDD	0	t	INHERIT	26	\N	1	12
2025-12-17 10:13:55.484496	2025-12-17 10:13:55.484496	\N	t	B0012UUP02	0	t	INHERIT	27	\N	1	13
2025-12-17 10:13:55.497058	2025-12-17 10:13:55.497058	\N	t	B00AFC9099	0	t	INHERIT	28	\N	1	14
2025-12-17 10:13:55.50873	2025-12-17 10:13:55.50873	\N	t	B00XI87KV8	0	t	INHERIT	29	\N	1	15
2025-12-17 10:13:55.525355	2025-12-17 10:13:55.525355	\N	t	B07K1330LL	0	t	INHERIT	30	\N	1	16
2025-12-17 10:13:55.562609	2025-12-17 10:13:55.562609	\N	t	B07D990021	0	t	INHERIT	31	\N	1	17
2025-12-17 10:13:55.573658	2025-12-17 10:13:55.573658	\N	t	B07D33B334	0	t	INHERIT	32	\N	1	18
2025-12-17 10:13:55.605331	2025-12-17 10:13:55.605331	\N	t	B07D75V44S	0	t	INHERIT	33	\N	1	19
2025-12-17 10:13:55.618284	2025-12-17 10:13:55.618284	\N	t	B07D78JTLR	0	t	INHERIT	34	\N	1	20
2025-12-17 10:13:55.650217	2025-12-17 10:13:55.650217	\N	t	RB000844334	0	t	INHERIT	35	\N	1	21
2025-12-17 10:13:55.665261	2025-12-17 10:13:55.665261	\N	t	B07CNGXVXT	0	t	INHERIT	36	\N	1	22
2025-12-17 10:13:55.679799	2025-12-17 10:13:55.679799	\N	t	B000ZYLPPU	0	t	INHERIT	37	\N	1	23
2025-12-17 10:13:55.695233	2025-12-17 10:13:55.695233	\N	t	2000023510	0	t	INHERIT	38	\N	1	24
2025-12-17 10:13:55.737919	2025-12-17 10:13:55.737919	\N	t	799872520	0	t	INHERIT	39	\N	1	25
2025-12-17 10:13:55.782867	2025-12-17 10:13:55.782867	\N	t	SC3137-056	0	t	INHERIT	40	\N	1	26
2025-12-17 10:13:55.800783	2025-12-17 10:13:55.800783	\N	t	WRT11752P	0	t	INHERIT	41	\N	1	27
2025-12-17 10:13:55.817729	2025-12-17 10:13:55.817729	\N	t	WTB1418XB06	0	t	INHERIT	42	\N	1	28
2025-12-17 10:13:55.855463	2025-12-17 10:13:55.855463	\N	t	RS0040	0	t	INHERIT	43	\N	1	29
2025-12-17 10:13:55.860773	2025-12-17 10:13:55.860773	\N	t	RS0042	0	t	INHERIT	44	\N	1	29
2025-12-17 10:13:55.866155	2025-12-17 10:13:55.866155	\N	t	RS0044	0	t	INHERIT	45	\N	1	29
2025-12-17 10:13:55.869503	2025-12-17 10:13:55.869503	\N	t	RS0046	0	t	INHERIT	46	\N	1	29
2025-12-17 10:13:55.890689	2025-12-17 10:13:55.890689	\N	t	AR4561-40	0	t	INHERIT	47	\N	1	30
2025-12-17 10:13:55.893405	2025-12-17 10:13:55.893405	\N	t	AR4561-42	0	t	INHERIT	48	\N	1	30
2025-12-17 10:13:55.896486	2025-12-17 10:13:55.896486	\N	t	AR4561-44	0	t	INHERIT	49	\N	1	30
2025-12-17 10:13:55.898391	2025-12-17 10:13:55.898391	\N	t	AR4561-46	0	t	INHERIT	50	\N	1	30
2025-12-17 10:13:55.915352	2025-12-17 10:13:55.915352	\N	t	AO7893-40	0	t	INHERIT	51	\N	1	31
2025-12-17 10:13:55.917112	2025-12-17 10:13:55.917112	\N	t	AO7893-42	0	t	INHERIT	52	\N	1	31
2025-12-17 10:13:55.918752	2025-12-17 10:13:55.918752	\N	t	AO7893-44	0	t	INHERIT	53	\N	1	31
2025-12-17 10:13:55.921576	2025-12-17 10:13:55.921576	\N	t	AO7893-46	0	t	INHERIT	54	\N	1	31
2025-12-17 10:13:55.935297	2025-12-17 10:13:55.935297	\N	t	F3578640	0	t	INHERIT	55	\N	1	32
2025-12-17 10:13:55.937246	2025-12-17 10:13:55.937246	\N	t	F3578642	0	t	INHERIT	56	\N	1	32
2025-12-17 10:13:55.938942	2025-12-17 10:13:55.938942	\N	t	F3578644	0	t	INHERIT	57	\N	1	32
2025-12-17 10:13:55.940441	2025-12-17 10:13:55.940441	\N	t	F3578646	0	t	INHERIT	58	\N	1	32
2025-12-17 10:13:55.95221	2025-12-17 10:13:55.95221	\N	t	F3633340	0	t	INHERIT	59	\N	1	33
2025-12-17 10:13:55.95408	2025-12-17 10:13:55.95408	\N	t	F3633342	0	t	INHERIT	60	\N	1	33
2025-12-17 10:13:55.955972	2025-12-17 10:13:55.955972	\N	t	F3633344	0	t	INHERIT	61	\N	1	33
2025-12-17 10:13:55.957576	2025-12-17 10:13:55.957576	\N	t	F3633346	0	t	INHERIT	62	\N	1	33
2025-12-17 10:13:55.973804	2025-12-17 10:13:55.973804	\N	t	CAS23340	0	t	INHERIT	63	\N	1	34
2025-12-17 10:13:55.975593	2025-12-17 10:13:55.975593	\N	t	CAS23342	0	t	INHERIT	64	\N	1	34
2025-12-17 10:13:55.979363	2025-12-17 10:13:55.979363	\N	t	CAS23344	0	t	INHERIT	65	\N	1	34
2025-12-17 10:13:55.981336	2025-12-17 10:13:55.981336	\N	t	CAS23346	0	t	INHERIT	66	\N	1	34
2025-12-17 10:13:55.998361	2025-12-17 10:13:55.998361	\N	t	SC011001	0	t	INHERIT	67	\N	1	35
2025-12-17 10:13:56.014964	2025-12-17 10:13:56.014964	\N	t	A58477	0	t	INHERIT	68	\N	1	36
2025-12-17 10:13:56.027819	2025-12-17 10:13:56.027819	\N	t	A44223	0	t	INHERIT	69	\N	1	37
2025-12-17 10:13:56.04071	2025-12-17 10:13:56.04071	\N	t	A44352	0	t	INHERIT	70	\N	1	38
2025-12-17 10:13:56.059351	2025-12-17 10:13:56.059351	\N	t	A04851	0	t	INHERIT	71	\N	1	39
2025-12-17 10:13:56.074031	2025-12-17 10:13:56.074031	\N	t	A08593	0	t	INHERIT	72	\N	1	40
2025-12-17 10:13:56.087094	2025-12-17 10:13:56.087094	\N	t	ROR00221	0	t	INHERIT	73	\N	1	41
2025-12-17 10:13:56.099793	2025-12-17 10:13:56.099793	\N	t	B01MXFLUSV	0	t	INHERIT	74	\N	1	42
2025-12-17 10:13:56.117332	2025-12-17 10:13:56.117332	\N	t	GL34LLW11	0	t	INHERIT	75	\N	1	43
2025-12-17 10:13:56.131835	2025-12-17 10:13:56.131835	\N	t	4058NB/09	0	t	INHERIT	76	\N	1	44
2025-12-17 10:13:56.141526	2025-12-17 10:13:56.141526	\N	t	34-BC82444	0	t	INHERIT	77	\N	1	45
2025-12-17 10:13:56.154731	2025-12-17 10:13:56.154731	\N	t	CH00001-12	0	t	INHERIT	78	\N	1	46
2025-12-17 10:13:56.168791	2025-12-17 10:13:56.168791	\N	t	CH00001-02	0	t	INHERIT	79	\N	1	47
2025-12-17 10:13:56.18083	2025-12-17 10:13:56.18083	\N	t	B45809LSW	0	t	INHERIT	80	\N	1	48
2025-12-17 10:13:56.195605	2025-12-17 10:13:56.195605	\N	t	304.096.29	0	t	INHERIT	81	\N	1	49
2025-12-17 10:13:56.209783	2025-12-17 10:13:56.209783	\N	t	404.068.14	0	t	INHERIT	82	\N	1	50
2025-12-17 10:13:56.22344	2025-12-17 10:13:56.22344	\N	t	003.600.02	0	t	INHERIT	83	\N	1	51
2025-12-17 10:13:56.236215	2025-12-17 10:13:56.236215	\N	t	202.493.30	0	t	INHERIT	84	\N	1	52
2025-12-17 10:13:56.252263	2025-12-17 10:13:56.252263	\N	t	404.290.14	0	t	INHERIT	85	\N	1	53
2025-12-17 10:13:56.271885	2025-12-17 10:13:56.271885	\N	t	404.038.96	0	t	INHERIT	86	\N	1	54
2025-12-17 10:13:56.278093	2025-12-17 10:13:56.278093	\N	t	404.038.96	0	t	INHERIT	87	\N	1	54
2025-12-17 10:13:56.28185	2025-12-17 10:13:56.28185	\N	t	404.038.96	0	t	INHERIT	88	\N	1	54
\.


--
-- TOC entry 4695 (class 0 OID 10312314)
-- Dependencies: 280
-- Data for Name: product_variant_asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_asset ("createdAt", "updatedAt", "assetId", "position", "productVariantId", id) FROM stdin;
\.


--
-- TOC entry 4765 (class 0 OID 10312797)
-- Dependencies: 350
-- Data for Name: product_variant_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_channels_channel ("productVariantId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
\.


--
-- TOC entry 4764 (class 0 OID 10312790)
-- Dependencies: 349
-- Data for Name: product_variant_facet_values_facet_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_facet_values_facet_value ("productVariantId", "facetValueId") FROM stdin;
86	38
87	39
88	28
\.


--
-- TOC entry 4763 (class 0 OID 10312783)
-- Dependencies: 348
-- Data for Name: product_variant_options_product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_options_product_option ("productVariantId", "productOptionId") FROM stdin;
1	1
1	3
2	2
2	3
3	1
3	4
4	2
4	4
5	5
6	6
9	7
10	8
11	9
12	10
13	11
14	12
14	14
15	13
15	14
16	12
16	15
17	13
17	15
18	16
19	17
20	18
21	19
22	20
43	21
44	22
45	23
46	24
47	25
48	26
49	27
50	28
51	29
52	30
53	31
54	32
55	33
56	34
57	35
58	36
59	37
60	38
61	39
62	40
63	41
64	42
65	43
66	44
86	45
87	46
88	47
\.


--
-- TOC entry 4697 (class 0 OID 10312325)
-- Dependencies: 282
-- Data for Name: product_variant_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_price ("createdAt", "updatedAt", "currencyCode", id, "channelId", price, "variantId") FROM stdin;
2025-12-17 10:13:55.280877	2025-12-17 10:13:55.280877	USD	1	1	129900	1
2025-12-17 10:13:55.284892	2025-12-17 10:13:55.284892	USD	2	1	139900	2
2025-12-17 10:13:55.287413	2025-12-17 10:13:55.287413	USD	3	1	219900	3
2025-12-17 10:13:55.290254	2025-12-17 10:13:55.290254	USD	4	1	229900	4
2025-12-17 10:13:55.303524	2025-12-17 10:13:55.303524	USD	5	1	32900	5
2025-12-17 10:13:55.305719	2025-12-17 10:13:55.305719	USD	6	1	44500	6
2025-12-17 10:13:55.317732	2025-12-17 10:13:55.317732	USD	7	1	1899	7
2025-12-17 10:13:55.334634	2025-12-17 10:13:55.334634	USD	8	1	31000	8
2025-12-17 10:13:55.348294	2025-12-17 10:13:55.348294	USD	9	1	14374	9
2025-12-17 10:13:55.35055	2025-12-17 10:13:55.35055	USD	10	1	16994	10
2025-12-17 10:13:55.366431	2025-12-17 10:13:55.366431	USD	11	1	13785	11
2025-12-17 10:13:55.368525	2025-12-17 10:13:55.368525	USD	12	1	14639	12
2025-12-17 10:13:55.370357	2025-12-17 10:13:55.370357	USD	13	1	28181	13
2025-12-17 10:13:55.385623	2025-12-17 10:13:55.385623	USD	14	1	108720	14
2025-12-17 10:13:55.387416	2025-12-17 10:13:55.387416	USD	15	1	109995	15
2025-12-17 10:13:55.389137	2025-12-17 10:13:55.389137	USD	16	1	93120	16
2025-12-17 10:13:55.391051	2025-12-17 10:13:55.391051	USD	17	1	94920	17
2025-12-17 10:13:55.407686	2025-12-17 10:13:55.407686	USD	18	1	3799	18
2025-12-17 10:13:55.409465	2025-12-17 10:13:55.409465	USD	19	1	5374	19
2025-12-17 10:13:55.411166	2025-12-17 10:13:55.411166	USD	20	1	7896	20
2025-12-17 10:13:55.412876	2025-12-17 10:13:55.412876	USD	21	1	9299	21
2025-12-17 10:13:55.415157	2025-12-17 10:13:55.415157	USD	22	1	13435	22
2025-12-17 10:13:55.426915	2025-12-17 10:13:55.426915	USD	23	1	7489	23
2025-12-17 10:13:55.439628	2025-12-17 10:13:55.439628	USD	24	1	597	24
2025-12-17 10:13:55.457733	2025-12-17 10:13:55.457733	USD	25	1	6900	25
2025-12-17 10:13:55.472949	2025-12-17 10:13:55.472949	USD	26	1	17499	26
2025-12-17 10:13:55.486126	2025-12-17 10:13:55.486126	USD	27	1	10400	27
2025-12-17 10:13:55.498486	2025-12-17 10:13:55.498486	USD	28	1	535000	28
2025-12-17 10:13:55.51019	2025-12-17 10:13:55.51019	USD	29	1	1498	29
2025-12-17 10:13:55.526696	2025-12-17 10:13:55.526696	USD	30	1	2000	30
2025-12-17 10:13:55.564136	2025-12-17 10:13:55.564136	USD	31	1	89999	31
2025-12-17 10:13:55.575126	2025-12-17 10:13:55.575126	USD	32	1	61500	32
2025-12-17 10:13:55.60785	2025-12-17 10:13:55.60785	USD	33	1	52100	33
2025-12-17 10:13:55.620323	2025-12-17 10:13:55.620323	USD	34	1	79900	34
2025-12-17 10:13:55.652665	2025-12-17 10:13:55.652665	USD	35	1	249900	35
2025-12-17 10:13:55.667057	2025-12-17 10:13:55.667057	USD	36	1	799	36
2025-12-17 10:13:55.681879	2025-12-17 10:13:55.681879	USD	37	1	3304	37
2025-12-17 10:13:55.697312	2025-12-17 10:13:55.697312	USD	38	1	21493	38
2025-12-17 10:13:55.761991	2025-12-17 10:13:55.761991	USD	39	1	2499	39
2025-12-17 10:13:55.785722	2025-12-17 10:13:55.785722	USD	40	1	5707	40
2025-12-17 10:13:55.803287	2025-12-17 10:13:55.803287	USD	41	1	1273	41
2025-12-17 10:13:55.821181	2025-12-17 10:13:55.821181	USD	42	1	3562	42
2025-12-17 10:13:55.858845	2025-12-17 10:13:55.858845	USD	43	1	9999	43
2025-12-17 10:13:55.864169	2025-12-17 10:13:55.864169	USD	44	1	9999	44
2025-12-17 10:13:55.868756	2025-12-17 10:13:55.868756	USD	45	1	9999	45
2025-12-17 10:13:55.872012	2025-12-17 10:13:55.872012	USD	46	1	9999	46
2025-12-17 10:13:55.892447	2025-12-17 10:13:55.892447	USD	47	1	16000	47
2025-12-17 10:13:55.895926	2025-12-17 10:13:55.895926	USD	48	1	16000	48
2025-12-17 10:13:55.897848	2025-12-17 10:13:55.897848	USD	49	1	16000	49
2025-12-17 10:13:55.899874	2025-12-17 10:13:55.899874	USD	50	1	16000	50
2025-12-17 10:13:55.916638	2025-12-17 10:13:55.916638	USD	51	1	14000	51
2025-12-17 10:13:55.918341	2025-12-17 10:13:55.918341	USD	52	1	14000	52
2025-12-17 10:13:55.920083	2025-12-17 10:13:55.920083	USD	53	1	14000	53
2025-12-17 10:13:55.923095	2025-12-17 10:13:55.923095	USD	54	1	14000	54
2025-12-17 10:13:55.936791	2025-12-17 10:13:55.936791	USD	55	1	9995	55
2025-12-17 10:13:55.938548	2025-12-17 10:13:55.938548	USD	56	1	9995	56
2025-12-17 10:13:55.940054	2025-12-17 10:13:55.940054	USD	57	1	9995	57
2025-12-17 10:13:55.941698	2025-12-17 10:13:55.941698	USD	58	1	9995	58
2025-12-17 10:13:55.953616	2025-12-17 10:13:55.953616	USD	59	1	4495	59
2025-12-17 10:13:55.955378	2025-12-17 10:13:55.955378	USD	60	1	4495	60
2025-12-17 10:13:55.95717	2025-12-17 10:13:55.95717	USD	61	1	4495	61
2025-12-17 10:13:55.958801	2025-12-17 10:13:55.958801	USD	62	1	4495	62
2025-12-17 10:13:55.975171	2025-12-17 10:13:55.975171	USD	63	1	6500	63
2025-12-17 10:13:55.977599	2025-12-17 10:13:55.977599	USD	64	1	6500	64
2025-12-17 10:13:55.98089	2025-12-17 10:13:55.98089	USD	65	1	6500	65
2025-12-17 10:13:55.982987	2025-12-17 10:13:55.982987	USD	66	1	6500	66
2025-12-17 10:13:55.999606	2025-12-17 10:13:55.999606	USD	67	1	1550	67
2025-12-17 10:13:56.016178	2025-12-17 10:13:56.016178	USD	68	1	675	68
2025-12-17 10:13:56.029838	2025-12-17 10:13:56.029838	USD	69	1	1995	69
2025-12-17 10:13:56.042946	2025-12-17 10:13:56.042946	USD	70	1	699	70
2025-12-17 10:13:56.062672	2025-12-17 10:13:56.062672	USD	71	1	895	71
2025-12-17 10:13:56.076437	2025-12-17 10:13:56.076437	USD	72	1	3250	72
2025-12-17 10:13:56.08932	2025-12-17 10:13:56.08932	USD	73	1	6500	73
2025-12-17 10:13:56.10232	2025-12-17 10:13:56.10232	USD	74	1	1999	74
2025-12-17 10:13:56.119416	2025-12-17 10:13:56.119416	USD	75	1	18853	75
2025-12-17 10:13:56.134126	2025-12-17 10:13:56.134126	USD	76	1	499	76
2025-12-17 10:13:56.143851	2025-12-17 10:13:56.143851	USD	77	1	6500	77
2025-12-17 10:13:56.156935	2025-12-17 10:13:56.156935	USD	78	1	29500	78
2025-12-17 10:13:56.171022	2025-12-17 10:13:56.171022	USD	79	1	124500	79
2025-12-17 10:13:56.183156	2025-12-17 10:13:56.183156	USD	80	1	2845	80
2025-12-17 10:13:56.197922	2025-12-17 10:13:56.197922	USD	81	1	12500	81
2025-12-17 10:13:56.212771	2025-12-17 10:13:56.212771	USD	82	1	13000	82
2025-12-17 10:13:56.226319	2025-12-17 10:13:56.226319	USD	83	1	7000	83
2025-12-17 10:13:56.238491	2025-12-17 10:13:56.238491	USD	84	1	1400	84
2025-12-17 10:13:56.254949	2025-12-17 10:13:56.254949	USD	85	1	13000	85
2025-12-17 10:13:56.275334	2025-12-17 10:13:56.275334	USD	86	1	10000	86
2025-12-17 10:13:56.281037	2025-12-17 10:13:56.281037	USD	87	1	10000	87
2025-12-17 10:13:56.284985	2025-12-17 10:13:56.284985	USD	88	1	10000	88
\.


--
-- TOC entry 4699 (class 0 OID 10312337)
-- Dependencies: 284
-- Data for Name: product_variant_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2025-12-17 10:13:55.275078	2025-12-17 10:13:55.275583	en	Laptop 13 inch 8GB	1	1
2025-12-17 10:13:55.28184	2025-12-17 10:13:55.282198	en	Laptop 15 inch 8GB	2	2
2025-12-17 10:13:55.28524	2025-12-17 10:13:55.285516	en	Laptop 13 inch 16GB	3	3
2025-12-17 10:13:55.287824	2025-12-17 10:13:55.288082	en	Laptop 15 inch 16GB	4	4
2025-12-17 10:13:55.30159	2025-12-17 10:13:55.301796	en	Tablet 32GB	5	5
2025-12-17 10:13:55.303819	2025-12-17 10:13:55.304024	en	Tablet 128GB	6	6
2025-12-17 10:13:55.31611	2025-12-17 10:13:55.316312	en	Wireless Optical Mouse	7	7
2025-12-17 10:13:55.332626	2025-12-17 10:13:55.333107	en	32-Inch Monitor	8	8
2025-12-17 10:13:55.345538	2025-12-17 10:13:55.345742	en	Curvy Monitor 24 inch	9	9
2025-12-17 10:13:55.348663	2025-12-17 10:13:55.348879	en	Curvy Monitor 27 inch	10	10
2025-12-17 10:13:55.364768	2025-12-17 10:13:55.364963	en	High Performance RAM 4GB	11	11
2025-12-17 10:13:55.366711	2025-12-17 10:13:55.3671	en	High Performance RAM 8GB	12	12
2025-12-17 10:13:55.368786	2025-12-17 10:13:55.368991	en	High Performance RAM 16GB	13	13
2025-12-17 10:13:55.384015	2025-12-17 10:13:55.384201	en	Gaming PC i7-8700 240GB SSD	14	14
2025-12-17 10:13:55.38591	2025-12-17 10:13:55.386093	en	Gaming PC R7-2700 240GB SSD	15	15
2025-12-17 10:13:55.387693	2025-12-17 10:13:55.387872	en	Gaming PC i7-8700 120GB SSD	16	16
2025-12-17 10:13:55.389513	2025-12-17 10:13:55.389708	en	Gaming PC R7-2700 120GB SSD	17	17
2025-12-17 10:13:55.405865	2025-12-17 10:13:55.406057	en	Hard Drive 1TB	18	18
2025-12-17 10:13:55.407964	2025-12-17 10:13:55.408159	en	Hard Drive 2TB	19	19
2025-12-17 10:13:55.409722	2025-12-17 10:13:55.409889	en	Hard Drive 3TB	20	20
2025-12-17 10:13:55.411419	2025-12-17 10:13:55.411602	en	Hard Drive 4TB	21	21
2025-12-17 10:13:55.413148	2025-12-17 10:13:55.413389	en	Hard Drive 6TB	22	22
2025-12-17 10:13:55.424704	2025-12-17 10:13:55.424931	en	Clacky Keyboard	23	23
2025-12-17 10:13:55.437843	2025-12-17 10:13:55.438029	en	Ethernet Cable	24	24
2025-12-17 10:13:55.451735	2025-12-17 10:13:55.453181	en	USB Cable	25	25
2025-12-17 10:13:55.470816	2025-12-17 10:13:55.471077	en	Instant Camera	26	26
2025-12-17 10:13:55.484293	2025-12-17 10:13:55.484496	en	Camera Lens	27	27
2025-12-17 10:13:55.496855	2025-12-17 10:13:55.497058	en	Vintage Folding Camera	28	28
2025-12-17 10:13:55.508463	2025-12-17 10:13:55.50873	en	Tripod	29	29
2025-12-17 10:13:55.525152	2025-12-17 10:13:55.525355	en	Instamatic Camera	30	30
2025-12-17 10:13:55.562419	2025-12-17 10:13:55.562609	en	Compact Digital Camera	31	31
2025-12-17 10:13:55.573466	2025-12-17 10:13:55.573658	en	Nikkormat SLR Camera	32	32
2025-12-17 10:13:55.60495	2025-12-17 10:13:55.605331	en	Compact SLR Camera	33	33
2025-12-17 10:13:55.618035	2025-12-17 10:13:55.618284	en	Twin Lens Camera	34	34
2025-12-17 10:13:55.649882	2025-12-17 10:13:55.650217	en	Road Bike	35	35
2025-12-17 10:13:55.665002	2025-12-17 10:13:55.665261	en	Skipping Rope	36	36
2025-12-17 10:13:55.679546	2025-12-17 10:13:55.679799	en	Boxing Gloves	37	37
2025-12-17 10:13:55.694971	2025-12-17 10:13:55.695233	en	Tent	38	38
2025-12-17 10:13:55.737482	2025-12-17 10:13:55.737919	en	Cruiser Skateboard	39	39
2025-12-17 10:13:55.782431	2025-12-17 10:13:55.782867	en	Football	40	40
2025-12-17 10:13:55.800395	2025-12-17 10:13:55.800783	en	Tennis Ball	41	41
2025-12-17 10:13:55.817379	2025-12-17 10:13:55.817729	en	Basketball	42	42
2025-12-17 10:13:55.854989	2025-12-17 10:13:55.855463	en	Ultraboost Running Shoe Size 40	43	43
2025-12-17 10:13:55.860315	2025-12-17 10:13:55.860773	en	Ultraboost Running Shoe Size 42	44	44
2025-12-17 10:13:55.865758	2025-12-17 10:13:55.866155	en	Ultraboost Running Shoe Size 44	45	45
2025-12-17 10:13:55.869175	2025-12-17 10:13:55.869503	en	Ultraboost Running Shoe Size 46	46	46
2025-12-17 10:13:55.890367	2025-12-17 10:13:55.890689	en	Freerun Running Shoe Size 40	47	47
2025-12-17 10:13:55.893115	2025-12-17 10:13:55.893405	en	Freerun Running Shoe Size 42	48	48
2025-12-17 10:13:55.896245	2025-12-17 10:13:55.896486	en	Freerun Running Shoe Size 44	49	49
2025-12-17 10:13:55.898185	2025-12-17 10:13:55.898391	en	Freerun Running Shoe Size 46	50	50
2025-12-17 10:13:55.915181	2025-12-17 10:13:55.915352	en	Hi-Top Basketball Shoe Size 40	51	51
2025-12-17 10:13:55.916931	2025-12-17 10:13:55.917112	en	Hi-Top Basketball Shoe Size 42	52	52
2025-12-17 10:13:55.918581	2025-12-17 10:13:55.918752	en	Hi-Top Basketball Shoe Size 44	53	53
2025-12-17 10:13:55.921342	2025-12-17 10:13:55.921576	en	Hi-Top Basketball Shoe Size 46	54	54
2025-12-17 10:13:55.935114	2025-12-17 10:13:55.935297	en	Pureboost Running Shoe Size 40	55	55
2025-12-17 10:13:55.937078	2025-12-17 10:13:55.937246	en	Pureboost Running Shoe Size 42	56	56
2025-12-17 10:13:55.938774	2025-12-17 10:13:55.938942	en	Pureboost Running Shoe Size 44	57	57
2025-12-17 10:13:55.940276	2025-12-17 10:13:55.940441	en	Pureboost Running Shoe Size 46	58	58
2025-12-17 10:13:55.952009	2025-12-17 10:13:55.95221	en	RunX Running Shoe Size 40	59	59
2025-12-17 10:13:55.953896	2025-12-17 10:13:55.95408	en	RunX Running Shoe Size 42	60	60
2025-12-17 10:13:55.955778	2025-12-17 10:13:55.955972	en	RunX Running Shoe Size 44	61	61
2025-12-17 10:13:55.957394	2025-12-17 10:13:55.957576	en	RunX Running Shoe Size 46	62	62
2025-12-17 10:13:55.973618	2025-12-17 10:13:55.973804	en	Allstar Sneakers Size 40	63	63
2025-12-17 10:13:55.975408	2025-12-17 10:13:55.975593	en	Allstar Sneakers Size 42	64	64
2025-12-17 10:13:55.978391	2025-12-17 10:13:55.979363	en	Allstar Sneakers Size 44	65	65
2025-12-17 10:13:55.98115	2025-12-17 10:13:55.981336	en	Allstar Sneakers Size 46	66	66
2025-12-17 10:13:55.998172	2025-12-17 10:13:55.998361	en	Spiky Cactus	67	67
2025-12-17 10:13:56.014782	2025-12-17 10:13:56.014964	en	Tulip Pot	68	68
2025-12-17 10:13:56.027529	2025-12-17 10:13:56.027819	en	Hanging Plant	69	69
2025-12-17 10:13:56.040409	2025-12-17 10:13:56.04071	en	Aloe Vera	70	70
2025-12-17 10:13:56.05866	2025-12-17 10:13:56.059351	en	Fern Blechnum Gibbum	71	71
2025-12-17 10:13:56.073643	2025-12-17 10:13:56.074031	en	Assorted Indoor Succulents	72	72
2025-12-17 10:13:56.086756	2025-12-17 10:13:56.087094	en	Orchid	73	73
2025-12-17 10:13:56.099438	2025-12-17 10:13:56.099793	en	Bonsai Tree	74	74
2025-12-17 10:13:56.116977	2025-12-17 10:13:56.117332	en	Guardian Lion Statue	75	75
2025-12-17 10:13:56.131521	2025-12-17 10:13:56.131835	en	Hand Trowel	76	76
2025-12-17 10:13:56.141174	2025-12-17 10:13:56.141526	en	Balloon Chair	77	77
2025-12-17 10:13:56.154332	2025-12-17 10:13:56.154731	en	Grey Fabric Sofa	78	78
2025-12-17 10:13:56.168457	2025-12-17 10:13:56.168791	en	Leather Sofa	79	79
2025-12-17 10:13:56.18049	2025-12-17 10:13:56.18083	en	Light Shade	80	80
2025-12-17 10:13:56.195297	2025-12-17 10:13:56.195605	en	Wooden Side Desk	81	81
2025-12-17 10:13:56.209441	2025-12-17 10:13:56.209783	en	Comfy Padded Chair	82	82
2025-12-17 10:13:56.223079	2025-12-17 10:13:56.22344	en	Black Eaves Chair	83	83
2025-12-17 10:13:56.235826	2025-12-17 10:13:56.236215	en	Wooden Stool	84	84
2025-12-17 10:13:56.251524	2025-12-17 10:13:56.252263	en	Bedside Table	85	85
2025-12-17 10:13:56.271504	2025-12-17 10:13:56.271885	en	Modern Cafe Chair mustard	86	86
2025-12-17 10:13:56.277739	2025-12-17 10:13:56.278093	en	Modern Cafe Chair mint	87	87
2025-12-17 10:13:56.281465	2025-12-17 10:13:56.28185	en	Modern Cafe Chair pearl	88	88
\.


--
-- TOC entry 4677 (class 0 OID 10312191)
-- Dependencies: 262
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion ("createdAt", "updatedAt", "deletedAt", "startsAt", "endsAt", "couponCode", "perCustomerUsageLimit", "usageLimit", enabled, conditions, actions, "priorityScore", id) FROM stdin;
\.


--
-- TOC entry 4757 (class 0 OID 10312741)
-- Dependencies: 342
-- Data for Name: promotion_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_channels_channel ("promotionId", "channelId") FROM stdin;
\.


--
-- TOC entry 4675 (class 0 OID 10312179)
-- Dependencies: 260
-- Data for Name: promotion_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_translation ("createdAt", "updatedAt", "languageCode", name, description, id, "baseId") FROM stdin;
\.


--
-- TOC entry 4667 (class 0 OID 10312130)
-- Dependencies: 252
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refund ("createdAt", "updatedAt", method, reason, state, "transactionId", metadata, id, "paymentId", items, shipping, adjustment, total) FROM stdin;
\.


--
-- TOC entry 4707 (class 0 OID 10312391)
-- Dependencies: 292
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region ("createdAt", "updatedAt", code, type, enabled, id, "parentId", discriminator) FROM stdin;
2025-12-17 10:13:54.836307	2025-12-17 10:13:54.836307	AF	country	t	1	\N	Country
2025-12-17 10:13:54.84579	2025-12-17 10:13:54.84579	AX	country	t	2	\N	Country
2025-12-17 10:13:54.851402	2025-12-17 10:13:54.851402	AL	country	t	3	\N	Country
2025-12-17 10:13:54.854313	2025-12-17 10:13:54.854313	DZ	country	t	4	\N	Country
2025-12-17 10:13:54.859382	2025-12-17 10:13:54.859382	AS	country	t	5	\N	Country
2025-12-17 10:13:54.864548	2025-12-17 10:13:54.864548	AD	country	t	6	\N	Country
2025-12-17 10:13:54.866853	2025-12-17 10:13:54.866853	AO	country	t	7	\N	Country
2025-12-17 10:13:54.869201	2025-12-17 10:13:54.869201	AI	country	t	8	\N	Country
2025-12-17 10:13:54.874595	2025-12-17 10:13:54.874595	AG	country	t	9	\N	Country
2025-12-17 10:13:54.877432	2025-12-17 10:13:54.877432	AR	country	t	10	\N	Country
2025-12-17 10:13:54.891554	2025-12-17 10:13:54.891554	AM	country	t	11	\N	Country
2025-12-17 10:13:54.893804	2025-12-17 10:13:54.893804	AW	country	t	12	\N	Country
2025-12-17 10:13:54.895736	2025-12-17 10:13:54.895736	AU	country	t	13	\N	Country
2025-12-17 10:13:54.897516	2025-12-17 10:13:54.897516	AT	country	t	14	\N	Country
2025-12-17 10:13:54.900226	2025-12-17 10:13:54.900226	AZ	country	t	15	\N	Country
2025-12-17 10:13:54.902467	2025-12-17 10:13:54.902467	BS	country	t	16	\N	Country
2025-12-17 10:13:54.904304	2025-12-17 10:13:54.904304	BH	country	t	17	\N	Country
2025-12-17 10:13:54.90598	2025-12-17 10:13:54.90598	BD	country	t	18	\N	Country
2025-12-17 10:13:54.907633	2025-12-17 10:13:54.907633	BB	country	t	19	\N	Country
2025-12-17 10:13:54.909966	2025-12-17 10:13:54.909966	BY	country	t	20	\N	Country
2025-12-17 10:13:54.911727	2025-12-17 10:13:54.911727	BE	country	t	21	\N	Country
2025-12-17 10:13:54.913366	2025-12-17 10:13:54.913366	BZ	country	t	22	\N	Country
2025-12-17 10:13:54.914993	2025-12-17 10:13:54.914993	BJ	country	t	23	\N	Country
2025-12-17 10:13:54.916639	2025-12-17 10:13:54.916639	BM	country	t	24	\N	Country
2025-12-17 10:13:54.918416	2025-12-17 10:13:54.918416	BT	country	t	25	\N	Country
2025-12-17 10:13:54.920036	2025-12-17 10:13:54.920036	BO	country	t	26	\N	Country
2025-12-17 10:13:54.921574	2025-12-17 10:13:54.921574	BQ	country	t	27	\N	Country
2025-12-17 10:13:54.923348	2025-12-17 10:13:54.923348	BA	country	t	28	\N	Country
2025-12-17 10:13:54.925072	2025-12-17 10:13:54.925072	BW	country	t	29	\N	Country
2025-12-17 10:13:54.926648	2025-12-17 10:13:54.926648	BV	country	t	30	\N	Country
2025-12-17 10:13:54.928165	2025-12-17 10:13:54.928165	BR	country	t	31	\N	Country
2025-12-17 10:13:54.929725	2025-12-17 10:13:54.929725	IO	country	t	32	\N	Country
2025-12-17 10:13:54.93143	2025-12-17 10:13:54.93143	BN	country	t	33	\N	Country
2025-12-17 10:13:54.933155	2025-12-17 10:13:54.933155	BG	country	t	34	\N	Country
2025-12-17 10:13:54.934851	2025-12-17 10:13:54.934851	BF	country	t	35	\N	Country
2025-12-17 10:13:54.93617	2025-12-17 10:13:54.93617	BI	country	t	36	\N	Country
2025-12-17 10:13:54.937377	2025-12-17 10:13:54.937377	CV	country	t	37	\N	Country
2025-12-17 10:13:54.938547	2025-12-17 10:13:54.938547	KH	country	t	38	\N	Country
2025-12-17 10:13:54.939635	2025-12-17 10:13:54.939635	CM	country	t	39	\N	Country
2025-12-17 10:13:54.940975	2025-12-17 10:13:54.940975	CA	country	t	40	\N	Country
2025-12-17 10:13:54.943264	2025-12-17 10:13:54.943264	KY	country	t	41	\N	Country
2025-12-17 10:13:54.944317	2025-12-17 10:13:54.944317	CF	country	t	42	\N	Country
2025-12-17 10:13:54.945333	2025-12-17 10:13:54.945333	TD	country	t	43	\N	Country
2025-12-17 10:13:54.946313	2025-12-17 10:13:54.946313	CL	country	t	44	\N	Country
2025-12-17 10:13:54.947381	2025-12-17 10:13:54.947381	CN	country	t	45	\N	Country
2025-12-17 10:13:54.948465	2025-12-17 10:13:54.948465	CX	country	t	46	\N	Country
2025-12-17 10:13:54.949571	2025-12-17 10:13:54.949571	CC	country	t	47	\N	Country
2025-12-17 10:13:54.950596	2025-12-17 10:13:54.950596	CO	country	t	48	\N	Country
2025-12-17 10:13:54.951645	2025-12-17 10:13:54.951645	KM	country	t	49	\N	Country
2025-12-17 10:13:54.952759	2025-12-17 10:13:54.952759	CG	country	t	50	\N	Country
2025-12-17 10:13:54.95374	2025-12-17 10:13:54.95374	CD	country	t	51	\N	Country
2025-12-17 10:13:54.954733	2025-12-17 10:13:54.954733	CK	country	t	52	\N	Country
2025-12-17 10:13:54.955724	2025-12-17 10:13:54.955724	CR	country	t	53	\N	Country
2025-12-17 10:13:54.956733	2025-12-17 10:13:54.956733	CI	country	t	54	\N	Country
2025-12-17 10:13:54.95774	2025-12-17 10:13:54.95774	HR	country	t	55	\N	Country
2025-12-17 10:13:54.95884	2025-12-17 10:13:54.95884	CU	country	t	56	\N	Country
2025-12-17 10:13:54.959944	2025-12-17 10:13:54.959944	CW	country	t	57	\N	Country
2025-12-17 10:13:54.961013	2025-12-17 10:13:54.961013	CY	country	t	58	\N	Country
2025-12-17 10:13:54.961994	2025-12-17 10:13:54.961994	CZ	country	t	59	\N	Country
2025-12-17 10:13:54.963277	2025-12-17 10:13:54.963277	DK	country	t	60	\N	Country
2025-12-17 10:13:54.964267	2025-12-17 10:13:54.964267	DJ	country	t	61	\N	Country
2025-12-17 10:13:54.965255	2025-12-17 10:13:54.965255	DM	country	t	62	\N	Country
2025-12-17 10:13:54.966244	2025-12-17 10:13:54.966244	DO	country	t	63	\N	Country
2025-12-17 10:13:54.967289	2025-12-17 10:13:54.967289	EC	country	t	64	\N	Country
2025-12-17 10:13:54.968322	2025-12-17 10:13:54.968322	EG	country	t	65	\N	Country
2025-12-17 10:13:54.969357	2025-12-17 10:13:54.969357	SV	country	t	66	\N	Country
2025-12-17 10:13:54.970357	2025-12-17 10:13:54.970357	GQ	country	t	67	\N	Country
2025-12-17 10:13:54.971321	2025-12-17 10:13:54.971321	ER	country	t	68	\N	Country
2025-12-17 10:13:54.972388	2025-12-17 10:13:54.972388	EE	country	t	69	\N	Country
2025-12-17 10:13:54.973415	2025-12-17 10:13:54.973415	SZ	country	t	70	\N	Country
2025-12-17 10:13:54.974393	2025-12-17 10:13:54.974393	ET	country	t	71	\N	Country
2025-12-17 10:13:54.976633	2025-12-17 10:13:54.976633	FK	country	t	72	\N	Country
2025-12-17 10:13:54.977625	2025-12-17 10:13:54.977625	FO	country	t	73	\N	Country
2025-12-17 10:13:54.978638	2025-12-17 10:13:54.978638	FJ	country	t	74	\N	Country
2025-12-17 10:13:54.979593	2025-12-17 10:13:54.979593	FI	country	t	75	\N	Country
2025-12-17 10:13:54.980585	2025-12-17 10:13:54.980585	FR	country	t	76	\N	Country
2025-12-17 10:13:54.981524	2025-12-17 10:13:54.981524	GF	country	t	77	\N	Country
2025-12-17 10:13:54.982531	2025-12-17 10:13:54.982531	PF	country	t	78	\N	Country
2025-12-17 10:13:54.983526	2025-12-17 10:13:54.983526	TF	country	t	79	\N	Country
2025-12-17 10:13:54.984975	2025-12-17 10:13:54.984975	GA	country	t	80	\N	Country
2025-12-17 10:13:54.986277	2025-12-17 10:13:54.986277	GM	country	t	81	\N	Country
2025-12-17 10:13:54.987425	2025-12-17 10:13:54.987425	GE	country	t	82	\N	Country
2025-12-17 10:13:54.98854	2025-12-17 10:13:54.98854	DE	country	t	83	\N	Country
2025-12-17 10:13:54.989629	2025-12-17 10:13:54.989629	GH	country	t	84	\N	Country
2025-12-17 10:13:54.990709	2025-12-17 10:13:54.990709	GI	country	t	85	\N	Country
2025-12-17 10:13:54.991735	2025-12-17 10:13:54.991735	GR	country	t	86	\N	Country
2025-12-17 10:13:54.992721	2025-12-17 10:13:54.992721	GL	country	t	87	\N	Country
2025-12-17 10:13:54.99373	2025-12-17 10:13:54.99373	GD	country	t	88	\N	Country
2025-12-17 10:13:54.994734	2025-12-17 10:13:54.994734	GP	country	t	89	\N	Country
2025-12-17 10:13:54.995647	2025-12-17 10:13:54.995647	GU	country	t	90	\N	Country
2025-12-17 10:13:54.996613	2025-12-17 10:13:54.996613	GT	country	t	91	\N	Country
2025-12-17 10:13:54.997541	2025-12-17 10:13:54.997541	GG	country	t	92	\N	Country
2025-12-17 10:13:54.998503	2025-12-17 10:13:54.998503	GN	country	t	93	\N	Country
2025-12-17 10:13:54.99943	2025-12-17 10:13:54.99943	GW	country	t	94	\N	Country
2025-12-17 10:13:55.000381	2025-12-17 10:13:55.000381	GY	country	t	95	\N	Country
2025-12-17 10:13:55.001362	2025-12-17 10:13:55.001362	HT	country	t	96	\N	Country
2025-12-17 10:13:55.002298	2025-12-17 10:13:55.002298	HM	country	t	97	\N	Country
2025-12-17 10:13:55.003284	2025-12-17 10:13:55.003284	VA	country	t	98	\N	Country
2025-12-17 10:13:55.004717	2025-12-17 10:13:55.004717	HN	country	t	99	\N	Country
2025-12-17 10:13:55.005741	2025-12-17 10:13:55.005741	HK	country	t	100	\N	Country
2025-12-17 10:13:55.006851	2025-12-17 10:13:55.006851	HU	country	t	101	\N	Country
2025-12-17 10:13:55.007884	2025-12-17 10:13:55.007884	IS	country	t	102	\N	Country
2025-12-17 10:13:55.010023	2025-12-17 10:13:55.010023	IN	country	t	103	\N	Country
2025-12-17 10:13:55.011014	2025-12-17 10:13:55.011014	ID	country	t	104	\N	Country
2025-12-17 10:13:55.011986	2025-12-17 10:13:55.011986	IR	country	t	105	\N	Country
2025-12-17 10:13:55.012966	2025-12-17 10:13:55.012966	IQ	country	t	106	\N	Country
2025-12-17 10:13:55.013901	2025-12-17 10:13:55.013901	IE	country	t	107	\N	Country
2025-12-17 10:13:55.014836	2025-12-17 10:13:55.014836	IM	country	t	108	\N	Country
2025-12-17 10:13:55.015776	2025-12-17 10:13:55.015776	IL	country	t	109	\N	Country
2025-12-17 10:13:55.017019	2025-12-17 10:13:55.017019	IT	country	t	110	\N	Country
2025-12-17 10:13:55.018007	2025-12-17 10:13:55.018007	JM	country	t	111	\N	Country
2025-12-17 10:13:55.018972	2025-12-17 10:13:55.018972	JP	country	t	112	\N	Country
2025-12-17 10:13:55.019945	2025-12-17 10:13:55.019945	JE	country	t	113	\N	Country
2025-12-17 10:13:55.020901	2025-12-17 10:13:55.020901	JO	country	t	114	\N	Country
2025-12-17 10:13:55.021831	2025-12-17 10:13:55.021831	KZ	country	t	115	\N	Country
2025-12-17 10:13:55.022733	2025-12-17 10:13:55.022733	KE	country	t	116	\N	Country
2025-12-17 10:13:55.023638	2025-12-17 10:13:55.023638	KI	country	t	117	\N	Country
2025-12-17 10:13:55.024586	2025-12-17 10:13:55.024586	KP	country	t	118	\N	Country
2025-12-17 10:13:55.025895	2025-12-17 10:13:55.025895	KR	country	t	119	\N	Country
2025-12-17 10:13:55.026841	2025-12-17 10:13:55.026841	KW	country	t	120	\N	Country
2025-12-17 10:13:55.028049	2025-12-17 10:13:55.028049	KG	country	t	121	\N	Country
2025-12-17 10:13:55.029291	2025-12-17 10:13:55.029291	LA	country	t	122	\N	Country
2025-12-17 10:13:55.030304	2025-12-17 10:13:55.030304	LV	country	t	123	\N	Country
2025-12-17 10:13:55.031273	2025-12-17 10:13:55.031273	LB	country	t	124	\N	Country
2025-12-17 10:13:55.032225	2025-12-17 10:13:55.032225	LS	country	t	125	\N	Country
2025-12-17 10:13:55.033162	2025-12-17 10:13:55.033162	LR	country	t	126	\N	Country
2025-12-17 10:13:55.034137	2025-12-17 10:13:55.034137	LY	country	t	127	\N	Country
2025-12-17 10:13:55.035172	2025-12-17 10:13:55.035172	LI	country	t	128	\N	Country
2025-12-17 10:13:55.036609	2025-12-17 10:13:55.036609	LT	country	t	129	\N	Country
2025-12-17 10:13:55.037636	2025-12-17 10:13:55.037636	LU	country	t	130	\N	Country
2025-12-17 10:13:55.038676	2025-12-17 10:13:55.038676	MO	country	t	131	\N	Country
2025-12-17 10:13:55.039788	2025-12-17 10:13:55.039788	MK	country	t	132	\N	Country
2025-12-17 10:13:55.040749	2025-12-17 10:13:55.040749	MG	country	t	133	\N	Country
2025-12-17 10:13:55.041708	2025-12-17 10:13:55.041708	MW	country	t	134	\N	Country
2025-12-17 10:13:55.043694	2025-12-17 10:13:55.043694	MY	country	t	135	\N	Country
2025-12-17 10:13:55.044649	2025-12-17 10:13:55.044649	MV	country	t	136	\N	Country
2025-12-17 10:13:55.045608	2025-12-17 10:13:55.045608	ML	country	t	137	\N	Country
2025-12-17 10:13:55.04686	2025-12-17 10:13:55.04686	MT	country	t	138	\N	Country
2025-12-17 10:13:55.047822	2025-12-17 10:13:55.047822	MH	country	t	139	\N	Country
2025-12-17 10:13:55.048782	2025-12-17 10:13:55.048782	MQ	country	t	140	\N	Country
2025-12-17 10:13:55.049759	2025-12-17 10:13:55.049759	MR	country	t	141	\N	Country
2025-12-17 10:13:55.050731	2025-12-17 10:13:55.050731	MU	country	t	142	\N	Country
2025-12-17 10:13:55.05165	2025-12-17 10:13:55.05165	YT	country	t	143	\N	Country
2025-12-17 10:13:55.052599	2025-12-17 10:13:55.052599	MX	country	t	144	\N	Country
2025-12-17 10:13:55.053479	2025-12-17 10:13:55.053479	FM	country	t	145	\N	Country
2025-12-17 10:13:55.054425	2025-12-17 10:13:55.054425	MD	country	t	146	\N	Country
2025-12-17 10:13:55.055366	2025-12-17 10:13:55.055366	MC	country	t	147	\N	Country
2025-12-17 10:13:55.056311	2025-12-17 10:13:55.056311	MN	country	t	148	\N	Country
2025-12-17 10:13:55.057241	2025-12-17 10:13:55.057241	ME	country	t	149	\N	Country
2025-12-17 10:13:55.058144	2025-12-17 10:13:55.058144	MS	country	t	150	\N	Country
2025-12-17 10:13:55.059086	2025-12-17 10:13:55.059086	MA	country	t	151	\N	Country
2025-12-17 10:13:55.060055	2025-12-17 10:13:55.060055	MZ	country	t	152	\N	Country
2025-12-17 10:13:55.060993	2025-12-17 10:13:55.060993	MM	country	t	153	\N	Country
2025-12-17 10:13:55.06187	2025-12-17 10:13:55.06187	NA	country	t	154	\N	Country
2025-12-17 10:13:55.06283	2025-12-17 10:13:55.06283	NR	country	t	155	\N	Country
2025-12-17 10:13:55.063729	2025-12-17 10:13:55.063729	NP	country	t	156	\N	Country
2025-12-17 10:13:55.064645	2025-12-17 10:13:55.064645	NL	country	t	157	\N	Country
2025-12-17 10:13:55.065566	2025-12-17 10:13:55.065566	NC	country	t	158	\N	Country
2025-12-17 10:13:55.066947	2025-12-17 10:13:55.066947	NZ	country	t	159	\N	Country
2025-12-17 10:13:55.067994	2025-12-17 10:13:55.067994	NI	country	t	160	\N	Country
2025-12-17 10:13:55.068945	2025-12-17 10:13:55.068945	NE	country	t	161	\N	Country
2025-12-17 10:13:55.069883	2025-12-17 10:13:55.069883	NG	country	t	162	\N	Country
2025-12-17 10:13:55.070832	2025-12-17 10:13:55.070832	NU	country	t	163	\N	Country
2025-12-17 10:13:55.071788	2025-12-17 10:13:55.071788	NF	country	t	164	\N	Country
2025-12-17 10:13:55.072733	2025-12-17 10:13:55.072733	MP	country	t	165	\N	Country
2025-12-17 10:13:55.073634	2025-12-17 10:13:55.073634	NO	country	t	166	\N	Country
2025-12-17 10:13:55.075551	2025-12-17 10:13:55.075551	OM	country	t	167	\N	Country
2025-12-17 10:13:55.076516	2025-12-17 10:13:55.076516	PK	country	t	168	\N	Country
2025-12-17 10:13:55.077439	2025-12-17 10:13:55.077439	PW	country	t	169	\N	Country
2025-12-17 10:13:55.078314	2025-12-17 10:13:55.078314	PS	country	t	170	\N	Country
2025-12-17 10:13:55.079237	2025-12-17 10:13:55.079237	PA	country	t	171	\N	Country
2025-12-17 10:13:55.080232	2025-12-17 10:13:55.080232	PG	country	t	172	\N	Country
2025-12-17 10:13:55.081235	2025-12-17 10:13:55.081235	PY	country	t	173	\N	Country
2025-12-17 10:13:55.082257	2025-12-17 10:13:55.082257	PE	country	t	174	\N	Country
2025-12-17 10:13:55.08321	2025-12-17 10:13:55.08321	PH	country	t	175	\N	Country
2025-12-17 10:13:55.084297	2025-12-17 10:13:55.084297	PN	country	t	176	\N	Country
2025-12-17 10:13:55.085271	2025-12-17 10:13:55.085271	PL	country	t	177	\N	Country
2025-12-17 10:13:55.086586	2025-12-17 10:13:55.086586	PT	country	t	178	\N	Country
2025-12-17 10:13:55.087584	2025-12-17 10:13:55.087584	PR	country	t	179	\N	Country
2025-12-17 10:13:55.08857	2025-12-17 10:13:55.08857	QA	country	t	180	\N	Country
2025-12-17 10:13:55.089616	2025-12-17 10:13:55.089616	RE	country	t	181	\N	Country
2025-12-17 10:13:55.090598	2025-12-17 10:13:55.090598	RO	country	t	182	\N	Country
2025-12-17 10:13:55.091586	2025-12-17 10:13:55.091586	RU	country	t	183	\N	Country
2025-12-17 10:13:55.09257	2025-12-17 10:13:55.09257	RW	country	t	184	\N	Country
2025-12-17 10:13:55.093536	2025-12-17 10:13:55.093536	BL	country	t	185	\N	Country
2025-12-17 10:13:55.094467	2025-12-17 10:13:55.094467	SH	country	t	186	\N	Country
2025-12-17 10:13:55.095414	2025-12-17 10:13:55.095414	KN	country	t	187	\N	Country
2025-12-17 10:13:55.09641	2025-12-17 10:13:55.09641	LC	country	t	188	\N	Country
2025-12-17 10:13:55.097331	2025-12-17 10:13:55.097331	MF	country	t	189	\N	Country
2025-12-17 10:13:55.098283	2025-12-17 10:13:55.098283	PM	country	t	190	\N	Country
2025-12-17 10:13:55.099238	2025-12-17 10:13:55.099238	VC	country	t	191	\N	Country
2025-12-17 10:13:55.100213	2025-12-17 10:13:55.100213	WS	country	t	192	\N	Country
2025-12-17 10:13:55.101226	2025-12-17 10:13:55.101226	SM	country	t	193	\N	Country
2025-12-17 10:13:55.102264	2025-12-17 10:13:55.102264	ST	country	t	194	\N	Country
2025-12-17 10:13:55.103206	2025-12-17 10:13:55.103206	SA	country	t	195	\N	Country
2025-12-17 10:13:55.104189	2025-12-17 10:13:55.104189	SN	country	t	196	\N	Country
2025-12-17 10:13:55.105288	2025-12-17 10:13:55.105288	RS	country	t	197	\N	Country
2025-12-17 10:13:55.106621	2025-12-17 10:13:55.106621	SC	country	t	198	\N	Country
2025-12-17 10:13:55.108509	2025-12-17 10:13:55.108509	SL	country	t	199	\N	Country
2025-12-17 10:13:55.109526	2025-12-17 10:13:55.109526	SG	country	t	200	\N	Country
2025-12-17 10:13:55.110443	2025-12-17 10:13:55.110443	SX	country	t	201	\N	Country
2025-12-17 10:13:55.111513	2025-12-17 10:13:55.111513	SK	country	t	202	\N	Country
2025-12-17 10:13:55.112503	2025-12-17 10:13:55.112503	SI	country	t	203	\N	Country
2025-12-17 10:13:55.11346	2025-12-17 10:13:55.11346	SB	country	t	204	\N	Country
2025-12-17 10:13:55.114398	2025-12-17 10:13:55.114398	SO	country	t	205	\N	Country
2025-12-17 10:13:55.115374	2025-12-17 10:13:55.115374	ZA	country	t	206	\N	Country
2025-12-17 10:13:55.116366	2025-12-17 10:13:55.116366	GS	country	t	207	\N	Country
2025-12-17 10:13:55.117338	2025-12-17 10:13:55.117338	SS	country	t	208	\N	Country
2025-12-17 10:13:55.118325	2025-12-17 10:13:55.118325	ES	country	t	209	\N	Country
2025-12-17 10:13:55.119268	2025-12-17 10:13:55.119268	LK	country	t	210	\N	Country
2025-12-17 10:13:55.120246	2025-12-17 10:13:55.120246	SD	country	t	211	\N	Country
2025-12-17 10:13:55.121242	2025-12-17 10:13:55.121242	SR	country	t	212	\N	Country
2025-12-17 10:13:55.122211	2025-12-17 10:13:55.122211	SJ	country	t	213	\N	Country
2025-12-17 10:13:55.123168	2025-12-17 10:13:55.123168	SE	country	t	214	\N	Country
2025-12-17 10:13:55.124068	2025-12-17 10:13:55.124068	CH	country	t	215	\N	Country
2025-12-17 10:13:55.125031	2025-12-17 10:13:55.125031	SY	country	t	216	\N	Country
2025-12-17 10:13:55.126272	2025-12-17 10:13:55.126272	TW	country	t	217	\N	Country
2025-12-17 10:13:55.127153	2025-12-17 10:13:55.127153	TJ	country	t	218	\N	Country
2025-12-17 10:13:55.128073	2025-12-17 10:13:55.128073	TZ	country	t	219	\N	Country
2025-12-17 10:13:55.128956	2025-12-17 10:13:55.128956	TH	country	t	220	\N	Country
2025-12-17 10:13:55.12983	2025-12-17 10:13:55.12983	TL	country	t	221	\N	Country
2025-12-17 10:13:55.130712	2025-12-17 10:13:55.130712	TG	country	t	222	\N	Country
2025-12-17 10:13:55.131628	2025-12-17 10:13:55.131628	TK	country	t	223	\N	Country
2025-12-17 10:13:55.132567	2025-12-17 10:13:55.132567	TO	country	t	224	\N	Country
2025-12-17 10:13:55.133473	2025-12-17 10:13:55.133473	TT	country	t	225	\N	Country
2025-12-17 10:13:55.134365	2025-12-17 10:13:55.134365	TN	country	t	226	\N	Country
2025-12-17 10:13:55.135308	2025-12-17 10:13:55.135308	TR	country	t	227	\N	Country
2025-12-17 10:13:55.1363	2025-12-17 10:13:55.1363	TM	country	t	228	\N	Country
2025-12-17 10:13:55.13721	2025-12-17 10:13:55.13721	TC	country	t	229	\N	Country
2025-12-17 10:13:55.13813	2025-12-17 10:13:55.13813	TV	country	t	230	\N	Country
2025-12-17 10:13:55.138997	2025-12-17 10:13:55.138997	UG	country	t	231	\N	Country
2025-12-17 10:13:55.140768	2025-12-17 10:13:55.140768	UA	country	t	232	\N	Country
2025-12-17 10:13:55.141688	2025-12-17 10:13:55.141688	AE	country	t	233	\N	Country
2025-12-17 10:13:55.142648	2025-12-17 10:13:55.142648	GB	country	t	234	\N	Country
2025-12-17 10:13:55.143579	2025-12-17 10:13:55.143579	US	country	t	235	\N	Country
2025-12-17 10:13:55.144821	2025-12-17 10:13:55.144821	UM	country	t	236	\N	Country
2025-12-17 10:13:55.14568	2025-12-17 10:13:55.14568	UY	country	t	237	\N	Country
2025-12-17 10:13:55.146608	2025-12-17 10:13:55.146608	UZ	country	t	238	\N	Country
2025-12-17 10:13:55.147532	2025-12-17 10:13:55.147532	VU	country	t	239	\N	Country
2025-12-17 10:13:55.148443	2025-12-17 10:13:55.148443	VE	country	t	240	\N	Country
2025-12-17 10:13:55.149306	2025-12-17 10:13:55.149306	VN	country	t	241	\N	Country
2025-12-17 10:13:55.150184	2025-12-17 10:13:55.150184	VG	country	t	242	\N	Country
2025-12-17 10:13:55.15106	2025-12-17 10:13:55.15106	VI	country	t	243	\N	Country
2025-12-17 10:13:55.151965	2025-12-17 10:13:55.151965	WF	country	t	244	\N	Country
2025-12-17 10:13:55.153592	2025-12-17 10:13:55.153592	EH	country	t	245	\N	Country
2025-12-17 10:13:55.15461	2025-12-17 10:13:55.15461	YE	country	t	246	\N	Country
2025-12-17 10:13:55.155501	2025-12-17 10:13:55.155501	ZM	country	t	247	\N	Country
2025-12-17 10:13:55.156395	2025-12-17 10:13:55.156395	ZW	country	t	248	\N	Country
\.


--
-- TOC entry 4705 (class 0 OID 10312379)
-- Dependencies: 290
-- Data for Name: region_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2025-12-17 10:13:54.834437	2025-12-17 10:13:54.836307	en	Afghanistan	1	1
2025-12-17 10:13:54.844816	2025-12-17 10:13:54.84579	en	Åland Islands	2	2
2025-12-17 10:13:54.850645	2025-12-17 10:13:54.851402	en	Albania	3	3
2025-12-17 10:13:54.853732	2025-12-17 10:13:54.854313	en	Algeria	4	4
2025-12-17 10:13:54.858671	2025-12-17 10:13:54.859382	en	American Samoa	5	5
2025-12-17 10:13:54.863752	2025-12-17 10:13:54.864548	en	Andorra	6	6
2025-12-17 10:13:54.866254	2025-12-17 10:13:54.866853	en	Angola	7	7
2025-12-17 10:13:54.868515	2025-12-17 10:13:54.869201	en	Anguilla	8	8
2025-12-17 10:13:54.873858	2025-12-17 10:13:54.874595	en	Antigua and Barbuda	9	9
2025-12-17 10:13:54.876788	2025-12-17 10:13:54.877432	en	Argentina	10	10
2025-12-17 10:13:54.890771	2025-12-17 10:13:54.891554	en	Armenia	11	11
2025-12-17 10:13:54.893322	2025-12-17 10:13:54.893804	en	Aruba	12	12
2025-12-17 10:13:54.895217	2025-12-17 10:13:54.895736	en	Australia	13	13
2025-12-17 10:13:54.897089	2025-12-17 10:13:54.897516	en	Austria	14	14
2025-12-17 10:13:54.898759	2025-12-17 10:13:54.900226	en	Azerbaijan	15	15
2025-12-17 10:13:54.902025	2025-12-17 10:13:54.902467	en	Bahamas	16	16
2025-12-17 10:13:54.90388	2025-12-17 10:13:54.904304	en	Bahrain	17	17
2025-12-17 10:13:54.905542	2025-12-17 10:13:54.90598	en	Bangladesh	18	18
2025-12-17 10:13:54.907172	2025-12-17 10:13:54.907633	en	Barbados	19	19
2025-12-17 10:13:54.909506	2025-12-17 10:13:54.909966	en	Belarus	20	20
2025-12-17 10:13:54.911258	2025-12-17 10:13:54.911727	en	Belgium	21	21
2025-12-17 10:13:54.912946	2025-12-17 10:13:54.913366	en	Belize	22	22
2025-12-17 10:13:54.914563	2025-12-17 10:13:54.914993	en	Benin	23	23
2025-12-17 10:13:54.916197	2025-12-17 10:13:54.916639	en	Bermuda	24	24
2025-12-17 10:13:54.91797	2025-12-17 10:13:54.918416	en	Bhutan	25	25
2025-12-17 10:13:54.919605	2025-12-17 10:13:54.920036	en	Bolivia (Plurinational State of)	26	26
2025-12-17 10:13:54.921151	2025-12-17 10:13:54.921574	en	Bonaire, Sint Eustatius and Saba	27	27
2025-12-17 10:13:54.922771	2025-12-17 10:13:54.923348	en	Bosnia and Herzegovina	28	28
2025-12-17 10:13:54.924631	2025-12-17 10:13:54.925072	en	Botswana	29	29
2025-12-17 10:13:54.926216	2025-12-17 10:13:54.926648	en	Bouvet Island	30	30
2025-12-17 10:13:54.927763	2025-12-17 10:13:54.928165	en	Brazil	31	31
2025-12-17 10:13:54.929276	2025-12-17 10:13:54.929725	en	British Indian Ocean Territory	32	32
2025-12-17 10:13:54.930969	2025-12-17 10:13:54.93143	en	Brunei Darussalam	33	33
2025-12-17 10:13:54.932682	2025-12-17 10:13:54.933155	en	Bulgaria	34	34
2025-12-17 10:13:54.934386	2025-12-17 10:13:54.934851	en	Burkina Faso	35	35
2025-12-17 10:13:54.935867	2025-12-17 10:13:54.93617	en	Burundi	36	36
2025-12-17 10:13:54.937025	2025-12-17 10:13:54.937377	en	Cabo Verde	37	37
2025-12-17 10:13:54.938231	2025-12-17 10:13:54.938547	en	Cambodia	38	38
2025-12-17 10:13:54.939346	2025-12-17 10:13:54.939635	en	Cameroon	39	39
2025-12-17 10:13:54.9407	2025-12-17 10:13:54.940975	en	Canada	40	40
2025-12-17 10:13:54.942969	2025-12-17 10:13:54.943264	en	Cayman Islands	41	41
2025-12-17 10:13:54.944021	2025-12-17 10:13:54.944317	en	Central African Republic	42	42
2025-12-17 10:13:54.945056	2025-12-17 10:13:54.945333	en	Chad	43	43
2025-12-17 10:13:54.946039	2025-12-17 10:13:54.946313	en	Chile	44	44
2025-12-17 10:13:54.947077	2025-12-17 10:13:54.947381	en	China	45	45
2025-12-17 10:13:54.948147	2025-12-17 10:13:54.948465	en	Christmas Island	46	46
2025-12-17 10:13:54.94929	2025-12-17 10:13:54.949571	en	Cocos (Keeling) Islands	47	47
2025-12-17 10:13:54.950321	2025-12-17 10:13:54.950596	en	Colombia	48	48
2025-12-17 10:13:54.951343	2025-12-17 10:13:54.951645	en	Comoros	49	49
2025-12-17 10:13:54.952457	2025-12-17 10:13:54.952759	en	Congo	50	50
2025-12-17 10:13:54.953466	2025-12-17 10:13:54.95374	en	Congo (Democratic Republic of the)	51	51
2025-12-17 10:13:54.954463	2025-12-17 10:13:54.954733	en	Cook Islands	52	52
2025-12-17 10:13:54.955452	2025-12-17 10:13:54.955724	en	Costa Rica	53	53
2025-12-17 10:13:54.956464	2025-12-17 10:13:54.956733	en	Côte d'Ivoire	54	54
2025-12-17 10:13:54.957466	2025-12-17 10:13:54.95774	en	Croatia	55	55
2025-12-17 10:13:54.958532	2025-12-17 10:13:54.95884	en	Cuba	56	56
2025-12-17 10:13:54.959639	2025-12-17 10:13:54.959944	en	Curaçao	57	57
2025-12-17 10:13:54.960713	2025-12-17 10:13:54.961013	en	Cyprus	58	58
2025-12-17 10:13:54.961737	2025-12-17 10:13:54.961994	en	Czechia	59	59
2025-12-17 10:13:54.962989	2025-12-17 10:13:54.963277	en	Denmark	60	60
2025-12-17 10:13:54.963998	2025-12-17 10:13:54.964267	en	Djibouti	61	61
2025-12-17 10:13:54.964985	2025-12-17 10:13:54.965255	en	Dominica	62	62
2025-12-17 10:13:54.965966	2025-12-17 10:13:54.966244	en	Dominican Republic	63	63
2025-12-17 10:13:54.966997	2025-12-17 10:13:54.967289	en	Ecuador	64	64
2025-12-17 10:13:54.968043	2025-12-17 10:13:54.968322	en	Egypt	65	65
2025-12-17 10:13:54.969077	2025-12-17 10:13:54.969357	en	El Salvador	66	66
2025-12-17 10:13:54.970083	2025-12-17 10:13:54.970357	en	Equatorial Guinea	67	67
2025-12-17 10:13:54.971048	2025-12-17 10:13:54.971321	en	Eritrea	68	68
2025-12-17 10:13:54.972103	2025-12-17 10:13:54.972388	en	Estonia	69	69
2025-12-17 10:13:54.973144	2025-12-17 10:13:54.973415	en	Eswatini	70	70
2025-12-17 10:13:54.974122	2025-12-17 10:13:54.974393	en	Ethiopia	71	71
2025-12-17 10:13:54.976344	2025-12-17 10:13:54.976633	en	Falkland Islands (Malvinas)	72	72
2025-12-17 10:13:54.977328	2025-12-17 10:13:54.977625	en	Faroe Islands	73	73
2025-12-17 10:13:54.978348	2025-12-17 10:13:54.978638	en	Fiji	74	74
2025-12-17 10:13:54.979318	2025-12-17 10:13:54.979593	en	Finland	75	75
2025-12-17 10:13:54.980305	2025-12-17 10:13:54.980585	en	France	76	76
2025-12-17 10:13:54.981279	2025-12-17 10:13:54.981524	en	French Guiana	77	77
2025-12-17 10:13:54.98225	2025-12-17 10:13:54.982531	en	French Polynesia	78	78
2025-12-17 10:13:54.983245	2025-12-17 10:13:54.983526	en	French Southern Territories	79	79
2025-12-17 10:13:54.984668	2025-12-17 10:13:54.984975	en	Gabon	80	80
2025-12-17 10:13:54.985975	2025-12-17 10:13:54.986277	en	Gambia	81	81
2025-12-17 10:13:54.987119	2025-12-17 10:13:54.987425	en	Georgia	82	82
2025-12-17 10:13:54.988226	2025-12-17 10:13:54.98854	en	Germany	83	83
2025-12-17 10:13:54.989335	2025-12-17 10:13:54.989629	en	Ghana	84	84
2025-12-17 10:13:54.990419	2025-12-17 10:13:54.990709	en	Gibraltar	85	85
2025-12-17 10:13:54.991449	2025-12-17 10:13:54.991735	en	Greece	86	86
2025-12-17 10:13:54.992454	2025-12-17 10:13:54.992721	en	Greenland	87	87
2025-12-17 10:13:54.993427	2025-12-17 10:13:54.99373	en	Grenada	88	88
2025-12-17 10:13:54.994471	2025-12-17 10:13:54.994734	en	Guadeloupe	89	89
2025-12-17 10:13:54.99539	2025-12-17 10:13:54.995647	en	Guam	90	90
2025-12-17 10:13:54.996331	2025-12-17 10:13:54.996613	en	Guatemala	91	91
2025-12-17 10:13:54.997263	2025-12-17 10:13:54.997541	en	Guernsey	92	92
2025-12-17 10:13:54.998224	2025-12-17 10:13:54.998503	en	Guinea	93	93
2025-12-17 10:13:54.999163	2025-12-17 10:13:54.99943	en	Guinea-Bissau	94	94
2025-12-17 10:13:55.000103	2025-12-17 10:13:55.000381	en	Guyana	95	95
2025-12-17 10:13:55.00109	2025-12-17 10:13:55.001362	en	Haiti	96	96
2025-12-17 10:13:55.002028	2025-12-17 10:13:55.002298	en	Heard Island and McDonald Islands	97	97
2025-12-17 10:13:55.002979	2025-12-17 10:13:55.003284	en	Holy See	98	98
2025-12-17 10:13:55.004128	2025-12-17 10:13:55.004717	en	Honduras	99	99
2025-12-17 10:13:55.005431	2025-12-17 10:13:55.005741	en	Hong Kong	100	100
2025-12-17 10:13:55.006557	2025-12-17 10:13:55.006851	en	Hungary	101	101
2025-12-17 10:13:55.007607	2025-12-17 10:13:55.007884	en	Iceland	102	102
2025-12-17 10:13:55.008679	2025-12-17 10:13:55.010023	en	India	103	103
2025-12-17 10:13:55.010724	2025-12-17 10:13:55.011014	en	Indonesia	104	104
2025-12-17 10:13:55.011721	2025-12-17 10:13:55.011986	en	Iran (Islamic Republic of)	105	105
2025-12-17 10:13:55.012702	2025-12-17 10:13:55.012966	en	Iraq	106	106
2025-12-17 10:13:55.013625	2025-12-17 10:13:55.013901	en	Ireland	107	107
2025-12-17 10:13:55.014582	2025-12-17 10:13:55.014836	en	Isle of Man	108	108
2025-12-17 10:13:55.015514	2025-12-17 10:13:55.015776	en	Israel	109	109
2025-12-17 10:13:55.016736	2025-12-17 10:13:55.017019	en	Italy	110	110
2025-12-17 10:13:55.017732	2025-12-17 10:13:55.018007	en	Jamaica	111	111
2025-12-17 10:13:55.018721	2025-12-17 10:13:55.018972	en	Japan	112	112
2025-12-17 10:13:55.019657	2025-12-17 10:13:55.019945	en	Jersey	113	113
2025-12-17 10:13:55.020648	2025-12-17 10:13:55.020901	en	Jordan	114	114
2025-12-17 10:13:55.021568	2025-12-17 10:13:55.021831	en	Kazakhstan	115	115
2025-12-17 10:13:55.022482	2025-12-17 10:13:55.022733	en	Kenya	116	116
2025-12-17 10:13:55.02338	2025-12-17 10:13:55.023638	en	Kiribati	117	117
2025-12-17 10:13:55.02431	2025-12-17 10:13:55.024586	en	Korea (Democratic People's Republic of)	118	118
2025-12-17 10:13:55.025615	2025-12-17 10:13:55.025895	en	Korea (Republic of)	119	119
2025-12-17 10:13:55.026573	2025-12-17 10:13:55.026841	en	Kuwait	120	120
2025-12-17 10:13:55.027746	2025-12-17 10:13:55.028049	en	Kyrgyzstan	121	121
2025-12-17 10:13:55.028993	2025-12-17 10:13:55.029291	en	Lao People's Democratic Republic	122	122
2025-12-17 10:13:55.030027	2025-12-17 10:13:55.030304	en	Latvia	123	123
2025-12-17 10:13:55.031011	2025-12-17 10:13:55.031273	en	Lebanon	124	124
2025-12-17 10:13:55.031973	2025-12-17 10:13:55.032225	en	Lesotho	125	125
2025-12-17 10:13:55.032895	2025-12-17 10:13:55.033162	en	Liberia	126	126
2025-12-17 10:13:55.033866	2025-12-17 10:13:55.034137	en	Libya	127	127
2025-12-17 10:13:55.034889	2025-12-17 10:13:55.035172	en	Liechtenstein	128	128
2025-12-17 10:13:55.036321	2025-12-17 10:13:55.036609	en	Lithuania	129	129
2025-12-17 10:13:55.03734	2025-12-17 10:13:55.037636	en	Luxembourg	130	130
2025-12-17 10:13:55.038378	2025-12-17 10:13:55.038676	en	Macao	131	131
2025-12-17 10:13:55.039488	2025-12-17 10:13:55.039788	en	Macedonia (the former Yugoslav Republic of)	132	132
2025-12-17 10:13:55.040488	2025-12-17 10:13:55.040749	en	Madagascar	133	133
2025-12-17 10:13:55.041437	2025-12-17 10:13:55.041708	en	Malawi	134	134
2025-12-17 10:13:55.043426	2025-12-17 10:13:55.043694	en	Malaysia	135	135
2025-12-17 10:13:55.044366	2025-12-17 10:13:55.044649	en	Maldives	136	136
2025-12-17 10:13:55.045346	2025-12-17 10:13:55.045608	en	Mali	137	137
2025-12-17 10:13:55.046285	2025-12-17 10:13:55.04686	en	Malta	138	138
2025-12-17 10:13:55.047563	2025-12-17 10:13:55.047822	en	Marshall Islands	139	139
2025-12-17 10:13:55.048521	2025-12-17 10:13:55.048782	en	Martinique	140	140
2025-12-17 10:13:55.049474	2025-12-17 10:13:55.049759	en	Mauritania	141	141
2025-12-17 10:13:55.05046	2025-12-17 10:13:55.050731	en	Mauritius	142	142
2025-12-17 10:13:55.051403	2025-12-17 10:13:55.05165	en	Mayotte	143	143
2025-12-17 10:13:55.052339	2025-12-17 10:13:55.052599	en	Mexico	144	144
2025-12-17 10:13:55.053222	2025-12-17 10:13:55.053479	en	Micronesia (Federated States of)	145	145
2025-12-17 10:13:55.054149	2025-12-17 10:13:55.054425	en	Moldova (Republic of)	146	146
2025-12-17 10:13:55.055101	2025-12-17 10:13:55.055366	en	Monaco	147	147
2025-12-17 10:13:55.05604	2025-12-17 10:13:55.056311	en	Mongolia	148	148
2025-12-17 10:13:55.056989	2025-12-17 10:13:55.057241	en	Montenegro	149	149
2025-12-17 10:13:55.0579	2025-12-17 10:13:55.058144	en	Montserrat	150	150
2025-12-17 10:13:55.058784	2025-12-17 10:13:55.059086	en	Morocco	151	151
2025-12-17 10:13:55.059787	2025-12-17 10:13:55.060055	en	Mozambique	152	152
2025-12-17 10:13:55.060722	2025-12-17 10:13:55.060993	en	Myanmar	153	153
2025-12-17 10:13:55.061626	2025-12-17 10:13:55.06187	en	Namibia	154	154
2025-12-17 10:13:55.06256	2025-12-17 10:13:55.06283	en	Nauru	155	155
2025-12-17 10:13:55.063483	2025-12-17 10:13:55.063729	en	Nepal	156	156
2025-12-17 10:13:55.06439	2025-12-17 10:13:55.064645	en	Netherlands	157	157
2025-12-17 10:13:55.065296	2025-12-17 10:13:55.065566	en	New Caledonia	158	158
2025-12-17 10:13:55.066653	2025-12-17 10:13:55.066947	en	New Zealand	159	159
2025-12-17 10:13:55.067704	2025-12-17 10:13:55.067994	en	Nicaragua	160	160
2025-12-17 10:13:55.068669	2025-12-17 10:13:55.068945	en	Niger	161	161
2025-12-17 10:13:55.069616	2025-12-17 10:13:55.069883	en	Nigeria	162	162
2025-12-17 10:13:55.07057	2025-12-17 10:13:55.070832	en	Niue	163	163
2025-12-17 10:13:55.07152	2025-12-17 10:13:55.071788	en	Norfolk Island	164	164
2025-12-17 10:13:55.072463	2025-12-17 10:13:55.072733	en	Northern Mariana Islands	165	165
2025-12-17 10:13:55.073389	2025-12-17 10:13:55.073634	en	Norway	166	166
2025-12-17 10:13:55.075266	2025-12-17 10:13:55.075551	en	Oman	167	167
2025-12-17 10:13:55.07625	2025-12-17 10:13:55.076516	en	Pakistan	168	168
2025-12-17 10:13:55.077174	2025-12-17 10:13:55.077439	en	Palau	169	169
2025-12-17 10:13:55.078084	2025-12-17 10:13:55.078314	en	Palestine, State of	170	170
2025-12-17 10:13:55.078962	2025-12-17 10:13:55.079237	en	Panama	171	171
2025-12-17 10:13:55.079963	2025-12-17 10:13:55.080232	en	Papua New Guinea	172	172
2025-12-17 10:13:55.080968	2025-12-17 10:13:55.081235	en	Paraguay	173	173
2025-12-17 10:13:55.081994	2025-12-17 10:13:55.082257	en	Peru	174	174
2025-12-17 10:13:55.082955	2025-12-17 10:13:55.08321	en	Philippines	175	175
2025-12-17 10:13:55.083988	2025-12-17 10:13:55.084297	en	Pitcairn	176	176
2025-12-17 10:13:55.084965	2025-12-17 10:13:55.085271	en	Poland	177	177
2025-12-17 10:13:55.08599	2025-12-17 10:13:55.086586	en	Portugal	178	178
2025-12-17 10:13:55.087286	2025-12-17 10:13:55.087584	en	Puerto Rico	179	179
2025-12-17 10:13:55.088286	2025-12-17 10:13:55.08857	en	Qatar	180	180
2025-12-17 10:13:55.089352	2025-12-17 10:13:55.089616	en	Réunion	181	181
2025-12-17 10:13:55.090325	2025-12-17 10:13:55.090598	en	Romania	182	182
2025-12-17 10:13:55.091314	2025-12-17 10:13:55.091586	en	Russian Federation	183	183
2025-12-17 10:13:55.092304	2025-12-17 10:13:55.09257	en	Rwanda	184	184
2025-12-17 10:13:55.093267	2025-12-17 10:13:55.093536	en	Saint Barthélemy	185	185
2025-12-17 10:13:55.094206	2025-12-17 10:13:55.094467	en	Saint Helena, Ascension and Tristan da Cunha	186	186
2025-12-17 10:13:55.095154	2025-12-17 10:13:55.095414	en	Saint Kitts and Nevis	187	187
2025-12-17 10:13:55.096125	2025-12-17 10:13:55.09641	en	Saint Lucia	188	188
2025-12-17 10:13:55.097058	2025-12-17 10:13:55.097331	en	Saint Martin (French part)	189	189
2025-12-17 10:13:55.098021	2025-12-17 10:13:55.098283	en	Saint Pierre and Miquelon	190	190
2025-12-17 10:13:55.098956	2025-12-17 10:13:55.099238	en	Saint Vincent and the Grenadines	191	191
2025-12-17 10:13:55.099928	2025-12-17 10:13:55.100213	en	Samoa	192	192
2025-12-17 10:13:55.100962	2025-12-17 10:13:55.101226	en	San Marino	193	193
2025-12-17 10:13:55.102004	2025-12-17 10:13:55.102264	en	Sao Tome and Principe	194	194
2025-12-17 10:13:55.102947	2025-12-17 10:13:55.103206	en	Saudi Arabia	195	195
2025-12-17 10:13:55.103896	2025-12-17 10:13:55.104189	en	Senegal	196	196
2025-12-17 10:13:55.104929	2025-12-17 10:13:55.105288	en	Serbia	197	197
2025-12-17 10:13:55.106329	2025-12-17 10:13:55.106621	en	Seychelles	198	198
2025-12-17 10:13:55.108222	2025-12-17 10:13:55.108509	en	Sierra Leone	199	199
2025-12-17 10:13:55.109269	2025-12-17 10:13:55.109526	en	Singapore	200	200
2025-12-17 10:13:55.110198	2025-12-17 10:13:55.110443	en	Sint Maarten (Dutch part)	201	201
2025-12-17 10:13:55.111193	2025-12-17 10:13:55.111513	en	Slovakia	202	202
2025-12-17 10:13:55.11225	2025-12-17 10:13:55.112503	en	Slovenia	203	203
2025-12-17 10:13:55.113209	2025-12-17 10:13:55.11346	en	Solomon Islands	204	204
2025-12-17 10:13:55.114144	2025-12-17 10:13:55.114398	en	Somalia	205	205
2025-12-17 10:13:55.115081	2025-12-17 10:13:55.115374	en	South Africa	206	206
2025-12-17 10:13:55.116062	2025-12-17 10:13:55.116366	en	South Georgia and the South Sandwich Islands	207	207
2025-12-17 10:13:55.117064	2025-12-17 10:13:55.117338	en	South Sudan	208	208
2025-12-17 10:13:55.118067	2025-12-17 10:13:55.118325	en	Spain	209	209
2025-12-17 10:13:55.118987	2025-12-17 10:13:55.119268	en	Sri Lanka	210	210
2025-12-17 10:13:55.119963	2025-12-17 10:13:55.120246	en	Sudan	211	211
2025-12-17 10:13:55.120968	2025-12-17 10:13:55.121242	en	Suriname	212	212
2025-12-17 10:13:55.121942	2025-12-17 10:13:55.122211	en	Svalbard and Jan Mayen	213	213
2025-12-17 10:13:55.122903	2025-12-17 10:13:55.123168	en	Sweden	214	214
2025-12-17 10:13:55.123812	2025-12-17 10:13:55.124068	en	Switzerland	215	215
2025-12-17 10:13:55.124764	2025-12-17 10:13:55.125031	en	Syrian Arab Republic	216	216
2025-12-17 10:13:55.126019	2025-12-17 10:13:55.126272	en	Taiwan, Province of China	217	217
2025-12-17 10:13:55.126915	2025-12-17 10:13:55.127153	en	Tajikistan	218	218
2025-12-17 10:13:55.127811	2025-12-17 10:13:55.128073	en	Tanzania, United Republic of	219	219
2025-12-17 10:13:55.128697	2025-12-17 10:13:55.128956	en	Thailand	220	220
2025-12-17 10:13:55.129582	2025-12-17 10:13:55.12983	en	Timor-Leste	221	221
2025-12-17 10:13:55.130456	2025-12-17 10:13:55.130712	en	Togo	222	222
2025-12-17 10:13:55.131375	2025-12-17 10:13:55.131628	en	Tokelau	223	223
2025-12-17 10:13:55.132279	2025-12-17 10:13:55.132567	en	Tonga	224	224
2025-12-17 10:13:55.133216	2025-12-17 10:13:55.133473	en	Trinidad and Tobago	225	225
2025-12-17 10:13:55.134117	2025-12-17 10:13:55.134365	en	Tunisia	226	226
2025-12-17 10:13:55.135023	2025-12-17 10:13:55.135308	en	Turkey	227	227
2025-12-17 10:13:55.136035	2025-12-17 10:13:55.1363	en	Turkmenistan	228	228
2025-12-17 10:13:55.136949	2025-12-17 10:13:55.13721	en	Turks and Caicos Islands	229	229
2025-12-17 10:13:55.137868	2025-12-17 10:13:55.13813	en	Tuvalu	230	230
2025-12-17 10:13:55.138755	2025-12-17 10:13:55.138997	en	Uganda	231	231
2025-12-17 10:13:55.140506	2025-12-17 10:13:55.140768	en	Ukraine	232	232
2025-12-17 10:13:55.141434	2025-12-17 10:13:55.141688	en	United Arab Emirates	233	233
2025-12-17 10:13:55.14235	2025-12-17 10:13:55.142648	en	United Kingdom	234	234
2025-12-17 10:13:55.143315	2025-12-17 10:13:55.143579	en	United States of America	235	235
2025-12-17 10:13:55.144236	2025-12-17 10:13:55.144821	en	United States Minor Outlying Islands	236	236
2025-12-17 10:13:55.145453	2025-12-17 10:13:55.14568	en	Uruguay	237	237
2025-12-17 10:13:55.146359	2025-12-17 10:13:55.146608	en	Uzbekistan	238	238
2025-12-17 10:13:55.147274	2025-12-17 10:13:55.147532	en	Vanuatu	239	239
2025-12-17 10:13:55.148176	2025-12-17 10:13:55.148443	en	Venezuela (Bolivarian Republic of)	240	240
2025-12-17 10:13:55.149055	2025-12-17 10:13:55.149306	en	Viet Nam	241	241
2025-12-17 10:13:55.149953	2025-12-17 10:13:55.150184	en	Virgin Islands (British)	242	242
2025-12-17 10:13:55.150828	2025-12-17 10:13:55.15106	en	Virgin Islands (U.S.)	243	243
2025-12-17 10:13:55.151693	2025-12-17 10:13:55.151965	en	Wallis and Futuna	244	244
2025-12-17 10:13:55.153271	2025-12-17 10:13:55.153592	en	Western Sahara	245	245
2025-12-17 10:13:55.154351	2025-12-17 10:13:55.15461	en	Yemen	246	246
2025-12-17 10:13:55.155244	2025-12-17 10:13:55.155501	en	Zambia	247	247
2025-12-17 10:13:55.156131	2025-12-17 10:13:55.156395	en	Zimbabwe	248	248
\.


--
-- TOC entry 4717 (class 0 OID 10312452)
-- Dependencies: 302
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role ("createdAt", "updatedAt", code, description, permissions, id) FROM stdin;
2025-12-17 10:13:54.131817	2025-12-17 10:13:54.131817	__super_admin_role__	SuperAdmin	Authenticated,SuperAdmin,UpdateGlobalSettings,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateSettings,ReadSettings,UpdateSettings,DeleteSettings,CreateAdministrator,ReadAdministrator,UpdateAdministrator,DeleteAdministrator,CreateAsset,ReadAsset,UpdateAsset,DeleteAsset,CreateChannel,ReadChannel,UpdateChannel,DeleteChannel,CreateCollection,ReadCollection,UpdateCollection,DeleteCollection,CreateCountry,ReadCountry,UpdateCountry,DeleteCountry,CreateCustomer,ReadCustomer,UpdateCustomer,DeleteCustomer,CreateCustomerGroup,ReadCustomerGroup,UpdateCustomerGroup,DeleteCustomerGroup,CreateFacet,ReadFacet,UpdateFacet,DeleteFacet,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,CreatePaymentMethod,ReadPaymentMethod,UpdatePaymentMethod,DeletePaymentMethod,CreateProduct,ReadProduct,UpdateProduct,DeleteProduct,CreatePromotion,ReadPromotion,UpdatePromotion,DeletePromotion,CreateShippingMethod,ReadShippingMethod,UpdateShippingMethod,DeleteShippingMethod,CreateTag,ReadTag,UpdateTag,DeleteTag,CreateTaxCategory,ReadTaxCategory,UpdateTaxCategory,DeleteTaxCategory,CreateTaxRate,ReadTaxRate,UpdateTaxRate,DeleteTaxRate,CreateSeller,ReadSeller,UpdateSeller,DeleteSeller,CreateStockLocation,ReadStockLocation,UpdateStockLocation,DeleteStockLocation,CreateSystem,ReadSystem,UpdateSystem,DeleteSystem,CreateZone,ReadZone,UpdateZone,DeleteZone,ReadDashboardGlobalViews,WriteDashboardGlobalViews	1
2025-12-17 10:13:54.133814	2025-12-17 10:13:54.133814	__customer_role__	Customer	Authenticated	2
2025-12-17 10:13:55.227064	2025-12-17 10:13:55.227064	administrator	Administrator	Authenticated,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateSettings,ReadSettings,UpdateSettings,DeleteSettings,CreateCustomer,ReadCustomer,UpdateCustomer,DeleteCustomer,CreateCustomerGroup,ReadCustomerGroup,UpdateCustomerGroup,DeleteCustomerGroup,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,CreateSystem,ReadSystem,UpdateSystem,DeleteSystem	3
2025-12-17 10:13:55.227745	2025-12-17 10:13:55.227745	order-manager	Order manager	Authenticated,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,ReadCustomer,ReadPaymentMethod,ReadShippingMethod,ReadPromotion,ReadCountry,ReadZone	4
2025-12-17 10:13:55.228277	2025-12-17 10:13:55.228277	inventory-manager	Inventory manager	Authenticated,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateTag,ReadTag,UpdateTag,DeleteTag,ReadCustomer	5
\.


--
-- TOC entry 4767 (class 0 OID 10312811)
-- Dependencies: 352
-- Data for Name: role_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_channels_channel ("roleId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
\.


--
-- TOC entry 4747 (class 0 OID 10312660)
-- Dependencies: 332
-- Data for Name: scheduled_task_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scheduled_task_record ("createdAt", "updatedAt", "taskId", enabled, "lockedAt", "lastExecutedAt", "manuallyTriggeredAt", "lastResult", id) FROM stdin;
\.


--
-- TOC entry 4748 (class 0 OID 10312673)
-- Dependencies: 333
-- Data for Name: search_index_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_index_item ("languageCode", enabled, "productName", "productVariantName", description, slug, sku, "facetIds", "facetValueIds", "collectionIds", "collectionSlugs", "channelIds", "productPreview", "productPreviewFocalPoint", "productVariantPreview", "productVariantPreviewFocalPoint", "inStock", "productInStock", "productVariantId", "channelId", "productId", "productAssetId", "productVariantAssetId", price, "priceWithTax") FROM stdin;
en	t	Laptop	Laptop 13 inch 8GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201308	1,2	1,2,3			1	preview/71/derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	1	1	1	1	\N	129900	155880
en	t	Laptop	Laptop 15 inch 8GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201508	1,2	1,2,3			1	preview/71/derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	2	1	1	1	\N	139900	167880
en	t	Laptop	Laptop 13 inch 16GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201316	1,2	1,2,3			1	preview/71/derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	3	1	1	1	\N	219900	263880
en	t	Laptop	Laptop 15 inch 16GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201516	1,2	1,2,3			1	preview/71/derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	4	1	1	1	\N	229900	275880
en	t	Tablet	Tablet 32GB	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted — with touch, a keyboard, or even a pencil. In other words, it wouldn’t really be a "computer." It would be Tablet.	tablet	TBL200032	1,2	1,2,3			1	preview/b8/kelly-sikkema-685291-unsplash__preview.jpg	\N		\N	t	t	5	1	2	2	\N	32900	39480
en	t	Tablet	Tablet 128GB	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted — with touch, a keyboard, or even a pencil. In other words, it wouldn’t really be a "computer." It would be Tablet.	tablet	TBL200128	1,2	1,2,3	2	electronics	1	preview/b8/kelly-sikkema-685291-unsplash__preview.jpg	\N		\N	t	t	6	1	2	2	\N	44500	53400
en	t	Wireless Optical Mouse	Wireless Optical Mouse	The Logitech M185 Wireless Optical Mouse is a great device for any computer user, and as Logitech are the global market leaders for these devices, you are also guaranteed absolute reliability. A mouse to be reckoned with!	cordless-mouse	834444	1,2	1,2,4	2,3	electronics,computers	1	preview/a1/oscar-ivan-esquivel-arteaga-687447-unsplash__preview.jpg	\N		\N	t	t	7	1	3	3	\N	1899	2279
en	t	32-Inch Monitor	32-Inch Monitor	The UJ59 with Ultra HD resolution has 4x the pixels of Full HD, delivering more screen space and amazingly life-like images. That means you can view documents and webpages with less scrolling, work more comfortably with multiple windows and toolbars, and enjoy photos, videos and games in stunning 4K quality. Note: beverage not included.	32-inch-monitor	LU32J590UQUXEN	1,2	1,2,5	2,3	electronics,computers	1	preview/d2/daniel-korpai-1302051-unsplash__preview.jpg	\N		\N	t	t	8	1	4	4	\N	31000	37200
en	t	Curvy Monitor	Curvy Monitor 24 inch	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	curvy-monitor	C24F390	1,2	1,2,5	2,3	electronics,computers	1	preview/9c/alexandru-acea-686569-unsplash__preview.jpg	\N		\N	t	t	9	1	5	5	\N	14374	17249
en	t	Curvy Monitor	Curvy Monitor 27 inch	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	curvy-monitor	C27F390	1,2	1,2,5	2,3	electronics,computers	1	preview/9c/alexandru-acea-686569-unsplash__preview.jpg	\N		\N	t	t	10	1	5	5	\N	16994	20393
en	t	High Performance RAM	High Performance RAM 4GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC04	1,2	1,2,6	2,3	electronics,computers	1	preview/58/liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	11	1	6	6	\N	13785	16542
en	t	High Performance RAM	High Performance RAM 8GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC08	1,2	1,2,6	2,3	electronics,computers	1	preview/58/liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	12	1	6	6	\N	14639	17567
en	t	High Performance RAM	High Performance RAM 16GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC16	1,2	1,2,6	2,3	electronics,computers	1	preview/58/liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	13	1	6	6	\N	28181	33817
en	t	Gaming PC	Gaming PC i7-8700 240GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1063	1,2	1,2,7	2,3	electronics,computers	1	preview/5a/florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	14	1	7	7	\N	108720	130464
en	t	Gaming PC	Gaming PC R7-2700 240GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1064	1,2	1,2,7	2,3	electronics,computers	1	preview/5a/florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	15	1	7	7	\N	109995	131994
en	t	Gaming PC	Gaming PC i7-8700 120GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1065	1,2	1,2,7	2,3	electronics,computers	1	preview/5a/florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	16	1	7	7	\N	93120	111744
en	t	Gaming PC	Gaming PC R7-2700 120GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1066	1,2	1,2,7	2,3	electronics,computers	1	preview/5a/florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	17	1	7	7	\N	94920	113904
en	t	Hard Drive	Hard Drive 1TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T1	1,2	1,2,8	2,3	electronics,computers	1	preview/96/vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	18	1	8	8	\N	3799	4559
en	t	Hard Drive	Hard Drive 3TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T3	1,2	1,2,8	2,3	electronics,computers	1	preview/96/vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	20	1	8	8	\N	7896	9475
en	t	Hard Drive	Hard Drive 2TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T2	1,2	1,2,8	2,3	electronics,computers	1	preview/96/vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	19	1	8	8	\N	5374	6449
en	t	Hard Drive	Hard Drive 4TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T4	1,2	1,2,8	2,3	electronics,computers	1	preview/96/vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	21	1	8	8	\N	9299	11159
en	t	Ethernet Cable	Ethernet Cable	5m (metres) Cat.6 network cable (upwards/downwards compatible) | Patch cable | 2 RJ-45 plug | plug with bend protection mantle. High transmission speeds due to operating frequency with up to 250 MHz (in comparison to Cat.5/Cat.5e cable bandwidth of 100 MHz).	ethernet-cable	A23334x30	1	1,2	2,3	electronics,computers	1	preview/7b/thomas-q-1229169-unsplash__preview.jpg	\N		\N	t	t	24	1	10	10	\N	597	716
en	t	USB Cable	USB Cable	Solid conductors eliminate strand-interaction distortion and reduce jitter. As the surface is made of high-purity silver, the performance is very close to that of a solid silver cable, but priced much closer to solid copper cable.	usb-cable	USBCIN01.5MI	1	1,2	2,3	electronics,computers	1	preview/64/adam-birkett-239153-unsplash__preview.jpg	\N		\N	t	t	25	1	11	11	\N	6900	8280
en	t	Hard Drive	Hard Drive 6TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T6	1,2	1,2,8	2,3	electronics,computers	1	preview/96/vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	22	1	8	8	\N	13435	16122
en	t	Clacky Keyboard	Clacky Keyboard	Let all your colleagues know that you are typing on this exclusive, colorful klicky-klacky keyboard. Huge travel on each keypress ensures maximum klack on each and every keystroke.	clacky-keyboard	A4TKLA45535	1,2	1,2,6	2,3	electronics,computers	1	preview/09/juan-gomez-674574-unsplash__preview.jpg	\N		\N	t	t	23	1	9	9	\N	7489	8987
\.


--
-- TOC entry 4735 (class 0 OID 10312577)
-- Dependencies: 320
-- Data for Name: seller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seller ("createdAt", "updatedAt", "deletedAt", name, id) FROM stdin;
2025-12-17 10:13:54.123315	2025-12-17 10:13:54.123315	\N	Default Seller	1
\.


--
-- TOC entry 4719 (class 0 OID 10312463)
-- Dependencies: 304
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session ("createdAt", "updatedAt", token, expires, invalidated, "authenticationStrategy", id, "activeOrderId", "activeChannelId", type, "userId") FROM stdin;
\.


--
-- TOC entry 4737 (class 0 OID 10312588)
-- Dependencies: 322
-- Data for Name: settings_store_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings_store_entry ("createdAt", "updatedAt", key, value, scope, id) FROM stdin;
\.


--
-- TOC entry 4683 (class 0 OID 10312227)
-- Dependencies: 268
-- Data for Name: shipping_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_line ("createdAt", "updatedAt", "listPriceIncludesTax", adjustments, "taxLines", id, "shippingMethodId", "listPrice", "orderId") FROM stdin;
\.


--
-- TOC entry 4681 (class 0 OID 10312216)
-- Dependencies: 266
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method ("createdAt", "updatedAt", "deletedAt", code, checker, calculator, "fulfillmentHandlerCode", id) FROM stdin;
2025-12-17 10:13:55.215417	2025-12-17 10:13:55.215417	\N	standard-shipping	{"code":"default-shipping-eligibility-checker","args":[{"name":"orderMinimum","value":"0"}]}	{"code":"default-shipping-calculator","args":[{"name":"rate","value":"500"},{"name":"includesTax","value":"auto"},{"name":"taxRate","value":"0"}]}	manual-fulfillment	1
2025-12-17 10:13:55.218765	2025-12-17 10:13:55.218765	\N	express-shipping	{"code":"default-shipping-eligibility-checker","args":[{"name":"orderMinimum","value":"0"}]}	{"code":"default-shipping-calculator","args":[{"name":"rate","value":"1000"},{"name":"includesTax","value":"auto"},{"name":"taxRate","value":"0"}]}	manual-fulfillment	2
\.


--
-- TOC entry 4758 (class 0 OID 10312748)
-- Dependencies: 343
-- Data for Name: shipping_method_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method_channels_channel ("shippingMethodId", "channelId") FROM stdin;
1	1
2	1
\.


--
-- TOC entry 4679 (class 0 OID 10312202)
-- Dependencies: 264
-- Data for Name: shipping_method_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method_translation ("createdAt", "updatedAt", "languageCode", name, description, id, "baseId") FROM stdin;
2025-12-17 10:13:55.21465	2025-12-17 10:13:55.215417	en	Standard Shipping		1	1
2025-12-17 10:13:55.218408	2025-12-17 10:13:55.218765	en	Express Shipping		2	2
\.


--
-- TOC entry 4693 (class 0 OID 10312302)
-- Dependencies: 278
-- Data for Name: stock_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_level ("createdAt", "updatedAt", "stockOnHand", "stockAllocated", id, "productVariantId", "stockLocationId") FROM stdin;
2025-12-17 10:13:55.27895	2025-12-17 10:13:55.280237	100	0	1	1	1
2025-12-17 10:13:55.283847	2025-12-17 10:13:55.284682	100	0	2	2	1
2025-12-17 10:13:55.286448	2025-12-17 10:13:55.287203	100	0	3	3	1
2025-12-17 10:13:55.28927	2025-12-17 10:13:55.290024	100	0	4	4	1
2025-12-17 10:13:55.302641	2025-12-17 10:13:55.303288	100	0	5	5	1
2025-12-17 10:13:55.30476	2025-12-17 10:13:55.305552	100	0	6	6	1
2025-12-17 10:13:55.316966	2025-12-17 10:13:55.31755	100	0	7	7	1
2025-12-17 10:13:55.333802	2025-12-17 10:13:55.334416	100	0	8	8	1
2025-12-17 10:13:55.346512	2025-12-17 10:13:55.348015	100	0	9	9	1
2025-12-17 10:13:55.349787	2025-12-17 10:13:55.350372	100	0	10	10	1
2025-12-17 10:13:55.365675	2025-12-17 10:13:55.366255	100	0	11	11	1
2025-12-17 10:13:55.367771	2025-12-17 10:13:55.368369	100	0	12	12	1
2025-12-17 10:13:55.36958	2025-12-17 10:13:55.370175	100	0	13	13	1
2025-12-17 10:13:55.384907	2025-12-17 10:13:55.385457	100	0	14	14	1
2025-12-17 10:13:55.386734	2025-12-17 10:13:55.387252	100	0	15	15	1
2025-12-17 10:13:55.388485	2025-12-17 10:13:55.389005	100	0	16	16	1
2025-12-17 10:13:55.390381	2025-12-17 10:13:55.390908	100	0	17	17	1
2025-12-17 10:13:55.406942	2025-12-17 10:13:55.407506	100	0	18	18	1
2025-12-17 10:13:55.408802	2025-12-17 10:13:55.409318	100	0	19	19	1
2025-12-17 10:13:55.410491	2025-12-17 10:13:55.411015	100	0	20	20	1
2025-12-17 10:13:55.412218	2025-12-17 10:13:55.412722	100	0	21	21	1
2025-12-17 10:13:55.414374	2025-12-17 10:13:55.414998	100	0	22	22	1
2025-12-17 10:13:55.425954	2025-12-17 10:13:55.426712	100	0	23	23	1
2025-12-17 10:13:55.438893	2025-12-17 10:13:55.439448	100	0	24	24	1
2025-12-17 10:13:55.45503	2025-12-17 10:13:55.457492	100	0	25	25	1
2025-12-17 10:13:55.472039	2025-12-17 10:13:55.472765	100	0	26	26	1
2025-12-17 10:13:55.485372	2025-12-17 10:13:55.485962	100	0	27	27	1
2025-12-17 10:13:55.497711	2025-12-17 10:13:55.498314	100	0	28	28	1
2025-12-17 10:13:55.509398	2025-12-17 10:13:55.510009	100	0	29	29	1
2025-12-17 10:13:55.525986	2025-12-17 10:13:55.526536	100	0	30	30	1
2025-12-17 10:13:55.563289	2025-12-17 10:13:55.563945	100	0	31	31	1
2025-12-17 10:13:55.574365	2025-12-17 10:13:55.574958	100	0	32	32	1
2025-12-17 10:13:55.606607	2025-12-17 10:13:55.607612	100	0	33	33	1
2025-12-17 10:13:55.619237	2025-12-17 10:13:55.620093	100	0	34	34	1
2025-12-17 10:13:55.651322	2025-12-17 10:13:55.652419	100	0	35	35	1
2025-12-17 10:13:55.666073	2025-12-17 10:13:55.666855	100	0	36	36	1
2025-12-17 10:13:55.680616	2025-12-17 10:13:55.681578	100	0	37	37	1
2025-12-17 10:13:55.696114	2025-12-17 10:13:55.697023	100	0	38	38	1
2025-12-17 10:13:55.73915	2025-12-17 10:13:55.74706	100	0	39	39	1
2025-12-17 10:13:55.784205	2025-12-17 10:13:55.785422	100	0	40	40	1
2025-12-17 10:13:55.801829	2025-12-17 10:13:55.802984	100	0	41	41	1
2025-12-17 10:13:55.819576	2025-12-17 10:13:55.820752	100	0	42	42	1
2025-12-17 10:13:55.85698	2025-12-17 10:13:55.858454	100	0	43	43	1
2025-12-17 10:13:55.8626	2025-12-17 10:13:55.863822	100	0	44	44	1
2025-12-17 10:13:55.867444	2025-12-17 10:13:55.868487	100	0	45	45	1
2025-12-17 10:13:55.870753	2025-12-17 10:13:55.871634	100	0	46	46	1
2025-12-17 10:13:55.891637	2025-12-17 10:13:55.892259	100	0	47	47	1
2025-12-17 10:13:55.894868	2025-12-17 10:13:55.895764	100	0	48	48	1
2025-12-17 10:13:55.897134	2025-12-17 10:13:55.897689	100	0	49	49	1
2025-12-17 10:13:55.899114	2025-12-17 10:13:55.899723	100	0	50	50	1
2025-12-17 10:13:55.915974	2025-12-17 10:13:55.916472	100	0	51	51	1
2025-12-17 10:13:55.917736	2025-12-17 10:13:55.91821	100	0	52	52	1
2025-12-17 10:13:55.919404	2025-12-17 10:13:55.919932	100	0	53	53	1
2025-12-17 10:13:55.92227	2025-12-17 10:13:55.922935	100	0	54	54	1
2025-12-17 10:13:55.935944	2025-12-17 10:13:55.936628	100	0	55	55	1
2025-12-17 10:13:55.937875	2025-12-17 10:13:55.938413	100	0	56	56	1
2025-12-17 10:13:55.93948	2025-12-17 10:13:55.939933	100	0	57	57	1
2025-12-17 10:13:55.941049	2025-12-17 10:13:55.941561	100	0	58	58	1
2025-12-17 10:13:55.952916	2025-12-17 10:13:55.953438	100	0	59	59	1
2025-12-17 10:13:55.954726	2025-12-17 10:13:55.955241	100	0	60	60	1
2025-12-17 10:13:55.956547	2025-12-17 10:13:55.95703	100	0	61	61	1
2025-12-17 10:13:55.958168	2025-12-17 10:13:55.958664	100	0	62	62	1
2025-12-17 10:13:55.974481	2025-12-17 10:13:55.974996	100	0	63	63	1
2025-12-17 10:13:55.976204	2025-12-17 10:13:55.977214	100	0	64	64	1
2025-12-17 10:13:55.980162	2025-12-17 10:13:55.980732	100	0	65	65	1
2025-12-17 10:13:55.982154	2025-12-17 10:13:55.982807	100	0	66	66	1
2025-12-17 10:13:55.998933	2025-12-17 10:13:55.999439	100	0	67	67	1
2025-12-17 10:13:56.015517	2025-12-17 10:13:56.016011	100	0	68	68	1
2025-12-17 10:13:56.028803	2025-12-17 10:13:56.029658	100	0	69	69	1
2025-12-17 10:13:56.041704	2025-12-17 10:13:56.042674	100	0	70	70	1
2025-12-17 10:13:56.061103	2025-12-17 10:13:56.062354	100	0	71	71	1
2025-12-17 10:13:56.075222	2025-12-17 10:13:56.076164	100	0	72	72	1
2025-12-17 10:13:56.088142	2025-12-17 10:13:56.089127	100	0	73	73	1
2025-12-17 10:13:56.100905	2025-12-17 10:13:56.102002	100	0	74	74	1
2025-12-17 10:13:56.118286	2025-12-17 10:13:56.119132	100	0	75	75	1
2025-12-17 10:13:56.132906	2025-12-17 10:13:56.133852	100	0	76	76	1
2025-12-17 10:13:56.142645	2025-12-17 10:13:56.143585	100	0	77	77	1
2025-12-17 10:13:56.155793	2025-12-17 10:13:56.156672	100	0	78	78	1
2025-12-17 10:13:56.169786	2025-12-17 10:13:56.170754	100	0	79	79	1
2025-12-17 10:13:56.181885	2025-12-17 10:13:56.182871	100	0	80	80	1
2025-12-17 10:13:56.19667	2025-12-17 10:13:56.197671	100	0	81	81	1
2025-12-17 10:13:56.211167	2025-12-17 10:13:56.212471	100	0	82	82	1
2025-12-17 10:13:56.22481	2025-12-17 10:13:56.225988	100	0	83	83	1
2025-12-17 10:13:56.23731	2025-12-17 10:13:56.238224	100	0	84	84	1
2025-12-17 10:13:56.253562	2025-12-17 10:13:56.25451	100	0	85	85	1
2025-12-17 10:13:56.274104	2025-12-17 10:13:56.275051	100	0	86	86	1
2025-12-17 10:13:56.279418	2025-12-17 10:13:56.280763	100	0	87	87	1
2025-12-17 10:13:56.283635	2025-12-17 10:13:56.284602	100	0	88	88	1
\.


--
-- TOC entry 4687 (class 0 OID 10312259)
-- Dependencies: 272
-- Data for Name: stock_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_location ("createdAt", "updatedAt", name, description, id) FROM stdin;
2025-12-17 10:13:54.687947	2025-12-17 10:13:54.687947	Default Stock Location	The default stock location	1
\.


--
-- TOC entry 4762 (class 0 OID 10312776)
-- Dependencies: 347
-- Data for Name: stock_location_channels_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_location_channels_channel ("stockLocationId", "channelId") FROM stdin;
1	1
\.


--
-- TOC entry 4689 (class 0 OID 10312270)
-- Dependencies: 274
-- Data for Name: stock_movement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_movement ("createdAt", "updatedAt", type, quantity, id, "stockLocationId", discriminator, "productVariantId", "orderLineId") FROM stdin;
2025-12-17 10:13:55.279444	2025-12-17 10:13:55.279444	ADJUSTMENT	100	1	1	StockAdjustment	1	\N
2025-12-17 10:13:55.284146	2025-12-17 10:13:55.284146	ADJUSTMENT	100	2	1	StockAdjustment	2	\N
2025-12-17 10:13:55.286722	2025-12-17 10:13:55.286722	ADJUSTMENT	100	3	1	StockAdjustment	3	\N
2025-12-17 10:13:55.289601	2025-12-17 10:13:55.289601	ADJUSTMENT	100	4	1	StockAdjustment	4	\N
2025-12-17 10:13:55.302884	2025-12-17 10:13:55.302884	ADJUSTMENT	100	5	1	StockAdjustment	5	\N
2025-12-17 10:13:55.304976	2025-12-17 10:13:55.304976	ADJUSTMENT	100	6	1	StockAdjustment	6	\N
2025-12-17 10:13:55.317179	2025-12-17 10:13:55.317179	ADJUSTMENT	100	7	1	StockAdjustment	7	\N
2025-12-17 10:13:55.334029	2025-12-17 10:13:55.334029	ADJUSTMENT	100	8	1	StockAdjustment	8	\N
2025-12-17 10:13:55.34754	2025-12-17 10:13:55.34754	ADJUSTMENT	100	9	1	StockAdjustment	9	\N
2025-12-17 10:13:55.350013	2025-12-17 10:13:55.350013	ADJUSTMENT	100	10	1	StockAdjustment	10	\N
2025-12-17 10:13:55.365912	2025-12-17 10:13:55.365912	ADJUSTMENT	100	11	1	StockAdjustment	11	\N
2025-12-17 10:13:55.367975	2025-12-17 10:13:55.367975	ADJUSTMENT	100	12	1	StockAdjustment	12	\N
2025-12-17 10:13:55.369782	2025-12-17 10:13:55.369782	ADJUSTMENT	100	13	1	StockAdjustment	13	\N
2025-12-17 10:13:55.385104	2025-12-17 10:13:55.385104	ADJUSTMENT	100	14	1	StockAdjustment	14	\N
2025-12-17 10:13:55.38692	2025-12-17 10:13:55.38692	ADJUSTMENT	100	15	1	StockAdjustment	15	\N
2025-12-17 10:13:55.388674	2025-12-17 10:13:55.388674	ADJUSTMENT	100	16	1	StockAdjustment	16	\N
2025-12-17 10:13:55.390573	2025-12-17 10:13:55.390573	ADJUSTMENT	100	17	1	StockAdjustment	17	\N
2025-12-17 10:13:55.407144	2025-12-17 10:13:55.407144	ADJUSTMENT	100	18	1	StockAdjustment	18	\N
2025-12-17 10:13:55.408992	2025-12-17 10:13:55.408992	ADJUSTMENT	100	19	1	StockAdjustment	19	\N
2025-12-17 10:13:55.410671	2025-12-17 10:13:55.410671	ADJUSTMENT	100	20	1	StockAdjustment	20	\N
2025-12-17 10:13:55.412408	2025-12-17 10:13:55.412408	ADJUSTMENT	100	21	1	StockAdjustment	21	\N
2025-12-17 10:13:55.414621	2025-12-17 10:13:55.414621	ADJUSTMENT	100	22	1	StockAdjustment	22	\N
2025-12-17 10:13:55.426293	2025-12-17 10:13:55.426293	ADJUSTMENT	100	23	1	StockAdjustment	23	\N
2025-12-17 10:13:55.439098	2025-12-17 10:13:55.439098	ADJUSTMENT	100	24	1	StockAdjustment	24	\N
2025-12-17 10:13:55.45556	2025-12-17 10:13:55.45556	ADJUSTMENT	100	25	1	StockAdjustment	25	\N
2025-12-17 10:13:55.472286	2025-12-17 10:13:55.472286	ADJUSTMENT	100	26	1	StockAdjustment	26	\N
2025-12-17 10:13:55.485594	2025-12-17 10:13:55.485594	ADJUSTMENT	100	27	1	StockAdjustment	27	\N
2025-12-17 10:13:55.497931	2025-12-17 10:13:55.497931	ADJUSTMENT	100	28	1	StockAdjustment	28	\N
2025-12-17 10:13:55.50963	2025-12-17 10:13:55.50963	ADJUSTMENT	100	29	1	StockAdjustment	29	\N
2025-12-17 10:13:55.526203	2025-12-17 10:13:55.526203	ADJUSTMENT	100	30	1	StockAdjustment	30	\N
2025-12-17 10:13:55.563554	2025-12-17 10:13:55.563554	ADJUSTMENT	100	31	1	StockAdjustment	31	\N
2025-12-17 10:13:55.574575	2025-12-17 10:13:55.574575	ADJUSTMENT	100	32	1	StockAdjustment	32	\N
2025-12-17 10:13:55.607022	2025-12-17 10:13:55.607022	ADJUSTMENT	100	33	1	StockAdjustment	33	\N
2025-12-17 10:13:55.619573	2025-12-17 10:13:55.619573	ADJUSTMENT	100	34	1	StockAdjustment	34	\N
2025-12-17 10:13:55.651785	2025-12-17 10:13:55.651785	ADJUSTMENT	100	35	1	StockAdjustment	35	\N
2025-12-17 10:13:55.666375	2025-12-17 10:13:55.666375	ADJUSTMENT	100	36	1	StockAdjustment	36	\N
2025-12-17 10:13:55.680907	2025-12-17 10:13:55.680907	ADJUSTMENT	100	37	1	StockAdjustment	37	\N
2025-12-17 10:13:55.696391	2025-12-17 10:13:55.696391	ADJUSTMENT	100	38	1	StockAdjustment	38	\N
2025-12-17 10:13:55.743656	2025-12-17 10:13:55.743656	ADJUSTMENT	100	39	1	StockAdjustment	39	\N
2025-12-17 10:13:55.784718	2025-12-17 10:13:55.784718	ADJUSTMENT	100	40	1	StockAdjustment	40	\N
2025-12-17 10:13:55.802207	2025-12-17 10:13:55.802207	ADJUSTMENT	100	41	1	StockAdjustment	41	\N
2025-12-17 10:13:55.820041	2025-12-17 10:13:55.820041	ADJUSTMENT	100	42	1	StockAdjustment	42	\N
2025-12-17 10:13:55.857535	2025-12-17 10:13:55.857535	ADJUSTMENT	100	43	1	StockAdjustment	43	\N
2025-12-17 10:13:55.863083	2025-12-17 10:13:55.863083	ADJUSTMENT	100	44	1	StockAdjustment	44	\N
2025-12-17 10:13:55.867882	2025-12-17 10:13:55.867882	ADJUSTMENT	100	45	1	StockAdjustment	45	\N
2025-12-17 10:13:55.871127	2025-12-17 10:13:55.871127	ADJUSTMENT	100	46	1	StockAdjustment	46	\N
2025-12-17 10:13:55.89188	2025-12-17 10:13:55.89188	ADJUSTMENT	100	47	1	StockAdjustment	47	\N
2025-12-17 10:13:55.895172	2025-12-17 10:13:55.895172	ADJUSTMENT	100	48	1	StockAdjustment	48	\N
2025-12-17 10:13:55.897355	2025-12-17 10:13:55.897355	ADJUSTMENT	100	49	1	StockAdjustment	49	\N
2025-12-17 10:13:55.899333	2025-12-17 10:13:55.899333	ADJUSTMENT	100	50	1	StockAdjustment	50	\N
2025-12-17 10:13:55.916162	2025-12-17 10:13:55.916162	ADJUSTMENT	100	51	1	StockAdjustment	51	\N
2025-12-17 10:13:55.917923	2025-12-17 10:13:55.917923	ADJUSTMENT	100	52	1	StockAdjustment	52	\N
2025-12-17 10:13:55.919609	2025-12-17 10:13:55.919609	ADJUSTMENT	100	53	1	StockAdjustment	53	\N
2025-12-17 10:13:55.922517	2025-12-17 10:13:55.922517	ADJUSTMENT	100	54	1	StockAdjustment	54	\N
2025-12-17 10:13:55.936314	2025-12-17 10:13:55.936314	ADJUSTMENT	100	55	1	StockAdjustment	55	\N
2025-12-17 10:13:55.93808	2025-12-17 10:13:55.93808	ADJUSTMENT	100	56	1	StockAdjustment	56	\N
2025-12-17 10:13:55.939651	2025-12-17 10:13:55.939651	ADJUSTMENT	100	57	1	StockAdjustment	57	\N
2025-12-17 10:13:55.941244	2025-12-17 10:13:55.941244	ADJUSTMENT	100	58	1	StockAdjustment	58	\N
2025-12-17 10:13:55.953108	2025-12-17 10:13:55.953108	ADJUSTMENT	100	59	1	StockAdjustment	59	\N
2025-12-17 10:13:55.954923	2025-12-17 10:13:55.954923	ADJUSTMENT	100	60	1	StockAdjustment	60	\N
2025-12-17 10:13:55.956727	2025-12-17 10:13:55.956727	ADJUSTMENT	100	61	1	StockAdjustment	61	\N
2025-12-17 10:13:55.958359	2025-12-17 10:13:55.958359	ADJUSTMENT	100	62	1	StockAdjustment	62	\N
2025-12-17 10:13:55.974679	2025-12-17 10:13:55.974679	ADJUSTMENT	100	63	1	StockAdjustment	63	\N
2025-12-17 10:13:55.976382	2025-12-17 10:13:55.976382	ADJUSTMENT	100	64	1	StockAdjustment	64	\N
2025-12-17 10:13:55.980372	2025-12-17 10:13:55.980372	ADJUSTMENT	100	65	1	StockAdjustment	65	\N
2025-12-17 10:13:55.982382	2025-12-17 10:13:55.982382	ADJUSTMENT	100	66	1	StockAdjustment	66	\N
2025-12-17 10:13:55.999128	2025-12-17 10:13:55.999128	ADJUSTMENT	100	67	1	StockAdjustment	67	\N
2025-12-17 10:13:56.015705	2025-12-17 10:13:56.015705	ADJUSTMENT	100	68	1	StockAdjustment	68	\N
2025-12-17 10:13:56.029179	2025-12-17 10:13:56.029179	ADJUSTMENT	100	69	1	StockAdjustment	69	\N
2025-12-17 10:13:56.04209	2025-12-17 10:13:56.04209	ADJUSTMENT	100	70	1	StockAdjustment	70	\N
2025-12-17 10:13:56.061575	2025-12-17 10:13:56.061575	ADJUSTMENT	100	71	1	StockAdjustment	71	\N
2025-12-17 10:13:56.075584	2025-12-17 10:13:56.075584	ADJUSTMENT	100	72	1	StockAdjustment	72	\N
2025-12-17 10:13:56.088598	2025-12-17 10:13:56.088598	ADJUSTMENT	100	73	1	StockAdjustment	73	\N
2025-12-17 10:13:56.101301	2025-12-17 10:13:56.101301	ADJUSTMENT	100	74	1	StockAdjustment	74	\N
2025-12-17 10:13:56.118617	2025-12-17 10:13:56.118617	ADJUSTMENT	100	75	1	StockAdjustment	75	\N
2025-12-17 10:13:56.133275	2025-12-17 10:13:56.133275	ADJUSTMENT	100	76	1	StockAdjustment	76	\N
2025-12-17 10:13:56.142997	2025-12-17 10:13:56.142997	ADJUSTMENT	100	77	1	StockAdjustment	77	\N
2025-12-17 10:13:56.156119	2025-12-17 10:13:56.156119	ADJUSTMENT	100	78	1	StockAdjustment	78	\N
2025-12-17 10:13:56.170157	2025-12-17 10:13:56.170157	ADJUSTMENT	100	79	1	StockAdjustment	79	\N
2025-12-17 10:13:56.182264	2025-12-17 10:13:56.182264	ADJUSTMENT	100	80	1	StockAdjustment	80	\N
2025-12-17 10:13:56.197097	2025-12-17 10:13:56.197097	ADJUSTMENT	100	81	1	StockAdjustment	81	\N
2025-12-17 10:13:56.211591	2025-12-17 10:13:56.211591	ADJUSTMENT	100	82	1	StockAdjustment	82	\N
2025-12-17 10:13:56.25394	2025-12-17 10:13:56.25394	ADJUSTMENT	100	85	1	StockAdjustment	85	\N
2025-12-17 10:13:56.280146	2025-12-17 10:13:56.280146	ADJUSTMENT	100	87	1	StockAdjustment	87	\N
2025-12-17 10:13:56.225235	2025-12-17 10:13:56.225235	ADJUSTMENT	100	83	1	StockAdjustment	83	\N
2025-12-17 10:13:56.23765	2025-12-17 10:13:56.23765	ADJUSTMENT	100	84	1	StockAdjustment	84	\N
2025-12-17 10:13:56.274475	2025-12-17 10:13:56.274475	ADJUSTMENT	100	86	1	StockAdjustment	86	\N
2025-12-17 10:13:56.284024	2025-12-17 10:13:56.284024	ADJUSTMENT	100	88	1	StockAdjustment	88	\N
\.


--
-- TOC entry 4671 (class 0 OID 10312154)
-- Dependencies: 256
-- Data for Name: surcharge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.surcharge ("createdAt", "updatedAt", description, "listPriceIncludesTax", sku, "taxLines", id, "listPrice", "orderId", "orderModificationId") FROM stdin;
\.


--
-- TOC entry 4659 (class 0 OID 10312078)
-- Dependencies: 244
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag ("createdAt", "updatedAt", value, id) FROM stdin;
\.


--
-- TOC entry 4703 (class 0 OID 10312367)
-- Dependencies: 288
-- Data for Name: tax_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_category ("createdAt", "updatedAt", name, "isDefault", id) FROM stdin;
2025-12-17 10:13:55.187775	2025-12-17 10:13:55.187775	Standard Tax	f	1
2025-12-17 10:13:55.198771	2025-12-17 10:13:55.198771	Reduced Tax	f	2
2025-12-17 10:13:55.206805	2025-12-17 10:13:55.206805	Zero Tax	f	3
\.


--
-- TOC entry 4711 (class 0 OID 10312414)
-- Dependencies: 296
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_rate ("createdAt", "updatedAt", name, enabled, value, id, "categoryId", "zoneId", "customerGroupId") FROM stdin;
2025-12-17 10:13:55.190855	2025-12-17 10:13:55.190855	Standard Tax Asia	t	20.00	1	1	1	\N
2025-12-17 10:13:55.1936	2025-12-17 10:13:55.1936	Standard Tax Europe	t	20.00	2	1	2	\N
2025-12-17 10:13:55.195032	2025-12-17 10:13:55.195032	Standard Tax Africa	t	20.00	3	1	3	\N
2025-12-17 10:13:55.196368	2025-12-17 10:13:55.196368	Standard Tax Oceania	t	20.00	4	1	4	\N
2025-12-17 10:13:55.197716	2025-12-17 10:13:55.197716	Standard Tax Americas	t	20.00	5	1	5	\N
2025-12-17 10:13:55.199365	2025-12-17 10:13:55.199365	Reduced Tax Asia	t	10.00	6	2	1	\N
2025-12-17 10:13:55.200582	2025-12-17 10:13:55.200582	Reduced Tax Europe	t	10.00	7	2	2	\N
2025-12-17 10:13:55.201766	2025-12-17 10:13:55.201766	Reduced Tax Africa	t	10.00	8	2	3	\N
2025-12-17 10:13:55.203113	2025-12-17 10:13:55.203113	Reduced Tax Oceania	t	10.00	9	2	4	\N
2025-12-17 10:13:55.204587	2025-12-17 10:13:55.204587	Reduced Tax Americas	t	10.00	10	2	5	\N
2025-12-17 10:13:55.207442	2025-12-17 10:13:55.207442	Zero Tax Asia	t	0.00	11	3	1	\N
2025-12-17 10:13:55.208795	2025-12-17 10:13:55.208795	Zero Tax Europe	t	0.00	12	3	2	\N
2025-12-17 10:13:55.210087	2025-12-17 10:13:55.210087	Zero Tax Africa	t	0.00	13	3	3	\N
2025-12-17 10:13:55.211404	2025-12-17 10:13:55.211404	Zero Tax Oceania	t	0.00	14	3	4	\N
2025-12-17 10:13:55.212969	2025-12-17 10:13:55.212969	Zero Tax Americas	t	0.00	15	3	5	\N
\.


--
-- TOC entry 4721 (class 0 OID 10312478)
-- Dependencies: 306
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" ("createdAt", "updatedAt", "deletedAt", identifier, verified, "lastLogin", id) FROM stdin;
2025-12-17 10:13:54.673059	2025-12-17 10:13:54.673059	\N	admin	t	\N	1
\.


--
-- TOC entry 4768 (class 0 OID 10312818)
-- Dependencies: 353
-- Data for Name: user_roles_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles_role ("userId", "roleId") FROM stdin;
1	1
\.


--
-- TOC entry 4709 (class 0 OID 10312403)
-- Dependencies: 294
-- Data for Name: zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zone ("createdAt", "updatedAt", name, id) FROM stdin;
2025-12-17 10:13:54.840716	2025-12-17 10:13:54.840716	Asia	1
2025-12-17 10:13:54.847946	2025-12-17 10:13:54.847946	Europe	2
2025-12-17 10:13:54.856025	2025-12-17 10:13:54.856025	Africa	3
2025-12-17 10:13:54.861426	2025-12-17 10:13:54.861426	Oceania	4
2025-12-17 10:13:54.871278	2025-12-17 10:13:54.871278	Americas	5
\.


--
-- TOC entry 4766 (class 0 OID 10312804)
-- Dependencies: 351
-- Data for Name: zone_members_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zone_members_region ("zoneId", "regionId") FROM stdin;
1	1
1	11
1	15
1	17
1	18
1	25
1	33
1	38
1	45
1	58
1	82
1	100
1	103
1	104
1	105
1	106
1	109
1	112
1	114
1	115
1	118
1	119
1	120
1	121
1	122
1	124
1	131
1	135
1	136
1	148
1	153
1	156
1	167
1	168
1	170
1	175
1	180
1	195
1	200
1	210
1	216
1	217
1	218
1	220
1	221
1	227
1	228
1	233
1	238
1	241
1	246
2	2
2	3
2	6
2	14
2	20
2	21
2	28
2	34
2	55
2	59
2	60
2	69
2	73
2	75
2	76
2	83
2	85
2	86
2	92
2	98
2	101
2	102
2	107
2	108
2	110
2	113
2	123
2	128
2	129
2	130
2	132
2	138
2	146
2	147
2	149
2	157
2	166
2	177
2	178
2	182
2	183
2	193
2	197
2	202
2	203
2	209
2	213
2	214
2	215
2	232
2	234
3	4
3	7
3	23
3	29
3	32
3	35
3	36
3	37
3	39
3	42
3	43
3	49
3	50
3	51
3	54
3	61
3	65
3	67
3	68
3	70
3	71
3	79
3	80
3	81
3	84
3	93
3	94
3	116
3	125
3	126
3	127
3	133
3	134
3	137
3	141
3	142
3	143
3	151
3	152
3	154
3	161
3	162
3	181
3	184
3	186
3	194
3	196
3	198
3	199
3	205
3	206
3	208
3	211
3	219
3	222
3	226
3	231
3	245
3	247
3	248
4	5
4	13
4	46
4	47
4	52
4	74
4	78
4	90
4	97
4	117
4	139
4	145
4	155
4	158
4	159
4	163
4	164
4	165
4	169
4	172
4	176
4	192
4	204
4	223
4	224
4	230
4	236
4	239
4	244
5	8
5	9
5	10
5	12
5	16
5	19
5	22
5	24
5	26
5	27
5	30
5	31
5	40
5	41
5	44
5	48
5	53
5	56
5	57
5	62
5	63
5	64
5	66
5	72
5	77
5	87
5	88
5	89
5	91
5	95
5	96
5	99
5	111
5	140
5	144
5	150
5	160
5	171
5	173
5	174
5	179
5	185
5	187
5	188
5	189
5	190
5	191
5	201
5	207
5	212
5	225
5	229
5	235
5	237
5	240
5	242
5	243
\.


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 309
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 1, false);


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 311
-- Name: administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrator_id_seq', 1, true);


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 245
-- Name: asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_id_seq', 54, true);


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 299
-- Name: authentication_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authentication_method_id_seq', 1, true);


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 323
-- Name: channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_id_seq', 1, true);


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 215
-- Name: collection_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_asset_id_seq', 9, true);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 219
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_id_seq', 10, true);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 217
-- Name: collection_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_translation_id_seq', 10, true);


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 297
-- Name: customer_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_group_id_seq', 1, false);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 307
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 223
-- Name: facet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facet_id_seq', 4, true);


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 221
-- Name: facet_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facet_translation_id_seq', 4, true);


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 227
-- Name: facet_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facet_value_id_seq', 39, true);


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 225
-- Name: facet_value_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facet_value_translation_id_seq', 39, true);


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 249
-- Name: fulfillment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fulfillment_id_seq', 1, false);


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 313
-- Name: global_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_settings_id_seq', 1, true);


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 325
-- Name: history_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_entry_id_seq', 1, false);


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 329
-- Name: job_record_buffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_record_buffer_id_seq', 1, false);


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 327
-- Name: job_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_record_id_seq', 107, true);


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 358
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 269
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 275
-- Name: order_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_line_id_seq', 1, false);


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 247
-- Name: order_line_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_line_reference_id_seq', 1, false);


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 257
-- Name: order_modification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_modification_id_seq', 1, false);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 253
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 317
-- Name: payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_method_id_seq', 1, true);


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 315
-- Name: payment_method_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_method_translation_id_seq', 1, true);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 237
-- Name: product_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_asset_id_seq', 54, true);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 241
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 54, true);


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 235
-- Name: product_option_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_group_id_seq', 15, true);


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 233
-- Name: product_option_group_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_group_translation_id_seq', 15, true);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_id_seq', 47, true);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_option_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_translation_id_seq', 47, true);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 239
-- Name: product_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_translation_id_seq', 54, true);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 279
-- Name: product_variant_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variant_asset_id_seq', 1, false);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 285
-- Name: product_variant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variant_id_seq', 88, true);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 281
-- Name: product_variant_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variant_price_id_seq', 88, true);


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 283
-- Name: product_variant_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variant_translation_id_seq', 88, true);


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 261
-- Name: promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_id_seq', 1, false);


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 259
-- Name: promotion_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_translation_id_seq', 1, false);


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 251
-- Name: refund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refund_id_seq', 1, false);


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 291
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 248, true);


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 289
-- Name: region_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_translation_id_seq', 248, true);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 301
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 5, true);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 331
-- Name: scheduled_task_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scheduled_task_record_id_seq', 1, false);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 319
-- Name: seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seller_id_seq', 1, true);


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 303
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.session_id_seq', 1, false);


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 321
-- Name: settings_store_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_store_entry_id_seq', 1, false);


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 267
-- Name: shipping_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_line_id_seq', 1, false);


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 265
-- Name: shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_method_id_seq', 2, true);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 263
-- Name: shipping_method_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_method_translation_id_seq', 2, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 277
-- Name: stock_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_level_id_seq', 88, true);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 271
-- Name: stock_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_location_id_seq', 1, true);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 273
-- Name: stock_movement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_movement_id_seq', 88, true);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 255
-- Name: surcharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.surcharge_id_seq', 1, false);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 243
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 287
-- Name: tax_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_category_id_seq', 3, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 295
-- Name: tax_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_rate_id_seq', 15, true);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 305
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 293
-- Name: zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zone_id_seq', 5, true);


--
-- TOC entry 4313 (class 2606 OID 10312759)
-- Name: order_promotions_promotion PK_001dfe7435f3946fbc2d66a4e92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_promotions_promotion
    ADD CONSTRAINT "PK_001dfe7435f3946fbc2d66a4e92" PRIMARY KEY ("orderId", "promotionId");


--
-- TOC entry 4162 (class 2606 OID 10312294)
-- Name: order_line PK_01a7c973d9f30479647e44f9892; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "PK_01a7c973d9f30479647e44f9892" PRIMARY KEY (id);


--
-- TOC entry 4130 (class 2606 OID 10312188)
-- Name: promotion_translation PK_0b4fd34d2fc7abc06189494a178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_translation
    ADD CONSTRAINT "PK_0b4fd34d2fc7abc06189494a178" PRIMARY KEY (id);


--
-- TOC entry 4277 (class 2606 OID 10312696)
-- Name: collection_channels_channel PK_0e292d80228c9b4a114d2b09476; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_channels_channel
    ADD CONSTRAINT "PK_0e292d80228c9b4a114d2b09476" PRIMARY KEY ("collectionId", "channelId");


--
-- TOC entry 4353 (class 2606 OID 10312829)
-- Name: customer_groups_customer_group PK_0f902789cba691ce7ebbc9fcaa6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_groups_customer_group
    ADD CONSTRAINT "PK_0f902789cba691ce7ebbc9fcaa6" PRIMARY KEY ("customerId", "customerGroupId");


--
-- TOC entry 4147 (class 2606 OID 10312253)
-- Name: order PK_1031171c13130102495201e3e20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_1031171c13130102495201e3e20" PRIMARY KEY (id);


--
-- TOC entry 4105 (class 2606 OID 10312100)
-- Name: asset PK_1209d107fe21482beaea51b745e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT "PK_1209d107fe21482beaea51b745e" PRIMARY KEY (id);


--
-- TOC entry 4337 (class 2606 OID 10312801)
-- Name: product_variant_channels_channel PK_1a10ca648c3d73c0f2b455ae191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_channels_channel
    ADD CONSTRAINT "PK_1a10ca648c3d73c0f2b455ae191" PRIMARY KEY ("productVariantId", "channelId");


--
-- TOC entry 4182 (class 2606 OID 10312362)
-- Name: product_variant PK_1ab69c9935c61f7c70791ae0a9f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "PK_1ab69c9935c61f7c70791ae0a9f" PRIMARY KEY (id);


--
-- TOC entry 4112 (class 2606 OID 10312111)
-- Name: order_line_reference PK_21891d07accb8fa87e11165bca2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_reference
    ADD CONSTRAINT "PK_21891d07accb8fa87e11165bca2" PRIMARY KEY (id);


--
-- TOC entry 4197 (class 2606 OID 10312423)
-- Name: tax_rate PK_23b71b53f650c0b39e99ccef4fd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "PK_23b71b53f650c0b39e99ccef4fd" PRIMARY KEY (id);


--
-- TOC entry 4184 (class 2606 OID 10312377)
-- Name: tax_category PK_2432988f825c336d5584a96cded; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_category
    ADD CONSTRAINT "PK_2432988f825c336d5584a96cded" PRIMARY KEY (id);


--
-- TOC entry 4357 (class 2606 OID 10312836)
-- Name: customer_channels_channel PK_27e2fa538c020889d32a0a784e8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_channels_channel
    ADD CONSTRAINT "PK_27e2fa538c020889d32a0a784e8" PRIMARY KEY ("customerId", "channelId");


--
-- TOC entry 4236 (class 2606 OID 10312586)
-- Name: seller PK_36445a9c6e794945a4a4a8d3c9d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT "PK_36445a9c6e794945a4a4a8d3c9d" PRIMARY KEY (id);


--
-- TOC entry 4321 (class 2606 OID 10312773)
-- Name: order_channels_channel PK_39853134b20afe9dfb25de18292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_channels_channel
    ADD CONSTRAINT "PK_39853134b20afe9dfb25de18292" PRIMARY KEY ("orderId", "channelId");


--
-- TOC entry 4240 (class 2606 OID 10312597)
-- Name: settings_store_entry PK_3a905b358c0b454f6fc6637d6db; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings_store_entry
    ADD CONSTRAINT "PK_3a905b358c0b454f6fc6637d6db" PRIMARY KEY (id);


--
-- TOC entry 4187 (class 2606 OID 10312388)
-- Name: region_translation PK_3e0c9619cafbe579eeecfd88abc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_translation
    ADD CONSTRAINT "PK_3e0c9619cafbe579eeecfd88abc" PRIMARY KEY (id);


--
-- TOC entry 4317 (class 2606 OID 10312766)
-- Name: order_fulfillments_fulfillment PK_414600087d71aee1583bc517590; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_fulfillments_fulfillment
    ADD CONSTRAINT "PK_414600087d71aee1583bc517590" PRIMARY KEY ("orderId", "fulfillmentId");


--
-- TOC entry 4087 (class 2606 OID 10312028)
-- Name: product_option_group_translation PK_44ab19f118175288dff147c4a00; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group_translation
    ADD CONSTRAINT "PK_44ab19f118175288dff147c4a00" PRIMARY KEY (id);


--
-- TOC entry 4305 (class 2606 OID 10312745)
-- Name: promotion_channels_channel PK_4b34f9b7bf95a8d3dc7f7f6dd23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_channels_channel
    ADD CONSTRAINT "PK_4b34f9b7bf95a8d3dc7f7f6dd23" PRIMARY KEY ("promotionId", "channelId");


--
-- TOC entry 4177 (class 2606 OID 10312346)
-- Name: product_variant_translation PK_4b7f882e2b669800bed7ed065f0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_translation
    ADD CONSTRAINT "PK_4b7f882e2b669800bed7ed065f0" PRIMARY KEY (id);


--
-- TOC entry 4084 (class 2606 OID 10312016)
-- Name: product_option PK_4cf3c467e9bc764bdd32c4cd938; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "PK_4cf3c467e9bc764bdd32c4cd938" PRIMARY KEY (id);


--
-- TOC entry 4114 (class 2606 OID 10312128)
-- Name: fulfillment PK_50c102da132afffae660585981f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "PK_50c102da132afffae660585981f" PRIMARY KEY (id);


--
-- TOC entry 4273 (class 2606 OID 10312689)
-- Name: collection_product_variants_product_variant PK_50c5ed0504ded53967be811f633; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_product_variants_product_variant
    ADD CONSTRAINT "PK_50c5ed0504ded53967be811f633" PRIMARY KEY ("collectionId", "productVariantId");


--
-- TOC entry 4246 (class 2606 OID 10312614)
-- Name: channel PK_590f33ee6ee7d76437acf362e39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "PK_590f33ee6ee7d76437acf362e39" PRIMARY KEY (id);


--
-- TOC entry 4190 (class 2606 OID 10312400)
-- Name: region PK_5f48ffc3af96bc486f5f3f3a6da; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "PK_5f48ffc3af96bc486f5f3f3a6da" PRIMARY KEY (id);


--
-- TOC entry 4098 (class 2606 OID 10312063)
-- Name: product_translation PK_62d00fbc92e7a495701d6fee9d5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translation
    ADD CONSTRAINT "PK_62d00fbc92e7a495701d6fee9d5" PRIMARY KEY (id);


--
-- TOC entry 4269 (class 2606 OID 10312681)
-- Name: search_index_item PK_6470dd173311562c89e5f80b30e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_index_item
    ADD CONSTRAINT "PK_6470dd173311562c89e5f80b30e" PRIMARY KEY ("languageCode", "productVariantId", "channelId");


--
-- TOC entry 4285 (class 2606 OID 10312710)
-- Name: facet_value_channels_channel PK_653fb72a256f100f52c573e419f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value_channels_channel
    ADD CONSTRAINT "PK_653fb72a256f100f52c573e419f" PRIMARY KEY ("facetValueId", "channelId");


--
-- TOC entry 4081 (class 2606 OID 10312004)
-- Name: product_option_translation PK_69c79a84baabcad3c7328576ac0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_translation
    ADD CONSTRAINT "PK_69c79a84baabcad3c7328576ac0" PRIMARY KEY (id);


--
-- TOC entry 4345 (class 2606 OID 10312815)
-- Name: role_channels_channel PK_6fb9277e9f11bb8a63445c36242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_channels_channel
    ADD CONSTRAINT "PK_6fb9277e9f11bb8a63445c36242" PRIMARY KEY ("roleId", "channelId");


--
-- TOC entry 4293 (class 2606 OID 10312724)
-- Name: product_channels_channel PK_722acbcc06403e693b518d2c345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_channels_channel
    ADD CONSTRAINT "PK_722acbcc06403e693b518d2c345" PRIMARY KEY ("productId", "channelId");


--
-- TOC entry 4234 (class 2606 OID 10312575)
-- Name: payment_method PK_7744c2b2dd932c9cf42f2b9bc3a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT "PK_7744c2b2dd932c9cf42f2b9bc3a" PRIMARY KEY (id);


--
-- TOC entry 4258 (class 2606 OID 10312646)
-- Name: job_record PK_88ce3ea0c9dca8b571450b457a7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_record
    ADD CONSTRAINT "PK_88ce3ea0c9dca8b571450b457a7" PRIMARY KEY (id);


--
-- TOC entry 4199 (class 2606 OID 10312437)
-- Name: customer_group PK_88e7da3ff7262d9e0a35aa3664e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT "PK_88e7da3ff7262d9e0a35aa3664e" PRIMARY KEY (id);


--
-- TOC entry 4167 (class 2606 OID 10312309)
-- Name: stock_level PK_88ff7d9dfb57dc9d435e365eb69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_level
    ADD CONSTRAINT "PK_88ff7d9dfb57dc9d435e365eb69" PRIMARY KEY (id);


--
-- TOC entry 4141 (class 2606 OID 10312236)
-- Name: shipping_line PK_890522bfc44a4b6eb7cb1e52609; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_line
    ADD CONSTRAINT "PK_890522bfc44a4b6eb7cb1e52609" PRIMARY KEY (id);


--
-- TOC entry 4367 (class 2606 OID 10316524)
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- TOC entry 4103 (class 2606 OID 10312087)
-- Name: tag PK_8e4052373c579afc1471f526760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT "PK_8e4052373c579afc1471f526760" PRIMARY KEY (id);


--
-- TOC entry 4260 (class 2606 OID 10312658)
-- Name: job_record_buffer PK_9a1cfa02511065b32053efceeff; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_record_buffer
    ADD CONSTRAINT "PK_9a1cfa02511065b32053efceeff" PRIMARY KEY (id);


--
-- TOC entry 4365 (class 2606 OID 10312850)
-- Name: collection_closure PK_9dda38e2273a7744b8f655782a5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_closure
    ADD CONSTRAINT "PK_9dda38e2273a7744b8f655782a5" PRIMARY KEY (id_ancestor, id_descendant);


--
-- TOC entry 4154 (class 2606 OID 10312279)
-- Name: stock_movement PK_9fe1232f916686ae8cf00294749; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "PK_9fe1232f916686ae8cf00294749" PRIMARY KEY (id);


--
-- TOC entry 4075 (class 2606 OID 10311980)
-- Name: facet_value_translation PK_a09fdeb788deff7a9ed827a6160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value_translation
    ADD CONSTRAINT "PK_a09fdeb788deff7a9ed827a6160" PRIMARY KEY (id);


--
-- TOC entry 4070 (class 2606 OID 10311967)
-- Name: facet PK_a0ebfe3c68076820c6886aa9ff3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet
    ADD CONSTRAINT "PK_a0ebfe3c68076820c6886aa9ff3" PRIMARY KEY (id);


--
-- TOC entry 4333 (class 2606 OID 10312794)
-- Name: product_variant_facet_values_facet_value PK_a28474836b2feeffcef98c806e1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_facet_values_facet_value
    ADD CONSTRAINT "PK_a28474836b2feeffcef98c806e1" PRIMARY KEY ("productVariantId", "facetValueId");


--
-- TOC entry 4058 (class 2606 OID 10311913)
-- Name: collection_asset PK_a2adab6fd086adfb7858f1f110c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_asset
    ADD CONSTRAINT "PK_a2adab6fd086adfb7858f1f110c" PRIMARY KEY (id);


--
-- TOC entry 4124 (class 2606 OID 10312163)
-- Name: surcharge PK_a62b89257bcc802b5d77346f432; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surcharge
    ADD CONSTRAINT "PK_a62b89257bcc802b5d77346f432" PRIMARY KEY (id);


--
-- TOC entry 4068 (class 2606 OID 10311954)
-- Name: facet_translation PK_a6902cc1dcbb5e52a980f0189ad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_translation
    ADD CONSTRAINT "PK_a6902cc1dcbb5e52a980f0189ad" PRIMARY KEY (id);


--
-- TOC entry 4215 (class 2606 OID 10312499)
-- Name: customer PK_a7a13f4cacb744524e44dfdad32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "PK_a7a13f4cacb744524e44dfdad32" PRIMARY KEY (id);


--
-- TOC entry 4065 (class 2606 OID 10311942)
-- Name: collection PK_ad3f485bbc99d875491f44d7c85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "PK_ad3f485bbc99d875491f44d7c85" PRIMARY KEY (id);


--
-- TOC entry 4149 (class 2606 OID 10312268)
-- Name: stock_location PK_adf770067d0df1421f525fa25cc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location
    ADD CONSTRAINT "PK_adf770067d0df1421f525fa25cc" PRIMARY KEY (id);


--
-- TOC entry 4232 (class 2606 OID 10312562)
-- Name: payment_method_translation PK_ae5ae0af71ae8d15da9eb75768b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method_translation
    ADD CONSTRAINT "PK_ae5ae0af71ae8d15da9eb75768b" PRIMARY KEY (id);


--
-- TOC entry 4205 (class 2606 OID 10312461)
-- Name: role PK_b36bcfe02fc8de3c57a8b2391c2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY (id);


--
-- TOC entry 4349 (class 2606 OID 10312822)
-- Name: user_roles_role PK_b47cd6c84ee205ac5a713718292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles_role
    ADD CONSTRAINT "PK_b47cd6c84ee205ac5a713718292" PRIMARY KEY ("userId", "roleId");


--
-- TOC entry 4255 (class 2606 OID 10312632)
-- Name: history_entry PK_b65bd95b0d2929668589d57b97a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "PK_b65bd95b0d2929668589d57b97a" PRIMARY KEY (id);


--
-- TOC entry 4135 (class 2606 OID 10312213)
-- Name: shipping_method_translation PK_b862a1fac1c6e1fd201eadadbcb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_translation
    ADD CONSTRAINT "PK_b862a1fac1c6e1fd201eadadbcb" PRIMARY KEY (id);


--
-- TOC entry 4137 (class 2606 OID 10312225)
-- Name: shipping_method PK_b9b0adfad3c6b99229c1e7d4865; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "PK_b9b0adfad3c6b99229c1e7d4865" PRIMARY KEY (id);


--
-- TOC entry 4174 (class 2606 OID 10312334)
-- Name: product_variant_price PK_ba659ff2940702124e799c5c854; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_price
    ADD CONSTRAINT "PK_ba659ff2940702124e799c5c854" PRIMARY KEY (id);


--
-- TOC entry 4062 (class 2606 OID 10311926)
-- Name: collection_translation PK_bb49cfcde50401eb5f463a84dac; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_translation
    ADD CONSTRAINT "PK_bb49cfcde50401eb5f463a84dac" PRIMARY KEY (id);


--
-- TOC entry 4192 (class 2606 OID 10312412)
-- Name: zone PK_bd3989e5a3c3fb5ed546dfaf832; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zone
    ADD CONSTRAINT "PK_bd3989e5a3c3fb5ed546dfaf832" PRIMARY KEY (id);


--
-- TOC entry 4101 (class 2606 OID 10312075)
-- Name: product PK_bebc9158e480b949565b4dc7a82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);


--
-- TOC entry 4297 (class 2606 OID 10312731)
-- Name: asset_tags_tag PK_c4113b84381e953901fa5553654; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_tags_tag
    ADD CONSTRAINT "PK_c4113b84381e953901fa5553654" PRIMARY KEY ("assetId", "tagId");


--
-- TOC entry 4094 (class 2606 OID 10312050)
-- Name: product_asset PK_c56a83efd14ec4175532e1867fc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_asset
    ADD CONSTRAINT "PK_c56a83efd14ec4175532e1867fc" PRIMARY KEY (id);


--
-- TOC entry 4329 (class 2606 OID 10312787)
-- Name: product_variant_options_product_option PK_c57de5cb6bb74504180604a00c0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_options_product_option
    ADD CONSTRAINT "PK_c57de5cb6bb74504180604a00c0" PRIMARY KEY ("productVariantId", "productOptionId");


--
-- TOC entry 4361 (class 2606 OID 10312843)
-- Name: payment_method_channels_channel PK_c83e4a201c0402ce5cdb170a9a2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method_channels_channel
    ADD CONSTRAINT "PK_c83e4a201c0402ce5cdb170a9a2" PRIMARY KEY ("paymentMethodId", "channelId");


--
-- TOC entry 4309 (class 2606 OID 10312752)
-- Name: shipping_method_channels_channel PK_c92b2b226a6ee87888d8dcd8bd6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_channels_channel
    ADD CONSTRAINT "PK_c92b2b226a6ee87888d8dcd8bd6" PRIMARY KEY ("shippingMethodId", "channelId");


--
-- TOC entry 4213 (class 2606 OID 10312488)
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- TOC entry 4171 (class 2606 OID 10312321)
-- Name: product_variant_asset PK_cb1e33ae13779da176f8b03a5d3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_asset
    ADD CONSTRAINT "PK_cb1e33ae13779da176f8b03a5d3" PRIMARY KEY (id);


--
-- TOC entry 4127 (class 2606 OID 10312176)
-- Name: order_modification PK_cccf2e1612694eeb1e5b6760ffa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "PK_cccf2e1612694eeb1e5b6760ffa" PRIMARY KEY (id);


--
-- TOC entry 4078 (class 2606 OID 10311992)
-- Name: facet_value PK_d231e8eecc7e1a6059e1da7d325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value
    ADD CONSTRAINT "PK_d231e8eecc7e1a6059e1da7d325" PRIMARY KEY (id);


--
-- TOC entry 4289 (class 2606 OID 10312717)
-- Name: product_facet_values_facet_value PK_d57f06b38805181019d75662aa6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_facet_values_facet_value
    ADD CONSTRAINT "PK_d57f06b38805181019d75662aa6" PRIMARY KEY ("productId", "facetValueId");


--
-- TOC entry 4090 (class 2606 OID 10312040)
-- Name: product_option_group PK_d76e92fdbbb5a2e6752ffd4a2c1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group
    ADD CONSTRAINT "PK_d76e92fdbbb5a2e6752ffd4a2c1" PRIMARY KEY (id);


--
-- TOC entry 4221 (class 2606 OID 10312521)
-- Name: address PK_d92de1f82754668b5f5f5dd4fd5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "PK_d92de1f82754668b5f5f5dd4fd5" PRIMARY KEY (id);


--
-- TOC entry 4301 (class 2606 OID 10312738)
-- Name: asset_channels_channel PK_d943908a39e32952e8425d2f1ba; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_channels_channel
    ADD CONSTRAINT "PK_d943908a39e32952e8425d2f1ba" PRIMARY KEY ("assetId", "channelId");


--
-- TOC entry 4281 (class 2606 OID 10312703)
-- Name: facet_channels_channel PK_df0579886093b2f830c159adfde; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_channels_channel
    ADD CONSTRAINT "PK_df0579886093b2f830c159adfde" PRIMARY KEY ("facetId", "channelId");


--
-- TOC entry 4203 (class 2606 OID 10312448)
-- Name: authentication_method PK_e204686018c3c60f6164e385081; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_method
    ADD CONSTRAINT "PK_e204686018c3c60f6164e385081" PRIMARY KEY (id);


--
-- TOC entry 4325 (class 2606 OID 10312780)
-- Name: stock_location_channels_channel PK_e6f8b2d61ff58c51505c38da8a0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location_channels_channel
    ADD CONSTRAINT "PK_e6f8b2d61ff58c51505c38da8a0" PRIMARY KEY ("stockLocationId", "channelId");


--
-- TOC entry 4223 (class 2606 OID 10312534)
-- Name: administrator PK_ee58e71b3b4008b20ddc7b3092b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "PK_ee58e71b3b4008b20ddc7b3092b" PRIMARY KEY (id);


--
-- TOC entry 4262 (class 2606 OID 10312670)
-- Name: scheduled_task_record PK_efd4b61a3b227f3eba94de32e4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_task_record
    ADD CONSTRAINT "PK_efd4b61a3b227f3eba94de32e4c" PRIMARY KEY (id);


--
-- TOC entry 4117 (class 2606 OID 10312139)
-- Name: refund PK_f1cefa2e60d99b206c46c1116e5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "PK_f1cefa2e60d99b206c46c1116e5" PRIMARY KEY (id);


--
-- TOC entry 4211 (class 2606 OID 10312472)
-- Name: session PK_f55da76ac1c3ac420f444d2ff11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "PK_f55da76ac1c3ac420f444d2ff11" PRIMARY KEY (id);


--
-- TOC entry 4132 (class 2606 OID 10312200)
-- Name: promotion PK_fab3630e0789a2002f1cadb7d38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "PK_fab3630e0789a2002f1cadb7d38" PRIMARY KEY (id);


--
-- TOC entry 4341 (class 2606 OID 10312808)
-- Name: zone_members_region PK_fc4eaa2236c4d4f61db0ae3826f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zone_members_region
    ADD CONSTRAINT "PK_fc4eaa2236c4d4f61db0ae3826f" PRIMARY KEY ("zoneId", "regionId");


--
-- TOC entry 4120 (class 2606 OID 10312151)
-- Name: payment PK_fcaec7df5adf9cac408c686b2ab; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "PK_fcaec7df5adf9cac408c686b2ab" PRIMARY KEY (id);


--
-- TOC entry 4229 (class 2606 OID 10312551)
-- Name: global_settings PK_fec5e2c0bf238e30b25d4a82976; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_settings
    ADD CONSTRAINT "PK_fec5e2c0bf238e30b25d4a82976" PRIMARY KEY (id);


--
-- TOC entry 4225 (class 2606 OID 10312538)
-- Name: administrator REL_1966e18ce6a39a82b19204704d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "REL_1966e18ce6a39a82b19204704d" UNIQUE ("userId");


--
-- TOC entry 4217 (class 2606 OID 10312501)
-- Name: customer REL_3f62b42ed23958b120c235f74d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "REL_3f62b42ed23958b120c235f74d" UNIQUE ("userId");


--
-- TOC entry 4248 (class 2606 OID 10312616)
-- Name: channel UQ_06127ac6c6d913f4320759971db; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "UQ_06127ac6c6d913f4320759971db" UNIQUE (code);


--
-- TOC entry 4072 (class 2606 OID 10311969)
-- Name: facet UQ_0c9a5d053fdf4ebb5f0490b40fd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet
    ADD CONSTRAINT "UQ_0c9a5d053fdf4ebb5f0490b40fd" UNIQUE (code);


--
-- TOC entry 4227 (class 2606 OID 10312536)
-- Name: administrator UQ_154f5c538b1576ccc277b1ed631; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "UQ_154f5c538b1576ccc277b1ed631" UNIQUE ("emailAddress");


--
-- TOC entry 4264 (class 2606 OID 10312672)
-- Name: scheduled_task_record UQ_661876d97056cad9fd37eaa8774; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scheduled_task_record
    ADD CONSTRAINT "UQ_661876d97056cad9fd37eaa8774" UNIQUE ("taskId");


--
-- TOC entry 4250 (class 2606 OID 10312618)
-- Name: channel UQ_842699fce4f3470a7d06d89de88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "UQ_842699fce4f3470a7d06d89de88" UNIQUE (token);


--
-- TOC entry 4200 (class 1259 OID 10312449)
-- Name: IDX_00cbe87bc0d4e36758d61bd31d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_00cbe87bc0d4e36758d61bd31d" ON public.authentication_method USING btree ("userId");


--
-- TOC entry 4106 (class 1259 OID 10312113)
-- Name: IDX_06b02fb482b188823e419d37bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_06b02fb482b188823e419d37bd" ON public.order_line_reference USING btree ("fulfillmentId");


--
-- TOC entry 4286 (class 1259 OID 10312719)
-- Name: IDX_06e7d73673ee630e8ec50d0b29; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_06e7d73673ee630e8ec50d0b29" ON public.product_facet_values_facet_value USING btree ("facetValueId");


--
-- TOC entry 4091 (class 1259 OID 10312052)
-- Name: IDX_0d1294f5c22a56da7845ebab72; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0d1294f5c22a56da7845ebab72" ON public.product_asset USING btree ("productId");


--
-- TOC entry 4330 (class 1259 OID 10312796)
-- Name: IDX_0d641b761ed1dce4ef3cd33d55; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0d641b761ed1dce4ef3cd33d55" ON public.product_variant_facet_values_facet_value USING btree ("facetValueId");


--
-- TOC entry 4318 (class 1259 OID 10312774)
-- Name: IDX_0d8e5c204480204a60e151e485; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0d8e5c204480204a60e151e485" ON public.order_channels_channel USING btree ("orderId");


--
-- TOC entry 4178 (class 1259 OID 10312363)
-- Name: IDX_0e6f516053cf982b537836e21c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0e6f516053cf982b537836e21c" ON public.product_variant USING btree ("featuredAssetId");


--
-- TOC entry 4302 (class 1259 OID 10312747)
-- Name: IDX_0eaaf0f4b6c69afde1e88ffb52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0eaaf0f4b6c69afde1e88ffb52" ON public.promotion_channels_channel USING btree ("channelId");


--
-- TOC entry 4168 (class 1259 OID 10312322)
-- Name: IDX_10b5a2e3dee0e30b1e26c32f5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_10b5a2e3dee0e30b1e26c32f5c" ON public.product_variant_asset USING btree ("assetId");


--
-- TOC entry 4142 (class 1259 OID 10312257)
-- Name: IDX_124456e637cca7a415897dce65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_124456e637cca7a415897dce65" ON public."order" USING btree ("customerId");


--
-- TOC entry 4121 (class 1259 OID 10312164)
-- Name: IDX_154eb685f9b629033bd266df7f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_154eb685f9b629033bd266df7f" ON public.surcharge USING btree ("orderId");


--
-- TOC entry 4298 (class 1259 OID 10312740)
-- Name: IDX_16ca9151a5153f1169da5b7b7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_16ca9151a5153f1169da5b7b7e" ON public.asset_channels_channel USING btree ("channelId");


--
-- TOC entry 4185 (class 1259 OID 10312389)
-- Name: IDX_1afd722b943c81310705fc3e61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1afd722b943c81310705fc3e61" ON public.region_translation USING btree ("baseId");


--
-- TOC entry 4115 (class 1259 OID 10312140)
-- Name: IDX_1c6932a756108788a361e7d440; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1c6932a756108788a361e7d440" ON public.refund USING btree ("paymentId");


--
-- TOC entry 4128 (class 1259 OID 10312189)
-- Name: IDX_1cc009e9ab2263a35544064561; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1cc009e9ab2263a35544064561" ON public.promotion_translation USING btree ("baseId");


--
-- TOC entry 4125 (class 1259 OID 10312177)
-- Name: IDX_1df5bc14a47ef24d2e681f4559; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1df5bc14a47ef24d2e681f4559" ON public.order_modification USING btree ("orderId");


--
-- TOC entry 4055 (class 1259 OID 10311915)
-- Name: IDX_1ed9e48dfbf74b5fcbb35d3d68; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1ed9e48dfbf74b5fcbb35d3d68" ON public.collection_asset USING btree ("collectionId");


--
-- TOC entry 4107 (class 1259 OID 10312114)
-- Name: IDX_22b818af8722746fb9f206068c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_22b818af8722746fb9f206068c" ON public.order_line_reference USING btree ("modificationId");


--
-- TOC entry 4206 (class 1259 OID 10312473)
-- Name: IDX_232f8e85d7633bd6ddfad42169; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_232f8e85d7633bd6ddfad42169" ON public.session USING btree (token);


--
-- TOC entry 4155 (class 1259 OID 10312300)
-- Name: IDX_239cfca2a55b98b90b6bef2e44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_239cfca2a55b98b90b6bef2e44" ON public.order_line USING btree ("orderId");


--
-- TOC entry 4290 (class 1259 OID 10312725)
-- Name: IDX_26d12be3b5fec6c4adb1d79284; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_26d12be3b5fec6c4adb1d79284" ON public.product_channels_channel USING btree ("productId");


--
-- TOC entry 4278 (class 1259 OID 10312705)
-- Name: IDX_2a8ea404d05bf682516184db7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2a8ea404d05bf682516184db7d" ON public.facet_channels_channel USING btree ("channelId");


--
-- TOC entry 4310 (class 1259 OID 10312761)
-- Name: IDX_2c26b988769c0e3b0120bdef31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2c26b988769c0e3b0120bdef31" ON public.order_promotions_promotion USING btree ("promotionId");


--
-- TOC entry 4108 (class 1259 OID 10312115)
-- Name: IDX_30019aa65b17fe9ee962893199; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_30019aa65b17fe9ee962893199" ON public.order_line_reference USING btree ("refundId");


--
-- TOC entry 4322 (class 1259 OID 10312781)
-- Name: IDX_39513fd02a573c848d23bee587; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_39513fd02a573c848d23bee587" ON public.stock_location_channels_channel USING btree ("stockLocationId");


--
-- TOC entry 4251 (class 1259 OID 10312635)
-- Name: IDX_3a05127e67435b4d2332ded7c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3a05127e67435b4d2332ded7c9" ON public.history_entry USING btree ("orderId");


--
-- TOC entry 4207 (class 1259 OID 10312476)
-- Name: IDX_3d2f174ef04fb312fdebd0ddc5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3d2f174ef04fb312fdebd0ddc5" ON public.session USING btree ("userId");


--
-- TOC entry 4073 (class 1259 OID 10311981)
-- Name: IDX_3d6e45823b65de808a66cb1423; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3d6e45823b65de808a66cb1423" ON public.facet_value_translation USING btree ("baseId");


--
-- TOC entry 4175 (class 1259 OID 10312347)
-- Name: IDX_420f4d6fb75d38b9dca79bc43b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_420f4d6fb75d38b9dca79bc43b" ON public.product_variant_translation USING btree ("baseId");


--
-- TOC entry 4338 (class 1259 OID 10312809)
-- Name: IDX_433f45158e4e2b2a2f344714b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_433f45158e4e2b2a2f344714b2" ON public.zone_members_region USING btree ("zoneId");


--
-- TOC entry 4252 (class 1259 OID 10312634)
-- Name: IDX_43ac602f839847fdb91101f30e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_43ac602f839847fdb91101f30e" ON public.history_entry USING btree ("customerId");


--
-- TOC entry 4362 (class 1259 OID 10312852)
-- Name: IDX_457784c710f8ac9396010441f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_457784c710f8ac9396010441f6" ON public.collection_closure USING btree (id_descendant);


--
-- TOC entry 4109 (class 1259 OID 10312116)
-- Name: IDX_49a8632be8cef48b076446b8b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_49a8632be8cef48b076446b8b9" ON public.order_line_reference USING btree (discriminator);


--
-- TOC entry 4314 (class 1259 OID 10312768)
-- Name: IDX_4add5a5796e1582dec2877b289; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_4add5a5796e1582dec2877b289" ON public.order_fulfillments_fulfillment USING btree ("fulfillmentId");


--
-- TOC entry 4346 (class 1259 OID 10312824)
-- Name: IDX_4be2f7adf862634f5f803d246b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_4be2f7adf862634f5f803d246b" ON public.user_roles_role USING btree ("roleId");


--
-- TOC entry 4056 (class 1259 OID 10311914)
-- Name: IDX_51da53b26522dc0525762d2de8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_51da53b26522dc0525762d2de8" ON public.collection_asset USING btree ("assetId");


--
-- TOC entry 4326 (class 1259 OID 10312788)
-- Name: IDX_526f0131260eec308a3bd2b61b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_526f0131260eec308a3bd2b61b" ON public.product_variant_options_product_option USING btree ("productVariantId");


--
-- TOC entry 4092 (class 1259 OID 10312051)
-- Name: IDX_5888ac17b317b93378494a1062; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5888ac17b317b93378494a1062" ON public.product_asset USING btree ("assetId");


--
-- TOC entry 4358 (class 1259 OID 10312844)
-- Name: IDX_5bcb569635ce5407eb3f264487; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5bcb569635ce5407eb3f264487" ON public.payment_method_channels_channel USING btree ("paymentMethodId");


--
-- TOC entry 4347 (class 1259 OID 10312823)
-- Name: IDX_5f9286e6c25594c6b88c108db7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5f9286e6c25594c6b88c108db7" ON public.user_roles_role USING btree ("userId");


--
-- TOC entry 4230 (class 1259 OID 10312563)
-- Name: IDX_66187f782a3e71b9e0f5b50b68; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_66187f782a3e71b9e0f5b50b68" ON public.payment_method_translation USING btree ("baseId");


--
-- TOC entry 4311 (class 1259 OID 10312760)
-- Name: IDX_67be0e40122ab30a62a9817efe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_67be0e40122ab30a62a9817efe" ON public.order_promotions_promotion USING btree ("orderId");


--
-- TOC entry 4156 (class 1259 OID 10312295)
-- Name: IDX_6901d8715f5ebadd764466f7bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6901d8715f5ebadd764466f7bd" ON public.order_line USING btree ("sellerChannelId");


--
-- TOC entry 4331 (class 1259 OID 10312795)
-- Name: IDX_69567bc225b6bbbd732d6c5455; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_69567bc225b6bbbd732d6c5455" ON public.product_variant_facet_values_facet_value USING btree ("productVariantId");


--
-- TOC entry 4287 (class 1259 OID 10312718)
-- Name: IDX_6a0558e650d75ae639ff38e413; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6a0558e650d75ae639ff38e413" ON public.product_facet_values_facet_value USING btree ("productId");


--
-- TOC entry 4303 (class 1259 OID 10312746)
-- Name: IDX_6d9e2c39ab12391aaa374bcdaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6d9e2c39ab12391aaa374bcdaa" ON public.promotion_channels_channel USING btree ("promotionId");


--
-- TOC entry 4179 (class 1259 OID 10312365)
-- Name: IDX_6e420052844edf3a5506d863ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6e420052844edf3a5506d863ce" ON public.product_variant USING btree ("productId");


--
-- TOC entry 4270 (class 1259 OID 10312690)
-- Name: IDX_6faa7b72422d9c4679e2f186ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6faa7b72422d9c4679e2f186ad" ON public.collection_product_variants_product_variant USING btree ("collectionId");


--
-- TOC entry 4265 (class 1259 OID 10312682)
-- Name: IDX_6fb55742e13e8082954d0436dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6fb55742e13e8082954d0436dc" ON public.search_index_item USING btree ("productName");


--
-- TOC entry 4274 (class 1259 OID 10312698)
-- Name: IDX_7216ab24077cf5cbece7857dbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7216ab24077cf5cbece7857dbb" ON public.collection_channels_channel USING btree ("channelId");


--
-- TOC entry 4063 (class 1259 OID 10311943)
-- Name: IDX_7256fef1bb42f1b38156b7449f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7256fef1bb42f1b38156b7449f" ON public.collection USING btree ("featuredAssetId");


--
-- TOC entry 4143 (class 1259 OID 10312255)
-- Name: IDX_729b3eea7ce540930dbb706949; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_729b3eea7ce540930dbb706949" ON public."order" USING btree (code);


--
-- TOC entry 4144 (class 1259 OID 10312254)
-- Name: IDX_73a78d7df09541ac5eba620d18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_73a78d7df09541ac5eba620d18" ON public."order" USING btree ("aggregateOrderId");


--
-- TOC entry 4157 (class 1259 OID 10312298)
-- Name: IDX_77be94ce9ec650446617946227; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_77be94ce9ec650446617946227" ON public.order_line USING btree ("taxCategoryId");


--
-- TOC entry 4208 (class 1259 OID 10312474)
-- Name: IDX_7a75399a4f4ffa48ee02e98c05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7a75399a4f4ffa48ee02e98c05" ON public.session USING btree ("activeOrderId");


--
-- TOC entry 4110 (class 1259 OID 10312112)
-- Name: IDX_7d57857922dfc7303604697dbe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7d57857922dfc7303604697dbe" ON public.order_line_reference USING btree ("orderLineId");


--
-- TOC entry 4095 (class 1259 OID 10312065)
-- Name: IDX_7dbc75cb4e8b002620c4dbfdac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7dbc75cb4e8b002620c4dbfdac" ON public.product_translation USING btree ("baseId");


--
-- TOC entry 4193 (class 1259 OID 10312424)
-- Name: IDX_7ee3306d7638aa85ca90d67219; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7ee3306d7638aa85ca90d67219" ON public.tax_rate USING btree ("categoryId");


--
-- TOC entry 4163 (class 1259 OID 10312312)
-- Name: IDX_7fc20486b8cfd33dc84c96e168; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_7fc20486b8cfd33dc84c96e168" ON public.stock_level USING btree ("productVariantId", "stockLocationId");


--
-- TOC entry 4133 (class 1259 OID 10312214)
-- Name: IDX_85ec26c71067ebc84adcd98d1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_85ec26c71067ebc84adcd98d1a" ON public.shipping_method_translation USING btree ("baseId");


--
-- TOC entry 4350 (class 1259 OID 10312831)
-- Name: IDX_85feea3f0e5e82133605f78db0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_85feea3f0e5e82133605f78db0" ON public.customer_groups_customer_group USING btree ("customerGroupId");


--
-- TOC entry 4256 (class 1259 OID 10312647)
-- Name: IDX_86bc376c56af8cefd41a847a95; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_86bc376c56af8cefd41a847a95" ON public.job_record USING btree ("createdAt");


--
-- TOC entry 4194 (class 1259 OID 10312426)
-- Name: IDX_8b5ab52fc8887c1a769b9276ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8b5ab52fc8887c1a769b9276ca" ON public.tax_rate USING btree ("customerGroupId");


--
-- TOC entry 4237 (class 1259 OID 10312599)
-- Name: IDX_8d8ddb95a0fbd11ffb5606ef0c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8d8ddb95a0fbd11ffb5606ef0c" ON public.settings_store_entry USING btree (scope);


--
-- TOC entry 4099 (class 1259 OID 10312076)
-- Name: IDX_91a19e6613534949a4ce6e76ff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_91a19e6613534949a4ce6e76ff" ON public.product USING btree ("featuredAssetId");


--
-- TOC entry 4253 (class 1259 OID 10312633)
-- Name: IDX_92f8c334ef06275f9586fd0183; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_92f8c334ef06275f9586fd0183" ON public.history_entry USING btree ("administratorId");


--
-- TOC entry 4085 (class 1259 OID 10312029)
-- Name: IDX_93751abc1451972c02e033b766; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_93751abc1451972c02e033b766" ON public.product_option_group_translation USING btree ("baseId");


--
-- TOC entry 4164 (class 1259 OID 10312311)
-- Name: IDX_984c48572468c69661a0b7b049; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_984c48572468c69661a0b7b049" ON public.stock_level USING btree ("stockLocationId");


--
-- TOC entry 4195 (class 1259 OID 10312425)
-- Name: IDX_9872fc7de2f4e532fd3230d191; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9872fc7de2f4e532fd3230d191" ON public.tax_rate USING btree ("zoneId");


--
-- TOC entry 4165 (class 1259 OID 10312310)
-- Name: IDX_9950eae3180f39c71978748bd0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9950eae3180f39c71978748bd0" ON public.stock_level USING btree ("productVariantId");


--
-- TOC entry 4266 (class 1259 OID 10312684)
-- Name: IDX_9a5a6a556f75c4ac7bfdd03410; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9a5a6a556f75c4ac7bfdd03410" ON public.search_index_item USING btree (description);


--
-- TOC entry 4294 (class 1259 OID 10312732)
-- Name: IDX_9e412b00d4c6cee1a4b3d92071; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9e412b00d4c6cee1a4b3d92071" ON public.asset_tags_tag USING btree ("assetId");


--
-- TOC entry 4158 (class 1259 OID 10312299)
-- Name: IDX_9f065453910ea77d4be8e92618; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9f065453910ea77d4be8e92618" ON public.order_line USING btree ("featuredAssetId");


--
-- TOC entry 4059 (class 1259 OID 10311927)
-- Name: IDX_9f9da7d94b0278ea0f7831e1fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9f9da7d94b0278ea0f7831e1fc" ON public.collection_translation USING btree (slug);


--
-- TOC entry 4201 (class 1259 OID 10312450)
-- Name: IDX_a23445b2c942d8dfcae15b8de2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a23445b2c942d8dfcae15b8de2" ON public.authentication_method USING btree (type);


--
-- TOC entry 4150 (class 1259 OID 10312281)
-- Name: IDX_a2fe7172eeae9f1cca86f8f573; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a2fe7172eeae9f1cca86f8f573" ON public.stock_movement USING btree ("stockLocationId");


--
-- TOC entry 4122 (class 1259 OID 10312165)
-- Name: IDX_a49c5271c39cc8174a0535c808; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a49c5271c39cc8174a0535c808" ON public.surcharge USING btree ("orderModificationId");


--
-- TOC entry 4291 (class 1259 OID 10312726)
-- Name: IDX_a51dfbd87c330c075c39832b6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a51dfbd87c330c075c39832b6e" ON public.product_channels_channel USING btree ("channelId");


--
-- TOC entry 4082 (class 1259 OID 10312017)
-- Name: IDX_a6debf9198e2fbfa006aa10d71; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a6debf9198e2fbfa006aa10d71" ON public.product_option USING btree ("groupId");


--
-- TOC entry 4088 (class 1259 OID 10312041)
-- Name: IDX_a6e91739227bf4d442f23c52c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a6e91739227bf4d442f23c52c7" ON public.product_option_group USING btree ("productId");


--
-- TOC entry 4079 (class 1259 OID 10312005)
-- Name: IDX_a79a443c1f7841f3851767faa6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a79a443c1f7841f3851767faa6" ON public.product_option_translation USING btree ("baseId");


--
-- TOC entry 4354 (class 1259 OID 10312837)
-- Name: IDX_a842c9fe8cd4c8ff31402d172d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a842c9fe8cd4c8ff31402d172d" ON public.customer_channels_channel USING btree ("customerId");


--
-- TOC entry 4238 (class 1259 OID 10312598)
-- Name: IDX_ab560f7983976aec91b91c26a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ab560f7983976aec91b91c26a4" ON public.settings_store_entry USING btree (key);


--
-- TOC entry 4282 (class 1259 OID 10312711)
-- Name: IDX_ad690c1b05596d7f52e52ffeed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ad690c1b05596d7f52e52ffeed" ON public.facet_value_channels_channel USING btree ("facetValueId");


--
-- TOC entry 4145 (class 1259 OID 10312256)
-- Name: IDX_af13739f4962eab899bdff34be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_af13739f4962eab899bdff34be" ON public."order" USING btree ("orderPlacedAt");


--
-- TOC entry 4242 (class 1259 OID 10312619)
-- Name: IDX_af2116c7e176b6b88dceceeb74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_af2116c7e176b6b88dceceeb74" ON public.channel USING btree ("sellerId");


--
-- TOC entry 4243 (class 1259 OID 10312620)
-- Name: IDX_afe9f917a1c82b9e9e69f7c612; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_afe9f917a1c82b9e9e69f7c612" ON public.channel USING btree ("defaultTaxZoneId");


--
-- TOC entry 4339 (class 1259 OID 10312810)
-- Name: IDX_b45b65256486a15a104e17d495; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b45b65256486a15a104e17d495" ON public.zone_members_region USING btree ("regionId");


--
-- TOC entry 4351 (class 1259 OID 10312830)
-- Name: IDX_b823a3c8bf3b78d3ed68736485; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b823a3c8bf3b78d3ed68736485" ON public.customer_groups_customer_group USING btree ("customerId");


--
-- TOC entry 4334 (class 1259 OID 10312802)
-- Name: IDX_beeb2b3cd800e589f2213ae99d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_beeb2b3cd800e589f2213ae99d" ON public.product_variant_channels_channel USING btree ("productVariantId");


--
-- TOC entry 4342 (class 1259 OID 10312816)
-- Name: IDX_bfd2a03e9988eda6a9d1176011; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_bfd2a03e9988eda6a9d1176011" ON public.role_channels_channel USING btree ("roleId");


--
-- TOC entry 4359 (class 1259 OID 10312845)
-- Name: IDX_c00e36f667d35031087b382e61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c00e36f667d35031087b382e61" ON public.payment_method_channels_channel USING btree ("channelId");


--
-- TOC entry 4363 (class 1259 OID 10312851)
-- Name: IDX_c309f8cd152bbeaea08491e0c6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c309f8cd152bbeaea08491e0c6" ON public.collection_closure USING btree (id_ancestor);


--
-- TOC entry 4244 (class 1259 OID 10312621)
-- Name: IDX_c9ca2f58d4517460435cbd8b4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c9ca2f58d4517460435cbd8b4c" ON public.channel USING btree ("defaultShippingZoneId");


--
-- TOC entry 4138 (class 1259 OID 10312238)
-- Name: IDX_c9f34a440d490d1b66f6829b86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c9f34a440d490d1b66f6829b86" ON public.shipping_line USING btree ("orderId");


--
-- TOC entry 4279 (class 1259 OID 10312704)
-- Name: IDX_ca796020c6d097e251e5d6d2b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ca796020c6d097e251e5d6d2b0" ON public.facet_channels_channel USING btree ("facetId");


--
-- TOC entry 4159 (class 1259 OID 10312297)
-- Name: IDX_cbcd22193eda94668e84d33f18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cbcd22193eda94668e84d33f18" ON public.order_line USING btree ("productVariantId");


--
-- TOC entry 4275 (class 1259 OID 10312697)
-- Name: IDX_cdbf33ffb5d451916125152008; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cdbf33ffb5d451916125152008" ON public.collection_channels_channel USING btree ("collectionId");


--
-- TOC entry 4118 (class 1259 OID 10312152)
-- Name: IDX_d09d285fe1645cd2f0db811e29; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d09d285fe1645cd2f0db811e29" ON public.payment USING btree ("orderId");


--
-- TOC entry 4319 (class 1259 OID 10312775)
-- Name: IDX_d0d16db872499e83b15999f8c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d0d16db872499e83b15999f8c7" ON public.order_channels_channel USING btree ("channelId");


--
-- TOC entry 4076 (class 1259 OID 10311993)
-- Name: IDX_d101dc2265a7341be3d94968c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d101dc2265a7341be3d94968c5" ON public.facet_value USING btree ("facetId");


--
-- TOC entry 4335 (class 1259 OID 10312803)
-- Name: IDX_d194bff171b62357688a5d0f55; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d194bff171b62357688a5d0f55" ON public.product_variant_channels_channel USING btree ("channelId");


--
-- TOC entry 4151 (class 1259 OID 10312282)
-- Name: IDX_d2c8d5fca981cc820131f81aa8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d2c8d5fca981cc820131f81aa8" ON public.stock_movement USING btree ("orderLineId");


--
-- TOC entry 4218 (class 1259 OID 10312523)
-- Name: IDX_d87215343c3a3a67e6a0b7f3ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d87215343c3a3a67e6a0b7f3ea" ON public.address USING btree ("countryId");


--
-- TOC entry 4267 (class 1259 OID 10312683)
-- Name: IDX_d8791f444a8bf23fe4c1bc020c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d8791f444a8bf23fe4c1bc020c" ON public.search_index_item USING btree ("productVariantName");


--
-- TOC entry 4219 (class 1259 OID 10312522)
-- Name: IDX_dc34d382b493ade1f70e834c4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dc34d382b493ade1f70e834c4d" ON public.address USING btree ("customerId");


--
-- TOC entry 4299 (class 1259 OID 10312739)
-- Name: IDX_dc4e7435f9f5e9e6436bebd33b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dc4e7435f9f5e9e6436bebd33b" ON public.asset_channels_channel USING btree ("assetId");


--
-- TOC entry 4160 (class 1259 OID 10312296)
-- Name: IDX_dc9ac68b47da7b62249886affb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dc9ac68b47da7b62249886affb" ON public.order_line USING btree ("shippingLineId");


--
-- TOC entry 4355 (class 1259 OID 10312838)
-- Name: IDX_dc9f69207a8867f83b0fd257e3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dc9f69207a8867f83b0fd257e3" ON public.customer_channels_channel USING btree ("channelId");


--
-- TOC entry 4343 (class 1259 OID 10312817)
-- Name: IDX_e09dfee62b158307404202b43a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e09dfee62b158307404202b43a" ON public.role_channels_channel USING btree ("channelId");


--
-- TOC entry 4283 (class 1259 OID 10312712)
-- Name: IDX_e1d54c0b9db3e2eb17faaf5919; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e1d54c0b9db3e2eb17faaf5919" ON public.facet_value_channels_channel USING btree ("channelId");


--
-- TOC entry 4139 (class 1259 OID 10312237)
-- Name: IDX_e2e7642e1e88167c1dfc827fdf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e2e7642e1e88167c1dfc827fdf" ON public.shipping_line USING btree ("shippingMethodId");


--
-- TOC entry 4060 (class 1259 OID 10311928)
-- Name: IDX_e329f9036210d75caa1d8f2154; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e329f9036210d75caa1d8f2154" ON public.collection_translation USING btree ("baseId");


--
-- TOC entry 4180 (class 1259 OID 10312364)
-- Name: IDX_e38dca0d82fd64c7cf8aac8b8e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e38dca0d82fd64c7cf8aac8b8e" ON public.product_variant USING btree ("taxCategoryId");


--
-- TOC entry 4172 (class 1259 OID 10312335)
-- Name: IDX_e6126cd268aea6e9b31d89af9a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e6126cd268aea6e9b31d89af9a" ON public.product_variant_price USING btree ("variantId");


--
-- TOC entry 4152 (class 1259 OID 10312280)
-- Name: IDX_e65ba3882557cab4febb54809b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e65ba3882557cab4febb54809b" ON public.stock_movement USING btree ("productVariantId");


--
-- TOC entry 4327 (class 1259 OID 10312789)
-- Name: IDX_e96a71affe63c97f7fa2f076da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e96a71affe63c97f7fa2f076da" ON public.product_variant_options_product_option USING btree ("productOptionId");


--
-- TOC entry 4066 (class 1259 OID 10311955)
-- Name: IDX_eaea53f44bf9e97790d38a3d68; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_eaea53f44bf9e97790d38a3d68" ON public.facet_translation USING btree ("baseId");


--
-- TOC entry 4209 (class 1259 OID 10312475)
-- Name: IDX_eb87ef1e234444728138302263; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_eb87ef1e234444728138302263" ON public.session USING btree ("activeChannelId");


--
-- TOC entry 4188 (class 1259 OID 10312401)
-- Name: IDX_ed0c8098ce6809925a437f42ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ed0c8098ce6809925a437f42ae" ON public.region USING btree ("parentId");


--
-- TOC entry 4306 (class 1259 OID 10312753)
-- Name: IDX_f0a17b94aa5a162f0d422920eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f0a17b94aa5a162f0d422920eb" ON public.shipping_method_channels_channel USING btree ("shippingMethodId");


--
-- TOC entry 4307 (class 1259 OID 10312754)
-- Name: IDX_f2b98dfb56685147bed509acc3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f2b98dfb56685147bed509acc3" ON public.shipping_method_channels_channel USING btree ("channelId");


--
-- TOC entry 4096 (class 1259 OID 10312064)
-- Name: IDX_f4a2ec16ba86d277b6faa0b67b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f4a2ec16ba86d277b6faa0b67b" ON public.product_translation USING btree (slug);


--
-- TOC entry 4315 (class 1259 OID 10312767)
-- Name: IDX_f80d84d525af2ffe974e7e8ca2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f80d84d525af2ffe974e7e8ca2" ON public.order_fulfillments_fulfillment USING btree ("orderId");


--
-- TOC entry 4169 (class 1259 OID 10312323)
-- Name: IDX_fa21412afac15a2304f3eb35fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fa21412afac15a2304f3eb35fe" ON public.product_variant_asset USING btree ("productVariantId");


--
-- TOC entry 4271 (class 1259 OID 10312691)
-- Name: IDX_fb05887e2867365f236d7dd95e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fb05887e2867365f236d7dd95e" ON public.collection_product_variants_product_variant USING btree ("productVariantId");


--
-- TOC entry 4295 (class 1259 OID 10312733)
-- Name: IDX_fb5e800171ffbe9823f2cc727f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fb5e800171ffbe9823f2cc727f" ON public.asset_tags_tag USING btree ("tagId");


--
-- TOC entry 4323 (class 1259 OID 10312782)
-- Name: IDX_ff8150fe54e56a900d5712671a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ff8150fe54e56a900d5712671a" ON public.stock_location_channels_channel USING btree ("channelId");


--
-- TOC entry 4241 (class 1259 OID 10312600)
-- Name: settings_store_key_scope_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX settings_store_key_scope_unique ON public.settings_store_entry USING btree (key, scope);


--
-- TOC entry 4424 (class 2606 OID 10313133)
-- Name: authentication_method FK_00cbe87bc0d4e36758d61bd31d6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_method
    ADD CONSTRAINT "FK_00cbe87bc0d4e36758d61bd31d6" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- TOC entry 4384 (class 2606 OID 10312938)
-- Name: order_line_reference FK_06b02fb482b188823e419d37bd4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_reference
    ADD CONSTRAINT "FK_06b02fb482b188823e419d37bd4" FOREIGN KEY ("fulfillmentId") REFERENCES public.fulfillment(id);


--
-- TOC entry 4447 (class 2606 OID 10313253)
-- Name: product_facet_values_facet_value FK_06e7d73673ee630e8ec50d0b29f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_facet_values_facet_value
    ADD CONSTRAINT "FK_06e7d73673ee630e8ec50d0b29f" FOREIGN KEY ("facetValueId") REFERENCES public.facet_value(id) ON DELETE CASCADE;


--
-- TOC entry 4380 (class 2606 OID 10312918)
-- Name: product_asset FK_0d1294f5c22a56da7845ebab72c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_asset
    ADD CONSTRAINT "FK_0d1294f5c22a56da7845ebab72c" FOREIGN KEY ("productId") REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4469 (class 2606 OID 10313363)
-- Name: product_variant_facet_values_facet_value FK_0d641b761ed1dce4ef3cd33d559; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_facet_values_facet_value
    ADD CONSTRAINT "FK_0d641b761ed1dce4ef3cd33d559" FOREIGN KEY ("facetValueId") REFERENCES public.facet_value(id);


--
-- TOC entry 4463 (class 2606 OID 10313328)
-- Name: order_channels_channel FK_0d8e5c204480204a60e151e4853; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_channels_channel
    ADD CONSTRAINT "FK_0d8e5c204480204a60e151e4853" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4416 (class 2606 OID 10313093)
-- Name: product_variant FK_0e6f516053cf982b537836e21cf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_0e6f516053cf982b537836e21cf" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id) ON DELETE SET NULL;


--
-- TOC entry 4455 (class 2606 OID 10313293)
-- Name: promotion_channels_channel FK_0eaaf0f4b6c69afde1e88ffb52d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_channels_channel
    ADD CONSTRAINT "FK_0eaaf0f4b6c69afde1e88ffb52d" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4412 (class 2606 OID 10313073)
-- Name: product_variant_asset FK_10b5a2e3dee0e30b1e26c32f5c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_asset
    ADD CONSTRAINT "FK_10b5a2e3dee0e30b1e26c32f5c7" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- TOC entry 4399 (class 2606 OID 10313013)
-- Name: order FK_124456e637cca7a415897dce659; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_124456e637cca7a415897dce659" FOREIGN KEY ("customerId") REFERENCES public.customer(id);


--
-- TOC entry 4390 (class 2606 OID 10312963)
-- Name: surcharge FK_154eb685f9b629033bd266df7fa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surcharge
    ADD CONSTRAINT "FK_154eb685f9b629033bd266df7fa" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 4453 (class 2606 OID 10313283)
-- Name: asset_channels_channel FK_16ca9151a5153f1169da5b7b7e3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_channels_channel
    ADD CONSTRAINT "FK_16ca9151a5153f1169da5b7b7e3" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4431 (class 2606 OID 10313168)
-- Name: administrator FK_1966e18ce6a39a82b19204704d7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "FK_1966e18ce6a39a82b19204704d7" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- TOC entry 4419 (class 2606 OID 10313108)
-- Name: region_translation FK_1afd722b943c81310705fc3e612; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_translation
    ADD CONSTRAINT "FK_1afd722b943c81310705fc3e612" FOREIGN KEY ("baseId") REFERENCES public.region(id) ON DELETE CASCADE;


--
-- TOC entry 4388 (class 2606 OID 10312953)
-- Name: refund FK_1c6932a756108788a361e7d4404; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "FK_1c6932a756108788a361e7d4404" FOREIGN KEY ("paymentId") REFERENCES public.payment(id);


--
-- TOC entry 4395 (class 2606 OID 10312988)
-- Name: promotion_translation FK_1cc009e9ab2263a35544064561b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_translation
    ADD CONSTRAINT "FK_1cc009e9ab2263a35544064561b" FOREIGN KEY ("baseId") REFERENCES public.promotion(id) ON DELETE CASCADE;


--
-- TOC entry 4392 (class 2606 OID 10312973)
-- Name: order_modification FK_1df5bc14a47ef24d2e681f45598; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "FK_1df5bc14a47ef24d2e681f45598" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 4368 (class 2606 OID 10312858)
-- Name: collection_asset FK_1ed9e48dfbf74b5fcbb35d3d686; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_asset
    ADD CONSTRAINT "FK_1ed9e48dfbf74b5fcbb35d3d686" FOREIGN KEY ("collectionId") REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- TOC entry 4385 (class 2606 OID 10312943)
-- Name: order_line_reference FK_22b818af8722746fb9f206068c2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_reference
    ADD CONSTRAINT "FK_22b818af8722746fb9f206068c2" FOREIGN KEY ("modificationId") REFERENCES public.order_modification(id);


--
-- TOC entry 4404 (class 2606 OID 10313058)
-- Name: order_line FK_239cfca2a55b98b90b6bef2e44f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_239cfca2a55b98b90b6bef2e44f" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 4449 (class 2606 OID 10313258)
-- Name: product_channels_channel FK_26d12be3b5fec6c4adb1d792844; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_channels_channel
    ADD CONSTRAINT "FK_26d12be3b5fec6c4adb1d792844" FOREIGN KEY ("productId") REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4443 (class 2606 OID 10313233)
-- Name: facet_channels_channel FK_2a8ea404d05bf682516184db7d3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_channels_channel
    ADD CONSTRAINT "FK_2a8ea404d05bf682516184db7d3" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4459 (class 2606 OID 10313313)
-- Name: order_promotions_promotion FK_2c26b988769c0e3b0120bdef31b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_promotions_promotion
    ADD CONSTRAINT "FK_2c26b988769c0e3b0120bdef31b" FOREIGN KEY ("promotionId") REFERENCES public.promotion(id);


--
-- TOC entry 4386 (class 2606 OID 10312948)
-- Name: order_line_reference FK_30019aa65b17fe9ee9628931991; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_reference
    ADD CONSTRAINT "FK_30019aa65b17fe9ee9628931991" FOREIGN KEY ("refundId") REFERENCES public.refund(id);


--
-- TOC entry 4465 (class 2606 OID 10313338)
-- Name: stock_location_channels_channel FK_39513fd02a573c848d23bee587d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location_channels_channel
    ADD CONSTRAINT "FK_39513fd02a573c848d23bee587d" FOREIGN KEY ("stockLocationId") REFERENCES public.stock_location(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4436 (class 2606 OID 10313203)
-- Name: history_entry FK_3a05127e67435b4d2332ded7c9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "FK_3a05127e67435b4d2332ded7c9e" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 4425 (class 2606 OID 10313148)
-- Name: session FK_3d2f174ef04fb312fdebd0ddc53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "FK_3d2f174ef04fb312fdebd0ddc53" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- TOC entry 4374 (class 2606 OID 10312883)
-- Name: facet_value_translation FK_3d6e45823b65de808a66cb1423b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value_translation
    ADD CONSTRAINT "FK_3d6e45823b65de808a66cb1423b" FOREIGN KEY ("baseId") REFERENCES public.facet_value(id) ON DELETE CASCADE;


--
-- TOC entry 4428 (class 2606 OID 10313153)
-- Name: customer FK_3f62b42ed23958b120c235f74df; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "FK_3f62b42ed23958b120c235f74df" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- TOC entry 4415 (class 2606 OID 10313088)
-- Name: product_variant_translation FK_420f4d6fb75d38b9dca79bc43b4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_translation
    ADD CONSTRAINT "FK_420f4d6fb75d38b9dca79bc43b4" FOREIGN KEY ("baseId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- TOC entry 4371 (class 2606 OID 10312873)
-- Name: collection FK_4257b61275144db89fa0f5dc059; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "FK_4257b61275144db89fa0f5dc059" FOREIGN KEY ("parentId") REFERENCES public.collection(id);


--
-- TOC entry 4473 (class 2606 OID 10313378)
-- Name: zone_members_region FK_433f45158e4e2b2a2f344714b22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zone_members_region
    ADD CONSTRAINT "FK_433f45158e4e2b2a2f344714b22" FOREIGN KEY ("zoneId") REFERENCES public.zone(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4437 (class 2606 OID 10313198)
-- Name: history_entry FK_43ac602f839847fdb91101f30ec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "FK_43ac602f839847fdb91101f30ec" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- TOC entry 4485 (class 2606 OID 10313443)
-- Name: collection_closure FK_457784c710f8ac9396010441f6c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_closure
    ADD CONSTRAINT "FK_457784c710f8ac9396010441f6c" FOREIGN KEY (id_descendant) REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- TOC entry 4461 (class 2606 OID 10313323)
-- Name: order_fulfillments_fulfillment FK_4add5a5796e1582dec2877b2898; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_fulfillments_fulfillment
    ADD CONSTRAINT "FK_4add5a5796e1582dec2877b2898" FOREIGN KEY ("fulfillmentId") REFERENCES public.fulfillment(id);


--
-- TOC entry 4477 (class 2606 OID 10313403)
-- Name: user_roles_role FK_4be2f7adf862634f5f803d246b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles_role
    ADD CONSTRAINT "FK_4be2f7adf862634f5f803d246b8" FOREIGN KEY ("roleId") REFERENCES public.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4369 (class 2606 OID 10312853)
-- Name: collection_asset FK_51da53b26522dc0525762d2de8e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_asset
    ADD CONSTRAINT "FK_51da53b26522dc0525762d2de8e" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- TOC entry 4467 (class 2606 OID 10313348)
-- Name: product_variant_options_product_option FK_526f0131260eec308a3bd2b61b6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_options_product_option
    ADD CONSTRAINT "FK_526f0131260eec308a3bd2b61b6" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4381 (class 2606 OID 10312913)
-- Name: product_asset FK_5888ac17b317b93378494a10620; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_asset
    ADD CONSTRAINT "FK_5888ac17b317b93378494a10620" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- TOC entry 4483 (class 2606 OID 10313428)
-- Name: payment_method_channels_channel FK_5bcb569635ce5407eb3f264487d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method_channels_channel
    ADD CONSTRAINT "FK_5bcb569635ce5407eb3f264487d" FOREIGN KEY ("paymentMethodId") REFERENCES public.payment_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4478 (class 2606 OID 10313398)
-- Name: user_roles_role FK_5f9286e6c25594c6b88c108db77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles_role
    ADD CONSTRAINT "FK_5f9286e6c25594c6b88c108db77" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4432 (class 2606 OID 10313173)
-- Name: payment_method_translation FK_66187f782a3e71b9e0f5b50b68b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method_translation
    ADD CONSTRAINT "FK_66187f782a3e71b9e0f5b50b68b" FOREIGN KEY ("baseId") REFERENCES public.payment_method(id) ON DELETE CASCADE;


--
-- TOC entry 4460 (class 2606 OID 10313308)
-- Name: order_promotions_promotion FK_67be0e40122ab30a62a9817efe0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_promotions_promotion
    ADD CONSTRAINT "FK_67be0e40122ab30a62a9817efe0" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4405 (class 2606 OID 10313033)
-- Name: order_line FK_6901d8715f5ebadd764466f7bde; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_6901d8715f5ebadd764466f7bde" FOREIGN KEY ("sellerChannelId") REFERENCES public.channel(id) ON DELETE SET NULL;


--
-- TOC entry 4470 (class 2606 OID 10313358)
-- Name: product_variant_facet_values_facet_value FK_69567bc225b6bbbd732d6c5455b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_facet_values_facet_value
    ADD CONSTRAINT "FK_69567bc225b6bbbd732d6c5455b" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4448 (class 2606 OID 10313248)
-- Name: product_facet_values_facet_value FK_6a0558e650d75ae639ff38e413a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_facet_values_facet_value
    ADD CONSTRAINT "FK_6a0558e650d75ae639ff38e413a" FOREIGN KEY ("productId") REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4456 (class 2606 OID 10313288)
-- Name: promotion_channels_channel FK_6d9e2c39ab12391aaa374bcdaa4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_channels_channel
    ADD CONSTRAINT "FK_6d9e2c39ab12391aaa374bcdaa4" FOREIGN KEY ("promotionId") REFERENCES public.promotion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4417 (class 2606 OID 10313103)
-- Name: product_variant FK_6e420052844edf3a5506d863ce6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_6e420052844edf3a5506d863ce6" FOREIGN KEY ("productId") REFERENCES public.product(id);


--
-- TOC entry 4439 (class 2606 OID 10313208)
-- Name: collection_product_variants_product_variant FK_6faa7b72422d9c4679e2f186ad1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_product_variants_product_variant
    ADD CONSTRAINT "FK_6faa7b72422d9c4679e2f186ad1" FOREIGN KEY ("collectionId") REFERENCES public.collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4441 (class 2606 OID 10313223)
-- Name: collection_channels_channel FK_7216ab24077cf5cbece7857dbbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_channels_channel
    ADD CONSTRAINT "FK_7216ab24077cf5cbece7857dbbd" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4372 (class 2606 OID 10312868)
-- Name: collection FK_7256fef1bb42f1b38156b7449f5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "FK_7256fef1bb42f1b38156b7449f5" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id) ON DELETE SET NULL;


--
-- TOC entry 4400 (class 2606 OID 10313008)
-- Name: order FK_73a78d7df09541ac5eba620d181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_73a78d7df09541ac5eba620d181" FOREIGN KEY ("aggregateOrderId") REFERENCES public."order"(id);


--
-- TOC entry 4406 (class 2606 OID 10313048)
-- Name: order_line FK_77be94ce9ec6504466179462275; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_77be94ce9ec6504466179462275" FOREIGN KEY ("taxCategoryId") REFERENCES public.tax_category(id);


--
-- TOC entry 4426 (class 2606 OID 10313138)
-- Name: session FK_7a75399a4f4ffa48ee02e98c059; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "FK_7a75399a4f4ffa48ee02e98c059" FOREIGN KEY ("activeOrderId") REFERENCES public."order"(id);


--
-- TOC entry 4387 (class 2606 OID 10312933)
-- Name: order_line_reference FK_7d57857922dfc7303604697dbe9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_reference
    ADD CONSTRAINT "FK_7d57857922dfc7303604697dbe9" FOREIGN KEY ("orderLineId") REFERENCES public.order_line(id) ON DELETE CASCADE;


--
-- TOC entry 4382 (class 2606 OID 10312923)
-- Name: product_translation FK_7dbc75cb4e8b002620c4dbfdac5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translation
    ADD CONSTRAINT "FK_7dbc75cb4e8b002620c4dbfdac5" FOREIGN KEY ("baseId") REFERENCES public.product(id);


--
-- TOC entry 4421 (class 2606 OID 10313118)
-- Name: tax_rate FK_7ee3306d7638aa85ca90d672198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_7ee3306d7638aa85ca90d672198" FOREIGN KEY ("categoryId") REFERENCES public.tax_category(id);


--
-- TOC entry 4396 (class 2606 OID 10312993)
-- Name: shipping_method_translation FK_85ec26c71067ebc84adcd98d1a5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_translation
    ADD CONSTRAINT "FK_85ec26c71067ebc84adcd98d1a5" FOREIGN KEY ("baseId") REFERENCES public.shipping_method(id) ON DELETE CASCADE;


--
-- TOC entry 4479 (class 2606 OID 10313413)
-- Name: customer_groups_customer_group FK_85feea3f0e5e82133605f78db02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_groups_customer_group
    ADD CONSTRAINT "FK_85feea3f0e5e82133605f78db02" FOREIGN KEY ("customerGroupId") REFERENCES public.customer_group(id);


--
-- TOC entry 4422 (class 2606 OID 10313128)
-- Name: tax_rate FK_8b5ab52fc8887c1a769b9276caf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_8b5ab52fc8887c1a769b9276caf" FOREIGN KEY ("customerGroupId") REFERENCES public.customer_group(id);


--
-- TOC entry 4383 (class 2606 OID 10312928)
-- Name: product FK_91a19e6613534949a4ce6e76ff8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_91a19e6613534949a4ce6e76ff8" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id) ON DELETE SET NULL;


--
-- TOC entry 4438 (class 2606 OID 10313193)
-- Name: history_entry FK_92f8c334ef06275f9586fd01832; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "FK_92f8c334ef06275f9586fd01832" FOREIGN KEY ("administratorId") REFERENCES public.administrator(id);


--
-- TOC entry 4378 (class 2606 OID 10312903)
-- Name: product_option_group_translation FK_93751abc1451972c02e033b766c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group_translation
    ADD CONSTRAINT "FK_93751abc1451972c02e033b766c" FOREIGN KEY ("baseId") REFERENCES public.product_option_group(id) ON DELETE CASCADE;


--
-- TOC entry 4410 (class 2606 OID 10313068)
-- Name: stock_level FK_984c48572468c69661a0b7b0494; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_level
    ADD CONSTRAINT "FK_984c48572468c69661a0b7b0494" FOREIGN KEY ("stockLocationId") REFERENCES public.stock_location(id) ON DELETE CASCADE;


--
-- TOC entry 4423 (class 2606 OID 10313123)
-- Name: tax_rate FK_9872fc7de2f4e532fd3230d1915; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_9872fc7de2f4e532fd3230d1915" FOREIGN KEY ("zoneId") REFERENCES public.zone(id);


--
-- TOC entry 4411 (class 2606 OID 10313063)
-- Name: stock_level FK_9950eae3180f39c71978748bd08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_level
    ADD CONSTRAINT "FK_9950eae3180f39c71978748bd08" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- TOC entry 4451 (class 2606 OID 10313268)
-- Name: asset_tags_tag FK_9e412b00d4c6cee1a4b3d920716; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_tags_tag
    ADD CONSTRAINT "FK_9e412b00d4c6cee1a4b3d920716" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4407 (class 2606 OID 10313053)
-- Name: order_line FK_9f065453910ea77d4be8e92618f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_9f065453910ea77d4be8e92618f" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id) ON DELETE SET NULL;


--
-- TOC entry 4401 (class 2606 OID 10313023)
-- Name: stock_movement FK_a2fe7172eeae9f1cca86f8f573a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "FK_a2fe7172eeae9f1cca86f8f573a" FOREIGN KEY ("stockLocationId") REFERENCES public.stock_location(id) ON DELETE CASCADE;


--
-- TOC entry 4391 (class 2606 OID 10312968)
-- Name: surcharge FK_a49c5271c39cc8174a0535c8088; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surcharge
    ADD CONSTRAINT "FK_a49c5271c39cc8174a0535c8088" FOREIGN KEY ("orderModificationId") REFERENCES public.order_modification(id);


--
-- TOC entry 4450 (class 2606 OID 10313263)
-- Name: product_channels_channel FK_a51dfbd87c330c075c39832b6e7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_channels_channel
    ADD CONSTRAINT "FK_a51dfbd87c330c075c39832b6e7" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4377 (class 2606 OID 10312898)
-- Name: product_option FK_a6debf9198e2fbfa006aa10d710; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "FK_a6debf9198e2fbfa006aa10d710" FOREIGN KEY ("groupId") REFERENCES public.product_option_group(id);


--
-- TOC entry 4379 (class 2606 OID 10312908)
-- Name: product_option_group FK_a6e91739227bf4d442f23c52c75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group
    ADD CONSTRAINT "FK_a6e91739227bf4d442f23c52c75" FOREIGN KEY ("productId") REFERENCES public.product(id);


--
-- TOC entry 4376 (class 2606 OID 10312893)
-- Name: product_option_translation FK_a79a443c1f7841f3851767faa6d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_translation
    ADD CONSTRAINT "FK_a79a443c1f7841f3851767faa6d" FOREIGN KEY ("baseId") REFERENCES public.product_option(id) ON DELETE CASCADE;


--
-- TOC entry 4481 (class 2606 OID 10313418)
-- Name: customer_channels_channel FK_a842c9fe8cd4c8ff31402d172d7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_channels_channel
    ADD CONSTRAINT "FK_a842c9fe8cd4c8ff31402d172d7" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4393 (class 2606 OID 10312978)
-- Name: order_modification FK_ad2991fa2933ed8b7f86a716338; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "FK_ad2991fa2933ed8b7f86a716338" FOREIGN KEY ("paymentId") REFERENCES public.payment(id);


--
-- TOC entry 4445 (class 2606 OID 10313238)
-- Name: facet_value_channels_channel FK_ad690c1b05596d7f52e52ffeedd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value_channels_channel
    ADD CONSTRAINT "FK_ad690c1b05596d7f52e52ffeedd" FOREIGN KEY ("facetValueId") REFERENCES public.facet_value(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4433 (class 2606 OID 10313178)
-- Name: channel FK_af2116c7e176b6b88dceceeb74b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "FK_af2116c7e176b6b88dceceeb74b" FOREIGN KEY ("sellerId") REFERENCES public.seller(id);


--
-- TOC entry 4434 (class 2606 OID 10313183)
-- Name: channel FK_afe9f917a1c82b9e9e69f7c6129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "FK_afe9f917a1c82b9e9e69f7c6129" FOREIGN KEY ("defaultTaxZoneId") REFERENCES public.zone(id);


--
-- TOC entry 4474 (class 2606 OID 10313383)
-- Name: zone_members_region FK_b45b65256486a15a104e17d495c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zone_members_region
    ADD CONSTRAINT "FK_b45b65256486a15a104e17d495c" FOREIGN KEY ("regionId") REFERENCES public.region(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4480 (class 2606 OID 10313408)
-- Name: customer_groups_customer_group FK_b823a3c8bf3b78d3ed68736485c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_groups_customer_group
    ADD CONSTRAINT "FK_b823a3c8bf3b78d3ed68736485c" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4471 (class 2606 OID 10313368)
-- Name: product_variant_channels_channel FK_beeb2b3cd800e589f2213ae99d6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_channels_channel
    ADD CONSTRAINT "FK_beeb2b3cd800e589f2213ae99d6" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4475 (class 2606 OID 10313388)
-- Name: role_channels_channel FK_bfd2a03e9988eda6a9d11760119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_channels_channel
    ADD CONSTRAINT "FK_bfd2a03e9988eda6a9d11760119" FOREIGN KEY ("roleId") REFERENCES public.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4484 (class 2606 OID 10313433)
-- Name: payment_method_channels_channel FK_c00e36f667d35031087b382e61b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method_channels_channel
    ADD CONSTRAINT "FK_c00e36f667d35031087b382e61b" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4486 (class 2606 OID 10313438)
-- Name: collection_closure FK_c309f8cd152bbeaea08491e0c66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_closure
    ADD CONSTRAINT "FK_c309f8cd152bbeaea08491e0c66" FOREIGN KEY (id_ancestor) REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- TOC entry 4435 (class 2606 OID 10313188)
-- Name: channel FK_c9ca2f58d4517460435cbd8b4c9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "FK_c9ca2f58d4517460435cbd8b4c9" FOREIGN KEY ("defaultShippingZoneId") REFERENCES public.zone(id);


--
-- TOC entry 4397 (class 2606 OID 10313003)
-- Name: shipping_line FK_c9f34a440d490d1b66f6829b86c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_line
    ADD CONSTRAINT "FK_c9f34a440d490d1b66f6829b86c" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 4444 (class 2606 OID 10313228)
-- Name: facet_channels_channel FK_ca796020c6d097e251e5d6d2b02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_channels_channel
    ADD CONSTRAINT "FK_ca796020c6d097e251e5d6d2b02" FOREIGN KEY ("facetId") REFERENCES public.facet(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4394 (class 2606 OID 10312983)
-- Name: order_modification FK_cb66b63b6e97613013795eadbd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "FK_cb66b63b6e97613013795eadbd5" FOREIGN KEY ("refundId") REFERENCES public.refund(id);


--
-- TOC entry 4408 (class 2606 OID 10313043)
-- Name: order_line FK_cbcd22193eda94668e84d33f185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_cbcd22193eda94668e84d33f185" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- TOC entry 4442 (class 2606 OID 10313218)
-- Name: collection_channels_channel FK_cdbf33ffb5d4519161251520083; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_channels_channel
    ADD CONSTRAINT "FK_cdbf33ffb5d4519161251520083" FOREIGN KEY ("collectionId") REFERENCES public.collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4389 (class 2606 OID 10312958)
-- Name: payment FK_d09d285fe1645cd2f0db811e293; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_d09d285fe1645cd2f0db811e293" FOREIGN KEY ("orderId") REFERENCES public."order"(id);


--
-- TOC entry 4464 (class 2606 OID 10313333)
-- Name: order_channels_channel FK_d0d16db872499e83b15999f8c7a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_channels_channel
    ADD CONSTRAINT "FK_d0d16db872499e83b15999f8c7a" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4375 (class 2606 OID 10312888)
-- Name: facet_value FK_d101dc2265a7341be3d94968c5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value
    ADD CONSTRAINT "FK_d101dc2265a7341be3d94968c5b" FOREIGN KEY ("facetId") REFERENCES public.facet(id) ON DELETE CASCADE;


--
-- TOC entry 4472 (class 2606 OID 10313373)
-- Name: product_variant_channels_channel FK_d194bff171b62357688a5d0f559; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_channels_channel
    ADD CONSTRAINT "FK_d194bff171b62357688a5d0f559" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4402 (class 2606 OID 10313028)
-- Name: stock_movement FK_d2c8d5fca981cc820131f81aa83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "FK_d2c8d5fca981cc820131f81aa83" FOREIGN KEY ("orderLineId") REFERENCES public.order_line(id);


--
-- TOC entry 4429 (class 2606 OID 10313163)
-- Name: address FK_d87215343c3a3a67e6a0b7f3ea9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_d87215343c3a3a67e6a0b7f3ea9" FOREIGN KEY ("countryId") REFERENCES public.region(id);


--
-- TOC entry 4430 (class 2606 OID 10313158)
-- Name: address FK_dc34d382b493ade1f70e834c4d3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_dc34d382b493ade1f70e834c4d3" FOREIGN KEY ("customerId") REFERENCES public.customer(id);


--
-- TOC entry 4454 (class 2606 OID 10313278)
-- Name: asset_channels_channel FK_dc4e7435f9f5e9e6436bebd33bb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_channels_channel
    ADD CONSTRAINT "FK_dc4e7435f9f5e9e6436bebd33bb" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4409 (class 2606 OID 10313038)
-- Name: order_line FK_dc9ac68b47da7b62249886affba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_dc9ac68b47da7b62249886affba" FOREIGN KEY ("shippingLineId") REFERENCES public.shipping_line(id) ON DELETE SET NULL;


--
-- TOC entry 4482 (class 2606 OID 10313423)
-- Name: customer_channels_channel FK_dc9f69207a8867f83b0fd257e30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_channels_channel
    ADD CONSTRAINT "FK_dc9f69207a8867f83b0fd257e30" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4476 (class 2606 OID 10313393)
-- Name: role_channels_channel FK_e09dfee62b158307404202b43a5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_channels_channel
    ADD CONSTRAINT "FK_e09dfee62b158307404202b43a5" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4446 (class 2606 OID 10313243)
-- Name: facet_value_channels_channel FK_e1d54c0b9db3e2eb17faaf5919c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_value_channels_channel
    ADD CONSTRAINT "FK_e1d54c0b9db3e2eb17faaf5919c" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4398 (class 2606 OID 10312998)
-- Name: shipping_line FK_e2e7642e1e88167c1dfc827fdf3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_line
    ADD CONSTRAINT "FK_e2e7642e1e88167c1dfc827fdf3" FOREIGN KEY ("shippingMethodId") REFERENCES public.shipping_method(id);


--
-- TOC entry 4370 (class 2606 OID 10312863)
-- Name: collection_translation FK_e329f9036210d75caa1d8f2154a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_translation
    ADD CONSTRAINT "FK_e329f9036210d75caa1d8f2154a" FOREIGN KEY ("baseId") REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- TOC entry 4418 (class 2606 OID 10313098)
-- Name: product_variant FK_e38dca0d82fd64c7cf8aac8b8ef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_e38dca0d82fd64c7cf8aac8b8ef" FOREIGN KEY ("taxCategoryId") REFERENCES public.tax_category(id);


--
-- TOC entry 4414 (class 2606 OID 10313083)
-- Name: product_variant_price FK_e6126cd268aea6e9b31d89af9ab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_price
    ADD CONSTRAINT "FK_e6126cd268aea6e9b31d89af9ab" FOREIGN KEY ("variantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- TOC entry 4403 (class 2606 OID 10313018)
-- Name: stock_movement FK_e65ba3882557cab4febb54809bb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "FK_e65ba3882557cab4febb54809bb" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id);


--
-- TOC entry 4468 (class 2606 OID 10313353)
-- Name: product_variant_options_product_option FK_e96a71affe63c97f7fa2f076dac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_options_product_option
    ADD CONSTRAINT "FK_e96a71affe63c97f7fa2f076dac" FOREIGN KEY ("productOptionId") REFERENCES public.product_option(id);


--
-- TOC entry 4373 (class 2606 OID 10312878)
-- Name: facet_translation FK_eaea53f44bf9e97790d38a3d68f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facet_translation
    ADD CONSTRAINT "FK_eaea53f44bf9e97790d38a3d68f" FOREIGN KEY ("baseId") REFERENCES public.facet(id) ON DELETE CASCADE;


--
-- TOC entry 4427 (class 2606 OID 10313143)
-- Name: session FK_eb87ef1e234444728138302263b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "FK_eb87ef1e234444728138302263b" FOREIGN KEY ("activeChannelId") REFERENCES public.channel(id);


--
-- TOC entry 4420 (class 2606 OID 10313113)
-- Name: region FK_ed0c8098ce6809925a437f42aec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "FK_ed0c8098ce6809925a437f42aec" FOREIGN KEY ("parentId") REFERENCES public.region(id) ON DELETE SET NULL;


--
-- TOC entry 4457 (class 2606 OID 10313298)
-- Name: shipping_method_channels_channel FK_f0a17b94aa5a162f0d422920eb2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_channels_channel
    ADD CONSTRAINT "FK_f0a17b94aa5a162f0d422920eb2" FOREIGN KEY ("shippingMethodId") REFERENCES public.shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4458 (class 2606 OID 10313303)
-- Name: shipping_method_channels_channel FK_f2b98dfb56685147bed509acc3d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_channels_channel
    ADD CONSTRAINT "FK_f2b98dfb56685147bed509acc3d" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- TOC entry 4462 (class 2606 OID 10313318)
-- Name: order_fulfillments_fulfillment FK_f80d84d525af2ffe974e7e8ca29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_fulfillments_fulfillment
    ADD CONSTRAINT "FK_f80d84d525af2ffe974e7e8ca29" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4413 (class 2606 OID 10313078)
-- Name: product_variant_asset FK_fa21412afac15a2304f3eb35feb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_asset
    ADD CONSTRAINT "FK_fa21412afac15a2304f3eb35feb" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- TOC entry 4440 (class 2606 OID 10313213)
-- Name: collection_product_variants_product_variant FK_fb05887e2867365f236d7dd95ee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_product_variants_product_variant
    ADD CONSTRAINT "FK_fb05887e2867365f236d7dd95ee" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id);


--
-- TOC entry 4452 (class 2606 OID 10313273)
-- Name: asset_tags_tag FK_fb5e800171ffbe9823f2cc727fd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_tags_tag
    ADD CONSTRAINT "FK_fb5e800171ffbe9823f2cc727fd" FOREIGN KEY ("tagId") REFERENCES public.tag(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4466 (class 2606 OID 10313343)
-- Name: stock_location_channels_channel FK_ff8150fe54e56a900d5712671a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_location_channels_channel
    ADD CONSTRAINT "FK_ff8150fe54e56a900d5712671a0" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


-- Completed on 2025-12-17 11:47:29 +05

--
-- PostgreSQL database dump complete
--

