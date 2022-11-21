-- PostgreSQL version 14.1

CREATE TYPE public.offer_type AS ENUM (
    'buy',
    'sell'
);

-- Таблица 'Пользователи'
CREATE TABLE public.users (
    id serial NOT NULL PRIMARY KEY,
    created_at timestamptz NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    avatar character varying(150)
);

-- Таблица 'Категории'
CREATE TABLE public.categories (
    id serial NOT NULL PRIMARY KEY,
    title character varying(100) NOT NULL,
    picture character varying(150),
    slug character varying(30)
);

-- Таблица 'Объявления'
CREATE TABLE public.offers (
    id serial NOT NULL PRIMARY KEY,
    created_at timestamptz NOT NULL,
    user_id integer NOT NULL,
    offer_type offer_type NOT NULL,
    title character varying(200) NOT NULL,
    full_text character varying(1000),
    price numeric(18,2),
    picture character varying(100)
);

-- Таблица 'Категория-объявление'
CREATE TABLE public.category_offer (
    category_id integer NOT NULL,
    offer_id integer NOT NULL
);

-- Таблица 'Комментарии к объявлениям'
CREATE TABLE public.comments (
    id serial NOT NULL PRIMARY KEY,
    created_at timestamptz NOT NULL,
    user_id integer NOT NULL,
    offer_id integer NOT NULL,
    comment_text character varying(1000)
);

--
-- Insert commands
-- 

-- Данные для таблицы "Пользователи"
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2021-10-19 11:23:54+03', 'Аня', 'Пучкова', '705da23959fa17c5d11d7a53a6157a19', 'Any.Bundle@vigil.com', 'https://placeimg.com/100/100/1');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-12-20 10:23:54+03', 'Кристина', 'Вязовая', '102f9e038bc0e1b7242000131c7223d5', 'Kristen.Elms@vigil.com', 'https://placeimg.com/100/100/2');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-11-20 11:23:54+03', 'Тиффани', 'Да-Со', 'a3b7c57bad6565c9551b7ce616c1cbbb', 'Tiffany.DaSo@vigil.com', 'https://placeimg.com/100/100/3');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-09-19 12:23:54+03', 'Тамара', 'Круглова', '205e8b242d2cd224d007b0052fc991bd', 'Toma.Round@vigil.com', 'https://placeimg.com/100/100/4');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-08-19 11:23:54+03', 'Костя', 'Буркин', 'b46489c11cc0cf01e2f987c0237263f9', 'Kost.Burke@vigil.com', 'https://placeimg.com/100/100/5');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-07-20 11:23:54+03', 'Игорь', 'Котёночкин', '01d4848202a3c7697ec037b02b4ee4e8', 'Gary.Kitten@vigil.com', 'https://placeimg.com/100/100/6');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-06-19 12:23:54+03', 'Борис', 'Добовой', '092f2ba9f39fbc2876e64d12cd662f72', 'Boris.Oakley@vigil.com', 'https://placeimg.com/100/100/7');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-05-20 10:23:54+03', 'Стивен', 'Круден', 'f87567f2159b425795ebb7ba9bc406ec', 'Stiv.Cruden@vigil.com', 'https://placeimg.com/100/100/8');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-04-19 11:23:54+03', 'Лариса', 'Михайловна', '37905b9b4fdb8fa311b30448254d51fe', 'Laura.Michaels@vigil.com', 'https://placeimg.com/100/100/9');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-03-20 11:23:54+03', 'Марк', 'Хилой', 'b82a9a13f4651e9abcbde90cd24ce2cb', 'Mark.Hill@vigil.com', 'https://placeimg.com/100/100/10');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2020-02-19 14:33:54+03', 'Женя', 'Колесов', '4d0fef3280b8c1356077de7363a8b893', 'Jay.Kohli@vigil.com', 'https://placeimg.com/100/100/11');
INSERT INTO public.users (created_at, first_name, last_name, password_hash, email, avatar) VALUES ('2019-01-20 11:25:54+03', 'Петя', 'Англичанин', '6fa95b1427af77b3d769ae9cb853382f', 'Peter.Ingles@vigil.com', 'https://placeimg.com/100/100/12');

-- Данные для таблицы категорий
INSERT INTO public.categories (title, picture, slug)  VALUES ('Вещи', 'https://images.deepai.org/art-image/03d3e6bbc01f48b1b19949f28c4b7ee6/stuff.jpg', 'stuff');
INSERT INTO public.categories (title, picture, slug)  VALUES ('Животные', 'https://images.deepai.org/art-image/28db48c5184447b482f1052e071e8275/animals.jpg', 'animals');
INSERT INTO public.categories (title, picture, slug)  VALUES ('Дома', 'https://images.deepai.org/art-image/52eb178e00ea4419a5f1464565eea54c/houses.jpg', 'houses');
INSERT INTO public.categories (title, picture, slug)  VALUES ('Одежда', 'https://images.deepai.org/art-image/864da0ccb0e84978ad178c1c981ca364/clothes.jpg', 'clothes');
INSERT INTO public.categories (title, picture, slug)  VALUES ('Услуги', 'https://images.deepai.org/art-image/ccba62a404254e36b6c17d973e5b9af9/service.jpg', 'service');
INSERT INTO public.categories (title, picture, slug)  VALUES ('Машины', 'https://images.deepai.org/art-image/c1461639b37349e981384d479aa96972/cars.jpg', 'cars');
INSERT INTO public.categories (title, picture, slug)  VALUES ('Дети', 'https://images.deepai.org/art-image/3a7b4afdc73a42c6b0d29de05388b1e9/toys.jpg', 'toys');
INSERT INTO public.categories (title, picture, slug)  VALUES ('Оружие', 'https://images.deepai.org/art-image/9f00967678914ebcbae8ad34fafca566/arms.jpg', 'arms');

