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


create generator category_generator;
set generator category_generator to 1;

create trigger trig_category for category
 active before insert position 0
as
begin
    new.id = gen_id(category_generator, 1);
end



