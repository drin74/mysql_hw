-- 1.
SELECT sum(amount) FROM hardware
-- 2. 
SELECT title from 
hardware WHERE amount like 0
-- 3.
SELECT AVG(price) AS avg_monitor_price FROM 
hardware WHERE title LIKE 'Монитор%';
-- 4.
SELECT title, price FROM 
hardware WHERE title LIKE 'Клавиатура%'ORDER BY price ASC;
-- 5.
SELECT tag, COUNT(*) AS item_count
FROM hardware
WHERE tag IS NOT NULL
GROUP BY tag
ORDER BY item_count DESC;
-- 6. 
select count(*) from hardware
where tag ='discount'
-- 7.
SELECT title, price
FROM hardware 
WHERE tag = 'new'
ORDER BY price DESC
LIMIT 1;
-- 8. 
INSERT INTO hardware (title, price, amount, tag)
VALUES ('Ноутбук Lenovo 2BXKQ7E9XD', 54500, 1, 'new');
-- 9.
DELETE FROM hardware 
WHERE title = 'Очки PS VR 2' AND id >