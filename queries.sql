--Find bestillinger fra kunde Nr. 5
SELECT * FROM bestilling
WHERE kundeNr = 5;

--Find alle bestillinger, der ikke skal spises in-house
SELECT * FROM bestilling WHERE BordNr IS NULL;

--Find alle pizzaer, der har pepperoni i sine toppings
SELECT * FROM pizzaer WHERE Toppings LIKE '%pepperoni%';

--Find alle pizzaer, der IKKE har tomatsovs i sine toppings
SELECT * FROM pizzaer WHERE Toppings NOT LIKE '%tomato sauce%';

--Find alle bestillinger, hvor kommentaren siger noget om ost
SELECT * FROM bestilling WHERE Kommentarer LIKE '%ost%';

--Find alle kunder som har postnumre med ”74”
SELECT * from kundeinfo WHERE kundeinfo.Leveringsaddresse LIKE "%74%";

--Find alle bestillinger som har et bordnummer, og som har en kommentar
SELECT * FROM bestilling
WHERE (bordNr IS NOT NULL) AND (kommentarer NOT LIKE '');

--Vis alle pizzaer der koster over 100.-
SELECT pizzaer.pizzanr AS 'Pizza Nr.', pizzaer.navn AS 'Pizza', pizzaer.pris AS 'Pris' FROM pizzaer
WHERE pizzaer.pris > 100
ORDER BY pizzaer.pizzanr;

--Vis alle bestillinger, deres pris og hvilken kunde der lavede dem
SELECT bestilling.BestillingsNr AS Ordrenummer, bestilling.PizzaNr AS "Menu punkt", pizzaer.Navn AS Type, pizzaer.pris AS Pris, kundeinfo.KundeNavn AS Navn
FROM bestilling
JOIN pizzaer ON pizzaer.PizzaNr = bestilling.PizzaNr
JOIN kundeinfo ON kundeinfo.KundeNr = bestilling.KundeNr;

--Find navne på kunder, og pizzaerne de har bestilt
SELECT kundeinfo.kundenavn AS 'Kunde', pizzaer.pizzanr AS 'Pizza Nr.', pizzaer.navn AS 'Pizza' FROM kundeinfo
INNER JOIN bestilling
	ON kundeinfo.kundenr = bestilling.kundenr
INNER JOIN pizzaer
	ON bestilling.pizzanr = pizzaer.pizzanr
ORDER BY pizzaer.pizzanr;
