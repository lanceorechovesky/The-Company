# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = Tag.create([
  {name: 'funny', rating: 1},
  {name: 'war', rating: 2},
  {name: 'raptor', rating: 1},
  {name: 'tec', rating: 2},
  {name: 'Random', rating: 3}])