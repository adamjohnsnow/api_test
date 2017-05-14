describe ThermostatApi do

feature 'saved data' do
  scenario 'can recieve new data' do
    visit('/save_thermostat?temperature=21&powerSave=true')
    visit('/thermostat')
    expect(page).to have_content ('"temperature":"21","powerSave":"true"')
  end
end

end
