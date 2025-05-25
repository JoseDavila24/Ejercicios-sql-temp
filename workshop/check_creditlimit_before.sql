ALTER TABLE customer
ADD (
    creditlimit_indicate VARCHAR2(3) DEFAULT 'NO'
    CONSTRAINT customer_creditlimit_ck CHECK (creditlimit_indicate IN ('YES', 'NO'))
);

