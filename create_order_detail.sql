CREATE TABLE "order_detail" (
	"detail_id"	INTEGER NOT NULL,
	"order_id"	INTEGER NOT NULL,
	"product_id"	INTEGER NOT NULL,
	"quantity"	REAL NOT NULL DEFAULT 1,
	PRIMARY KEY("detail_id" AUTOINCREMENT),
	FOREIGN KEY("product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT,
	FOREIGN KEY("order_id") REFERENCES "order_header"("order_id") ON DELETE RESTRICT
)