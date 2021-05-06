CREATE TABLE "customer" (
	"customer_id"	INTEGER NOT NULL,
	"first_name"	TEXT NOT NULL,
	"last_name"	TEXT NOT NULL,
	"company"	TEXT,
	"street"	TEXT NOT NULL,
	"postal_code"	TEXT NOT NULL,
	"city"	TEXT NOT NULL,
	PRIMARY KEY("customer_id" AUTOINCREMENT)
)