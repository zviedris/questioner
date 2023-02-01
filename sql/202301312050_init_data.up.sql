START TRANSACTION;
INSERT INTO question_statistic (question_id, option_value, answer_count)
SELECT q.id, 0, 0
FROM question q
WHERE code<>'T10Q';

INSERT INTO question_statistic (question_id, option_value, answer_count)
SELECT q.id, 1, 0
FROM question q
WHERE code<>'T10Q';

INSERT INTO question_statistic (question_id, option_value, answer_count)
SELECT q.id, 2, 0
FROM question q
WHERE code<>'T10Q';

INSERT INTO question_statistic (question_id, option_value, answer_count)
SELECT q.id, 3, 0
FROM question q
WHERE code<>'T10Q';

INSERT INTO question_statistic (question_id, option_value, answer_count)
SELECT q.id, 4, 0
FROM question q
WHERE code<>'T10Q';

INSERT INTO question_statistic (question_id, option_value, answer_count)
SELECT q.id, 5, 0
FROM question q
WHERE code<>'T10Q';
COMMIT;