USE MER7;
select Ticket.num_factura, Ticket.data_ticket, Empleat.nom, Empleat.cognom
FROM Ticket, Empleat, Producte, Linia_ticket
WHERE Producte.ID = Linia_ticket.Producte_ID AND
Ticket.num = Linia_ticket.Ticket_num AND
Empleat.ID = Ticket.Empleat_ID AND
Producte.nom="P%";