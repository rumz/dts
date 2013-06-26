create PROCEDURE login(id_no varchar(20), pw varchar(30))
RETURNS
(
    NAME       VARCHAR(80) CHARACTER SET NONE,
    RIGHTS     VARCHAR(20) CHARACTER SET NONE
)
AS BEGIN
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
AS BEGIN
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
AS BEGIN
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
AS BEGIN
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
AS BEGIN
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
AS BEGIN
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
    riv_no  varchar(10),
    requestor varchar(16),
    description varchar(255),
    create_date  date,
    status varchar(20),
    remarks varchar(255)
)
as begin
    /* 0 for description */
    if (:s_type = 0) then
    begin
         for
      select id, riv_no, requestor, description, current_step, remarks, create_date
        from RIVS
       where upper(description) like upper(:s_data)
       order by id
        into :id, :riv_no, :requestor, :description, :status, :remarks, :create_date
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
    create_date timestamp,
    created_by varchar(16),
    current_step integer,
    status varchar(20),
    remarks varchar(255)
)
as
declare variable newid integer;
begin
    if (:id = 0) then begin
        insert into RIVS(description, riv_no, requestor, create_date, created_by, current_step, status, remarks)
        values(:description, :riv_no, :requestor, :create_date, :created_by, :current_step, :status, :remarks);
        select id from RIVS where create_date= :create_date into :newid;
        insert into flow_data(ftype, riv_id, flow_id, approved, approved_by, approved_date, remarks, lastupdate)
        values('RIV', :newid, 1, '1', :requestor, :create_date, '', :create_date);
    end
    else if (:id < 0) then begin
        delete from RIVS where id = (:id * -1);
    end
    else begin
      update RIVS
         set description = :description,
             riv_no = :riv_no,
             requestor = :requestor,
             created_by = :created_by,
             current_step = :current_step,
             status = :status,
             remarks = :remarks
       where id = :id;
    end
end





alter procedure select_riv_transactions(
    riv_id integer
)
returns(
    flow_id integer,
    rights varchar
    description varchar(255),
    approved varchar(20),
    approved_by varchar(16),
    approved_date timestamp,
    remarks varchar(255)
)
as begin
       for
    select flow_id, fl.rights || ' - ' || fl.description, approved, approved_by, approved_date, remarks
      from flow_data fd, flow_lib fl
     where fl.id = fd.flow_id
       and riv_id = :riv_id
       and fl.ftype = 'RIV'
     order by flow_id, approved_date
      into :flow_id, :description, :approved, :approved_by, :approved_date, :remarks
        do
        begin
            suspend;
        end
end


// probably dont need this anymore but lets keep it around for the meantime
alter procedure select_current_transaction(
    riv_id integer
)
returns(
    id integer,
    rights varchar(16),
    description varchar(255)
)
as begin
    select id, rights, description
      from flow_lib
     where id = (select count(fd.flow_id)
                   from flow_data fd, flow_lib fl
                  where fd.flow_id = fl.id
                    and riv_id = :riv_id
                    and fd.approved = 1) + 1
      into :id, :rights, :description;
      suspend;
end


select * from select_current_transaction(14)

select * from select_riv_transactions(14)



alter procedure update_flow_data(
    id integer,
    ftype varchar(50),
    riv_id integer,
    flow_id integer,
    approved integer,
    approved_by varchar(16),
    approved_date timestamp,
    remarks varchar(255),
    lastupdate timestamp
)
as begin
    if (:id = 0) then begin
        insert into flow_data(ftype, riv_id, flow_id, approved, approved_by, approved_date, remarks, lastupdate)
        values(:ftype, :riv_id, :flow_id, :approved, :approved_by, :approved_date, :remarks, :lastupdate);
        update rivs
           set current_step = :flow_id
         where id = :riv_id;
    end
    else if (:id < 0) then begin
        delete from flow_data where id = (:id * -1);
    end
    else begin
        update flow_data
           set ftype         = :ftype,
               riv_id        = :riv_id,
               flow_id       = :flow_id,
               approved      = :approved,
               approved_by   = :approved_by,
               approved_date = :approved_date,
               remarks       = :remarks,
               lastupdate    = :lastupdate
         where id = :id;
    end
end



alter  procedure select_riv_flow
returns(
    rights varchar(16),
    description  varchar(255)
)
as begin
       for
    select rights, description
      from flow_lib
     where ftype = 'RIV'
     order by id
      into :rights, :description
      do
        begin
            suspend;
        end
end
/*
select flow_id, approved_by, approved, approved_date, remarks
  from flow_data
 where riv_id = 1
 order by flow_id, approved_date
*/
