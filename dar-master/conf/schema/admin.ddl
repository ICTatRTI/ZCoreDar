-- ============================

-- This file was created using Derby's dblook utility.
-- Timestamp: 2008-10-16 12:16:35.443
-- Source database is: C:\zephyr\databases\admin
-- Connection URL is: jdbc:derby:C:\zephyr\databases\admin
-- appendLogs: false

-- ----------------------------------------------
-- DDL Statements for schemas
-- ----------------------------------------------

CREATE SCHEMA "ADMIN";

-- ----------------------------------------------
-- DDL Statements for tables
-- ----------------------------------------------

CREATE TABLE "ADMIN"."FLOW" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 104, INCREMENT BY 14), "NAME" VARCHAR(255) NOT NULL, "FLOW_ORDER" BIGINT);

CREATE TABLE "ADMIN"."IMMUNIZATION" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(255) NOT NULL, "TYPE_ID" BIGINT, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT);

CREATE TABLE "ADMIN"."FIELD_ENUMERATION" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 3197, INCREMENT BY 1), "FIELD_ID" BIGINT, "ENUMERATION" VARCHAR(255) NOT NULL, "NUMERIC_VALUE" VARCHAR(255), "IS_ENABLED" SMALLINT NOT NULL DEFAULT 0, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "DISPLAY_ORDER" INTEGER);

CREATE TABLE "ADMIN"."DRUGS" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(255) NOT NULL, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "INACTIVE" SMALLINT, "TERATOGENIC" VARCHAR(100));

CREATE TABLE "ADMIN"."FORM" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 120, INCREMENT BY 1), "NAME" VARCHAR(255) NOT NULL, "LABEL" VARCHAR(255) NOT NULL, "REQUIRE_REAUTH" SMALLINT NOT NULL DEFAULT 0, "REQUIRE_PATIENT" SMALLINT NOT NULL DEFAULT 0, "IS_ENABLED" SMALLINT NOT NULL DEFAULT 0, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "FLOW_ID" BIGINT, "FLOW_ORDER" INTEGER, "FORM_TYPE_ID" BIGINT, "MAX_SUBMISSIONS" INTEGER, "RECORDS_PER_ENCOUNTER" INTEGER DEFAULT 0, "GLOBAL_IDENTIFIER_NAME" VARCHAR(128));

CREATE TABLE "ADMIN"."USER_GROUP_MEMBERSHIP" ("ID" VARCHAR(255) NOT NULL, "GROUP_ID" BIGINT, "PREFIX" VARCHAR(255), "FIRSTNAME" VARCHAR(255), "LASTNAME" VARCHAR(255));

CREATE TABLE "ADMIN"."SEX" ("ID" INTEGER, "NAME" VARCHAR(10));

CREATE TABLE "ADMIN"."FORM_TYPE" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 5, INCREMENT BY 1), "NAME" VARCHAR(255), "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT);

CREATE TABLE "ADMIN"."DISTRICT" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 2), "DISTRICT_ID" VARCHAR(255) NOT NULL, "DISTRICT_NAME" VARCHAR(255) NOT NULL, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT);

CREATE TABLE "ADMIN"."RULE_DEFINITION" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "RULE_CLASS" VARCHAR(255) NOT NULL, "OUTCOME_CLASS" VARCHAR(255) NOT NULL, "FORM_ID" BIGINT, "FIELD_ID" BIGINT, "IS_ENABLED" SMALLINT NOT NULL DEFAULT 0, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "MESSAGE" VARCHAR(255), "OPERAND" VARCHAR(255), "OPERATOR" VARCHAR(255), "ALL_PREGS" SMALLINT DEFAULT 0);

CREATE TABLE "ADMIN"."USER_GROUP_ROLE" ("GROUP_ID" BIGINT NOT NULL DEFAULT 0, "ROLE" VARCHAR(255));

CREATE TABLE "ADMIN"."USER_GROUP" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(255) NOT NULL, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "ACTIVE" SMALLINT);

