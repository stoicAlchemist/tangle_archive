# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{name: 'Star Wars'}, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Domain.create(name: 'Personal', description: 'All personal stuff can go here')
Status.create [
  {
    name: 'New',
    description: 'All newly created items will have this status',
    done: false,
    bootstrap_color: 'secondary'
  },
  {
    name: 'Process',
    description: 'All items that you are working on have this status',
    done: false,
    bootstrap_color: 'primary'
  },
  {
    name: 'Done',
    description: 'All items that you are done with will have this status',
    done: true,
    bootstrap_color: 'success'
  }
]
Effort.create [
  {
    name: 'Low',
    description: 'Stuff easy to do that you can do in a couple of minutes'
  }
]

Project.create [
  {
    name: 'Test Project',
    description: 'It\'s a good idea to have Projects to group related items',
    goal: 'Setting a goal will make clear what you are doing this items for',
    domain_id: 1
  }
]

User.create [
  {
    username: 'anonymous',
    email: 'nobody@example.com',
    password_digest: 'stub'
  },
  {
    username: 'admintangle',
    email: 'tangle@example.com',
    secret: 'stub'
  }
]
