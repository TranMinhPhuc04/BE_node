
-- tạo database cho web app food
-- tạo table users
CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

INSERT INTO users (full_name, email, pass_word) VALUES
('John Doe', 'johndoe@example.com', 'password123'),
('Jane Smith', 'janesmith@example.com', 'mypassword456'),
('Alice Johnson', 'alicej@example.com', 'alice789'),
('Bob Brown', 'bobbrown@example.com', 'bobpassword'),
('Charlie Wilson', 'charliew@example.com', 'charlie1234'),
('Emma Davis', 'emmad@example.com', 'emma567'),
('Liam Taylor', 'liamt@example.com', 'liam098'),
('Olivia Moore', 'oliviam@example.com', 'olivia123'),
('Noah Anderson', 'noaha@example.com', 'noah456'),
('Sophia Thomas', 'sophiat@example.com', 'sophia789'),
('James Jackson', 'jamesj@example.com', 'james999'),
('Mia White', 'miaw@example.com', 'mia567'),
('William Harris', 'williamh@example.com', 'william321'),
('Isabella Martin', 'isabellam@example.com', 'bella654'),
('Elijah Garcia', 'elijahg@example.com', 'elijahpass'),
('Amelia Martinez', 'ameliam@example.com', 'amelia123'),
('Lucas Lee', 'lucasl@example.com', 'lucaspass'),
('Charlotte Walker', 'charlottew@example.com', 'charlotte777'),
('Ethan Young', 'ethany@example.com', 'ethan888'),
('Harper Hall', 'harperh@example.com', 'harper654');


create table restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description TEXT
)

INSERT INTO restaurant (res_name, image, description) VALUES
('The Gourmet Kitchen', 'gourmet_kitchen.jpg', 'A fine dining restaurant specializing in French cuisine.'),
('Sushi Haven', 'sushi_haven.jpg', 'The best sushi spot in town offering fresh and authentic Japanese dishes.'),
('Pasta Paradise', 'pasta_paradise.jpg', 'A cozy Italian restaurant with handmade pasta and delicious sauces.'),
('BBQ Kingdom', 'bbq_kingdom.jpg', 'Experience the best barbecue flavors from around the world.'),
('The Vegan Bistro', 'vegan_bistro.jpg', 'A plant-based haven for health-conscious food lovers.'),
('Ocean Delights', 'ocean_delights.jpg', 'Seafood specialties served fresh from the ocean.'),
('Spicy Corner', 'spicy_corner.jpg', 'Indian cuisine with bold flavors and a wide variety of spices.'),
('Burger Barn', 'burger_barn.jpg', 'Classic American burgers with a modern twist.'),
('Taco Fiesta', 'taco_fiesta.jpg', 'Authentic Mexican tacos bursting with flavor.'),
('Steakhouse Supreme', 'steakhouse_supreme.jpg', 'Premium cuts of steak grilled to perfection.'),
('Dim Sum Delight', 'dim_sum_delight.jpg', 'Traditional Chinese dim sum made fresh daily.'),
('Mediterranean Bliss', 'mediterranean_bliss.jpg', 'Healthy and delicious Mediterranean dishes.'),
('Cafe Cozy', 'cafe_cozy.jpg', 'A warm and inviting cafe with the best coffee and pastries.'),
('Korean Grill', 'korean_grill.jpg', 'Authentic Korean barbecue with a modern ambiance.'),
('Pizza Perfection', 'pizza_perfection.jpg', 'Wood-fired pizzas with fresh, high-quality ingredients.'),
('Thai Fusion', 'thai_fusion.jpg', 'A unique blend of traditional Thai and modern flavors.'),
('Bistro Bliss', 'bistro_bliss.jpg', 'A casual dining spot with a menu full of comfort food.'),
('Dessert Haven', 'dessert_haven.jpg', 'Heavenly desserts to satisfy your sweet tooth.'),
('Tapas Treat', 'tapas_treat.jpg', 'A lively spot offering delicious Spanish tapas.'),
('The Breakfast Club', 'breakfast_club.jpg', 'Start your day with hearty breakfast options and fresh coffee.');-- tạo table like_res
CREATE TABLE like_res (like_res_id INT PRIMARY KEY AUTO_INCREMENT, user_id INT, FOREIGN KEY (user_id) REFERENCES users (user_id), res_id INT, FOREIGN KEY (res_id) REFERENCES restaurant (res_id), date_like DATE)
INSERT INTO
	like_res (user_id, res_id, date_like)
