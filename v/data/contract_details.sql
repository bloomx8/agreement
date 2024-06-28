/*
To collect the Contract details, we need to retrieve information about the client
from the CLIENT TABLE,details about the agreement that exists between the landlord
and the tenant(client) in the agreement table, and the details about the room
the client occupies.
To Compile a contract, I need:-
1. Name of the Client/ Name of the Company represented by the client
2. Contact Details of the client.
3. Legibility of the client for V.A.T,i.e., the client will pay  VAT through our company.(Later)
4. The start_date of the agreement
5. The end date of the agreement
6. The amount dictated in the agreement.
7. The manner in which the client will pay thier rent either monthly|quarterly
8. The Duration of the contract
9. The Room(s) number occupied by the client
10. The floor.(Optional)
11. The relevant Deposits such as(2 months of rent, water and sewarage deposit, KPLC Deposit)(Optional)
*/
select
    client.name as client_name,
    client.title as client_org,
    room.title as room_name,
    #
    #Combine the client's email, phone, and physical address.There may be more than one
    JSON_ARRAY(client.email, client.phone, client.address) as client_contacts,
    agreement.start_date,
    #
    #We can obtain the end date of the contract by adding the review period to the start_date
    DATE_ADD(agreement.start_date, interval (agreement.duration)year) as end_date,
    agreement.amount,
    client.quarterly,
    agreement.duration as duration_in_years,
    room.uid as client_room,
    room.floor
from agreement
    inner join client on agreement.client=client.client
    inner join room on agreement.room=room.room
order by client.name;