CREATE TABLE "ADMIN"."APPUPDATE" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "DATEPOSTED" TIMESTAMP, "DATEINSTALLED" TIMESTAMP, "TYPE" CHAR(1), "JOB" LONG VARCHAR, "MESSAGE" VARCHAR(255), "UPDATEID" BIGINT);

CREATE TABLE "ADMIN"."IMMUNIZATION_TYPE" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(255), "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT);

CREATE TABLE "ADMIN"."PAGE_ITEM" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 4349, INCREMENT BY 1), "FORM_FIELD_ID" BIGINT, "DISPLAY_ORDER" INTEGER, "INPUT_TYPE" VARCHAR(255) NOT NULL, "CLOSE_ROW" SMALLINT, "COLUMN_NUMBER" INTEGER, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "SIZE" INTEGER, "MAXLENGTH" INTEGER, "rows" INTEGER, "COLS" INTEGER, "VISIBLE" SMALLINT, "VISIBLE_ENUM_ID_TRIGGER1" VARCHAR(255), "VISIBLE_DEPENDENCIES1" VARCHAR(255), "VISIBLE_ENUM_ID_TRIGGER2" VARCHAR(255), "VISIBLE_DEPENDENCIES2" VARCHAR(255), "SELECTED_ENUM" BIGINT, "FORM_ID" BIGINT, "COLSPAN" INTEGER, "HIGHLIGHT" SMALLINT, "DROPDOWN_TABLE_NAME" VARCHAR(255), "DROPDOWN_COLUMN_NAME" VARCHAR(255), "DROPDOWN_CONSTRAINT" VARCHAR(255), "DROPDOWN_ORDER_BY" VARCHAR(255));

CREATE TABLE "ADMIN"."FORM_FIELD" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 2141, INCREMENT BY 1), "LABEL" VARCHAR(255) NOT NULL, "TYPE" VARCHAR(255) NOT NULL, "REQUIRED" SMALLINT NOT NULL DEFAULT 0, "MIN_VALUE" INTEGER, "MAX_VALUE" INTEGER, "UNITS" VARCHAR(255), "DISPLAY_ORDER" INTEGER, "PATIENT_PROPERTY" VARCHAR(255), "IS_ENABLED" SMALLINT NOT NULL DEFAULT 0, "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "SHARED" SMALLINT NOT NULL DEFAULT 0, "STAR_SCHEMA_NAME" VARCHAR(255), "ENCOUNTER_RECORD_PROPERTY" VARCHAR(255), "PATIENT_STATUS_PROPERTY" VARCHAR(255), "PATIENT_LAB_PROPERTY" VARCHAR(255));

-- ----------------------------------------------
-- DDL Statements for indexes
-- ----------------------------------------------

