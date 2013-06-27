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
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '4',  'GSU',     'Forward to FMS for Approval of RIV');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '5',  'FMS',     'Budget Clearing');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '6',  'RVP',     'Approval of RIV');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '7',  'FMS',     'Forward to GSU');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '8',  'GSU',     'Canvass Quotation');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '9',  'GSU',     'Abstract and PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '10', 'GSU',     'Required Signatures for Abstract and PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '11', 'GSU',     'Forward to FMS for Approval of PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '12', 'FMS',     'For Final Budgeting');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '13', 'RVP',     'Approval of PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '14', 'RVP',     'Forward to FMS');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '15', 'FMS',     'Forward to GSU');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '16', 'GSU',     'Prepare Voucher');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '17', 'GSU',     'Forward to FMS');  // for checking
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '18', 'FMS',     'Forward to Cashier');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '19', 'C', 'Issue Checks');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '20', 'GSU',     'Serve Payment and Pickup Supplies');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '21', 'EU',      'Receive Supplies via Withdrawal Slip');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '22', 'GSU',     'Prepare Inspection Report and Delivery Receipt');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '23', 'C',       'File Voucher');



insert into user_rights (user_id, right_id) values('30070809', 'GSU');
insert into user_rights (user_id, right_id) values('30077010', 'GSU');
insert into user_rights (user_id, right_id) values('30068408', 'GSU');
insert into user_rights (user_id, right_id) values('30071209', 'GSU');


