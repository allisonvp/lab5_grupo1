-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Lab5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Lab5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Lab5` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `Lab5` ;

-- -----------------------------------------------------
-- Table `Lab5`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab5`.`role` (
  `id_role` INT(11) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Lab5`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab5`.`user` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `intro` TINYTEXT NULL DEFAULT NULL,
  `profile` TEXT NULL DEFAULT NULL,
  `active` TINYINT(1) NOT NULL,
  `id_role` INT(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `uq_emai` (`email` ASC),
  INDEX `fk_user_role1_idx` (`id_role` ASC),
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`id_role`)
    REFERENCES `Lab5`.`role` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Lab5`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab5`.`post` (
  `id_post` INT(11) NOT NULL AUTO_INCREMENT,
  `author_id` INT(11) NOT NULL,
  `title` VARCHAR(75) NOT NULL,
  `summary` TINYTEXT NULL DEFAULT NULL,
  `published` TINYINT(1) NOT NULL DEFAULT '0',
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_post`),
  INDEX `fk_post_user1_idx` (`author_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`author_id`)
    REFERENCES `Lab5`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

--- Roles

INSERT INTO `role` VALUES ('1','admin'),
('2','user'); 

--- Users

INSERT INTO `user` VALUES ('1','Jaylan','Howell','abauch@example.com','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Minus perspiciatis et enim architecto.','Beatae praesentium enim perspiciatis dignissimos nemo sunt rem. Accusamus aut voluptatum delectus nisi non laborum. Aut quisquam pariatur quidem qui et quos.','1','2'),
('2','Xander','Waters','edison71@example.com','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Et omnis sequi quia dolor.','Et nemo hic illum architecto velit magni atque dicta. Ullam aut atque eos quidem quas harum. Illo aut eos numquam eveniet omnis et ut libero.','1','2'),
('3','Ronaldo','Funk','ozboncak@example.com','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Quis similique et amet quaerat autem non.','Deleniti aut expedita rerum pariatur quos officiis earum et. Fugit exercitationem beatae temporibus quos repellat corporis.','1','2'),
('4','Garret','Ankunding','louisa19@example.org','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Quo facere error mollitia blanditiis.','Consequatur reprehenderit molestiae vel laborum explicabo labore asperiores. Quia quam ut ut sapiente quos.','1','2'),
('5','Elinore','Trantow','max62@example.net','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Sit totam omnis deleniti doloribus.','Consequatur minima culpa et quaerat delectus delectus. Officia itaque incidunt sit odio ex quidem.','1','2'),
('6','Darrion','Harber','kelton46@example.net','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Dolor aliquam ex eius.','Exercitationem hic omnis officia. Natus rerum voluptatem omnis tenetur.','1','2'),
('7','Eddie','Harris','gail.cole@example.net','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Expedita sit nostrum id quo.','Culpa doloremque omnis rerum fugit voluptas dolorum dolorem facilis. Perferendis illo nam quaerat tempore laborum rerum. Voluptatum a ducimus qui aut.','1','2'),
('8','Candace','Pouros','nolan.elena@example.net','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Cum rerum qui facere vero ut rerum.','Occaecati eum dolores nemo ut placeat qui voluptatem et. Totam et debitis dicta reprehenderit ut quo blanditiis repellendus. Sunt non possimus voluptatem quae est qui reprehenderit aut.','1','2'),
('9','Marlee','Nolan','eliezer.mccullough@example.org','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Explicabo quidem est soluta officiis.','Unde beatae autem quae sint quas dolorem placeat nostrum. Omnis repellendus ut voluptatum in adipisci culpa. Facilis et quis in doloremque ullam ut sequi possimus.','1','2'),
('10','Marlon','McLaughlin','fermin.shanahan@example.com','$2a$04$MAnu1ISI1ppPGJm4KGMvLurWvwPsWyWrdK1jPZEWHe.cWYbk9vzdq','Porro voluptatem unde cum similique est.','Molestiae quibusdam accusantium quam et similique occaecati fugiat. Architecto qui nisi perferendis et magnam.','1','1'); 

-- Posts

INSERT INTO `post` VALUES ('1','5','Vel eum neque voluptates eos ullam enim explicabo ex.','Non deserunt neque non et nostrum tenetur ea voluptates voluptatem dolores totam et blanditiis.','1','Quis et tenetur voluptate sit hic natus. Voluptas incidunt quia eveniet. Reiciendis quae sint aspernatur repellat est mollitia. Nihil optio eius itaque sint ipsum.'),
('2','8','Omnis voluptates expedita nemo soluta.','Et et deserunt aut animi voluptatem iure possimus eaque minus labore aperiam laboriosam enim sit eum ipsam sed sit.','1','Aut nisi hic ut quaerat deleniti sequi. Quidem rem maiores ut qui. Nostrum temporibus iure suscipit omnis. Sed et sit ipsam maiores.'),
('3','8','Blanditiis saepe tempora mollitia ipsum consequatur.','Ea dicta quisquam ullam et voluptatem sit quaerat est occaecati optio.','1','Odit cumque tenetur dignissimos. Hic consequatur esse error porro quo. Doloremque aut consequatur et beatae impedit doloribus corporis.'),
('4','5','Impedit voluptatum corporis ipsam non tenetur qui.','Neque voluptatem explicabo earum eum facere quo distinctio dolores aut.','1','Ipsa aut at aut voluptatem sint ullam assumenda. Modi quasi eos porro neque corrupti nisi. Amet dolor ipsam voluptas modi nihil. Expedita tempore quod cumque veniam.'),
('5','7','Cum est consequatur dolore culpa accusantium qui nihil.','Eaque qui atque omnis quis quam recusandae iste officia quasi provident aut eos qui libero iure molestiae accusamus.','1','Quia natus eum asperiores et. Expedita voluptas fugiat nostrum nam. Aut maiores similique placeat vero et.'),
('6','3','Quod sed voluptas deserunt possimus vel.','Et eius autem et similique vitae necessitatibus dolores quibusdam earum quisquam sit voluptatem enim perspiciatis.','1','Qui sit incidunt atque eos placeat nobis distinctio. Eos illum animi minus qui nesciunt enim assumenda. Et et necessitatibus soluta id molestiae. Aut eveniet sit quas.'),
('7','4','Natus placeat culpa minima sit assumenda et quisquam et.','Accusamus temporibus quisquam et inventore distinctio delectus excepturi quaerat eos possimus dolorem velit a itaque voluptatum quisquam quia.','1','Distinctio qui odio nobis iusto et quam. Ducimus aperiam quia similique hic iure. Aut dolore non officiis non vel. Fugiat asperiores voluptate molestiae et cum et architecto delectus.'),
('8','8','Soluta necessitatibus omnis ut et harum sed consequatur.','Ut excepturi ut sint sunt et nostrum rerum fugiat repellat qui totam cupiditate consequatur.','0','Et molestiae ut nihil voluptas facilis sequi ex officiis. Quibusdam et aut animi. Eos facere praesentium maiores consequuntur ut. Illum odit ratione cumque numquam officiis.'),
('9','1','Odit et error sapiente unde similique.','Accusantium a non dolores non in optio voluptas est et rerum sequi consequatur nesciunt exercitationem cumque est at qui.','1','Soluta nesciunt reprehenderit sit eaque quae eveniet voluptatibus. Itaque consequuntur repellendus delectus voluptatem. Sunt ipsam omnis veniam ut.'),
('10','10','Culpa doloremque excepturi neque.','Eligendi sit aut qui molestiae ut omnis reprehenderit corporis distinctio quo dolor quia rerum officia et.','1','At a odio nostrum nihil aut quia. Voluptate dolor doloremque ut veritatis. Et itaque fuga reprehenderit voluptatibus aut id.'),
('11','6','Unde perferendis odio provident cum ut.','Rerum autem est nihil architecto omnis sit ad ratione et porro repellendus et amet nihil.','1','Impedit culpa dolorum labore eum expedita sapiente. Cupiditate veritatis eaque fuga culpa expedita. Quibusdam iure at voluptate omnis.'),
('12','6','Nihil minima voluptatem corrupti.','At repudiandae aspernatur qui veritatis rem sed unde dicta nobis animi ut explicabo sapiente modi id perferendis ad architecto et.','0','Minima sunt nostrum delectus nobis repudiandae. Rerum et eos odio dolores ut laudantium. Dolor sed dolor nesciunt. Recusandae et velit tenetur aut.'),
('13','6','Alias consequatur et et aut voluptas voluptatem.','Reiciendis provident ex ut dicta quaerat corporis eveniet aspernatur ab.','1','Saepe aperiam dolorum laboriosam in. Sit illo illum qui quis officiis eveniet. Pariatur sit veritatis saepe.'),
('14','2','Itaque culpa laborum rerum quisquam.','Ut et sunt pariatur autem earum vel debitis quia quidem eum quae ut.','1','Cupiditate ut ex est reprehenderit quas qui ut. Et vel saepe molestias. Facilis mollitia in labore. Similique totam placeat id animi atque dolore qui.'),
('15','5','Minima aliquid aut rerum ut aperiam eos repellendus.','Id rerum sunt praesentium fugit perferendis minus dolorem qui minima necessitatibus praesentium.','1','Facere tenetur voluptatibus possimus. Id iure provident ut et hic sunt. Odio ut omnis nostrum rem suscipit. Dicta quasi enim enim et ipsum.'),
('16','3','Suscipit voluptas ut at.','Consequatur dolor cum cum ut distinctio minus praesentium ut fugit.','1','Ab aut omnis nam quis in et. Nihil itaque assumenda quo vel asperiores iure quam. Aut totam qui qui voluptatem repellat porro sapiente similique.'),
('17','6','Rerum et totam quaerat sunt.','Repudiandae aperiam perferendis expedita dignissimos dolore velit unde sit sunt totam velit sit.','1','Qui ut consequatur quibusdam aut. Magni sed ex recusandae id. Qui eveniet et ut blanditiis et reiciendis.'),
('18','1','Praesentium nesciunt cupiditate consequatur et.','Error molestiae sint in consequatur esse non porro deserunt temporibus amet aliquid et deleniti numquam eveniet eos iusto.','0','At eaque culpa aliquam. Omnis non in perferendis in. Et quis odio iusto labore a iusto.'),
('19','9','Nisi labore omnis similique illum quibusdam.','Excepturi impedit earum quibusdam eos facere molestiae cupiditate totam adipisci aperiam dolorum itaque quia.','1','Quos aut laboriosam quod numquam necessitatibus. Quo nam velit architecto accusantium accusamus. Eius autem omnis sit. Quo vel eos aliquam molestiae odio nam autem incidunt.'),
('20','8','Vitae suscipit omnis magni ut maxime.','Exercitationem adipisci dolores in doloribus odit alias qui dicta voluptates iste consequuntur sunt.','1','Alias iusto rerum cupiditate. Nulla unde est ipsam omnis eaque nam.\nSit facilis nobis laboriosam commodi ut eaque nihil consectetur. Aut quis magnam repellendus.'),
('21','7','Quisquam voluptas velit ut tempore.','Laboriosam rerum beatae quia provident et quos quod ea repellendus sed.','1','Sequi est recusandae debitis quia quos dolorem. Nobis velit nisi quis hic. Possimus facilis est at ea nesciunt. Dolorum architecto veritatis fugit voluptates officia earum alias.'),
('22','6','Nihil et consequatur est illum non tempora.','Et cum eum dolorem eveniet nemo saepe autem fugiat quia laboriosam aut exercitationem labore perferendis accusantium vitae minus quia repudiandae aut.','0','Libero dolorum quia deserunt consequatur. Sed maxime voluptatem sit voluptas rerum iste ad nulla. Exercitationem et eveniet consectetur eaque.'),
('23','4','Nam error aperiam ad harum beatae dolorem amet.','Perspiciatis harum voluptatum repellat numquam aut sed id minus reiciendis aut quos aut aperiam exercitationem ab ut ut vel omnis nihil corporis.','1','Accusantium inventore culpa fugit. Beatae at et architecto. Molestiae fugit dolores voluptates quod eos. Et qui reprehenderit et atque quae odit laudantium.'),
('24','4','Quo incidunt facere possimus rerum necessitatibus nam nostrum ut.','Animi repellat dolor molestias enim ea sunt asperiores occaecati deserunt vel beatae deleniti unde alias qui iste.','1','Aut harum quaerat provident est atque ut sunt voluptatem. Eum blanditiis eaque consequatur nihil ut. Possimus et asperiores aut provident qui.'),
('25','10','Dolor fuga natus id sed quas modi.','Est esse consectetur consequatur laboriosam earum omnis voluptatem eum voluptatem.','1','Assumenda optio sunt soluta ipsam. Inventore quidem laboriosam illo aliquam omnis inventore. Voluptatum quis atque ut in. Nisi necessitatibus eaque temporibus dolor unde.'),
('26','4','Rerum aspernatur voluptas voluptatum harum minus.','Consequatur natus saepe alias et illo quasi fugiat et necessitatibus aut corporis veniam cupiditate mollitia quasi vel quia.','1','Id qui eveniet in qui. Error nesciunt et voluptatum rem ut molestiae. Dolores nemo maxime modi. Distinctio non omnis consequatur tenetur nostrum officia.'),
('27','10','Omnis quos est est nobis dolor nihil debitis.','Sunt qui a aperiam provident ex impedit consectetur asperiores facere enim nihil.','0','Velit ut ipsam suscipit dignissimos eos. Odit repudiandae quis qui. Voluptatibus corporis non id et. Voluptas ut in quos.'),
('28','2','Repellendus doloribus est vel qui cumque ipsum molestiae.','Aliquam commodi eius maxime eaque sapiente non et quas commodi numquam earum est cupiditate itaque non aspernatur necessitatibus ratione ex tenetur veniam.','1','Veritatis quis possimus pariatur. Quia minus deserunt maiores aut ab quia ab. Enim fugit qui eum laboriosam. Sit sunt quisquam aperiam sed.'),
('29','8','Harum atque quia nihil qui voluptatem consequatur sunt exercitationem.','Numquam aliquam sequi non nostrum qui dolores earum a et veniam molestiae voluptas accusamus atque sed.','1','Facilis qui dolorem rem ut sit nesciunt laudantium. Voluptate autem voluptatem qui nulla pariatur sit. Architecto commodi recusandae id. Non quia numquam atque rerum maxime.'),
('30','7','Magni repellendus rerum sed pariatur eligendi.','Quibusdam repudiandae voluptatem voluptas voluptatum ad qui adipisci voluptatem nisi repellat eum voluptatem ipsam aliquid.','0','Aliquam sint sed aliquid quia temporibus dignissimos. Tenetur illum ex et corrupti tempora blanditiis dolorem. Ipsa sint voluptatum ut aut quisquam.'); 

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
