\c qa;
CREATE VIEW answers_to_a_question AS SELECT posts.*, users.reputation as user_reputation FROM posts JOIN users ON posts.owner_user_id = users.id WHERE posts.post_type_id = 2 ORDER BY score;