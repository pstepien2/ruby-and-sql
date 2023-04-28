# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.
salesperson1 = Salesperson.new
salesperson1["first_name"] = "Steve"
salesperson1["last_name"] = "Thomas"
salesperson1["email"] = "steve.thomas@gmail.com"
salesperson1.save

salesperson2 = Salesperson.new
salesperson2["first_name"] = "Hannah"
salesperson2["last_name"] = "Lewis"
salesperson2["email"] = "hannah.lewis@gmail.com"
salesperson2.save

# 3. write code to display how many salespeople rows are in the database
puts "Salespeople: #{Salesperson.all.count}"

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.
sp1 = Salesperson.where({"first_name"=>"Steve"})
sp1 = sp1[0]
sp1["last_name"] = "Tomas"
sp1["email"] = "steve.tomas@gmail.com"
sp1.save



sp2 = Salesperson.find_by({"email" => "hannah.lewis@gmail.com"})
sp2["first_name"] = "Hanna"
sp2["email"] = "hanna.lewis@gmail.com"
sp2.save


# CHALLENGE:
# 5. write code to display each salesperson's full name
salespeoplearray = Salesperson.all

for i in salespeoplearray
    first_name = i["first_name"]
    last_name = i["last_name"]
    email = i["email"]
    puts "#{first_name} #{last_name} ; #{email}"
end

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
