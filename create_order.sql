CREATE TABLE "order_header" (
	"order_id"	INTEGER NOT NULL,
	"customer_id"	INTEGER NOT NULL,
	"order_date"	TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Oletus kuluva päivä date('now') ei toimi oletusarvojen kanssa
	PRIMARY KEY("order_id" AUTOINCREMENT),
	FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id") ON DELETE RESTRICT
)