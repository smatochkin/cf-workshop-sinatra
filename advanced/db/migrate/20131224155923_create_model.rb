class CreateModel < ActiveRecord::Migration

  def self.up
    create_table :attendees do |t|
      t.string :firstName
      t.string :lastName
      t.string :address
      t.string :city
      t.string :state
      t.string :zipCode
      t.string :phoneNumber
      t.string :emailAddress
    end

    create_table :class_sessions do |t|
      t.integer :attendeeId
      t.string :name
      t.date :date
      t.boolean :completed
    end

  Attendee.create(firstName: 'John', lastName: 'Doe', address: '123 Main St', city: 'Chicago', state: 'IL', zipCode: '60601', phoneNumber: '123-456-7890', emailAddress: 'john@doe.com')
  Attendee.create(firstName: 'Mary', lastName: 'Doe', address: '456 Main St', city: 'Chicago', state: 'IL', zipCode: '60601', phoneNumber: '123-456-0987', emailAddress: 'mary@doe.com')
  Attendee.create(firstName: 'Jim', lastName: 'Dandy', address: '12 Large St', city: 'Lincoln', state: 'NE', zipCode: '68507', phoneNumber: '321-456-0987', emailAddress: 'dandy@aol.com')
  Attendee.create(firstName: 'Sue', lastName: 'Zana', address: '2 Roundabout Ln', city: 'Kansas City', state: 'MO', zipCode: '64081', phoneNumber: '251-456-0987', emailAddress: 'suez@copper.net')

  ClassSession.create(attendeeId: "1", name: "CF Basics", date: "14/10/2013", completed: false)
  ClassSession.create(attendeeId: "3", name: "CF Basics", date: "14/10/2013", completed: true)
  ClassSession.create(attendeeId: "4", name: "CF Advanced", date: "31/10/2013", completed: true)

  end

  def self.down
    drop_table :attendees
    drop_table :class_sessions
  end
end
