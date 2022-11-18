--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

CREATE TYPE public.offer_type AS ENUM (
    'Buy',
    'Sell'
);

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    picture character varying(100),
    slug character varying(100)
);

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.category_offer (
    category_id integer NOT NULL,
    offer_id integer NOT NULL
);

CREATE TABLE public.comments (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer DEFAULT 1 NOT NULL,
    offer_id integer NOT NULL,
    Comment_text character varying(1000)
);

ALTER TABLE public.comments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.offers (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer DEFAULT 1 NOT NULL,
    offer_type public.offer_type NOT NULL,
    title character varying(255) NOT NULL,
    full_text character varying(1000),
    price numeric(18,2),
    picture character varying(100)
);

ALTER TABLE public.offers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.users (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    avatar character varying(100)
);

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

--
-- Insert commands
-- 

INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (1, 'Stuff', 'https://images.deepai.org/art-image/03d3e6bbc01f48b1b19949f28c4b7ee6/stuff.jpg', 'stuff-1');
INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (2, 'Animals', 'https://images.deepai.org/art-image/28db48c5184447b482f1052e071e8275/animals.jpg', 'animals-2');
INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (3, 'Houses', 'https://images.deepai.org/art-image/52eb178e00ea4419a5f1464565eea54c/houses.jpg', 'houses-3');
INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (4, 'Clothes', 'https://images.deepai.org/art-image/864da0ccb0e84978ad178c1c981ca364/clothes.jpg', 'clothes-4');
INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (5, 'Service', 'https://images.deepai.org/art-image/ccba62a404254e36b6c17d973e5b9af9/service.jpg', 'service-5');
INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (6, 'Cars', 'https://images.deepai.org/art-image/c1461639b37349e981384d479aa96972/cars.jpg', 'cars-6');
INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (7, 'Toys', 'https://images.deepai.org/art-image/3a7b4afdc73a42c6b0d29de05388b1e9/toys.jpg', 'toys-7');
INSERT INTO public.categories (id, title, picture, slug) OVERRIDING SYSTEM VALUE VALUES (8, 'Arms', 'https://images.deepai.org/art-image/9f00967678914ebcbae8ad34fafca566/arms.jpg', 'arms-8');

INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 1);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 2);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (2, 3);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 4);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (3, 5);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (4, 6);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 7);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (3, 7);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (5, 7);

INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (1, '2021-11-15 08:21:54+03', 2, 1, 'Wait');
INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (2, '2021-11-16 08:22:54+03', 1, 2, 'No!');
INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (3, '2021-11-17 08:23:54+03', 1, 3, 'Quanto costa?');
INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (4, '2021-11-18 08:24:54+03', 5, 1, 'I will Buy it');
INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (5, '2021-12-15 09:21:54+03', 2, 1, 'Dont wait!');
INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (6, '2021-12-16 09:22:54+03', 1, 2, 'Et aperiam nihil cum quasi voluptatem cum aspernatur explicabo ab impedit repellendus');
INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (7, '2021-12-17 09:23:54+03', 1, 3, 'Et commodi dicta ea illo cumque rem eaque Quis. Aut dicta corporis qui tenetur dolorum aut culpa illo?');
INSERT INTO public.comments (id, created_at, user_id, offer_id, comment_text) OVERRIDING SYSTEM VALUE VALUES (8, '2021-12-18 09:24:54+03', 5, 1, 'Et esse labore qui ipsam minima ea voluptates alias et sunt delectus?');

INSERT INTO public.offers (id, created_at, user_id, offer_type, title, full_text, price, picture) OVERRIDING SYSTEM VALUE VALUES (1, '2021-11-14 08:23:54+03', 1, 'Buy', 'Book', 'Please help!', 100.00, 'https://placeimg.com/640/480/book');
INSERT INTO public.offers (id, created_at, user_id, offer_type, title, full_text, price, picture) OVERRIDING SYSTEM VALUE VALUES (2, '2021-11-13 08:23:54+03', 2, 'Sell', 'DVD', 'Here is one stuff…', 150.00, 'https://placeimg.com/640/480/dvd');
INSERT INTO public.offers (id, created_at, user_id, offer_type, title, full_text, price, picture) OVERRIDING SYSTEM VALUE VALUES (3, '2021-11-12 08:23:54+03', 2, 'Sell', 'Cat', 'Anybody take away this hungry animal', NULL, 'https://placeimg.com/640/480/cat');
INSERT INTO public.offers (id, created_at, user_id, offer_type, title, full_text, price, picture) OVERRIDING SYSTEM VALUE VALUES (4, '2021-11-11 08:23:54+03', 3, 'Sell', 'SSD', 'top-secret mi-6 information on the disk', 2000.00, 'https://placeimg.com/640/480/ssd');
INSERT INTO public.offers (id, created_at, user_id, offer_type, title, full_text, price, picture) OVERRIDING SYSTEM VALUE VALUES (5, '2020-12-12 08:23:54+03', 4, 'Buy', 'House', 'I have no place to live (after prison)', 10000.00, 'https://placeimg.com/640/480/house');
INSERT INTO public.offers (id, created_at, user_id, offer_type, title, full_text, price, picture) OVERRIDING SYSTEM VALUE VALUES (6, '2020-12-11 08:23:54+03', 5, 'Sell', 'Shirt', 'Red everyday unisex-shirt, very cheap!', 90.00, 'https://placeimg.com/640/480/shirt');
INSERT INTO public.offers (id, created_at, user_id, offer_type, title, full_text, price, picture) OVERRIDING SYSTEM VALUE VALUES (7, '2021-11-22 23:23:54+03', 5, 'Sell', 'Submarine licence', '', 200000.00, 'https://placeimg.com/640/480/licence');

INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (1, '2021-10-19 11:23:54+03', 'Amy', 'Silva', '705da23959fa17c5d11d7a53a6157a19', 'Amy.Silva@vigil.com', 'https://placeimg.com/100/100/1');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (2, '2020-12-20 10:23:54+03', 'Kirsten', 'Longacre', '102f9e038bc0e1b7242000131c7223d5', 'Kirsten.Longacre@vigil.com', 'https://placeimg.com/100/100/2');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (3, '2020-11-20 11:23:54+03', 'Tiffany', 'Docherty', 'a3b7c57bad6565c9551b7ce616c1cbbb', 'Tiffany.Docherty@vigil.com', 'https://placeimg.com/100/100/3');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (4, '2020-09-19 12:23:54+03', 'Tara', 'Kierly', '205e8b242d2cd224d007b0052fc991bd', 'Tara.Kierly@vigil.com', 'https://placeimg.com/100/100/4');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (5, '2020-08-19 11:23:54+03', 'Craig', 'Burke', 'b46489c11cc0cf01e2f987c0237263f9', 'Craig.Burke@vigil.com', 'https://placeimg.com/100/100/5');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (6, '2020-07-20 11:23:54+03', 'Gary', 'Walsh', '01d4848202a3c7697ec037b02b4ee4e8', 'Gary.Walsh@vigil.com', 'https://placeimg.com/100/100/6');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (7, '2020-06-19 12:23:54+03', 'Ben', 'Oakley', '092f2ba9f39fbc2876e64d12cd662f72', 'Ben.Oakley@vigil.com', 'https://placeimg.com/100/100/7');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (8, '2020-05-20 10:23:54+03', 'Patrick', 'Cruden', 'f87567f2159b425795ebb7ba9bc406ec', 'Patrick.Cruden@vigil.com', 'https://placeimg.com/100/100/8');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (9, '2020-04-19 11:23:54+03', 'Laura', 'Michaels', '37905b9b4fdb8fa311b30448254d51fe', 'Laura.Michaels@vigil.com', 'https://placeimg.com/100/100/9');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (10, '2020-03-20 11:23:54+03', 'Mark', 'Hill', 'b82a9a13f4651e9abcbde90cd24ce2cb', 'Mark.Hill@vigil.com', 'https://placeimg.com/100/100/10');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (11, '2020-02-19 14:33:54+03', 'Jay', 'Kohli', '4d0fef3280b8c1356077de7363a8b893', 'Jay.Kohli@vigil.com', 'https://placeimg.com/100/100/11');
INSERT INTO public.users (id, created_at, first_name, last_name, password_hash, email, avatar) OVERRIDING SYSTEM VALUE VALUES (12, '2019-01-20 11:25:54+03', 'Peter', 'Ingles', '6fa95b1427af77b3d769ae9cb853382f', 'Peter.Ingles@vigil.com', 'https://placeimg.com/100/100/12');

--
-- Sequences, Keys
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);

SELECT pg_catalog.setval('public.comments_id_seq', 4, true);

SELECT pg_catalog.setval('public.offers_id_seq', 8, true);

SELECT pg_catalog.setval('public.users_id_seq', 12, true);

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.category_offer
    ADD CONSTRAINT fk_category_categoryoffer FOREIGN KEY (Category_id) REFERENCES public.categories(id);

ALTER TABLE ONLY public.category_offer
    ADD CONSTRAINT fk_offer_categoryoffer FOREIGN KEY (Offer_id) REFERENCES public.offers(id);

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_offer_comment FOREIGN KEY (Offer_id) REFERENCES public.offers(id);

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_user_comment FOREIGN KEY (User_id) REFERENCES public.users(id);

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT fk_user_offer FOREIGN KEY (User_id) REFERENCES public.users(id);