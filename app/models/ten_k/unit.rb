module TenK
  class Unit < Dry::Struct
    transform_keys do |key|
      key.underscore.to_sym
    end

    attribute :usd, Types::Array.of(UsdUnit)

    def only_ten_k
      usd.select do |unit|
        unit.form == "10-K" &&
        unit.frame.present? &&
        unit.frame == "CY#{unit.end.year}"
      end
    end

    def only_ten_k_without_frame
      usd.select do |unit|
        unit.form == "10-K"
      end
    end
  end
end
