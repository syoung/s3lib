CREATE TABLE IF NOT EXISTS flow
(
    username            VARCHAR(30) NOT NULL,
    project             VARCHAR(20) NOT NULL,
    workflow            VARCHAR(20) NOT NULL,
    workflownumber      INT(12),
    controltype         VARCHAR(20),
    controlnumber       INT(12),
    
    PRIMARY KEY  (username, project, workflow, workflownumber)
);