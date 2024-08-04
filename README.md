# README

After cloning the repo:

### To set up the app:
- `$ bundle install`
- `$ rails db:create && rails db:migrate && rails db:seed`
Seeding adds in 2 x Companies and a handful of managers and their direct reports

### To run the app:
- start redis
- start sidekiq: `$ bundle exec sidekiq`
- start the rails server: `$ rails server`

### To onboard Widget Co (creating 1-1's for each of the manager / reports):
- `$ bundle exec rake onboard:widget_co`
Which will spawn a bunch of sidekiq jobs to create the 1-1s
In this app, the record of a 1-1 is an `event`


### Notes
- by spawning lots of small jobs this onboarding task should not lock up any synchronous requirements
- this work could be placed into a low priority queue if there are other, more important background jobs
- Some validation is handled by database constraints, eg `null: false` for manager_id on the `events` table
- Some validation is handled at the model level, eg checking that a note has a manager _or_ a report
  - on reflection, the relationship that the note has to it's creator should be a polymorphic one, to a manager or a report
- Some validation is handled by the CreateEvent service, eg checking that the manager does not already have a scheduled event at the time the report has requested
  - currently any attempt to create an event at a time for which the manager already has an event will fail quietly. There should be a different arrangement where an alternative time is used, or these failures are surfaced somewhere so the event can be created after some manual intervention.

- the note entry form on the event page uses hotwire broadcast to append the note onto the event page without a page refresh
