CREATE DATABASE MovieRatings;
USE MovieRatings;

-- Create Movies Table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL
);

-- Create Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL
);

-- Create Ratings Table
CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    rating INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Insert Movies Data
INSERT INTO Movies (movie_name) VALUES
('Black Panther: Wakanda Forever'),
('Nope'),
('John Wick: Chapter 4'),
('Wicked'),
('Blink Twice'),
('Deadpool and Wolverine');

-- Insert Users Data
INSERT INTO Users (user_name) VALUES
('Jaleesa'), ('Desmond'), ('Sharai'), ('Christian'), ('Juliet'), ('Mikyia'),
('Mikeli'), ('Latoya'), ('Ebony'), ('Chineze'), ('Jessie'), ('Margie');

-- Insert Ratings Data
INSERT INTO Ratings (user_id, movie_id, rating) VALUES
(1, 1, 5), (1, 2, 4), (1, 3, 3), (1, 5, 2), (1, 6, 5),
(2, 1, 4), (2, 2, 5), (2, 4, 3), (2, 5, 2), (2, 6, 4),
(3, 1, 3), (3, 2, 4), (3, 3, 5), (3, 4, 5), (3, 6, 3),
(4, 1, 5), (4, 2, 3), (4, 3, 4), (4, 4, 5), (4, 5, 3),
(5, 2, 2), (5, 3, 3), (5, 4, 4), (5, 5, 5), (5, 6, 4),
(6, 1, 4), (6, 3, 5), (6, 4, 3), (6, 5, 2), (6, 6, 5),
(7, 1, 5), (7, 2, 4), (7, 3, 3), (7, 4, 2), (7, 5, 4),
(8, 1, 3), (8, 2, 2), (8, 4, 4), (8, 5, 5), (8, 6, 4),
(9, 1, 5), (9, 2, 4), (9, 3, 3), (9, 4, 5), (9, 5, 2), (9, 6, 4),
(10, 1, 4), (10, 3, 5), (10, 4, 3), (10, 5, 4), (10, 6, 5),
(11, 1, 5), (11, 2, 3), (11, 3, 4), (11, 4, 5), (11, 6, 3),
(12, 1, 4), (12, 2, 5), (12, 3, 3), (12, 5, 2), (12, 6, 4);
