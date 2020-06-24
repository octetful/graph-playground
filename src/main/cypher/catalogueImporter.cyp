LOAD CSV WITH HEADERS FROM 'file:///export.csv' AS row
MERGE (asset:Asset {id: row.ASSET_ID, title: row.ASSET_TITLE})
MERGE (assignor:Party {id: row.ASSIGNOR_ID, name: row.ASSIGNOR_NAME})
MERGE (assignee:Party {id: row.ASSIGNEE_ID, name: row.ASSIGNEE_NAME})
MERGE (contribution:Contribution {id: row.CONTRIBUTION_ID, share: row.CONTRIBUTION_SHARE, type: row.CONTRIBUTION_TYPE})
MERGE (assetShare:AssetShare {id: row.CONTRIBUTION_ID + row.ASSET_SHARE_OWNER_ID, share: row.ASSET_SHARE})

LOAD CSV WITH HEADERS FROM 'file:///export.csv' AS row
MATCH (contributor:Party {id: row.CONTRIBUTOR_ID}),(contribution1:Contribution {id: row.CONTRIBUTION_ID})
MERGE (contributor)-[r:contributed_to]->(contribution1)

LOAD CSV WITH HEADERS FROM 'file:///export.csv' AS row
MATCH (contribution2:Contribution {id: row.CONTRIBUTION_ID}), (asset1:Asset {id: row.ASSET_ID})
MERGE (contribution2)-[r1:portion_of]->(asset1)

LOAD CSV WITH HEADERS FROM 'file:///export.csv' AS row
MATCH (assetShare1:AssetShare {id: row.CONTRIBUTION_ID + row.ASSET_SHARE_OWNER_ID, share: row.ASSET_SHARE}), (assetOwner:Party {id: row.ASSET_SHARE_OWNER_ID})
MERGE (assetOwner)-[r2:is_owner]->(assetShare1)

LOAD CSV WITH HEADERS FROM 'file:///export.csv' AS row
MATCH (assetShare2:AssetShare {id: row.CONTRIBUTION_ID + row.ASSET_SHARE_OWNER_ID, share: row.ASSET_SHARE}), (contribution3:Contribution {id: row.CONTRIBUTION_ID})
MERGE (assetShare2)-[r3:portion_of]->(contribution3)

MATCH p = (asset2:Asset {title: 'Champagne Kiss'})-[*3]-(x)
RETURN p

MATCH p = (assignor1:Party {id: 'IP246257'})--(contribution4:Contribution)--(assetShare3:AssetShare)--(assignee:Party)
MATCH q = (contribution4)--(asset3:Asset {title:'Champagne Kiss'})
RETURN p, q

MATCH (n)
DETACH DELETE n