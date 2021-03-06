# frozen_string_literal: true

# File created 06/10/2020 by Troy Stein
# Edited on 06/12/2020 by Prachiti Garge: Updated method call
=begin
Main file.
=end

require 'mechanize'
require './lib/basic_search.rb'
require './lib/get_org_list.rb'
require './lib/get_org_data.rb'
require './lib/recommendation.rb'
require './lib/output.rb'

# MAIN
puts 'Welcome to The Ohio State University Clubs page!'
ins = Searching.basic_search # Call basic_search to trim list of organizations
puts ins[0]
orgs = [] # orgs - array to store Org objects
get_org_list ins[0], orgs # stores objects into array orgs
puts 'GOT LIST'
get_org_data orgs if ins[1].length == 21
get_org_attr orgs, ins[1] if ins[1].length != 21 # populates Org objects with respective data
recs = Recommendations.get_rec ins[0], orgs
output_handler orgs, ins[1], recs # display all Orgs

