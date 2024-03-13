USE MER4;
SELECT polissa.num_polissa as "Numero de la pòlissa", tipus_polissa.nom as "Nom pòlissa",
client.DNI, client.nom as "Nom client", client.cognom as "Cognom client"
FROM client, polissa, tipus_polissa
WHERE client.DNI = polissa.client_DNI and
tipus_polissa.idtipus_polissa = polissa.tipus_polissa_idtipus_polissa and 
tipus_polissa.nom = "Viatge";