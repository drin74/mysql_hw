-- 1. 
SELECT a.name AS author_name, COUNT(ab.books_id) AS book_count
FROM authors a
JOIN authors_books ab ON a.id = ab.authors_id
GROUP BY a.id, a.name
ORDER BY book_count DESC
LIMIT 1;

-- 2. 
SELECT title, year
FROM books
WHERE year IS NOT NULL
ORDER BY year ASC
LIMIT 5;

-- 3.
SELECT COUNT(*) AS books_in_cabinet
FROM books b
JOIN shelves s ON b.shelves_id = s.id
WHERE s.title = 'Полка в кабинете';

-- 4. 
SELECT b.title, a.name AS author, b.year
FROM books b
JOIN shelves s ON b.shelves_id = s.id
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
WHERE s.title = 'Полка в спальне';

-- 5.
SELECT b.title, b.year
FROM books b
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
WHERE a.name = 'Лев Толстой';

-- 6. 
SELECT DISTINCT b.title
FROM books b
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
WHERE a.name LIKE 'А%';

-- 7.
SELECT b.title, a.name AS author
FROM books b
JOIN shelves s ON b.shelves_id = s.id
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
WHERE s.title LIKE '%верхняя%' OR s.title LIKE '%нижняя%';

-- 8.
UPDATE books b
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
JOIN friends f ON f.name = 'Иванов Иван'
SET b.friends_id = f.id
WHERE b.title = 'Божественная комедия' AND a.name = 'Данте Алигьери';

-- 9.
INSERT INTO authors (name) VALUES ('Стивен Хокинг') ON DUPLICATE KEY UPDATE name=name;
INSERT INTO books (title, year, shelves_id)
SELECT 'Краткие ответы на большие вопросы', 2020, id
FROM shelves WHERE title = 'Полка в кабинете';
INSERT INTO authors_books (books_id, authors_id)
SELECT LAST_INSERT_ID(), id FROM authors WHERE name = 'Стивен Хокинг';