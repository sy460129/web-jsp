use odbo;

Create TABLE IF NOT EXISTS members(
	id VARCHAR(20) PRIMARY KEY,
	passwd VARCHAR(20),
	email VARCHAR(20),
	signup TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);