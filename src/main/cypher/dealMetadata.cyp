CREATE (creative_prospect_1:Prospect {name: 'Creative Prospect: 1'})
CREATE (creative_prospect_2:Prospect {name: 'Creative Prospect: 2'})
CREATE (party_1:Party {name: 'Party: 1'})
CREATE (party_2:Party {name: 'Party: 2'})
CREATE (deal_1:Deal {name: 'Deal 1'})
CREATE (deal_2:Deal {name: 'Deal 2'})
CREATE (deal_3:Deal {name: 'Deal 3'})
CREATE (creative_prospect_1)-[:deal_prospect]->(deal_1)
CREATE (creative_prospect_1)-[:deal_prospect]->(deal_2)
CREATE (creative_prospect_2)-[:deal_prospect]->(deal_3)
CREATE (party_1)-[:is_dealmaker]->(deal_1)
CREATE (party_2)-[:is_dealmaker]->(deal_2)
CREATE (party_2)-[:is_dealmaker]->(deal_3)

MATCH p=(party)-[r:is_dealmaker]->(deal) WHERE party.name='Party: 1' RETURN p






MATCH (n)
DETACH DELETE n