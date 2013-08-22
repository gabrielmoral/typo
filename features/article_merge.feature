Feature: Article merge
	As a blog adminsitrator
	In order to share my thoughts with the world
  I	want to be able to merge similar articles to my blog

  Background:
    Given the blog is set up
		And the following articles exist:
      | title  | author | body           | published | id |
      | first  | gmoral | Lorem Ipsum    | t         | 1  |
      | second | eric   | Muspi Merol    | u         | 2  |
		
	Scenario: User cannot merge articles
	  Given I am logged into the admin panel like gmoral
	  And I follow "All Articles"
	  And I follow "first"	
	  Then I should not see "Merge"	

	Scenario: Admin can merge articles
	  Given I am logged into the admin panel
	  And I follow "All Articles"
    And I follow "first"	
	  Then I should see "Merge"	

	Scenario: The merged article should contain the text of both previous articles   
		Given I am logged into the admin panel 
		And I am on the article "first" page	
		When I fill in "merge_with" with "2"
		And I press "Merge"
	  Then I should be on the article "first" page
		And I should see "Articles merged"
		And I should see "Lorem Ipsum"
		And I should see "Muspi Merol"

	
