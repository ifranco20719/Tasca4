USE MER7;
select Producte.nom, Producte.descripcio, Producte.IVA, Producte.preu_unitari
From Producte
Where Producte.IVA="4%"