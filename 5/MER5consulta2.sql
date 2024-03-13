USE MER5;
SELECT Client.nom, Vehicle.marca, tipus_vehicle.nom, Cita.ubicacio, client_vehicle.data_fi
FROM Client, Vehicle, tipus_vehicle, Cita, client_vehicle
WHERE Client.DNI=client_vehicle.Client_DNI AND
	Vehicle.num_carroseria=client_vehicle.Vehicle_ID AND
    tipus_vehicle.id=Vehicle.tipus_vehicle_id AND
    client_vehicle.id=Cita.Client_DNI;