VALUES
	(1, 3, '2025-01-01'),
	(1, 4, '2025-01-01'),
	(2, 5, '2025-01-02'),
	(3, 7, '2025-01-03'),
	(4, 9, '2025-01-04'),
	(5, 2, '2025-01-05'),
	(6, 4, '2025-01-06'),
	(7, 6, '2025-01-07'),
	(8, 8, '2025-01-08'),
	(9, 1, '2025-01-09'),
	(10, 10, '2025-01-10'),
	(11, 12, '2025-01-11'),
	(12, 14, '2025-01-12'),
	(13, 15, '2025-01-13'),
	(14, 11, '2025-01-14'),
	(15, 13, '2025-01-15');

-- 1. tìm 5 người like nhà hàng nhiều nhất
-- B1: tìm table để kết bảng
-- users, like_res
-- để đếm số lượng like
-- dùng 1 số hàm tổng hợp => COUNT
-- COUNT, MAX, MIN, AVG, SUM
-- GROUP BY

SELECT COUNT(u.user_id) AS 'Số lượng like', u.user_id, u.full_name FROM users AS u
JOIN like_res AS lr ON u.user_id = lr.user_id
GROUP BY u.user_id, u.full_name
ORDER BY COUNT(u.user_id) DESC
LIMIT 5

-- 2. Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT COUNT(res.res_id) AS 'Lượt like', res.res_name FROM restaurant as res
JOIN like_res AS lr ON lr.res_id = res.res_id
GROUP BY res.res_name
ORDER BY COUNT(res.res_id) DESC
LIMIT 2

-- tạo table rate_res, food_type
CREATE TABLE rate_res (
	rata_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
	amount INT,
	date_rate date
)

CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

-- data rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate)
VALUES
    (1, 2, 5, '2024-01-01'),
    (2, 3, 4, '2024-01-02'),
    (3, 1, 3, '2024-01-03'),
    (4, 4, 5, '2024-01-04'),
    (5, 2, 2, '2024-01-05'),
    (6, 3, 4, '2024-01-06'),
    (7, 1, 5, '2024-01-07'),
    (8, 4, 3, '2024-01-08'),
    (9, 2, 4, '2024-01-09'),
    (10, 3, 5, '2024-01-10'),
    (11, 1, 2, '2024-01-11'),
    (12, 4, 5, '2024-01-12'),
    (13, 2, 3, '2024-01-13'),
    (14, 3, 4, '2024-01-14'),
    (15, 1, 5, '2024-01-15'),
    (16, 4, 3, '2024-01-16'),
    (17, 2, 4, '2024-01-17'),
    (18, 3, 5, '2024-01-18'),
    (19, 1, 2, '2024-01-19'),
    (20, 4, 5, '2024-01-20');

-- data food_type
INSERT INTO food_type (type_name)
VALUES
    ('Asian Cuisine'),
    ('Fast Food'),
    ('Desserts'),
    ('Beverages'),
    ('Italian Cuisine'),
    ('Mexican Cuisine'),
    ('Indian Cuisine'),
    ('Mediterranean Cuisine'),
    ('Vegetarian'),
    ('Vegan'),
    ('Seafood'),
    ('Grill & BBQ'),
    ('Breakfast'),
    ('Snacks'),
    ('Street Food'),
    ('Chinese Cuisine'),
    ('French Cuisine'),
    ('Japanese Cuisine'),
    ('Korean Cuisine'),
    ('Healthy Food');

-- tạo table food
CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    price DOUBLE,
    image VARCHAR(255),
    description TEXT,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);


