/* inventory.sql */


/* PHIC_201 table

Taken from the PIPS database

*/



CREATE TABLE PHIC_201 (
    ID_NO           VARCHAR(16) CHARACTER SET NONE NOT NULL,
    L_NAME          VARCHAR(30) CHARACTER SET NONE,
    F_NAME          VARCHAR(30) CHARACTER SET NONE,
    M_NAME          VARCHAR(20) CHARACTER SET NONE,
    DATE_ASSUM      DATE,
    SEX             VARCHAR(2) CHARACTER SET NONE,
    CIVIL_STAT      VARCHAR(1) CHARACTER SET NONE,
    BIRTH_DATE      DATE,
    ADDRESS         VARCHAR(83) CHARACTER SET NONE,
    HOME_TEL        VARCHAR(30) CHARACTER SET NONE,
    PROV_ADDRESS    VARCHAR(83) CHARACTER SET NONE,
    PROV_TEL        VARCHAR(30) CHARACTER SET NONE,
    PW              VARCHAR(30) CHARACTER SET NONE,
    REMARK          BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    DATEHIRE        DATE
);

DROP TABLE USER_RIGHTS_LIB;
CREATE TABLE USER_RIGHTS_LIB (
  ID INTEGER,
  SHORTD VARCHAR(20) CHARACTER SET NONE,
  LONGD VARCHAR(255) CHARACTER SET NONE
)



CREATE TABLE USER_RIGHTS (
  USER_ID VARCHAR(16) CHARACTER SET NONE NOT NULL,
  RIGHT_ID VARCHAR(16) CHARACTER SET NONE NOT NULL
)



/**************************************************
FLOW_LIB Table:

Flow Types:  RIV, ACTIVITY, OT, TRAVEL
Flow ID: Each type has a sequence to complete
Next ID: The next ID to go to  (usually n+1)
Rights: The user rights needed to approve/disapprove
Description: e.g.  'EU - Create RIV and Get Clearance from Division Head'

**************************************************/

drop table flow_lib;

CREATE TABLE FLOW_LIB (
    FTYPE VARCHAR(50),
    FLOW_ID INTEGER,
    RIGHTS VARCHAR(16) CHARACTER SET NONE NOT NULL,
    DESCRIPTION VARCHAR(255) CHARACTER SET NONE NOT NULL
)


/**************************************************
FLOW_DATA Table:

This table stores the actual remarks and timestamps for each corresponding step


Flow Types:  RIV, ACTIVITY, OT, TRAVEL
RIV ID: FK on RIVs.id
Flow ID: Each type has a sequence to complete, currently only RIV is defined
Received Date:  Timestamp of when this step started
Received By:  User ID of

Rights: The user rights needed to approve/disapprove
Description: e.g.  'EU - Create RIV and Get Clearance from Division Head'

**************************************************/



drop table FLOW_DATA;
create table flow_data (
    id integer,
    ftype varchar(50),
    riv_id integer,
    flow_id integer,
    received_date timestamp,
    received_by varchar(16),
    approved integer,
    approved_date timestamp,
    returned_to varchar(16),
    returned_remarks varchar(255),
    remarks varchar(255),
    lastupdate timestamp
)


/************************************************
RIV table

ID - PK
DESCRIPTION - Short description for easier tracking
RIV_NO - defined by (XXX-YY) e.g 001-13   (this is the series number)
REQUESTOR - user who requested the RIV
CURRENT_STEP - current step in the flow_data table
CREATE_DATE - timestamp
CREATED_BY - in most cases this is the same as REQUESTOR but just in case
  the RIV is created in lieu of someone else we can use this field.
STATUS - we can probably put COMPLETED, CANCELLED, or the current_step and invalidate the current_step field 
************************************************/


drop table RIVs;
create table RIVs (
    id integer,
    description varchar(255),
    riv_no varchar(10),
    requestor varchar(16),
    current_step integer,
    create_date timestamp,
    created_by varchar(16),
    status varchar(20),
    po varchar(10),
    dv varchar(15)
)


/************************************************
RIV_DATA table

ID - PK
RIV_ID - FK on RIVS.ID
QTY - number of items
UNIT - unit (e.g. pcs, roll, box, set, spool, jar, ca, ctn (carton), m, ream, lot)
ITEM_ID - FK on ITEM_LIB.ID
************************************************/


create table RIV_DATA (
    id integer,
    riv_id integer,
    qty integer,
    unit varchar(20),
    item_id integer
)




/************************************************
Items Table
This table stores each individual item.

ID - system PK
ITYPE - reference ITEMS_LIB table
SERIAL - serial number
STATUS - 'For Repair - In Stockroom', 'For Repair - Sent to Supplier', 'Working', 'Destroyed'
REMARKS - Extra remarks
USER_ID - id number of the user that is assigned this item, fk ref phic_201 table
PROP_NUM - Property number
RIV_NUM - RIV number
PO_NUM - Purchase Order Number
DOA - Date of Acquisition
LOCATION - Current Location of Item
*************************************************/

DROP TABLE ITEMS;
CREATE TABLE ITEMS (
  ID INTEGER NOT NULL PRIMARY KEY,
  ITYPE VARCHAR(100) CHARACTER SET NONE,
  SERIAL VARCHAR(100) CHARACTER SET NONE,
  STATUS VARCHAR(100) CHARACTER SET NONE,
  REMARKS VARCHAR(100) CHARACTER SET NONE,
  USER_ID VARCHAR(16) CHARACTER SET NONE,
  PROP_NUM VARCHAR(16) CHARACTER SET NONE,
  RIV_NUM VARCHAR(16) CHARACTER SET NONE,
  PO_NUM VARCHAR(16) CHARACTER SET NONE,
  DOA DATE,
  LOCATION VARCHAR(255) CHARACTER SET NONE
)






/*  Item_Lib Table

Library table that stores description of items 

ITYPE - type of item
Valid ITypes can be:
CPU, Keyboard, Mouse, AVR, UPS, Monitor, Printer, Scanner, Switch, Router, Camera, Fax

MODEL - 
DESCRIPTION
CAPEX - 1 True, 0 False
COST - Default cost (may change for the actual item)

*/

DROP TABLE ITEM_LIB;
CREATE TABLE ITEM_LIB (
  ID INTEGER NOT NULL PRIMARY KEY,
  ITYPE VARCHAR(100) CHARACTER SET NONE, 
  MODEL VARCHAR(255) CHARACTER SET NONE,
  DESCRIPTION VARCHAR(255) CHARACTER SET NONE,
  CAPEX INTEGER,
  COST DOUBLE PRECISION
)





insert into item_lib(itype, model, description, capex, cost) values('PC', 'HP Compaq DX 7400 Microtower', '', 1, 0) 
insert into item_lib(itype, model, description, capex, cost) values('PC', 'HP Compaq DX 7400 Microtower', 'HP Compaq DX 7400 Microtower', 1, 62895)
insert into item_lib(itype, model, description, capex, cost) values('PC', 'HP COMPAQ DC 7800 Convertible Mini Tower', 'HP COMPAQ DC 7800 Convertible Mini Tower', 1, 49942.93)




/*  ITEM_STATUS table - so we can track the history of an item
Valid Statuses:
'For Repair - In Stockroom', 'For Repair - Sent to Supplier', 'Working', 'Destroyed'
*/

DROP TABLE ITEM_STATUS;
CREATE TABLE ITEM_STATUS (
  ID INTEGER, 
  STATUS VARCHAR(100) CHARACTER SET NONE,
  STATUS_DATE DATE
);



