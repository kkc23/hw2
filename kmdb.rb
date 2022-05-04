# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Role.destroy_all
Studio.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

warner_bros = Studio.new
warner_bros["studio_name"] = "Warner Bros."
warner_bros.save

batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year"] = 2005
batman_begins["rating"] = "PG-13"
batman_begins["studio"] = warner_bros["studio_name"]
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year"] = 2008
dark_knight["rating"] = "PG-13"
dark_knight["studio"] = warner_bros["studio_name"]
dark_knight.save

dark_knight_r = Movie.new
dark_knight_r["title"] = "The Dark Knight Rises"
dark_knight_r["year"] = 2012
dark_knight_r["rating"] = "PG-13"
dark_knight_r["studio"] = warner_bros["studio_name"]
dark_knight_r.save

actor = Actor.new
actor["actor_name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["actor_name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["actor_name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["actor_name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["actor_name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor["actor_name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["actor_name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["actor_name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor["actor_name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["actor_name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["actor_name"] = "Anne Hathaway"
actor.save

batman_begins = Movie.find_by({"title" => "Batman Begins"})
dark_knight = Movie.find_by({"title" => "The Dark Knight"})
dark_knight_r = Movie.find_by({"title" => "The Dark Knight Rises"})

bale = Actor.find_by({"actor_name" => "Christian Bale"})
caine = Actor.find_by({"actor_name" => "Michael Caine"})
neeson = Actor.find_by({"actor_name" => "Liam Neeson"})
holmes = Actor.find_by({"actor_name" => "Katie Holmes"})
oldman = Actor.find_by({"actor_name" => "Gary Oldman"})
ledger = Actor.find_by({"actor_name" => "Heath Ledger"})
eckhart = Actor.find_by({"actor_name" => "Aaron Eckhart"})
gyllenhaal = Actor.find_by({"actor_name" => "Maggie Gyllenhaal"})
hardy = Actor.find_by({"actor_name" => "Tom Hardy"})
levitt = Actor.find_by({"actor_name" => "Joseph Gordon-Levitt"})
hathaway = Actor.find_by({"actor_name" => "Anne Hathaway"})

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = holmes["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = ledger["id"]
role["character_name"] = "Joker"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = eckhart["id"]
role["character_name"] = "Harvey Dent"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = gyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = dark_knight_r["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = dark_knight_r["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = dark_knight_r["id"]
role["actor_id"] = hardy["id"]
role["character_name"] = "Bane"
role.save

role = Role.new
role["movie_id"] = dark_knight_r["id"]
role["actor_id"] = levitt["id"]
role["character_name"] = "John Blake"
role.save

role = Role.new
role["movie_id"] = dark_knight_r["id"]
role["actor_id"] = hathaway["id"]
role["character_name"] = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

for movie in Movie.all
    puts "#{movie["title"]} #{movie["year"]} #{movie["rating"]} #{movie["studio"]}"
end

# Query the movies data and loop through the results to display the movies output.

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

for role in Role.all
    puts "#{role["movie_id"]} #{role["actor_id"]} #{role["character_name"]}"
end

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
