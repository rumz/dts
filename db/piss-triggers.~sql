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

