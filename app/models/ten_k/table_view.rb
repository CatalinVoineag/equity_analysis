module TenK
  class TableView
    Item = Struct.new(:date, :label, :value)

    attr_reader :revenue, :gross_profit
    private :revenue, :gross_profit

    def initialize(revenue, gross_profit)
      @revenue = revenue
      @gross_profit = gross_profit
    end

    def items
      revenue.units.only_ten_k.map do |unit|
        Item.new(
          date: unit.fy,
          label: revenue.label,
          value: unit.val
        )
      end.reverse
    end
  end
end
