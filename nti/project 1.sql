drop database if exists simple_blog_system;
create database simple_blog_system;
use simple_blog_system;
drop table blog_users;
CREATE TABLE blog_users (
    users_id INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL,
    user_password VARCHAR(50) NOT NULL
);
insert into blog_users (username,email,user_password) values
("admin","admin@example.com,","password123"),
("user1","user1@example.com,","password123"),
("user2","user2@example.com","password123");
SELECT 
    *
FROM
    blog_users;
CREATE TABLE posts (
    post_id INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(100),
    content VARCHAR(800),
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES blog_users (users_id)
);
 insert into posts(title,content,user_id) values 
 ("Hello World!","This is my first post.",1),
 ("My Second Post","This is my second post.",1),
 ("User1\'s Post","This is user1\'s post.",2);
 SELECT 
    *
FROM
    posts;
 CREATE TABLE comments (
    comments_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    FOREIGN KEY (post_id)
        REFERENCES posts (post_id),
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES blog_users (users_id),
    comment_text varchar(100) not null
);
INSERT INTO comments (post_id, user_id, comment_text) VALUES 
(1, 1,"Nice post!"),
(1, 2,"I agree!"),
(2, 1,"Good job!"),
(3, 2,"Thanks!");
select * from comments;
#1
select title, content from posts;
#2
select * from posts where user_id=2;
#3
select * from comments where post_id=2;
#4
select username from blog_users where comments_id=1;

 



