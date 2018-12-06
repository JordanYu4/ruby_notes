=begin
if curr_company_user.is_sys_admin? && curr_company_user.can_crud_company_users? && params[:id].to_i != curr_company_user.id

  params[:company_user] = params[:company_user].except(:otp_set_up) if params[:company_user][:otp_set_up] == true
  params.require(:company_user).permit(:otp_setup, etc. etc....

elsif etc. etc...
=end

# skeleton of Allowable module via msimonborg
# Allowable params filtering implementation purportedly faster than built-in delete_if function 
module Allowable 
    def self.filter_match?(obj, key, val)
        Array(val).include?(obj[key]) || val ==obj[key]
    end

    def forbid(filters = {})
        dup.forbid!(filters)
    end

    def forbid!(filters = {})
        filters.each do |key, val|
            delete(key) if Allowable.filter_match?(self, key, val)
        end
        self
    end
end

class Hash 
    include Allowable
end

# Benchmarking 

# Issues installing ruby 2.4.1 via rbenv. Moved on for the sake of time. 