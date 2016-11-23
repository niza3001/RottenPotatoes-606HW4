Feature: Add movie to Rotten potatoes database

   As a movie buff
   So that I can make a list of my favorite movies
   I want to be able to add movies to Rotten Potatoes database

 Background: movies in database

   Given the following movies exist:
   | title        | rating | director     | release_date |
   | Star Wars    | PG     | George Lucas |   1977-05-25 |
   | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
   | Alien        | R      |              |   1979-05-25 |
   | THX-1138     | R      | George Lucas |   1971-03-11 |

 Scenario: add movie
   When I am on the home page
   When I follow "Add new movie"
   And  I fill in "Title" with "test_movie"
   And  I press "Save"
   Then I should be on the home page
   And I should see "test_movie"
