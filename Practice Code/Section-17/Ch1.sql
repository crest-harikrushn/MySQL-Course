-- 1. Finding 5 oldest users

SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- 2. Most Popular Registration Date (Day of Week)
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- 3. Identify Inactive users (users with no photos)
-- LEFT JOIN
SELECT username FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.user_id IS NULL; 

-- RIGHT JOIN
SELECT username FROM photos RIGHT JOIN users ON users.id = photos.user_id WHERE photos.user_id IS NULL; 


-- 4. Identify most popular photo (and user who created it)
SELECT 
    username,
    photos.id as photo_id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;


-- 5. Calculate average num of photos per user
SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS AVG_USER_POST;


-- 5. Top 5 Most Popular Tags
SELECT 
    tags.tag_name,
    COUNT(*) AS total_used
FROM photo_tags
JOIN tags
    ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total_used DESC
LIMIT 5;



-- 6. Finding Bots - users who liked every single photos

SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 