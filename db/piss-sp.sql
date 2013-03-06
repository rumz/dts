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













