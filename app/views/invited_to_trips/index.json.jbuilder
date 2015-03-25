json.array!(@invited_to_trips) do |invited_to_trip|
  json.extract! invited_to_trip, :id, :InviterId, :InviteeId, :NonMemberInviteeId, :TripId
  json.url invited_to_trip_url(invited_to_trip, format: :json)
end
