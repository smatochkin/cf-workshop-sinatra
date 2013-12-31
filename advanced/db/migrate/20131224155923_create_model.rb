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

    create_table :sessions do |t|
      t.integer :attendee
      t.string :name
      t.date :date
      t.boolean :completed
    end

    Attendee.create(firstName: 'John', lastName: 'Doe', address: '123 Main St', city: 'Chicago', state: 'IL', zipCode: '60601', phoneNumber: '123-456-7890', emailAddress: 'john@doe.com')
    Attendee.create(firstName: 'Mary', lastName: 'Doe', address: '456 Main St', city: 'Chicago', state: 'IL', zipCode: '60601', phoneNumber: '123-456-0987', emailAddress: 'mary@doe.com')
    Attendee.create(firstName: 'Jim', lastName: 'Dandy', address: '12 Large St', city: 'Lincoln', state: 'NE', zipCode: '68507', phoneNumber: '321-456-0987', emailAddress: 'dandy@aol.com')
    Attendee.create(firstName: 'Sue', lastName: 'Zana', address: '2 Roundabout Ln', city: 'Knasas City', state: 'MO', zipCode: '64081', phoneNumber: '251-456-0987', emailAddress: 'suez@copper.net')

    Session.create(attendee: "1", name: "John", date: "10/14/2013", completed: false)
    Session.create(attendee: "3", name: "Jim", date: "10/14/2013", completed: true)
    Session.create(attendee: "4", name: "Sue", date: "10/31/2013", completed: true)

  end

  def self.down
    drop_table :attendees
    drop_table :sessions
  end
end
