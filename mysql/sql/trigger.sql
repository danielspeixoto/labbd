CREATE DEFINER=`root`@`localhost` TRIGGER `qa`.`links_AFTER_INSERT` AFTER INSERT ON `links` FOR EACH ROW
BEGIN
	UPDATE posts SET closed=IF(NEW.type = 3,1,0) WHERE id = NEW.post_id;
END