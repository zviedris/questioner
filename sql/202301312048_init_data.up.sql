START TRANSACTION;

insert into questioner (description, code)
values ('Test questioner', 'TEST');

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T1Q', 'First test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T2Q', 'Second test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T3Q', 'Third test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T4Q', 'Fourth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T5Q', 'Fifth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T6Q', 'Sixth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T7Q', 'Seventh test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T8Q', 'Eigth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T9Q', 'Ninth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';
INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T10Q', 'Tenth test question', 'TEXT', 10, 200 
FROM questioner q
WHERE code='TEST';
COMMIT;