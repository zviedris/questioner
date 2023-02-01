CREATE SEQUENCE public.response_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;

CREATE TABLE public.response (
    id numeric DEFAULT nextval('public.response_seq'::regclass) NOT NULL,
    questioner_id numeric NOT NULL,
    time timestamp NOT NULL DEFAULT (now() at time zone 'utc'),
    PRIMARY KEY(id),
    CONSTRAINT fk_response_questioner
      FOREIGN KEY(questioner_id) 
	    REFERENCES questioner(id)
);