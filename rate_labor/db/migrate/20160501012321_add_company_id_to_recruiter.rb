class AddCompanyIdToRecruiter < ActiveRecord::Migration
  def change
    add_column :recruiters, :company_id, :integer
  end
end
