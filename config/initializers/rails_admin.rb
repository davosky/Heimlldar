RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end

  config.main_app_name = ['Heimdallr']

  config.model 'User' do
    visible true
    label 'Utente'
    label_plural 'Utenti'
  end

  config.model 'Department' do
    visible true
    label 'Reparto'
    label_plural 'Reparti'
  end

  config.model 'Zone' do
    visible true
    label 'Zona'
    label_plural 'Zone'
  end

  config.model 'Absence' do
    visible true
    label 'Ferie'
    label_plural 'Ferie'
  end

  config.model 'Howto' do
    visible true
    label 'Manuale'
    label_plural 'Manuali'
  end
  
  config.model 'Topic' do
    visible true
    label 'Argomento'
    label_plural 'Argomenti'
  end

  config.model 'Color' do
    visible true
    label 'Colore'
    label_plural 'Colori'
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
