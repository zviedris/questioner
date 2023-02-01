START TRANSACTION;

CREATE TABLE response (
    id INT AUTO_INCREMENT NOT NULL,
    questioner_id INT NOT NULL,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
      FOREIGN KEY(questioner_id) 
	    REFERENCES questioner(id)
);

CREATE TABLE answer (
    id INT AUTO_INCREMENT NOT NULL,
    response_id INT NOT NULL,
    question_id INT NOT NULL,
    numeric_value INT,
    text_value VARCHAR(200),
    PRIMARY KEY(id),
    FOREIGN KEY(response_id) REFERENCES response(id),
    FOREIGN KEY(question_id) REFERENCES question(id)    
);

COMMIT;