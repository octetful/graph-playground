CREATE (allison:Party {name: 'Allison'})
CREATE (mulika:Party {name: 'Mulika'})
CREATE (leo:Party {name: 'Leo'})
CREATE (kevin_jones:Party {name: 'Kevin Jones'})
CREATE (johannes_refsdal:Party {name: 'Johannes Refsdal'})
CREATE (andrew_davie:Party {name: 'Andrew Davie'})
CREATE (justin_paul:Party {name: 'Justin Paul'})
CREATE (benj_pasek:Party {name: 'Benj Pasek'})
CREATE (kobalt_us:Party {name: 'Kobalt US'})
CREATE (amra:Party {name: 'AMRA'})
CREATE (kobalt_uk:Party {name: 'Kobalt UK'})

CREATE (kmg:Group {name: 'KMG'})

CREATE (bears_den:Prospect {name: 'Bears Den'})

CREATE (deal_1:Deal {name: 'Deal 1'})

CREATE (contract_1:Contract {name: 'Contract 1'})

CREATE (account_1:Account {name: 'Acc 1'})
CREATE (account_2:Account {name: 'Acc 2'})
CREATE (account_3:Account {name: 'Acc 3'})
CREATE (account_4:Account {name: 'Acc 4'})
CREATE (account_5:Account {name: 'Acc 5'})
CREATE (account_6:Account {name: 'Acc 6'})
CREATE (account_7:Account {name: 'Acc 7'})
CREATE (account_8:Account {name: 'Acc 8'})
CREATE (account_9:Account {name: 'Acc 9'})
CREATE (account_10:Account {name: 'Acc 10'})

CREATE (bears_den)-[:deal_prospect]->(deal_1)
CREATE (allison)-[:is_dealmaker]->(deal_1)
CREATE (deal_1)-[:is_documented_in]->(contract_1)
CREATE (mulika)-[:is_negotiator]->(contract_1)
CREATE (leo)-[:is_admin_owner]->(contract_1)
CREATE (account_1)-[:is_managed_by]->(contract_1)
CREATE (account_2)-[:is_managed_by]->(contract_1)
CREATE (account_3)-[:is_managed_by]->(contract_1)
CREATE (kevin_jones)-[:is_assignor]->(account_3)
CREATE (johannes_refsdal)-[:is_assignor]->(account_2)
CREATE (andrew_davie)-[:is_assignor]->(account_1)
CREATE (benj_pasek)-[:is_assignor]->(account_4)
CREATE (benj_pasek)-[:is_assignor]->(account_5)
CREATE (justin_paul)-[:is_assignor]->(account_6)
CREATE (kobalt_us)-[:is_assignor]->(account_7)
CREATE (kobalt_us)-[:is_assignor]->(account_8)
CREATE (kobalt_us)-[:is_assignor]->(account_9)
CREATE (kobalt_uk)-[:is_assignor]->(account_10)


CREATE (kobalt_uk)-[:is_acquirer]->(account_1)
CREATE (kobalt_uk)-[:is_acquirer]->(account_2)
CREATE (kobalt_uk)-[:is_acquirer]->(account_3)

CREATE (kobalt_us)-[:is_acquirer]->(account_4)
CREATE (kobalt_us)-[:is_acquirer]->(account_5)
CREATE (kobalt_us)-[:is_acquirer]->(account_6)

CREATE (amra)-[:is_acquirer]->(account_7)
CREATE (amra)-[:is_acquirer]->(account_8)
CREATE (amra)-[:is_acquirer]->(account_9)
CREATE (amra)-[:is_acquirer]->(account_10)

CREATE (amra)-[:is_subsidiary]->(kmg)
CREATE (kobalt_us)-[:is_subsidiary]->(kmg)
CREATE (kobalt_uk)-[:is_subsidiary]->(kmg)


MATCH p=(allison:Party)-[:is_dealmaker]->(:Deal)-[:is_documented_in]->(:Contract)<-[:is_managed_by]-(:Account)<-[:is_acquirer]-(party:Party)-[:is_subsidiary]->(group:Group)
  WHERE allison.name='Allison'
RETURN DISTINCT group.name, party.name



MATCH (n)
DETACH DELETE n
