create PROCEDURE login(id_no varchar(20), pw varchar(30))
RETURNS
(
    NAME       VARCHAR(80) CHARACTER SET NONE,
    RIGHTS     VARCHAR(20) CHARACTER SET NONE
)
AS
BEGIN
    for
 select f_name || ' ' || l_name, right_id
   from phic_201
  inner join user_rights on phic_201.id_no = user_id
  where id_no = :id_no
    and pw = :pw
   into :name, :rights
     do
     begin
       suspend;
     end
END^





SET TERM ^ ;
alter PROCEDURE SELECT_USERS
RETURNS
(
    ID_NO           INTEGER,
    LAST_NAME       VARCHAR(80) CHARACTER SET NONE,
    FIRST_NAME       VARCHAR(80) CHARACTER SET NONE,
    DEPT            VARCHAR(30) CHARACTER SET NONE,
    RIGHTS          VARCHAR(20) CHARACTER SET NONE
)
AS
BEGIN
    for
    select id_no, L_NAME, f_NAME, '', ''
      from PHIC_201
     order by id_no
      into :id_no, :last_name, :first_name, :dept, :rights
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




alter PROCEDURE SELECT_USERS
RETURNS
(
    ID_NO           INTEGER,
    LAST_NAME       VARCHAR(80) CHARACTER SET NONE,
    FIRST_NAME       VARCHAR(80) CHARACTER SET NONE,
    DEPT            VARCHAR(30) CHARACTER SET NONE,
    RIGHTS          VARCHAR(20) CHARACTER SET NONE
)
AS
BEGIN
    for
    select id_no, L_NAME, f_NAME, '', ''
      from PHIC_201 a
     inner join USER_RIGHTS b
        on a.id_no = b.user_id
     where b.right_id = 'EU'
      into :id_no, :last_name, :first_name, :dept, :rights
        do
        begin
          suspend;
        end
END




alter procedure select_rivs
(
    s_type integer,
    s_data varchar(255)
)
returns
(
    id   integer,
    riv_no  varchar(20),
    requestor varchar(20),
    description varchar(100),
    create_date  date,
    status varchar(20)
)
as
begin
    /* 0 for description */
    if (:s_type = 0) then
    begin
         for
      select id, riv_no, requestor, description, create_date, status
        from RIVS
       where description like :s_data
       order by id
        into :id, :riv_no, :requestor, :description, :create_date, :status
          do
            begin
              suspend;
            end
    end
end



alter procedure update_rivs(
    id   integer,
    description varchar(255),
    riv_no  varchar(10),
    requestor varchar(16),
    create_date  date,
    created_by varchar(16),
    current_step integer,
    status varchar(20)
)
as
begin
    if (:id = 0) then begin
        insert into RIVS(description, riv_no, requestor, create_date, created_by, current_step, status)
        values(:description, :riv_no, :requestor, :create_date, :created_by, :current_step, :status);
    end
    else if (:id < 0) then begin
        delete from RIVS where id = (:id * -1);
    end
    else begin
      update RIVS
         set description = :description,
             riv_no = :riv_no,
             requestor = :requestor,
             create_date = :create_date,
             created_by = :created_by,
             current_step = :current_step,
             status = :status
       where id = :id;
    end
end




