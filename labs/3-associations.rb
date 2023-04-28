# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

sp = Salesperson.find_by({"first_name"=>"Hanna"})
c1 = Contact.find_by({"first_name"=>"Tim"})
c2 = Contact.find_by({"first_name"=>"Craig"})

new_activity = Activity.new
new_activity["salesperson_id"] = sp["id"]
new_activity["contact_id"] = c1["id"]
new_activity["note"] = "Grabbed lunch with Tim"
new_activity.save

new_activity = Activity.new
new_activity["salesperson_id"] = sp["id"]
new_activity["contact_id"] = c2["id"]
new_activity["note"] = "Tried to sell to Craig but he said no"
new_activity.save

new_activity = Activity.new
new_activity["salesperson_id"] = sp["id"]
new_activity["contact_id"] = c1["id"]
new_activity["note"] = "Talked to Tim about firing Craig"
new_activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

puts "Activities between #{sp["first_name"]} and #{c1["first_name"]} #{c1["last_name"]}:"

sp_acts_small = Activity.where({"salesperson_id"=>sp["id"], "contact_id"=>c1["id"]})

for i in sp_acts_small
    puts "- #{i["note"]}"
end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):
puts "#{sp["first_name"]}'s Activities:"

sp_acts = Activity.where({"salesperson_id"=>sp["id"]})

for i in sp_acts
    puts "- #{i["note"]}"
end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
