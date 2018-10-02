DROP DATABASE IF EXISTS qa;
CREATE DATABASE qa;
\c qa;

CREATE TABLE "posts" (
	"id" serial NOT NULL,
	"title" TEXT NULL,
	"body" TEXT NULL,
	"comment_count" integer NULL,
	"creation_date" TIMESTAMP NULL,
	"last_activity_date" TIMESTAMP NULL,
	"owner_user_id" integer NULL,
	"score" integer NULL,
	"view_count" integer NULL,
	"answer_count" integer NULL,
	"tags" TEXT NULL,
	"post_type_id" integer NULL,
	"parent_id" integer NULL,
	CONSTRAINT posts_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "users" (
	"id" serial NOT NULL,
	"reputation" integer NULL,
	"up_votes" integer NULL,
	"down_votes" integer NULL,
	"last_access_date" TIMESTAMP NULL,
	"views" integer NULL,
	CONSTRAINT users_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "links" (
	"id" serial NOT NULL,
	"creation_date" DATE NULL,
	"link_type_id" integer NULL,
	"post_id" integer NOT NULL,
	"related_post_id" integer NOT NULL,
	CONSTRAINT links_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "posts" ADD CONSTRAINT "posts_fk0" FOREIGN KEY ("owner_user_id") REFERENCES "users"("id");


ALTER TABLE "links" ADD CONSTRAINT "links_fk0" FOREIGN KEY ("post_id") REFERENCES "posts"("id");
ALTER TABLE "links" ADD CONSTRAINT "links_fk1" FOREIGN KEY ("related_post_id") REFERENCES "posts"("id");

