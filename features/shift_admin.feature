Feature: Shift admin manages shifts
  In order to manage shifts
  As a shifts admininistrator
  I want to be able to create, assign, and destroy shifts

Scenario: Create a shift with power sign up
  Given I am logged into CAS as "ad12"
  And I am on the homepage
	And I follow "Shifts"
	Then I should see "Power sign up"
	When I follow "Power sign up"
  And I select "2010" from "shift_start_1i"
	And I select "January" from "shift_start_2i"
	And I select "18" from "shift_start_3i"
	And I select "09" from "shift_start_4i"
	And I select "00" from "shift_start_5i"
	And I select "2010" from "shift_end_1i"
	And I select "January" from "shift_end_2i"
	And I select "18" from "shift_end_3i"
	And I select "12" from "shift_end_4i"
	And I select "00" from "shift_end_5i"
	And I select "Harry Potter" from "shift_user_id"
	And I select "Diagon Alley" from "shift_location_id"
	When I press "Submit"
	Then I should see "Successfully created shift."

Scenario: Destroy a shift
  Given I am logged into CAS as "ad12"
  And I am on the homepage
	And I follow "Shifts"
	Then I should see "Power sign up"
	When I follow "Power sign up"
  And I select "2010" from "shift_start_1i"
	And I select "January" from "shift_start_2i"
	And I select "18" from "shift_start_3i"
	And I select "09" from "shift_start_4i"
	And I select "00" from "shift_start_5i"
	And I select "2010" from "shift_end_1i"
	And I select "January" from "shift_end_2i"
	And I select "18" from "shift_end_3i"
	And I select "12" from "shift_end_4i"
	And I select "00" from "shift_end_5i"
	And I select "Harry Potter" from "shift_user_id"
	And I select "Diagon Alley" from "shift_location_id"
	When I press "Submit"
	Then I should see "Successfully created shift."
	When I follow "Shifts"
	And I follow "Destroy"
	Then I should see "Successfully destroyed shift."

Scenario Outline: See more choices when logged in as admin
Given I am logged into CAS as <user>
Given I am on the homepage
Then I <shouldornot> see <item>

Scenarios: Logged in as superuser

|user  |shouldornot|item       |
|"ad12"|should     |"Dashboard"|
|"ad12"|should     |"Hogwarts" |
|"ad12"|should     |"Users"    |
|"ad12"|should     |"Shifts"   |
|"ad12"|should     |"Payforms" |

Scenarios: Logged in as normal user

|user   |shouldornot|item         |
|"em123"|should     |"Dashboard"  |
|"em123"|should     |"Shifts"     |
|"em123"|should     |"Payforms"   |
|"em123"|should not |"Departments"|
|"em123"|should not |"Users"      |

Scenario Outline: See control panel on certain pages depending on how logged in
Given I am logged into CAS as <user>
Given I am on the homepage
When I follow <page>
Then I <shouldornot> see <item>


Scenarios: Logged in as admin

|user  |page      |shouldornot|item                 |
|"ad12"|"Shifts"  |should     |"Scheduling Options" |
|"ad12"|"Shifts"  |should     |"Schedule"           |
|"ad12"|"Shifts"  |should     |"Time Slots"         |
|"ad12"|"Shifts"  |should     |"Locations"          |
|"ad12"|"Shifts"  |should     |"Location Groups"    |
|"ad12"|"Shifts"  |should     |"Restrictions"       |
|"ad12"|"Shifts"  |should     |"Notices"            |
|"ad12"|"Shifts"  |should     |"Shift Report Links" |
|"ad12"|"Shifts"  |should     |"Export Schedule"    |
|"ad12"|"Shifts"  |should     |"Templates"          |
|"ad12"|"Shifts"  |should     |"Activate Templates" |
|"ad12"|"Shifts"  |should     |"View Options"       |
|"ad12"|"Shifts"  |should     |"Unscheduled Shifts" |
|"ad12"|"Shifts"  |should     |"Active Shifts"      |
|"ad12"|"Shifts"  |should     |"Data Objects"       |
|"ad12"|"Payforms"|should     |"Payform Admin"      |
|"ad12"|"Payforms"|should     |"View Payforms"      |
|"ad12"|"Payforms"|should     |"Submitted"          |
|"ad12"|"Payforms"|should     |"Approved"           |
|"ad12"|"Payforms"|should     |"Printed"            |
|"ad12"|"Payforms"|should     |"Print History"      |
|"ad12"|"Payforms"|should     |"Mass Add Jobs"      |
|"ad12"|"Payforms"|should     |"View Mass Jobs"     |
|"ad12"|"Payforms"|should     |"Punch Clocks"       |
|"ad12"|"Payforms"|should     |"Mass Punch Clocks"  |
|"ad12"|"Payforms"|should     |"E-mail Reminders"   |
|"ad12"|"Payforms"|should     |"Edit Categories"    |
|"ad12"|"Payforms"|should     |"Edit Configurations"|

#Scenarios: Logged in as regular user

