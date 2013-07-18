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



alter PROCEDURE SELECT_USERS
RETURNS
(
    ID_NO           INTEGER,
    LAST_NAME       VARCHAR(80) CHARACTER SET NONE,
    FIRST_NAME       VARCHAR(80) CHARACTER SET NONE,
    DEPT            VARCHAR(30) CHARACTER SET NONE,
    RIGHTS          VARCHAR(20) CHARACTER SET NONE
)
as
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



alter PROCEDURE UPDATE_FLOW_DATA(
    id integer,
    ftype varchar(50),
    riv_id integer,
    flow_id integer,
    approved integer,
    approved_by integer,
    approved_date integer,
    remarks varchar(255)
)
as begin
    if (:id = 0) then begin
        insert into flow_data(ftype, riv_id, flow_id, approved, approved_by, approved_date, remarks)
        values(:ftype, :riv_id, :flow_id, :approved, :approved_by, :approved_date, :remarks);
        update rivs
           set current_step = :flow_id
         where id = :riv_id
           and :approved = 1;
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
               remarks       = :remarks
         where id = :id;
    end
end



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



select * from select_rivs(0, '%')


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
    requestor_name varchar(60),
    description varchar(255),
    create_date  timestamp,
    status varchar(271),
    remarks varchar(255)
)
as begin
    /* 0 for description */
    if (:s_type = 0) then
    begin
         for
      select r.id, riv_no, requestor, p.l_name || ', ' || p.f_name,r.description, fl.rights || ' - ' || fl.description , remarks, create_date
        from RIVS r, flow_lib fl, phic_201 p
       where r.current_step = fl.id
         and r.requestor = phic_201.id_no
         and upper(r.description) like upper(:s_data)
       order by id
        into :id, :riv_no, :requestor, :requestor_name, :description, :status, :remarks, :create_date
          do
            begin
              suspend;
            end
    end
end



select * from select_rivs2('riv_no', '12%'


alter procedure select_rivs2
(
    s_type varchar(30),
    s_data varchar(255)
)
returns
(
    id   integer,
    riv_no  varchar(10),
    requestor varchar(16),
    requestor_name varchar(60),
    description varchar(255),
    create_date  timestamp,
    status varchar(271),
    remarks varchar(255)
)
as
begin
    if (s_type = 'riv_no') then
    begin
         for
      select r.id, riv_no, requestor, p.l_name || ', ' || p.f_name, r.description, fl.rights || ' - ' || fl.description , remarks, create_date
        from RIVS r, flow_lib fl, phic_201 p
       where r.current_step + 1 = fl.id
         and r.requestor = phic_201.id_no
         and upper(r.riv_no) like upper(:s_data)
       order by riv_no desc
        into :id, :riv_no, :requestor, :requestor_name, :description, :status, :remarks, :create_date
          do
            begin
              suspend;
            end
    end
    else if (s_type = 'description') then
    begin
         for
      select r.id, riv_no, requestor, p.l_name || ', ' || p.f_name,r.description, fl.rights || ' - ' || fl.description , remarks, create_date
        from RIVS r, flow_lib fl, phic_201 p
       where r.current_step + 1 = fl.id
         and r.requestor = phic_201.id_no
         and upper(r.description) like upper(:s_data)
       order by description
        into :id, :riv_no, :requestor, :requestor_name, :description, :status, :remarks, :create_date
          do
            begin
              suspend;
            end
    end
end




alter procedure update_rivs(
    ID INTEGER,
    DESCRIPTION VARCHAR(255) CHARACTER SET NONE,
    RIV_NO VARCHAR(10) CHARACTER SET NONE,
    REQUESTOR VARCHAR(16) CHARACTER SET NONE,
    CREATE_DATE TIMESTAMP,
    CREATED_BY VARCHAR(16) CHARACTER SET NONE,
    CURRENT_STEP INTEGER,
    STATUS VARCHAR(20) CHARACTER SET NONE,
    REMARKS VARCHAR(255) CHARACTER SET NONE)
AS
DECLARE VARIABLE NEWID INTEGER;
begin
    if (:id = 0) then begin
        insert into RIVS(description, riv_no, requestor, create_date, created_by, current_step, status, remarks)
        values(:description, :riv_no, :requestor, :create_date, :created_by, :current_step, :status, :remarks);
        select id from RIVS where create_date= :create_date into :newid;
        insert into flow_data(ftype, riv_id, flow_id, approved, approved_by, approved_date, remarks)
        values('RIV', :newid, 1, '1', :requestor, :create_date, '');
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
    description varchar(255),
    approved varchar(20),
    approved_by varchar(60),
    approved_date timestamp,
    remarks varchar(255)
)
as begin
       for
    select flow_id, fl.rights || ' - ' || fl.description, approved, l_name || ', ' || f_name, approved_date, remarks
      from flow_data fd, flow_lib fl, phic_201 p
     where fl.id = fd.flow_id
       and riv_id = :riv_id
       and fd.approved_by = p.id_no
       and fl.ftype = 'RIV'
     order by flow_id, approved_date
      into :flow_id, :description, :approved, :approved_by,  :approved_date, :remarks
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
    remarks varchar(255)
)
as begin
    if (:id = 0) then begin
        insert into flow_data(ftype, riv_id, flow_id, approved, approved_by, approved_date, remarks)
        values(:ftype, :riv_id, :flow_id, :approved, :approved_by, :approved_date, :remarks);
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
               remarks       = :remarks
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

