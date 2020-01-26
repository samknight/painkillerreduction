# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Drug.create(name: 'Codeine', dosage: '30', morphine: 0.15)
Drug.create(name: 'Tramadol', dosage: '50', morphine: 0.15)
Drug.create(name: 'Oxycodone', dosage: '5', morphine: 0.2)
Drug.create(name: 'Gabapentin', dosage: '100', morphine: 0.15)
Drug.create(name: 'DiHydrocodeine', dosage: '30', morphine: 0.1)
