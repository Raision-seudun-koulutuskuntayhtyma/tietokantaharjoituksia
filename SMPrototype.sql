
CREATE TABLE customer_type (
                type VARCHAR(30) NOT NULL,
                CONSTRAINT customer_type_pk PRIMARY KEY (type)
);


CREATE TABLE product_category (
                category_name VARCHAR(30) NOT NULL,
                CONSTRAINT product_category_pk PRIMARY KEY (category_name)
);


CREATE TABLE unit (
                unit_name VARCHAR(20) NOT NULL,
                CONSTRAINT unit_pk PRIMARY KEY (unit_name)
);
COMMENT ON TABLE unit IS 'Confirmed unit names for GUI';


CREATE TABLE product (
                product_id INTEGER NOT NULL,
                name VARCHAR(30) NOT NULL,
                price FLOAT NOT NULL,
                unit_name VARCHAR(20) NOT NULL,
                category_name VARCHAR(30) NOT NULL,
                CONSTRAINT product_pk PRIMARY KEY (product_id)
);


CREATE TABLE customer (
                customer_id INTEGER NOT NULL,
                customer_name VARCHAR(50) NOT NULL,
                type VARCHAR(30) NOT NULL,
                CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);
COMMENT ON TABLE customer IS 'Basic customer information';
COMMENT ON COLUMN customer.customer_id IS 'Autoincremented field';
COMMENT ON COLUMN customer.customer_name IS 'Name of the Company or First Name and Last Name';


CREATE TABLE customer_contact (
                contact_id INTEGER NOT NULL,
                customer_id INTEGER NOT NULL,
                first_name VARCHAR(20) NOT NULL,
                last_name VARCHAR(20) NOT NULL,
                email VARCHAR(50) NOT NULL,
                phone VARCHAR(12) NOT NULL,
                CONSTRAINT customer_contact_pk PRIMARY KEY (contact_id)
);
COMMENT ON COLUMN customer_contact.customer_id IS 'Autoincremented field';


CREATE TABLE address (
                address_id INTEGER NOT NULL,
                customer_id INTEGER NOT NULL,
                street VARCHAR(30) NOT NULL,
                postal_code VARCHAR(10) NOT NULL,
                city VARCHAR(30) NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (address_id)
);
COMMENT ON COLUMN address.customer_id IS 'Autoincremented field';


CREATE TABLE order_header (
                order_id INTEGER NOT NULL,
                customer_reference VARCHAR(50),
                date DATE,
                customer_id INTEGER NOT NULL,
                billing_address_id INTEGER NOT NULL,
                shipping_address_id INTEGER NOT NULL,
                contact_id INTEGER NOT NULL,
                CONSTRAINT order_header_pk PRIMARY KEY (order_id)
);
COMMENT ON COLUMN order_header.customer_id IS 'Autoincremented field';


CREATE TABLE order_detail (
                order_detail_id INTEGER NOT NULL,
                order_id INTEGER NOT NULL,
                product_id INTEGER NOT NULL,
                amount FLOAT DEFAULT 1 NOT NULL,
                CONSTRAINT order_detail_pk PRIMARY KEY (order_detail_id)
);
COMMENT ON COLUMN order_detail.order_detail_id IS 'Dummy key for future use';


ALTER TABLE customer ADD CONSTRAINT customer_type_customer_fk
FOREIGN KEY (type)
REFERENCES customer_type (type)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE product ADD CONSTRAINT product_category_product_fk
FOREIGN KEY (category_name)
REFERENCES product_category (category_name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE product ADD CONSTRAINT unit_product_fk
FOREIGN KEY (unit_name)
REFERENCES unit (unit_name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE order_detail ADD CONSTRAINT product_order_detail_fk
FOREIGN KEY (product_id)
REFERENCES product (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE order_header ADD CONSTRAINT customer_order_header_fk
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE address ADD CONSTRAINT customer_address_fk
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE customer_contact ADD CONSTRAINT customer_customer_contact_fk
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE order_header ADD CONSTRAINT customer_contact_order_header_fk
FOREIGN KEY (contact_id)
REFERENCES customer_contact (contact_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE order_header ADD CONSTRAINT address_order_header_fk
FOREIGN KEY (billing_address_id)
REFERENCES address (address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE order_header ADD CONSTRAINT address_order_header_fk1
FOREIGN KEY (shipping_address_id)
REFERENCES address (address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE order_detail ADD CONSTRAINT order_header_order_detail_fk
FOREIGN KEY (order_id)
REFERENCES order_header (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
