#### CodeChallenge: Eventbrite Mini

##We have three classes
# **Event** - An event has a name, date, and attendees.
# **Person** - A person has a first name and a last name.
# **Invite** -  An invite has a person and an event.

Since there was only 1 hour to complete this assignment, my browser-based API is far from complete.

However, the use of this "miniapp" is good enough, especially considering the time constraints,
by simply using the Rails Console. This is accessible by changing the console directory ('cd') to the
MiniEventBrite folder within this project and entering 'rails c' once there.

From the Rails console, a user can do the RESTful options for Events, Invites, and Users.

I added another column to Invitations where they can be confirmed so that Events have both Invited and Attendees.

Events need a name and date, so to create an Event, for example, type in:
Event.create!(name: "First Event", date: DateTime.new(2016, 1, 10))
(With the browser-based API, this would be much more intuitive.)

A Person needs a firstname and lastname, so to create a Person, for example, type in:
Person.create!(firstname: "Jane", lastname: "Doe")

Finally, to create an Invitation you need an event_id and person_id, so, following from the last two examples:
Invitation.create!(event_id: 1, person_id: 1) will create an Invitation for Jane Doe to the First Event.

With this, you can test it out with Event.first.invited and Person.first.invites, and see the association between the First Event and Jane Doe in action.

Finally, when your attendee has hypothetically confirmed the event, you can simply call Invitation.first.confirm, which will update
the confirmation to true. With that, you can check the Event.first.attendees and Person.first.events, and see that the association
was updated, as well.
