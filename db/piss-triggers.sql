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



CREATE GENERATOR Flow_Lib_Generator;
SET GENERATOR Flow_Data_Generator TO 1;


CREATE TRIGGER TRIG_Flow_Lib FOR Flow_Lib
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(Flow_Lib_GENERATOR, 1);
    /* enter trigger code here */
END^


















CREATE GENERATOR Items_Generator;
SET GENERATOR Items_Generator TO 1;

SET TERM ^ ;
CREATE TRIGGER TRIG_Items FOR Items
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(Items_GENERATOR, 1);
    /* enter trigger code here */
END^
SET TERM ; ^


CREATE GENERATOR Item_Lib_Generator;
SET GENERATOR Item_Lib_Generator TO 1;

SET TERM ^ ;
CREATE TRIGGER TRIG_Item_Lib FOR Item_Lib
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(Item_Lib_GENERATOR, 1);
    /* enter trigger code here */
END^
SET TERM ; ^



CREATE GENERATOR Item_Status_Generator;
SET GENERATOR Item_Status_Generator TO 1;

SET TERM ^ ;
CREATE TRIGGER TRIG_Item_Status FOR Item_Status
 ACTIVE
 BEFORE INSERT
 POSITION 0
AS
BEGIN
    NEW.id = gen_id(Item_Status_GENERATOR, 1);
    /* enter trigger code here */
END^
SET TERM ; ^

