module StationZone
  @@station_zone = [
    {name: "Acton Town", zone: 3},
    {name: "Aldgate", zone: 1},
    {name: "Aldgate East", zone: 1},
    {name: "Alperton", zone: 4},
    {name: "Amersham", zone: 9},
    {name: "Angel", zone: 1}
  ]

  def zone_of_station(station_name)
    @@station_zone.each do |station|
      return "#{station[:zone]}" if station[:name] == station_name
    end
  end
end
