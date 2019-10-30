USE publications;

#This is first subquery
SELECT titles.title_id as Title_ID, titleauthor.au_id as Author_ID, 
titles.advance * titleauthor.royaltyper / 100 AS Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Sales_Royalty
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
ORDER BY Author_ID;

#Temporary table way
create temporary table temp
SELECT Author_ID, Advance + Sales_Royalty AS Profit
FROM (
SELECT titles.title_id as Title_ID, titleauthor.au_id as Author_ID, 
titles.advance * titleauthor.royaltyper / 100 AS Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Sales_Royalty
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
ORDER BY Author_ID
)SUBQUERY1
GROUP BY Author_ID, Title_ID
ORDER BY Author_ID;

select  Author_ID , SUM(Profit) as Total
from temp
group by Author_ID
order by Total desc
Limit 3;

#Query and subqueries way
select  Author_ID , SUM(Profit) as Total
from
(
SELECT Author_ID, Advance + Sales_Royalty AS Profit
FROM (
SELECT titles.title_id as Title_ID, titleauthor.au_id as Author_ID, 
titles.advance * titleauthor.royaltyper / 100 AS Advance,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS Sales_Royalty
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
ORDER BY Author_ID
)SUBQUERY1
GROUP BY Author_ID, Title_ID
ORDER BY Author_ID)sub2
group by Author_ID
order by Total desc
Limit 3;