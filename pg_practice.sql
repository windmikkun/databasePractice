-- 問題1. postgresqlでpracticeデータベースを生成するSQL文を記述してください。
CREATE DATABASE practice;
-- 問題2. postgresqlでpracticeデータベースのusersテーブルを生成するSQL文を記述してください。
-- useではなく \cを使用する
\c practice;
--テーブル作成
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL DEFAULT '',
  age INTEGER NOT NULL DEFAULT 0,
  gender VARCHAR(10) NOT NULL DEFAULT 'Other' CHECK (gender IN ('Man','Woman','Other'))
);
COMMENT ON COLUMN users.name IS '氏名';
COMMENT ON COLUMN users.age IS '年齢';
COMMENT ON COLUMN users.gender IS '性別';

-- 問題3. postgresqlでpracticeデータベースのjobsテーブルを生成するSQL文を記述してください。
CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  name VARCHAR(255) NOT NULL DEFAULT '会社員'
);

COMMENT ON COLUMN jobs.name IS '仕事名';
COMMENT ON COLUMN jobs.user_id IS 'ユーザーID';
-- CREATE TABLE 'テーブル名'の後にカラムを入力しなかったらエラー。
--postgreSQLはMySQLと違ってコメントは別で行う必要がある。