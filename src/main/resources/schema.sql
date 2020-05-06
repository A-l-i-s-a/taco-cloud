-- Table: public.app_user

-- DROP TABLE public.app_user;

CREATE TABLE IF NOT EXISTS public.app_user
(
    id bigint NOT NULL,
    city character varying(255) COLLATE pg_catalog."default",
    fullname character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    phone_number character varying(255) COLLATE pg_catalog."default",
    state character varying(255) COLLATE pg_catalog."default",
    street character varying(255) COLLATE pg_catalog."default",
    username character varying(255) COLLATE pg_catalog."default",
    zip character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT app_user_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.app_user
    OWNER to root;

-- Table: public.ingredient

-- DROP TABLE public.ingredient;

CREATE TABLE  IF NOT EXISTS  public.ingredient
(
    id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    type integer,
    CONSTRAINT ingredient_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.ingredient
    OWNER to root;

-- Table: public.taco

-- DROP TABLE public.taco;

CREATE TABLE IF NOT EXISTS public.taco
(
    id bigint NOT NULL,
    created_at timestamp without time zone,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT taco_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.taco
    OWNER to root;

-- Table: public.taco_ingredients

-- DROP TABLE public.taco_ingredients;

CREATE TABLE IF NOT EXISTS public.taco_ingredients
(
    taco_id bigint NOT NULL,
    ingredients_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT fk27rycuh3mjaepnba0j6m8xl4q FOREIGN KEY (taco_id)
        REFERENCES public.taco (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk7y679y77n5e75s3ss1v7ff14j FOREIGN KEY (ingredients_id)
        REFERENCES public.ingredient (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.taco_ingredients
    OWNER to root;

-- Table: public.taco_order_tacos

-- DROP TABLE public.taco_order_tacos;

CREATE TABLE IF NOT EXISTS public.taco_order_tacos
(
    order_id bigint NOT NULL,
    tacos_id bigint NOT NULL,
    CONSTRAINT fkcxwvdkndaqmrxcen10vkneexo FOREIGN KEY (order_id)
        REFERENCES public.taco_order (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkfwvqtnjfview9e5f7bfqtd1ns FOREIGN KEY (tacos_id)
        REFERENCES public.taco (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.taco_order_tacos
    OWNER to root;