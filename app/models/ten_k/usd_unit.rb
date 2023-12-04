module TenK
  class UsdUnit < Dry::Struct
    transform_keys do |key|
      key.underscore.to_sym
    end

    attribute :start, Types::Params::Date.optional.default(nil)
    attribute :end, Types::Params::Date.optional
    attribute :val, Types::Params::Decimal.optional
    attribute :accn, Types::Params::String.optional
    attribute :fy, Types::Params::Integer.optional
    attribute :fp, Types::Params::String.optional
    attribute :form, Types::Params::String.optional
    attribute :filed, Types::Params::Date.optional
    attribute :frame, Types::Params::String.optional.default(nil)
  end
end
