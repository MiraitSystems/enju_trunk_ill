Item.class_eval do
  has_many :inter_library_loans, :dependent => :destroy

  def inter_library_loaned?
    true if self.inter_library_loans.size > 0
  end

end
