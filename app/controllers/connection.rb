post '/lovers/:lover_id/connections' do
  lover = Lover.find(params[:lover_id])

  if logged_in? && current_lover.id != lover.id
    current_lover.leaders.push(lover)
    current_lover.save!
  end

  ""
end

delete '/lovers/:lover_id/connections' do
  lover = Lover.find(params[:lover_id])

  if logged_in? && current_lover.id != lover.id
    current_lover.leaders.delete(lover)
    current_lover.save!
  end

  ""
end