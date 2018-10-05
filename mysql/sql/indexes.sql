USE `qa`;

CREATE INDEX parent ON posts(parent_id);
CREATE INDEX parent ON posts(owner_user_id);
CREATE INDEX related ON links(post_id);