CREATE INDEX "ADMIN"."SQL071107184501420" ON "ADMIN"."FORM" ("FORM_TYPE_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500640" ON "ADMIN"."FORM" ("ID");

CREATE INDEX "ADMIN"."SQL071107184501400" ON "ADMIN"."FORM" ("FLOW_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184501030" ON "ADMIN"."USER_GROUP" ("ID");

CREATE INDEX "ADMIN"."SQL071107184502400" ON "ADMIN"."USER_GROUP_ROLE" ("GROUP_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500780" ON "ADMIN"."IMMUNIZATION" ("ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500890" ON "ADMIN"."PAGE_ITEM" ("ID");

CREATE INDEX "ADMIN"."SQL071107184502030" ON "ADMIN"."PAGE_ITEM" ("FORM_ID");

CREATE INDEX "ADMIN"."SQL071107184502000" ON "ADMIN"."PAGE_ITEM" ("FORM_FIELD_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184501000" ON "ADMIN"."SITE" ("ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184501060" ON "ADMIN"."USER_GROUP_MEMBERSHIP" ("ID");

CREATE INDEX "ADMIN"."SQL071107184502350" ON "ADMIN"."USER_GROUP_MEMBERSHIP" ("GROUP_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500730" ON "ADMIN"."FORM_TYPE" ("ID");

CREATE INDEX "ADMIN"."SQL071107184502180" ON "ADMIN"."RULE_DEFINITION" ("FIELD_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500930" ON "ADMIN"."RULE_DEFINITION" ("ID");

CREATE INDEX "ADMIN"."SQL071107184502200" ON "ADMIN"."RULE_DEFINITION" ("FORM_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500480" ON "ADMIN"."DRUGS" ("ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500680" ON "ADMIN"."FORM_FIELD" ("ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500790" ON "ADMIN"."IMMUNIZATION_TYPE" ("ID");

CREATE INDEX "ADMIN"."SQL071107184501210" ON "ADMIN"."FIELD_ENUMERATION" ("FIELD_ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500540" ON "ADMIN"."FIELD_ENUMERATION" ("ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500570" ON "ADMIN"."FLOW" ("ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500430" ON "ADMIN"."APPUPDATE" ("ID");

CREATE UNIQUE INDEX "ADMIN"."SQL071107184500460" ON "ADMIN"."DISTRICT" ("ID");

-- ----------------------------------------------
-- DDL Statements for keys
-- ----------------------------------------------

-- primary/unique
ALTER TABLE "ADMIN"."FORM" ADD CONSTRAINT "SQL071107184500640" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."USER_GROUP" ADD CONSTRAINT "SQL071107184501030" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."IMMUNIZATION" ADD CONSTRAINT "SQL071107184500780" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."PAGE_ITEM" ADD CONSTRAINT "SQL071107184500890" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."SITE" ADD CONSTRAINT "SQL071107184501000" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."USER_GROUP_MEMBERSHIP" ADD CONSTRAINT "SQL071107184501060" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."FORM_TYPE" ADD CONSTRAINT "SQL071107184500730" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."RULE_DEFINITION" ADD CONSTRAINT "SQL071107184500930" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."DRUGS" ADD CONSTRAINT "SQL071107184500480" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."FORM_FIELD" ADD CONSTRAINT "SQL071107184500680" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."IMMUNIZATION_TYPE" ADD CONSTRAINT "SQL071107184500790" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."FIELD_ENUMERATION" ADD CONSTRAINT "SQL071107184500540" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."FLOW" ADD CONSTRAINT "SQL071107184500570" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."APPUPDATE" ADD CONSTRAINT "SQL071107184500430" PRIMARY KEY ("ID");

ALTER TABLE "ADMIN"."DISTRICT" ADD CONSTRAINT "SQL071107184500460" PRIMARY KEY ("ID");

-- foreign
ALTER TABLE "ADMIN"."FORM" ADD CONSTRAINT "FK300CC4D25AB9CC" FOREIGN KEY ("FLOW_ID") REFERENCES "ADMIN"."FLOW" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ADMIN"."FORM" ADD CONSTRAINT "FK300CC4E37F8FC5" FOREIGN KEY ("FORM_TYPE_ID") REFERENCES "ADMIN"."FORM_TYPE" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ADMIN"."IMMUNIZATION" ADD CONSTRAINT "FK7EB4E202CD26E040" FOREIGN KEY ("TYPE_ID") REFERENCES "ADMIN"."IMMUNIZATION_TYPE" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ADMIN"."PAGE_ITEM" ADD CONSTRAINT "FK34AA12C37D5DB79B" FOREIGN KEY ("FORM_FIELD_ID") REFERENCES "ADMIN"."FORM_FIELD" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ADMIN"."PAGE_ITEM" ADD CONSTRAINT "FK34AA12C3D79EFE76" FOREIGN KEY ("FORM_ID") REFERENCES "ADMIN"."FORM" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ADMIN"."RULE_DEFINITION" ADD CONSTRAINT "FKEAD6FE76D79EFE76" FOREIGN KEY ("FORM_ID") REFERENCES "ADMIN"."FORM" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ADMIN"."RULE_DEFINITION" ADD CONSTRAINT "FKEAD6FE76C8A07680" FOREIGN KEY ("FIELD_ID") REFERENCES "ADMIN"."FORM_FIELD" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "ADMIN"."FIELD_ENUMERATION" ADD CONSTRAINT "FKC69A6282C8A07680" FOREIGN KEY ("FIELD_ID") REFERENCES "ADMIN"."FORM_FIELD" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

