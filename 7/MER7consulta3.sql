Use MER7;
select count(Linia_ticket.ID)
from Linia_ticket, Ticket, Empleat
WHERE Ticket.num=Linia_ticket.Ticket_num AND
Empleat.ID=Ticket.Empleat_ID AND
Empleat.nom LIKE "H%";