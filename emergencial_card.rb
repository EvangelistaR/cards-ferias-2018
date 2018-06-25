require_relative 'card'

Class Emergencial_Card < Card
  attr_accessor :emergencial_msg, :emergencial_phone

  def initialize(pt, en = "")
    super(pt, en)
    @emergencial_phone = "190"
    @emergencial_msg = "Em caso de emergencias ligue para a polícia."
  end

  def to_s
    "#{super()}\n#{emergencial_msg()} #{emergencial_phone()}"
  end
end
