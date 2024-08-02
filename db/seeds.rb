# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



Note.destroy_all
Event.destroy_all
Report.destroy_all
Manager.destroy_all
Company.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('notes')
ActiveRecord::Base.connection.reset_pk_sequence!('events')
ActiveRecord::Base.connection.reset_pk_sequence!('reports')
ActiveRecord::Base.connection.reset_pk_sequence!('managers')
ActiveRecord::Base.connection.reset_pk_sequence!('companies')


# companies
acme = Company.find_or_create_by!(name: "Acme Products P/L")
widget_co = Company.find_or_create_by!(name: "Widget Co")

# managers
mary = Manager.find_or_create_by!(name: "Mary", company: acme)
james = Manager.find_or_create_by!(name: "James", company: widget_co)
lesley = Manager.find_or_create_by!(name: "Lesley", company: widget_co)

# reports
tom = Report.find_or_create_by!(name: "Tom", company: acme, manager: mary, preferred_day: 1, preferred_hour: 9)
dick = Report.find_or_create_by!(name: "Dick", company: acme, manager: mary, preferred_day: 2, preferred_hour: 10)
sally = Report.find_or_create_by!(name: "Sally", company: acme, manager: mary, preferred_day: 3, preferred_hour: 11)
alice = Report.find_or_create_by!(name: "Alice", company: widget_co, manager: james, preferred_day: 1, preferred_hour: 9)
sarah = Report.find_or_create_by!(name: "Dick", company: widget_co, manager: james, preferred_day: 2, preferred_hour: 10)
steve = Report.find_or_create_by!(name: "Sally", company: widget_co, manager: james, preferred_day: 3, preferred_hour: 11)
pat = Report.find_or_create_by!(name: "Pat", company: widget_co, manager: lesley, preferred_day: 3, preferred_hour: 11)
alex = Report.find_or_create_by!(name: "Alex", company: widget_co, manager: lesley, preferred_day: 3, preferred_hour: 11)
francis = Report.find_or_create_by!(name: "Francis", company: widget_co, manager: lesley, preferred_day: 3, preferred_hour: 11)



