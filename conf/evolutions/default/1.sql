# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table admin (
  id                        bigint auto_increment not null,
  fullname                  varchar(255),
  email                     varchar(255),
  password                  varchar(255),
  created_at                datetime,
  constraint pk_admin primary key (id))
;

create table comments (
  id                        bigint auto_increment not null,
  law_id                    bigint,
  citizen_identity          varchar(255),
  citizen_name              varchar(255),
  suggestion                varchar(255),
  created_at                datetime,
  constraint pk_comments primary key (id))
;

create table inquiries (
  id                        bigint auto_increment not null,
  admin_id                  bigint,
  inquery                   varchar(255),
  citizen_name              varchar(255),
  citizen_identification    varchar(255),
  reply                     tinyint(1) default 0,
  replied_at                varchar(255),
  created_at                datetime,
  constraint pk_inquiries primary key (id))
;

create table laws (
  id                        bigint auto_increment not null,
  cat_id                    bigint,
  admin_id                  bigint,
  law_name                  varchar(255),
  law_number                varchar(255),
  description               varchar(255),
  created_at                datetime,
  constraint pk_laws primary key (id))
;

create table laws_category (
  id                        bigint auto_increment not null,
  admin_id                  bigint,
  category_name             varchar(255),
  description               varchar(255),
  created_at                datetime,
  constraint pk_laws_category primary key (id))
;

create table laws_review (
  id                        bigint auto_increment not null,
  law_id                    bigint,
  country                   varchar(255),
  visit_time                datetime,
  constraint pk_laws_review primary key (id))
;

alter table comments add constraint fk_comments_law_1 foreign key (law_id) references laws (id) on delete restrict on update restrict;
create index ix_comments_law_1 on comments (law_id);
alter table inquiries add constraint fk_inquiries_admin_2 foreign key (admin_id) references admin (id) on delete restrict on update restrict;
create index ix_inquiries_admin_2 on inquiries (admin_id);
alter table laws add constraint fk_laws_cat_3 foreign key (cat_id) references laws_category (id) on delete restrict on update restrict;
create index ix_laws_cat_3 on laws (cat_id);
alter table laws add constraint fk_laws_admin_4 foreign key (admin_id) references admin (id) on delete restrict on update restrict;
create index ix_laws_admin_4 on laws (admin_id);
alter table laws_category add constraint fk_laws_category_admin_5 foreign key (admin_id) references admin (id) on delete restrict on update restrict;
create index ix_laws_category_admin_5 on laws_category (admin_id);
alter table laws_review add constraint fk_laws_review_law_6 foreign key (law_id) references laws (id) on delete restrict on update restrict;
create index ix_laws_review_law_6 on laws_review (law_id);



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table admin;

drop table comments;

drop table inquiries;

drop table laws;

drop table laws_category;

drop table laws_review;

SET FOREIGN_KEY_CHECKS=1;

