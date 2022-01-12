create database flughafenverwaltungOliver collate utf8mb4_general_ci;

use flughafenverwaltungOliver;

# alle Tabellen erzeugen - allerdings ohne ForeignKey-Constraint

create table flight_execution_staff(
fe_id int unsigned not null,
id_nr varchar(50) not null,

constraint flight_execution_staff_PK primary key(fe_id, id_nr)

);
drop table flight_execution_staff;

alter table flight_execution_staff add constraint id_nr_FK3 foreign key (id_nr) references staff(id_nr);

create table flight_execution(
fe_id int unsigned not null auto_increment,
departure_date_time datetime not null,
arrival_date_time datetime not null,
flight_route varchar(20) not null,
airline_id int unsigned not null,

constraint fe_id_PK primary key(fe_id)
);

alter table flight_execution add constraint al_id_FK foreign key (airline_id) references airline(airline_id);
alter table flight_execution add constraint flight_route_FK foreign key (flight_route) references flight_route(flight_route);

create table flight_execution_customer(
fe_id int unsigned not null,
id_nr varchar(50) not null,

constraint fec_id_PK primary key(fe_id, id_nr)
);

alter table flight_execution_customer add constraint id_nr_FK2 foreign key(id_nr) references customer(id_nr);

create table airline(
airline_id int unsigned not null auto_increment,
a_name varchar(50) not null,
a_address_id int unsigned not null,
a_contact_person_f_name varchar(50) not null,
a_contact_person_l_name varchar(50) not null,

constraint airline_id_PK primary key(airline_id)
);

alter table airline add constraint address_id_FK2 foreign key (a_address_id) references address(address_id);

create table customer_address(
id_nr varchar(50) not null,
address_id int unsigned not null,

constraint customer_address_PK primary key(id_nr, address_id)
);

alter table customer_address add constraint address_id_FK3 foreign key (address_id) references address(address_id);

create table address(
address_id int unsigned not null auto_increment,
state varchar(50) not null,
postal_code varchar(50) not null,
city varchar(50) not null,
street varchar(50) not null,
streetnumber varchar(10) not null,

constraint address_id_PK primary key(address_id)
);

create table customer(
id_nr varchar(50) not null,
f_name varchar(50) not null,
l_name varchar(50) not null,
birthdate date not null,
gender char(1) not null,

constraint id_nr_PK primary key(id_nr)
);

create table staff_address(
id_nr varchar(50) not null,
address_id int unsigned not null,

constraint staff_address_PK primary key(id_nr, address_id)
);

drop table staff_address;
alter table staff_address add constraint address_id_FK foreign key(address_id) references address(address_id);

create table airport(
airport_number varchar(15) not null,
address_id int unsigned not null,

constraint airport_id_PK primary key(airport_number, address_id)
);

alter table airport add constraint address_id_FK1 foreign key(address_id) references address(address_id);

create table flight_route(
flight_route varchar(20) not null,
departure_airport varchar(15) not null,
arrival_airport varchar(15) not null,

constraint flight_route_PK primary key(flight_route)
);

insert into flight_route values("R1","AUT-520-282-164","EGY-238-842-732");
insert into flight_route values("R2","GER-021-263-434","LUX-823-264-386");
insert into flight_route values("R3","FRA-754-293-639","FIN-683-386-832");
insert into flight_route values("R4","BRA-927-892-083","SWN-264-264-725");
insert into flight_route values("R5","SWZ-739-535-929","NOR-958-246-475");
insert into flight_route values("R6","AFG-567-835-923","USA-367-833-525");
insert into flight_route values("R7","PAK-723-738-917","NIG-752-598-144");
insert into flight_route values("R8","POR-936-674-246","KRO-745-725-264");
insert into flight_route values("R9","CHI-275-862-812","BOS-136-264-386");
insert into flight_route values("R10","TUK-923-433-723","KOL-192-134-147");
insert into flight_route values("R11","KOL-192-134-147","TUK-923-433-723");
insert into flight_route values("R12","BOS-136-264-386","CHI-275-862-812");
insert into flight_route values("R13","KRO-745-725-264","POR-936-674-246");
insert into flight_route values("R14","NIG-752-598-144","PAK-723-738-917");
insert into flight_route values("R15","USA-367-833-525","AFG-567-835-923");
insert into flight_route values("R16","NOR-958-246-475","SWZ-739-535-929");
insert into flight_route values("R17","SWN-264-264-725","BRA-927-892-083");
insert into flight_route values("R18","FIN-683-386-832","FRA-754-293-639");
insert into flight_route values("R19","LUX-823-264-386","GER-021-263-434");
insert into flight_route values("R20","EGY-238-842-732","AUT-520-282-164");

alter table flight_route add constraint departure_airport_FK foreign key(departure_airport) references airport(airport_number);
alter table flight_route add constraint arrival_airport_FK foreign key(arrival_airport) references airport(airport_number);

create table staff(
id_nr varchar(50) not null,
f_name varchar(50) not null,
l_name varchar(50) not null,
birthdate date not null,
gender char(1) not null,
type_of_work varchar(50) not null,
pilot_id int unsigned not null,

constraint staff_id_PK primary key(id_nr)
);
drop table staff;
alter table staff add constraint pilot_id_FK foreign key(pilot_id) references pilot(pilot_id);

create table airport_time_to_fly(
airport_number varchar(15) not null,
ttf_id int unsigned not null,

constraint airport_time_to_fly_PK primary key(airport_number, ttf_id)
);

alter table airport_time_to_fly add constraint ttf_id_FK foreign key (ttf_id) references times_to_fly(ttf_id);

create table times_to_fly(
ttf_id int unsigned not null auto_increment,
weekday varchar(50) not null,
starting_time time not null,
ending_time time not null,

constraint times_to_fly_PK primary key(ttf_id)
);

create table pilot(
pilot_id int unsigned not null auto_increment,
enddate_of_flying_license date not null,

constraint pilot_id_PK primary key(pilot_id)
);



