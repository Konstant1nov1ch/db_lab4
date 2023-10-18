CREATE SCHEMA IF NOT EXISTS "s333714";

CREATE TABLE "s333714"."Player" (
                                            "name" serial PRIMARY KEY,
                                            "hit_point" integer NOT NULL,
                                            "exp" integer,
                                            "gender" VARCHAR(10),
                                            "age" integer,
                                            "money" integer,
                                            "status" VARCHAR(25),
                                            "InventoryId" integer REFERENCES "s333714"."Inventory"


);

CREATE TABLE "s333714"."Inventory" (
                                           "InventoryId" serial PRIMARY KEY,
                                           "size" integer integer CHECK (size >= 10 AND size <= 50)
);

