module TenK
  class FinancialValue < Dry::Struct
    transform_keys do |key|
      key.underscore.to_sym
    end

    attribute :tag, Types::Params::String
    attribute :label, Types::Params::String
    attribute :description, Types::Params::String
    attribute :taxonomy, Types::Params::String
    attribute :cik, Types::Params::Integer
    attribute :entity_name, Types::Params::String
    attribute :units, Unit

    def years
      units.only_ten_k.map do |unit|
        unit.end.year
      end
    end

    def ten_ks
      if values_without_frames.include?(tag)
        units.only_ten_k_without_frame
      else
        units.only_ten_k
      end
    end

    private

    def values_without_frames
      [
        "LiabilitiesAndStockholdersEquity",
        "LongTermDebt",
        "RetainedEarningsAccumulatedDeficit",
        "StockholdersEquity"
      ]
    end
  end
end
