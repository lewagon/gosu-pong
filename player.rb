class Player
  attr_reader :x, :y, :image

  def initialize(window, side)
    @image = Gosu::Image.new("media/paddle.png")
    @window = window
    @side = side
    @score = 0

    @font = Gosu::Font.new(20)

    if side == 'left'
      @x = 50
    else
      @x = window.width - @image.width - 50
    end
    @y = (window.height - @image.height) / 2
  end

  def wins
    @score += 1
  end

  def update
    if Gosu::button_down?(up_button)
      @y -= 5 unless @y == 0
    elsif Gosu::button_down?(down_button)
      @y += 5 unless @y == (@window.height - @image.height)
    end
  end

  def draw
    @image.draw(@x, @y, 1)
    x = @side == 'left' ? @x : @x - 40
    @font.draw("Score: #{@score}", x, 10, 2, 1.0, 1.0, 0xff_ffff00)
  end

  private

  def up_button
    @side == 'left' ? Gosu::KbW : Gosu::KbUp
  end

  def down_button
    @side == 'left' ? Gosu::KbS : Gosu::KbDown
  end
end
