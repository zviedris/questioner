CREATE SEQUENCE questioner_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.questioner (
    id numeric DEFAULT nextval('public.questioner_seq'::regclass) NOT NULL,
    description character varying NOT NULL,
    code character varying NOT NULL,
    PRIMARY KEY(id)
);

CREATE SEQUENCE public.question_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.question (
    id numeric DEFAULT nextval('public.questions_seq'::regclass) NOT NULL,
    questioner_id numeric NOT NULL,
    code character varying NOT NULL,
    description character varying NOT NULL,
    type character varying NOT NULL,
    min_value numeric,
    max_value numeric,
    PRIMARY KEY(id),
    CONSTRAINT fk_questions_questioner
      FOREIGN KEY(questioner_id) 
	    REFERENCES questioner(id)
);

CREATE TABLE public.questions_statistic (
    question_id numeric NOT NULL,
    option_value numeric,
    answer_count numeric DEFAULT 0,
    answer_total_value numeric DEFAULT 0,
    PRIMARY KEY(question_id),
    CONSTRAINT fk_questions_statistic_questions
      FOREIGN KEY(question_id) 
	    REFERENCES questions(id)
);