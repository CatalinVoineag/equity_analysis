class AnalysesController < ApplicationController
  def index
    #SecFiling.new.get_all_financials

    render locals: {
      company_financials: CompanyFinancials.new
    }
  end
end
