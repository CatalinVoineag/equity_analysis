class CompanyFinancials
  def years
    stats.fetch(:revenue).years
  end

  def stats
    @stats ||= {
      revenue: sec_filing.get("RevenueFromContractWithCustomerExcludingAssessedTax"),
      gross_profit: sec_filing.get("GrossProfit"),
      research_and_development: sec_filing.get("ResearchAndDevelopmentExpense"),
      selling_and_administrative: sec_filing.get("SellingGeneralAndAdministrativeExpense"),
      interest_expense: sec_filing.get("InterestExpense"),
      net_income: sec_filing.get("NetIncomeLoss"),
      earnings_per_share: sec_filing.get("EarningsPerShareBasic"),
      total_assets: sec_filing.get("LiabilitiesAndStockholdersEquity"),
      long_term_debt: sec_filing.get("LongTermDebt"),
      retained_earnings: sec_filing.get("RetainedEarningsAccumulatedDeficit"),
      share_holder_equity: sec_filing.get("StockholdersEquity"),
      capital_expenditure: sec_filing.get("PaymentsToAcquirePropertyPlantAndEquipment"),
      share_buy_back: sec_filing.get("PaymentsForRepurchaseOfCommonStock"),
      divident_paid: sec_filing.get("PaymentsOfDividendsCommonStock"),
      divident_per_share: sec_filing.get("CommonStockDividendsPerShareDeclared")
    }
  end

  private

  def sec_filing
    @sec_filing ||= SecFiling.new
  end
end