-- Данные для таблицы "Объявления"
INSERT INTO public.offers (created_at, user_id, offer_type, title, full_text, price, picture) VALUES ('2021-11-14 08:23:54+03', 1, 'buy', 'Старая кулинарная книга', 'Пожалуйста, купите уже эту книгу!', 100.00, 'https://placeimg.com/640/480/book');
INSERT INTO public.offers (created_at, user_id, offer_type, title, full_text, price, picture) VALUES ('2021-11-13 08:23:54+03', 2, 'sell', 'Набор DVD с Джеки Чаном', 'Эту вещь я продаю в последнюю очередь, даже не надейтесь купить этот замечательный набор!', 150.00, 'https://placeimg.com/640/480/dvd');
INSERT INTO public.offers (created_at, user_id, offer_type, title, full_text, price, picture) VALUES ('2021-11-12 08:23:54+03', 2, 'sell', 'Жирный котик', 'Кто-нибудь, избавьте меня от этого вечно голодного животного', 0, 'https://placeimg.com/640/480/cat');
INSERT INTO public.offers (created_at, user_id, offer_type, title, full_text, price, picture) VALUES ('2021-11-11 08:23:54+03', 3, 'sell', 'SSD диск', 'Содержит top-secret mi-6 информацию. Но это не точно, я ниго не увидел внутри, когда открыл...', 2000.00, 'https://placeimg.com/640/480/ssd');
INSERT INTO public.offers (created_at, user_id, offer_type, title, full_text, price, picture) VALUES ('2020-12-12 08:23:54+03', 4, 'buy', 'Дом', 'Мне негде жить после выхода из тюрьмы. Очень нужно место, где мы с корешами сможем бросить кости.', 10000.00, 'https://placeimg.com/640/480/house');
INSERT INTO public.offers (created_at, user_id, offer_type, title, full_text, price, picture) VALUES ('2020-12-11 08:23:54+03', 5, 'sell', 'Любимая майка', 'Красная поношенная унисекс майка на все случаи жизни. Почти даром.', 90.00, 'https://placeimg.com/640/480/shirt');
INSERT INTO public.offers (created_at, user_id, offer_type, title, full_text, price, picture) VALUES ('2021-11-22 23:23:54+03', 5, 'sell', 'Лицензия на управление субмариной', 'Очень нужная вещь в ближайшем будущем. Если разразится третья мировая, то вы сможете спастись в океане.', 200000.00, 'https://placeimg.com/640/480/licence');

-- Данные для таблицы "Категория-объявление"
INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 1);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 2);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (2, 3);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 4);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (3, 5);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (4, 6);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (1, 7);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (3, 7);
INSERT INTO public.category_offer (category_id, offer_id) VALUES (5, 7);

-- Данные для таблицы "Комментарии"
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-11-15 08:21:54+03', 2, 1, 'Подожди-как секундочку...');
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-11-16 08:22:54+03', 4, 2, 'Нет! Ни за что!');
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-11-17 08:23:54+03', 1, 3, 'И сколько же эта штука стоит?');
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-11-18 08:24:54+03', 5, 1, 'Я ДОЛЖЕН ЭТО КУПИТЬ!');
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-12-15 09:21:54+03', 7, 1, 'Не трать время на это, приятель!');
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-12-16 09:22:54+03', 1, 2, 'Выглядит очень интересно, и качество хорошее, и цена приятная.');
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-12-17 09:23:54+03', 6, 3, 'Я смогу позволить себе купить это только через год. Сможешь дождаться?');
INSERT INTO public.comments (created_at, user_id, offer_id, comment_text) VALUES ('2021-12-18 09:24:54+03', 3, 1, 'Эй, эта вещи выглядит так, словно её только что пожевали и выплюнули!');

--
-- Sequences, Keys
--

ALTER TABLE ONLY public.category_offer
    ADD CONSTRAINT fk_category_categoryoffer FOREIGN KEY (category_id) REFERENCES public.categories(id);

ALTER TABLE ONLY public.category_offer
    ADD CONSTRAINT fk_offer_categoryoffer FOREIGN KEY (offer_id) REFERENCES public.offers(id);

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_offer_comment FOREIGN KEY (offer_id) REFERENCES public.offers(id);

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_user_comment FOREIGN KEY (user_id) REFERENCES public.users(id);

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT fk_user_offer FOREIGN KEY (user_id) REFERENCES public.users(id);