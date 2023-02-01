START TRANSACTION;

CREATE TABLE questioner (
    id INT NOT NULL AUTO_INCREMENT,
    description VARCHAR(200) NOT NULL,
    code VARCHAR(10) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE question (
    id INT NOT NULL AUTO_INCREMENT,
    questioner_id INT NOT NULL,
    code VARCHAR(10) NOT NULL,
    description VARCHAR(200) NOT NULL,
    type VARCHAR(50) NOT NULL,
    min_value INT,
    max_value INT,
    PRIMARY KEY(id),
    FOREIGN KEY(questioner_id) 
	    REFERENCES questioner(id)    
);

CREATE TABLE question_statistic (    
    question_id INT NOT NULL,
    option_value INT,
    answer_count INT DEFAULT 0,
    FOREIGN KEY(question_id) 
	    REFERENCES question(id)
);

COMMIT;
