class Ability
  def initialize_ill(user, ip_address = nil)
    case user.try(:role).try(:name)
    when 'Administrator'
      can [:read, :create, :export_loan_lists, :get_loan_lists, :pickup, :pickup_item, :accept, :accept_item, :download_file, :output], InterLibraryLoan
      can [:update, :destroy], InterLibraryLoan do |inter_library_loan|
        inter_library_loan.state == "pending" || inter_library_loan.state == "requested"
      end
    when 'Librarian'
      can [:read, :create, :export_loan_lists, :get_loan_lists, :pickup, :pickup_item, :accept, :accept_item, :download_file, :output], InterLibraryLoan
      can [:update, :update, :destroy], InterLibraryLoan do |inter_library_loan|
        inter_library_loan.state == "pending" || inter_library_loan.state == "requested"
      end
    end
  end
end
