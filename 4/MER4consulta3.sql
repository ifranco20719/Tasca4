USE MER4;
Select client.nom, client.cognom, venedor.nom, venedor.cognom, polissa.num_polissa, tipus_polissa.nom
From client, venedor, polissa, tipus_polissa
where client.DNI = polissa.client_DNI and venedor.DNI=polissa.venedor_DNI and
tipus_polissa.idtipus_polissa = polissa.tipus_polissa_idtipus_polissa;