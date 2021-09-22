Feature: display list of movies sorted by different criteria
 
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Star Wars               | PG-13  | 25-Apr-1997  |
  | Requiem for a dream     | R      | 27-Oct-2000  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Aladdin                 | G      | 1-Nov-1992   |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | Luca                    | PG     | 18-Jun-2021  |
  | Django Unchained        | R      | 23-Aug-2026  |
  | Tropa de Elite 2        | NC-17  | 31-Aug-2021  |
  | Field of dreams         | PG     | 20-Sep-2016  |

  And I am on the RottenPotatoes home page
  And I check all ratings
  And I press "ratings_submit"

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  Then I should see "Aladdin" before "Star Wars"

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  Then I should see "When Harry Met Sally" before "The Help"