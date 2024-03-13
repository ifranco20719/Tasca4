USE MER6;
SELECT Passatger.DNI, Passatger.Nom, Passatger.Cognom, Vol.num_vol, Vol.origen, Vol.desti, Reserves.import_reserva
FROM Passatger, Vol, Reserves
WHERE Passatger.ID=Reserves.Passatger_ID AND
	Vol.ID=Reserves.Passatger_ID;