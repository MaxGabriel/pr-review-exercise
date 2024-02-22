CREATE TABLE users(
	username       TEXT PRIMARY KEY NOT NULL,
	email          TEXT    NOT NULL,
	password       TEXT    NULLABLE,
	age            INT     NULLABLE,
	admin          BOOLEAN NULLABLE,
	country        TEXT    NULLABLE,
);
CREATE UNIQUE INDEX email_index on users (email);



CREATE TABLE follows (
	id           INT PRIMARY KEY AUTOINCREMENT NOT NULL,
	user_1_name TEXT                           NULLABLE,
	user_2_name TEXT                           NULLABLE,
);
CREATE INDEX user_1_user_2 on follows (user_1_name, user_2_name);

-- Example query to find the users who you follow "SELECT * FROM users WHERE username IN (SELECT user_2_name FROM follows WHERE user_1_name = ?)"



CREATE TABLE preferences(
	username TEXT PRIMARY KEY NOT NULL REFERENCES users(username) ON DELETE CASCADE,
	two_factor_auth_enabled BOOLEAN NOT NULL DEFAULT FALSE,
);