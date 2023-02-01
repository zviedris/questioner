CREATE SEQUENCE public.answer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 100;

CREATE TABLE public.answer (
    id numeric DEFAULT nextval('public.answer_seq'::regclass) NOT NULL,
    response_id numeric NOT NULL,
    question_id numeric NOT NULL,
    numeric_value numeric,
    text_value character varying,
    PRIMARY KEY(id),
    CONSTRAINT fk_answer_response
      FOREIGN KEY(response_id) 
	    REFERENCES response(id),
    CONSTRAINT fk_answer_question
      FOREIGN KEY(question_id) 
	    REFERENCES question(id)    
);