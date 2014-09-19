class PasepPisNitValidator < ::ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?
    record.errors.add(attribute, options[:message] || :invalid) unless PasepPisNit::Pis.new(value).valido?
  end
end
