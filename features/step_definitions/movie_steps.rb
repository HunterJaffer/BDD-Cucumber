# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(", ").each do |e|
    step(%{I uncheck "ratings[#{e}]"}) if uncheck=="un"
    step(%{I check "ratings[#{e}]"}) if uncheck==nil
  end
end
Then /I should( not)? see the following ratings: (.*)/ do |no,rating_list|
  rating_list.split(", ").each do |e|
    Movie.where(rating:"#{e}").each do |movie|
      expect(page).not_to have_content("#{movie.title}") if no=="not"
      expect(page).to have_content("#{movie.title}") if no==nil
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  fail "Unimplemented"
end
