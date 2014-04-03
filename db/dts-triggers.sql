CREATE GENERATOR Rivs_Generator;
SET GENERATOR Rivs_Generator TO 4;


SET TERM ^ ;
CREATE TRIGGER TRIG_Rivs FOR Rivs
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(Rivs_GENERATOR, 1);
    /* enter trigger code here */
END^
SET TERM ; ^


CREATE GENERATOR RIV_Data_Generator;
SET GENERATOR RIV_Data_Generator TO 0;


SET TERM ^ ;
CREATE TRIGGER TRIG_RIV_Data FOR RIV_Data
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(RIV_Data_GENERATOR, 1);
    /* enter trigger code here */
END^
SET TERM ; ^


CREATE GENERATOR Flow_Data_Generator;
SET GENERATOR Flow_Data_Generator TO 1;


CREATE TRIGGER TRIG_Flow_Data FOR Flow_Data
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(Flow_Data_GENERATOR, 1);
    /* enter trigger code here */
END^


CREATE GENERATOR Flows_Generator;
SET GENERATOR Flows_Generator TO 344;


CREATE TRIGGER TRIG_Flows FOR Flows
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(Flows_GENERATOR, 1);
END


create generator ticket_generator;
set generator ticket_generator to 1;


create trigger trig_ticket for ticket
 active before insert position 0
as
begin
    new.id = gen_id(ticket_generator, 1);
end


create generator comment_generator;
set generator comment_generator to 1;
create trigger trig_comment for comment
 active before insert position 0
as
begin
    new.id = gen_id(comment_generator, 1);
end





