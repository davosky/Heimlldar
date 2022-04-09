class AddCertificateNumberToDiseases < ActiveRecord::Migration[7.0]
  def change
    add_column :diseases, :certificate_number, :string
  end
end
