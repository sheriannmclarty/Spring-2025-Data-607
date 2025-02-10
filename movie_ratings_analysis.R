# Load the necessary packages
library(DBI)       # For database connection
library(RMariaDB)  # MySQL driver
library(dplyr)     # Data wrangling
library(ggplot2)   # For visualizations
library(RColorBrewer) # For better colors

# Step 1: Connect to MySQL
con <- dbConnect(
  RMariaDB::MariaDB(), 
  user = "root",       
  password = "Spring_2025",   
  dbname = "movieratings",      
  host = "localhost",
  port = 3306
)

# Step 2: Get Data from MySQL
movies <- dbGetQuery(con, "SELECT * FROM Movies;")
users <- dbGetQuery(con, "SELECT * FROM Users;")
ratings <- dbGetQuery(con, "SELECT * FROM Ratings;")

# Step 3: Merge Ratings with Movie Names
ratings <- ratings %>%
  left_join(movies, by = "movie_id")

# Step 4: Handle Missing Ratings
ratings <- ratings %>%
  group_by(movie_id) %>%
  mutate(rating = ifelse(is.na(rating), mean(rating, na.rm = TRUE), rating)) %>%
  ungroup()

# Step 5: Quick Summary
print("📊 Quick look at the ratings:")
summary(ratings$rating)

# Step 6: Bar Chart - Average Rating per Movie
ggplot(ratings, aes(x = reorder(movie_name, -rating), y = rating, fill = movie_name)) +
  geom_bar(stat = "summary", fun = "mean", color = "black", width = 0.7) +
  geom_text(stat = "summary", fun = "mean", aes(label = round(..y.., 1)), vjust = -0.5, size = 5) +
  scale_fill_brewer(palette = "Set2") +  # Uses a colorful palette
  labs(
    title = "🎬 Average Movie Ratings", 
    subtitle = "Ratings collected from different users",
    x = "Movie",
    y = "Average Rating"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12), 
        axis.text.y = element_text(size = 12),
        plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(size = 12),
        legend.position = "none")  # Hides unnecessary legend

# Step 7: Histogram - Rating Distribution
ggplot(ratings, aes(x = rating, fill = ..count..)) +
  geom_histogram(binwidth = 1, color = "black", alpha = 0.8) +
  scale_fill_gradient(low = "skyblue", high = "darkblue") +  # Gradient effect
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5, size = 5) +
  labs(
    title = "⭐ Rating Distribution",
    subtitle = "How many times each rating was given",
    x = "Rating (1 to 5)",
    y = "Number of Ratings"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 12), 
        axis.text.y = element_text(size = 12),
        plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(size = 12))

# Step 8: Close Connection
dbDisconnect(con)
print("✅ Done! Disconnected from database.")
