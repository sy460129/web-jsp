use final;

Create TABLE IF NOT EXISTS board(
	list_id int auto_increment primary key,
	id VARCHAR(20),
	subject varchar(50),
	content text,
	date varchar(50)
	);