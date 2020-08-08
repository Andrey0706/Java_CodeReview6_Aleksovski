///////1. Retrieve data for all packages sent from Wien

SELECT package.package_id, package.date_received, sender.first_name, sender.last_name, zip_code.city, processing_system.current_status
FROM package INNER JOIN sender
ON package.sender_id = sender.sender_id
INNER JOIN address
ON sender.address_id = address.address_id
INNER JOIN zip_code
ON address.zip_code = zip_code.zip_code
INNER JOIN processing_system
ON package.package_id = processing_system.package_id
WHERE zip_code.city = 'Wien';



///////2. Retrieve data for all delivered packages

SELECT package.package_id, package.date_received, package.date_delivered, sender.first_name, sender.last_name, zip_code.city, employee.first_name, processing_system.current_status
FROM package INNER JOIN sender
ON package.sender_id = sender.sender_id
INNER JOIN address
ON sender.address_id = address.address_id
INNER JOIN zip_code
ON address.zip_code = zip_code.zip_code
INNER JOIN processing_system
ON package.package_id = processing_system.package_id
INNER JOIN employee
ON processing_system.employee_id = employee.employee_id
WHERE processing_system.current_status = 'delivered';



///////3. Retrieve all packages received in year 2019

SELECT sender.first_name, sender.last_name, package.package_id, package.date_received FROM sender
INNER JOIN package
ON package.sender_id = sender.sender_id
WHERE package.date_received BETWEEN '2019-01-01' AND '2019-12-31';


//////4. Retrieve data for all employees that are assigned to drive Mercedes

SELECT employee.employee_id, employee.first_name, employee.last_name, vehicle.vehicle_id, vehicle_data.brand FROM employee
INNER JOIN vehicle
ON vehicle.employee_id = employee.employee_id
INNER JOIN vehicle_data
ON vehicle_data.vehicle_id = vehicle.vehicle_id
WHERE vehicle_data.brand = 'Mercedes';


//////5. How many packages were sent from Viena

SELECT COUNT(*) FROM package
INNER JOIN sender
ON sender.sender_id = package.sender_id
INNER JOIN address
ON address.address_id = sender.address_id
INNER JOIN zip_code
ON zip_code.zip_code = address.zip_code
WHERE zip_code.city = 'Wien';

//////6. Display all packages received on 08.08.2020

SELECT sender.first_name, sender.last_name, package.package_id FROM sender
INNER JOIN package
ON sender.sender_id = package.sender_id
WHERE package.date_received BETWEEN '2020.08.07' AND '2020.08.09';