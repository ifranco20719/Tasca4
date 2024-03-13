use MER6;
select Reserves.data_reserva, Reserves.import_reserva, Vol.num_vol, Passatger.Nom, Passatger.Cognom
FROM Reserves, Vol, Passatger
where Passatger.ID=Reserves.Passatger_ID AND Vol.ID=Reserves.Vol_ID AND Passatger.Nom="Pepe"