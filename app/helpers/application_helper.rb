module ApplicationHelper

  def sanitize_params(params)
    params.delete(:controller)
    params.delete(:action)
    params.delete(:limit)
    clean_hash = {}
    params.each do |key, val|
      clean_hash[key] = { val['op'] => Float(val['value']) }
    end
    clean_hash
  end
end
