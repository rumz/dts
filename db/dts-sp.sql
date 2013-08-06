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

alter procedure select_flows (
    s_type varchar(30) character set none,
    s_data varchar(255) character set none,
    s_user varchar(20) character set none)
returns (
    id integer,
    f_no varchar(10) character set none,
    requestor varchar(16) character set none,
    requestor_name varchar(60) character set none,
    description varchar(255) character set none,
    create_date timestamp,
    status varchar(271) character set none,
    remarks varchar(255) character set none)
as
begin
     for
  select f.id, f_no, requestor, p.l_name || ', ' || p.f_name, f.description, fl.rights || ' - ' || fl.description , remarks, create_date
    from flows f, flow_lib fl, phic_201 p
   where f.ftype = :s_type
     and fl.ftype = :s_type
     and f.current_step  = fl.id
     and f.requestor = phic_201.id_no
     and upper(f.f_no) like upper(:s_data)
     and fl.rights in (select right_id from user_rights where user_id = :s_user)
   order by f_no desc
    into :id, :f_no, :requestor, :requestor_name, :description, :status, :remarks, :create_date
      do
        begin
          suspend;
        end
end


alter procedure select_flows2 (
    s_type varchar(30) character set none,
    s_data varchar(255) character set none)
returns (
    id integer,
    f_no varchar(10) character set none,
    requestor varchar(16) character set none,
    requestor_name varchar(60) character set none,
    description varchar(255) character set none,
    create_date timestamp,
    status varchar(271) character set none,
    remarks varchar(255) character set none)
as
begin
     for
  select f.id, f_no, requestor, p.l_name || ', ' || p.f_name, f.description, fl.rights || ' - ' || fl.description , remarks, create_date
    from flows f, flow_lib fl, phic_201 p
   where f.ftype = :s_type
     and fl.ftype = :s_type
     and f.current_step  = fl.id
     and f.requestor = phic_201.id_no
     and upper(f.f_no) like upper(:s_data)
   order by f_no desc
    into :id, :f_no, :requestor, :requestor_name, :description, :status, :remarks, :create_date
      do
        begin
          suspend;
        end
end


alter PROCEDURE UPDATE_FLOW_DATA(
    id integer,
    ftype varchar(50),
    riv_id integer,
    flow_id integer,
    approved integer,
    approved_by integer,
    approved_date timestamp,
    remarks varchar(255)
)
as begin
    if (:id = 0) then begin
        insert into flow_data(ftype, riv_id, flow_id, approved, approved_by, approved_date, remarks)
        values(:ftype, :riv_id, :flow_id, :approved, :approved_by, :approved_date, :remarks);
        update rivs
           set current_step = :flow_id + 1
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


create procedure update_flows (
    id integer,
    ftype varchar(50),
    description varchar(255) character set none,
    f_no varchar(50) character set none,
    requestor varchar(16) character set none,
    create_date timestamp,
    created_by varchar(16) character set none,
    current_step integer,
    status varchar(20) character set none,
    remarks varchar(255) character set none
)
as
declare variable newid integer;
begin
    if (:id = 0) then begin
        insert into FLOWS(ftype, description, f_no, requestor, create_date, created_by, current_step, status, remarks)
        values(:ftype, :description, :f_no, :requestor, :create_date, :created_by, :current_step, :status, :remarks);
        select id from FLOWS where create_date = :create_date into :newid;
        insert into flow_data(f_id, flow_id, approved, approved_by, approved_date, remarks)
        values(:newid, 1, '1', :requestor, :create_date, '');
    end
    else if (:id < 0) then begin
        delete from FLOWS where id = (:id * -1);
    end
    else begin
      update FLOWS
         set ftype = :ftype,
             description = :description,
             f_no = :f_no,
             requestor = :requestor,
             created_by = :created_by,
             current_step = :current_step,
             status = :status,
             remarks = :remarks
       where id = :id;
    end
end




create procedure select_flow_transactions (
    f_id integer,
    ftype varchar(50)
)
returns (
    flow_id integer,
    description varchar(255) character set none,
    approved varchar(20) character set none,
    approved_by varchar(60) character set none,
    approved_date timestamp,
    remarks varchar(255) character set none)
as
begin
       for
    select flow_id, fl.rights || ' - ' || fl.description, approved, l_name || ', ' || f_name, approved_date, remarks
      from flow_data fd, flow_lib fl, phic_201 p
     where fl.id = fd.flow_id
       and f_id = :f_id
       and fd.approved_by = p.id_no
       and fl.ftype = :ftype
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


create procedure update_flow_data (
    id integer,
    f_id integer,
    flow_id integer,
    approved integer,
    approved_by integer,
    approved_date timestamp,
    remarks varchar(255) character set none)
as
begin
    if (:id = 0) then begin
        insert into flow_data(f_id, flow_id, approved, approved_by, approved_date, remarks)
        values(:f_id, :flow_id, :approved, :approved_by, :approved_date, :remarks);
        update rivs
           set current_step = :flow_id+1
         where id = :f_id
           and :approved = 1;
    end
    else if (:id < 0) then begin
        delete from flow_data where id = (:id * -1);
    end
    else begin
        update flow_data
           set f_id          = :f_id,
               flow_id       = :flow_id,
               approved      = :approved,
               approved_by   = :approved_by,
               approved_date = :approved_date,
               remarks       = :remarks
         where id = :id;
    end
end

create procedure select_flow_lib_data(
  ftype varchar(50)
)
returns (
    rights varchar(16) character set none,
    description varchar(255) character set none
)
as
begin
       for
    select rights, description
      from flow_lib
     where ftype = :ftype
     order by id
      into :rights, :description
      do
        begin
            suspend;
        end
end

