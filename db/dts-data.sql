INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (1,'EU','End User');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (2,'GSU','General Services Unit');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (3,'FMS','Fund Management Section');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (4,'ORVP','Office of the Regional Vice President');
INSERT INTO USER_RIGHTS_LIB (ID, SHORTD, LONGD) VALUES (5,'C','Cashier');



INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '1',  'EU',      'Create RIV & Get Clearance from Division Head');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '2',  'GSU1',     'Check APP and Assign Series Number');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '3',  'GSU2',     'Screening of Attachments/Signature of Recommending Approval');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '4',  'FMS',     'Budget Clearing');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '5',  'RVP',     'Approval of RIV');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '6',  'FMS',     'Forward to GSU');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '7',  'GSU3',     'Canvass Quotation');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '8',  'GSU1',     'Abstract and PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '9',  'GSU1',     'Procurement Monitoring Report');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '10', 'GSU2',     'Required Signatures for Abstract and PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '11', 'FMS',     'For Final Budgeting');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '12', 'RVP',     'Approval of PO');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '13', 'FMS',     'Forward to GSU');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '14', 'GSU1',     'Prepare Voucher');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '15', 'FMS',     'Checking');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '16', 'GSU3',     'Serve Payment and Pickup Supplies');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '17', 'EU',      'Receive Supplies via Withdrawal Slip');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '18', 'GSU4',     'Prepare Inspection Report and Delivery Receipt');
INSERT INTO FLOW_LIB (FTYPE, ID, RIGHTS, DESCRIPTION) VALUES ('RIV', '19', 'C',       'File Voucher');




insert into user_rights (user_id, right_id) values('30070809', 'EU');
insert into user_rights (user_id, right_id) values('30068408', 'EU');
insert into user_rights (user_id, right_id) values('10261808', 'EU');

insert into user_rights (user_id, right_id) values('30070809', 'GSU2');  // ema
insert into user_rights (user_id, right_id) values('30077010', 'GSU3');  // james
insert into user_rights (user_id, right_id) values('30068408', 'GSU1');  // rhodz
insert into user_rights (user_id, right_id) values('30071209', 'GSU2');  // cair
insert into user_rights (user_id, right_id) values('30067808', 'GSU4');  // papay

delete from user_rights where user_id in ('30070809', '30077010', '30068408', '30071209')

-- TEMP RIGHTS FOR RHODZ
insert into user_rights (user_id, right_id) values('30068408', 'FMS');
insert into user_rights (user_id, right_id) values('30068408', 'C');
insert into user_rights (user_id, right_id) values('30068408', 'ORVP');
insert into user_rights (user_id, right_id) values('30068408', 'GSU3');
insert into user_rights (user_id, right_id) values('30068408', 'GSU2');
insert into user_rights (user_id, right_id) values('30068408', 'GSU4');

-- TEMP RIGHTS FOR ROMMEL

insert into user_rights (user_id, right_id) values('10323412', 'GSU1');
insert into user_rights (user_id, right_id) values('10323412', 'GSU3');
insert into user_rights (user_id, right_id) values('10323412', 'GSU2');
insert into user_rights (user_id, right_id) values('10323412', 'GSU4');

