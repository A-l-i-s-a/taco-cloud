INSERT INTO public.ingredient(id, name, type)
	VALUES ('FLTO', 'Flour Tortilla', 0)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('COTO', 'Corn Tortilla', 0)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('GRBF', 'Ground Beef', 1)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('CARN', 'Carnitas', 1)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('TMTO', 'Diced Tomatoes', 2)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('LETC', 'Lettuce', 2)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('CHED', 'Cheddar', 3)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('JACK', 'Monterrey Jack', 3)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('SLSA', 'Salsa', 4)
    on conflict do nothing;

INSERT INTO public.ingredient(id, name, type)
	VALUES ('SRCR', 'Sour Cream', 4)
    on conflict do nothing;