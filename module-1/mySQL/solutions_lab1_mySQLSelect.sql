#CHALLENGE 1
SELECT authors.au_id, authors.au_fname AS First_Name, authors.au_lname AS Last_Name, titles.title, publishers.pub_name AS Publisher
FROM pubs.authors 
JOIN pubs.titleauthor ON authors.au_id = titleauthor.au_id
JOIN pubs.titles ON titleauthor.title_id = titles.title_id
JOIN pubs.publishers ON titles.pub_id = publishers.pub_id;

#CHALLENGE2

SELECT authors.au_id, authors.au_fname AS First_Name, authors.au_lname AS Last_Name, publishers.pub_name AS Publisher, count(titles.title) AS Title_Count
FROM pubs.authors 
JOIN pubs.titleauthor ON authors.au_id = titleauthor.au_id
JOIN pubs.titles ON titleauthor.title_id = titles.title_id
JOIN pubs.publishers ON titles.pub_id = publishers.pub_id
GROUP BY 1,2,3,4

#CHALLENGE3

SELECT authors.au_id, authors.au_fname AS First_Name, authors.au_lname AS Last_Name, count(titles.title) AS Title_Count, sum(sales.qty) AS Total_Sales
FROM pubs.authors 
JOIN pubs.titleauthor ON authors.au_id = titleauthor.au_id
JOIN pubs.titles ON titleauthor.title_id = titles.title_id
JOIN pubs.sales ON titles.title_id = sales.title_id
GROUP BY 1,2,3
ORDER BY 5 DESC
LIMIT 3;

#CHALLENGE4

SELECT authors.au_id, authors.au_fname AS First_Name, authors.au_lname AS Last_Name, count(titles.title) AS Title_Count, sum(sales.qty) AS Total_Sales
FROM pubs.authors 
LEFT JOIN pubs.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN pubs.titles ON titleauthor.title_id = titles.title_id
LEFT JOIN pubs.sales ON titles.title_id = sales.title_id
GROUP BY 1,2,3
ORDER BY 5 DESC;
