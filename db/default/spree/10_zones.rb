# See /home/user/Documents/webdev/future_projects/theartscene/spree/theartscene/db/sample/0_zones.rb

# eu_vat = Spree::Zone.create!(name: "EU_VAT", description: "Countries that make up the EU VAT zone.")
# north_america = Spree::Zone.create!(name: "North America", description: "USA + Canada")
#
# ["Poland", "Finland", "Portugal", "Romania", "Germany", "France",
#  "Slovakia", "Hungary", "Slovenia", "Ireland", "Austria", "Spain",
#  "Italy", "Belgium", "Sweden", "Latvia", "Bulgaria", "United Kingdom",
#  "Lithuania", "Cyprus", "Luxembourg", "Malta", "Denmark", "Netherlands",
#  "Estonia"].
# each do |name|
#   eu_vat.zone_members.create!(zoneable: Spree::Country.find_by!(name: name))
# end
#
# ["United States", "Canada"].each do |name|
#   north_america.zone_members.create!(zoneable: Spree::Country.find_by!(name: name))
# end


# TODO create zones for Metropolitan regions
# Can a Zone be anything but a Spree::Country or Spree::State? How can we determine Zones by Postcodes.
# Postcodes ranges as per http://auspost.com.au/parcels-mail/delivery-areas.html
# at 27/07/15
# Sydney and suburbs
# sydney = [
#   1000..1404,
#   1411..1920,
#   2000..2249,
#   2555..2574,
#   2740..2786
# ]
#
# # Melbourne and suburbs
# melbourne = [
#   3000..3210,
#   3335..3338,
#   3340,
#   3427..3429,
#   3750,
#   3755,
#   3757,
#   3765..3767,
#   3782,
#   3785..3796,
#   3800..3810,
#   3910..3915,
#   3930..3934,
#   3975..3977,
#   8000..8899
# ]
#
# # Brisbane
# brisbane = [
#   4000..4209
# ]
#
# # Adelaide
# adelaide = [
#   5000..5199, 5800..5999
# ]
#
# # Canberra
# act = [0200..0250, 2600..2639, 2900..2920]
#
# # Hobart area
# hobart = [
#   7000..7019,
#   7050..7053,
#   7055,
#   7172,
#   7892
# ]
#
# # From all above locations to Perth CBD
# perth = [6000..6005, 6800..6899]
#
# # Merge inner_states_metro
# inner_states_metro_post_codes = [sydney, melbourne, brisbane, adelaide].flatten
# # Expand postcode ranges
# inner_states_metro_post_codes.collect {|i| Range === i ? i.entries : i}.flatten

global = Spree::Zone.create!(
    name: 'global',
    description: 'All Countries'
)

international = Spree::Zone.create!(
    name: 'international',
    description: 'International'
)

national = Spree::Zone.create!(
    name: 'national',
    description: 'National'
)

inner_states_metro = Spree::Zone.create!(
    name: 'inner_states_metro',
    description: 'Metropolitan Sydney, Melbourne, Brisbane & Adelaide'
)

inner_states_regional = Spree::Zone.create!(
    name: 'inner_states_regional',
    description: 'Regional NSW, VIC, QLD, SA & ACT'
)

outer_states = Spree::Zone.create!(
    name: 'outer_states',
    description: 'WA, NT & TAS'
)

global.zone_members.create!(zoneable: Spree::Country.all)

international.zone_members.create!(zoneable: Spree::Country.where.not(iso: 'AU'))

['NSW', 'QLD', 'VIC', 'SA', 'NT', 'ACT', 'WA', 'TAS'].each do |state|
  national.zone_members.create!(zoneable: Spree::State.find_by!(abbr: state))
end

['NSW', 'VIC', 'QLD', 'SA'].each do |name|
  inner_states_metro.zone_members.create!(zoneable: Spree::State.find_by!(abbr: name))
end

['NSW', 'VIC', 'QLD', 'SA', 'ACT'].each do |name|
  inner_states_regional.zone_members.create!(zoneable: Spree::State.find_by!(abbr: name))
end

['WA', 'TAS', 'NT'].each do |name|
  outer_states.zone_members.create!(zoneable: Spree::State.find_by!(abbr: name))
end
