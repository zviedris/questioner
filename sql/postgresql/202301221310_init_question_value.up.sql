insert into questioner (description, code)
values ('Test questioner', 'TEST');

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T1Q', 'First test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T1Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T2Q', 'Second test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T2Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T3Q', 'Third test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T3Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T4Q', 'Fourth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T4Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T5Q', 'Fifth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T5Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T6Q', 'Sixth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T6Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T7Q', 'Seventh test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T7Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T8Q', 'Eigth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T8Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T9Q', 'Ninth test question', 'NUM', 0, 5 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T9Q';

INSERT INTO question (questioner_id, code, description, type, min_value, max_value)
SELECT q.id, 'T10Q', 'Tenth test question', 'TEXT', 10, 400 
FROM questioner q
WHERE code='TEST';

INSERT INTO questions_statistic (question_id, answer_count, answer_total_value)
SELECT q.id, 0, 0
FROM question q
WHERE code='T10Q';