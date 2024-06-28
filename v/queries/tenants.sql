select
    tenant.id,
    contract.*
from 
    contract
    inner join tenant on contract.tenant=tenant.tenant
where
    tenant.id='mzalendo'