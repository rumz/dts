SET TERM ^ ;
CREATE PROCEDURE SELECT_USERS
RETURNS
(
    ID_NO           INTEGER,
    FULL_NAME       VARCHAR(80) CHARACTER SET NONE,
    DEPT            VARCHAR(30) CHARACTER SET NONE,
    RIGHTS          VARCHAR(20) CHARACTER SET NONE
)
AS
BEGIN
    for
    select id_no, L_NAME || ', ' || f_NAME || ' ' || M_NAME, '', ''
      from PHIC_201
     order by id_no
      into :id_no, :full_name, :dept, :rights
        do
        begin
          suspend;
        end
END^
SET TERM ; ^




SET TERM ^ ;
CREATE PROCEDURE SELECT_ITEM_LIB
RETURNS
(
    id integer,
    itype varchar(100) character set none,
    model varchar(255) character set none,
    capex integer,
    cost double precision,
    description varchar(255) character set none
)
AS
BEGIN
    for
    select id, itype, model, capex, cost, description
      from ITEM_LIB
     order by id
      into :id, :itype, :model, :capex, :cost, :description
        do
        begin
          suspend;
        end
END^
SET TERM ; ^



SET TERM ^ ;
CREATE PROCEDURE DELETE_ITEM_LIB(
    ID INTEGER)
AS
BEGIN
    delete from ITEM_LIB
     where ID = :ID;
END^
SET TERM ; ^



DROP PROCEDURE UPDATE_ITEM_LIB;
SET TERM ^ ;
CREATE PROCEDURE UPDATE_ITEM_LIB(
    id integer,
    itype varchar(100) character set none,
    model varchar(255) character set none,
    capex integer,
    cost double precision,
    description varchar(255) character set none
)
AS
BEGIN
    if (:id = 0) then
    begin
        insert into item_lib(itype, model, description, capex, cost) values(:itype, :model, :description, :capex, :cost);
    end
    else
    begin
    update ITEM_LIB
       set itype = :itype, model = :model, capex = :capex, cost = :cost,
           description = :description
     where id = :id;
    end
END^
SET TERM ; ^




DROP PROCEDURE UPDATE_FLOW_DATA;
SET TERM ^ ;
CREATE PROCEDURE UPDATE_FLOW_DATA(
    id integer,
    ftype varchar(50) character set none,
    flow_id integer,
    received_date  date,
    received_by    varchar(16) character set none,
    approved       integer,
    remarks        varchar(255) character set none
)
AS
BEGIN
    if (:id = 0) then
    begin
        insert into flow_data(ftype, flow_id, received_date, received_by, approved, remarks) values(:ftype, :flow_id, :received_date, :received_by, :approved, :remarks);
    end
    else
    begin
    update FLOW_DATA
       set ftype = :ftype, flow_id = :flow_id, received_date = :received_date,
           received_by = :received_by, approved = :approved, remarks = :remarks
     where id = :id;
    end
END^
SET TERM ; ^











