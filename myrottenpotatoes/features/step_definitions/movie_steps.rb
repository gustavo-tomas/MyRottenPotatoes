Given('the following movies exist:') do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    data = table.raw
    expected_data = [["title", "rating", "release_date"], ["Star Wars", "PG-13", "25-Apr-1997"],
    ["Requiem for a dream", "R", "27-Oct-2000"], ["The Help", "PG-13", "10-Aug-2011"],
    ["Aladdin", "G", "1-Nov-1992"], ["When Harry Met Sally", "R", "21-Jul-1989"],
    ["Luca", "PG", "18-Jun-2021"], ["Django Unchained", "R", "23-Aug-2026"],
    ["Tropa de Elite 2", "NC-17", "31-Aug-2021"], ["Field of dreams", "PG", "20-Sep-2016"]]
    
    assert(data.sort == expected_data.sort)
    # pending # Write code here that turns the phrase above into concrete actions
end

Given('I check all ratings') do
    within('#ratings_form') do
        assert check('ratings_G')
        assert check('ratings_PG')
        assert check('ratings_PG-13')
        assert check('ratings_R')
        assert check('ratings_NC-17')
    end
    # pending # Write code here that turns the phrase above into concrete actions
end

Given('I check the following ratings: {}') do |string|
    ratings_list = string.gsub(/\s+/,"").split(',')
    ratings_list.each do |rating|
        printf("\nRATING = ratings_#{rating}")
        assert check("ratings_#{rating}")
    end
    # pending # Write code here that turns the phrase above into concrete actions
end

Given('I uncheck the following ratings: {}') do |string|
    ratings_list = string.gsub(/\s+/,"").split(',')
    ratings_list.each do |rating|
        printf("RATING = #{rating}\n") 
        assert uncheck("ratings_#{rating}")
    end
    # pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see all of the movies') do
    title_list = ["Star Wars", "Requiem for a dream", "The Help", "Aladdin", "When Harry Met Sally",
    "Luca", "Django Unchained", "Tropa de Elite 2", "Field of dreams"]
    title_list.each do |title|
        printf("YE? = #{assert has_text?(title)}\n") # assert has_content?(title)
    end
    # printf("\nCONTENT = #{page.body}\n")

    pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see {string} before {string}') do |string, string2|
    # within_table('movies') do
    #     printf("ROWS = #{}")
    #     assert(page.find("Alladin"))
    # end
    pending # Write code here that turns the phrase above into concrete actions
end