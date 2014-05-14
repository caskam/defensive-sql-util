/* 
Table REMISPRD.VLDTN_ERR_MSG_FRWK meta data
Volumetrics : 
     Initial Rows : < 1000 
     Max Rows : N/A 
     Grow By : N/A  
Entity Security Category Description :
     CONFIDENTIALITY = LOW
     INTEGRITY = LOW
     AVAILABILITY = LOW
Entity Requirement ID : REMIS 8.0
Entity Data Source : REMIS Error code table
*/

DECLARE
  cnt_v number  (2) := 0;

BEGIN

  SELECT COUNT(*) 
  INTO   cnt_v 
  FROM   all_objects 
  WHERE  object_name = 'VLDTN_ERR_MSG_FRWK' 
    AND  owner = 'REMISPRD' 
    AND  object_type='TABLE';

  if (cnt_v = 0) then

     EXECUTE IMMEDIATE 'CREATE TABLE REMISPRD.VLDTN_ERR_MSG_FRWK
   	(
	  	ERR_CD NUMBER NOT NULL,
	  	ERR_MSG VARCHAR( 255 ) NOT NULL,
	  	WRNG_SW NUMBER( 1 ) NOT NULL,
	  	ACTV_SW NUMBER( 1 ) NOT NULL,
		  CREAT_TIME TIMESTAMP NOT NULL,
	  	UPDT_TIME TIMESTAMP NOT NULL,
		
	  	CONSTRAINT VLDTN_ERR_MSG_FRWK_PK PRIMARY KEY ( ERR_CD )
  	)';

       -- Add comments to the table 
    EXECUTE IMMEDIATE 'COMMENT ON TABLE REMISPRD.VLDTN_ERR_MSG_FRWK is ''Contains all of the error (and warning) messages produced in the REMIS application..''';
    -- Add comments to the columns
    EXECUTE IMMEDIATE 'COMMENT ON COLUMN REMISPRD.VLDTN_ERR_MSG_FRWK.ERR_CD IS ''Unique error code used to lookup the error message.e''';
    EXECUTE IMMEDIATE 'COMMENT ON COLUMN REMISPRD.VLDTN_ERR_MSG_FRWK.ERR_MSG IS ''The error message text to display.''';
    EXECUTE IMMEDIATE 'COMMENT ON COLUMN REMISPRD.VLDTN_ERR_MSG_FRWK.WRNG_SW IS ''Flag indicating whether the message is just a warning or an error.''';
    EXECUTE IMMEDIATE 'COMMENT ON COLUMN REMISPRD.VLDTN_ERR_MSG_FRWK.ACTV_SW IS ''Flag indicating whether or not the error is actively in use by the system.''';
    EXECUTE IMMEDIATE 'COMMENT ON COLUMN REMISPRD.VLDTN_ERR_MSG_FRWK.CREAT_TIME IS ''Time the error was inserted into the database.''';
    EXECUTE IMMEDIATE 'COMMENT ON COLUMN REMISPRD.VLDTN_ERR_MSG_FRWK.UPDT_TIME IS ''Time the error was last UPDTd in the database.''';

    -- Grant/Revoke object privileges 
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON REMISPRD.VLDTN_ERR_MSG_FRWK to REMIS_DML';


    dbms_output.put_line('Table REMISPRD.VLDTN_ERR_MSG_FRWK created.');
  else
    dbms_output.put_line('Table REMISPRD.VLDTN_ERR_MSG_FRWK already exists.');
  end if;

end;
/
 
COMMIT;

-- VLDTN_ERR_MSG_FRWK_INSERT_PATIENT_SEARCH_ERRORS;

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100000', 'Enter valid date in MM/DD/YYYY format.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100001', 'Birth Date cannot be greater than today.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100002', 'Death Date cannot be greater than today.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100003', 'You had selected Birth Date range between {0} and {1}. {0} cannot be greater than {1}. Select different range.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100004', 'You had selected Death Date range between {0} and {1}. {0} cannot be greater than {1}. Select different range.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100005', 'Birth Dates range must be less than two years.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100006', 'Death Dates range must be less than two years.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK ( ERR_CD, ERR_MSG, WRNG_SW, ACTV_SW, CREAT_TIME, UPDT_TIME ) 
VALUES( '100007', 'Enter only numbers.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

-- OTHER ERRORS;

INSERT INTO REMISPRD.VLDTN_ERR_MSG_FRWK (ERR_CD,ERR_MSG,WRNG_SW,ACTV_SW,CREAT_TIME,UPDT_TIME) 
VALUES ('100008', 'Please enter at least one search parameter and try again.', 0, 1, SYSTIMESTAMP, SYSTIMESTAMP );

COMMIT;