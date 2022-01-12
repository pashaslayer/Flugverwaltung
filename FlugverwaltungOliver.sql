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



