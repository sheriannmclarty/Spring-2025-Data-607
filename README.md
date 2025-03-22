# Spring-2025-Data-607
Chess Tournament Data Analysis

Author: Sheriann McLartyDate: February 24, 2025

Overview

This project tackles a text-based dataset from a chess tournament and transforms it into a clean, structured format ready for analysis or import into a database. The dataset includes each player’s name, state, total points earned, pre-tournament rating, and a record of their opponents. The goal was to extract these insights, calculate the average pre-tournament rating of each player’s opponents, and visualize the results using R and Shiny.

Objectives

Parse and clean semi-structured tournament data

Extract key fields using regular expressions and string manipulation

Calculate average opponent ratings

Rank players by performance (points and opponent strength)

Export a clean CSV suitable for SQL import

Create static and interactive data visualizations using ggplot2 and Shiny

Process Summary

Data Cleaning & Extraction:The raw file alternated between performance stats and player metadata. I used R to line-match the two and extracted relevant fields using regex.

Feature Engineering:I created a lookup table for opponent ratings and calculated each player’s average opponent pre-rating. Players were then re-ranked using total points and this new metric.

Visualization:Using ggplot2, I plotted:

A horizontal bar chart of the top 10 players by points

A scatter plot of Pre-Rating vs. Average Opponent Pre-Rating

Interactivity with Shiny:Built a simple Shiny app to filter by rating and explore individual player stats dynamically.

Exporting:The final cleaned dataset was exported to a CSV:chess_tournament_results.csv

Output Fields

Final_Rank: Recalculated ranking based on performance

Player: Full name

State: Player’s state (if available)

Total_Points: Tournament points earned

Pre_Rating: Player’s rating before the tournament

Avg_Opponent_Pre_Rating: Average rating of all opponents

Technologies Used

R (tidyverse, ggplot2, stringr, shiny)

R Markdown

Shiny for interactivity

CSV for data export

SQL-ready formatting

How to Run

Open the R Markdown file (.Rmd) and knit to HTML or PDF

Launch the Shiny app section inside RStudio (runtime: shiny)

CSV will be saved as chess_tournament_results.csv in your working directory

Import into your database as needed

