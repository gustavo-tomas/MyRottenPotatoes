Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

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

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  Given I check the following ratings: PG, R
  And I uncheck the following ratings: PG-13, G, NC-17
  And I press "Refresh"
  Then I should not see "Star Wars"
  And I should see "Requiem for a dream"
  And I should not see "The Help"
  And I should not see "Aladdin"
  And I should see "When Harry Met Sally"
  And I should see "Luca"
  And I should see "Django Unchained"
  And I should not see "Tropa de Elite 2"
  And I should see "Field of dreams"

Scenario: no ratings selected
Given I uncheck the following ratings: PG, G, R, PG-13, NC-17
  And I press "Refresh"
  Then I should not see "Star Wars"
  And I should not see "Requiem for a dream"
  And I should not see "The Help"
  And I should not see "Aladdin"
  And I should not see "When Harry Met Sally"
  And I should not see "Luca"
  And I should not see "Django Unchained"
  And I should not see "Tropa de Elite 2"
  And I should not see "Field of dreams"

Scenario: all ratings selected
Given I check the following ratings: PG, G, R, PG-13, NC-17
  And I press "Refresh"
  Then I should see all of the movies