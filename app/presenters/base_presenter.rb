class BasePresenter
  # rubocop:disable RedundantSelf
  def self.wrap(object)
    if object.respond_to?(:map)
      object.map { |el| self.new(el) }
    else
      self.new(object)
    end
  end
end
