Given /^the following articles exist:$/ do |article_table|
  article_table.hashes.each do |article|
    Article.create!(article)
  end
end

