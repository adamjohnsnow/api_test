describe ThermostatApi do

feature 'saved data' do
  scenario 'can recieve new data' do
    visit('/save_thermostat?temperature=23&powerSave=false')
    visit('/thermostat')
    expect(page).to have_content ('"temperature":23,"powerSave":false')
  end
end

end
