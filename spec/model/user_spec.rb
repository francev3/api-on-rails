require 'rails_helper'

RSpec.describe User, type: :model do
  
  

    subject { create(:user) }

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }

    
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:username).ignoring_case_sensitivity } 
  
  

    it { should validate_length_of(:username).is_at_least(6) }
    it { should validate_inclusion_of(:role).in_array([1,2,3]) }
  
  
  

end