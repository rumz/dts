INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (1,'EU','End User');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (2,'GSU','General Services Unit');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (3,'FMS','Fund Management Section');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (4,'ORVP','Office of the Regional Vice President');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (5,'C','Cashier');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (2,'GSU','GSU ');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (2,'GSU','General Services Unit');



INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '1',  'EU',      'Create RIV & Get Clearance from Division Head');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '2',  'GSU',     'Check APP and Assign Series Number');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '3',  'GSU',     'Screening of Attachments/Signature of Recommending Approval');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '4',  'FMS',     'Budget Clearing');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '5',  'RVP',     'Approval of RIV');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '6',  'FMS',     'Forward to GSU');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '7',  'GSU',     'Canvass Quotation');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '8',  'GSU',     'Abstract and PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '9', 'GSU',     'Required Signatures for Abstract and PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '10', 'FMS',     'For Final Budgeting');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '11', 'RVP',     'Approval of PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '12', 'FMS',     'Forward to GSU');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '13', 'GSU',     'Prepare Voucher');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '14', 'FMS',     'Checking');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '15', 'GSU',     'Serve Payment and Pickup Supplies');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '16', 'EU',      'Receive Supplies via Withdrawal Slip');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '17', 'GSU',     'Prepare Inspection Report and Delivery Receipt');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '18', 'C',       'File Voucher');



insert into user_rights (user_id, right_id) values('30070809', 'GSU');  // ema
insert into user_rights (user_id, right_id) values('30077010', 'GSU');  // james
insert into user_rights (user_id, right_id) values('30068408', 'GSU');  // rhodz
insert into user_rights (user_id, right_id) values('30071209', 'GSU');  // cair


-- TEMP RIGHTS FOR RHODZ
insert into user_rights (user_id, right_id) values('30068408', 'FMS');
insert into user_rights (user_id, right_id) values('30068408', 'C');
insert into user_rights (user_id, right_id) values('30068408', 'ORVP');

