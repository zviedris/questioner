DELETE FROM questions_statistic
WHERE question_id = ANY(
SELECT id FROM question
WHERE code  = ANY('{T1Q,T2Q,T3Q,T4Q,T5Q,T6Q,T7Q,T8Q,T9Q, T10Q}'::varchar[]));

DELETE FROM question
WHERE questioner_id = ANY(
SELECT id FROM questioner
WHERE code='TEST');

DELETE FROM questioner
WHERE code = 'TEST';