-- data food
INSERT INTO food (food_name, price, image, description, type_id)
VALUES
    ('Margherita Pizza', 8.99, 'margherita.jpg', 'Classic Italian pizza with tomatoes, mozzarella, and basil.', 5),
    ('Tacos', 6.49, 'tacos.jpg', 'Soft tacos filled with seasoned meat, lettuce, and cheese.', 6),
    ('Butter Chicken', 10.99, 'butter_chicken.jpg', 'Rich and creamy Indian curry with tender chicken.', 7),
    ('Sushi Platter', 15.99, 'sushi_platter.jpg', 'An assortment of fresh sushi and sashimi.', 18),
    ('Korean BBQ Ribs', 12.99, 'korean_bbq.jpg', 'Grilled beef ribs marinated in a sweet and savory sauce.', 19),
    ('Vegetarian Salad', 7.49, 'veg_salad.jpg', 'Fresh mix of greens, tomatoes, and cucumbers.', 9),
    ('Vegan Burger', 9.99, 'vegan_burger.jpg', 'Plant-based burger served with fries.', 10),
    ('Grilled Salmon', 13.99, 'grilled_salmon.jpg', 'Perfectly grilled salmon with a lemon butter sauce.', 11),
    ('Pancakes', 5.99, 'pancakes.jpg', 'Fluffy pancakes served with maple syrup.', 13),
    ('Cheeseburger', 7.99, 'cheeseburger.jpg', 'Juicy beef patty topped with cheese and veggies.', 2),
    ('Dim Sum', 9.49, 'dim_sum.jpg', 'Steamed dumplings filled with pork and shrimp.', 16),
    ('Crepes', 6.99, 'crepes.jpg', 'Thin French pancakes with sweet or savory fillings.', 17),
    ('Ramen', 10.49, 'ramen.jpg', 'Japanese noodle soup with pork, egg, and vegetables.', 18),
    ('Falafel Wrap', 8.49, 'falafel_wrap.jpg', 'Middle Eastern wrap with falafel, hummus, and veggies.', 8),
    ('Chocolate Cake', 4.99, 'chocolate_cake.jpg', 'Rich and moist chocolate cake.', 3),
    ('Smoothie', 3.99, 'smoothie.jpg', 'Refreshing fruit smoothie made with fresh ingredients.', 4),
    ('Grilled Chicken', 11.49, 'grilled_chicken.jpg', 'Juicy grilled chicken served with a side of vegetables.', 12),
    ('Street Tacos', 5.99, 'street_tacos.jpg', 'Authentic street-style tacos with spicy salsa.', 15),
    ('Biryani', 12.99, 'biryani.jpg', 'Fragrant spiced rice dish with chicken or lamb.', 7),
    ('Pho', 9.99, 'pho.jpg', 'Vietnamese noodle soup with beef and herbs.', 1);

-- orders
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	amount INT,
	code VARCHAR(10),
	arr_sub_id VARCHAR(255)
)

-- DATA ORDER
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id)
VALUES
    (1, 5, 2, 'ORD001', 'SUB001, SUB002'),
    (2, 10, 1, 'ORD002', 'SUB003'),
    (3, 7, 3, 'ORD003', 'SUB004, SUB005'),
    (4, 15, 1, 'ORD004', 'SUB006'),
    (5, 2, 4, 'ORD005', 'SUB007, SUB008'),
    (6, 9, 2, 'ORD006', 'SUB009'),
    (7, 20, 3, 'ORD007', 'SUB010, SUB011'),
    (8, 14, 1, 'ORD008', 'SUB012'),
    (9, 8, 2, 'ORD009', 'SUB013, SUB014'),
    (10, 12, 1, 'ORD010', 'SUB015'),
    (11, 3, 3, 'ORD011', 'SUB016, SUB017'),
    (12, 18, 1, 'ORD012', 'SUB018'),
    (13, 6, 2, 'ORD013', 'SUB019, SUB020'),
    (14, 4, 4, 'ORD014', 'SUB021'),
    (15, 19, 1, 'ORD015', 'SUB022, SUB023'),
    (16, 1, 2, 'ORD016', 'SUB024'),
    (17, 11, 3, 'ORD017', 'SUB025, SUB026'),
    (18, 13, 1, 'ORD018', 'SUB027'),
    (19, 16, 2, 'ORD019', 'SUB028, SUB029'),
    (20, 17, 1, 'ORD020', 'SUB030');

-- câu 3: Tìm người đã đặt hàng nhiều nhất
-- kết table users và orders
SELECT COUNT(u.user_id) AS 'Lượt order', u.full_name FROM users AS u
JOIN orders AS o ON o.user_id = u.user_id
GROUP BY u.full_name
ORDER BY COUNT(u.user_id) DESC
LIMIT 1

-- Câu 4: Tìm người dùng không hoạt động trong hệ thống
-- (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT * FROM users AS u 
LEFT JOIN like_res AS lr ON u.user_id = lr.user_id
LEFT JOIN rate_res AS rr ON u.user_id = rr.user_id
LEFT JOIN orders AS o ON u.user_id = o.user_id
WHERE lr.user_id IS NULL AND rr.user_id IS NULL AND o.user_id IS NULL














