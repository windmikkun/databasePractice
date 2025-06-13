-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;
-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
-- practiceDBに移動
use practice;
--テーブル作成
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL DEFAULT '' Comment '氏名',
  `age` int NOT NULL DEFAULT 0 Comment '年齢',
  `gender` enum('Man','Woman','Other') NOT NULL DEFAULT 'Other' Comment '性別',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` char(255) NOT NULL DEFAULT '会社員' Comment '仕事名',
  PRIMARY KEY (`id`),
  FOREIGN KEY `fk_user_id` (`user_id`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CREATE TABLE 'テーブル名'の後にカラム必須です。