CREATE (pallawi:Person {name:'Pallawi'})
CREATE (manisha:Person {name:'Manisha'})
CREATE (ganeshan:Person {name:'Ganeshan'})
CREATE (sid:Person {name:'Sid'})
CREATE (ganeshan)-[:friendOf]->(pallawi)
CREATE (manisha)-[:friendOf]->(pallawi)
CREATE (pallawi)-[:friendOf]->(sid)

MATCH p=()-[r:friendOf]->(pallawi) RETURN p

MATCH p=(ganeshan {name:'Ganeshan'})-[:friendOf]->()-[:friendOf]->(fof) RETURN p

MATCH (n)
DETACH DELETE n