use MER4;
SELECT client.nom as "Nom Client", client.cognom as "Cognom del client", polissa.num_polissa as "Número de pòlissa"
FROM client, polissa
WHERE client.DNI = polissa.client_DNI and client.nom="Jordi" and client.cognom="Barber"