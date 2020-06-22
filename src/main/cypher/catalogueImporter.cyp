LOAD CSV WITH HEADERS FROM 'file:///export.csv' AS row
MERGE (asset:Asset {id: row.ASSET_ID, title: row.ASSET_TITLE})
MERGE (assignor:Party {id: row.ASSIGNOR_ID, name: row.ASSIGNOR_NAME})
MERGE (assignee:Party {id: row.ASSIGNEE_ID, name: row.ASSIGNEE_NAME})
MERGE (contribution:Contribution {id: row.CONTRIBUTION_ID, share: row.CONTRIBUTION_SHARE, type: row.CONTRIBUTION_TYPE})

LOAD CSV WITH HEADERS FROM 'file:///export.csv' AS row
MATCH (contributor:Party {id: row.CONTRIBUTOR_ID}),(contribution1:Contribution {id: row.CONTRIBUTION_ID})
MERGE (contributor)-[r:contributed_to]->(contribution1)



MATCH (n)
DETACH DELETE n