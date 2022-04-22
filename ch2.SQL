--- selections

-- descending list of name and part number where name contains 'hair'
SELECT name, part_num FROM parts WHERE name LIKE '%Hair%' ORDER BY part_num DESC;

-- list of sets between 1990 and 2015 where the name contains 'showdown'
SELECT * FROM sets WHERE set_name LIKE '%showdown%' AND year BETWEEN 1990 AND 2015;

-- list of part ids and names of parts containing the term 'bricks'
SELECT p.id, p.name FROM part_categories AS p WHERE p.name LIKE '%bricks%';

--- subqueries

-- list of sets where the theme id matches 'pirates' or 'star wars'
SELECT set_name FROM sets WHERE theme_id IN (SELECT id FROM themes WHERE name LIKE 'Pirates' OR name LIKE '%Star Wars%');

-- full inventory parts table that only lists parts with more than one version
SELECT * FROM inventory_parts WHERE inventory_id IN (SELECT id FROM inventories WHERE version > 1);

--- manipulate values

-- list all sets where set name contains batman. concatenate '!!!' and uppercase names.
SELECT CONCAT(UPPER(set_name), '!!!'), year FROM sets as s WHERE set_name LIKE '%Batman%';

-- descending list of top 20 quantity x 2 of parts where quantity is greater than one. 
SELECT quantity * 2 FROM inventory_parts WHERE quantity > 1 ORDER BY quantity DESC LIMIT 20;

--- dates

--list of set names with year and date corresponding to Jan 1st of the year 
SELECT set_name, year, MAKEDATE(year, 1) FROM sets;

