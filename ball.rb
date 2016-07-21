class Ball
  def initialize(window, player1, player2)
    @window = window
    @player1 = player1
    @player2 = player2
    @image = Gosu::Image.new("media/ball.png")

    reset
  end

  def update
    @x += Gosu::offset_x(@angle, 3)
    @y += Gosu::offset_y(@angle, 3)

    if @x <= 0
      @player2.wins
      reset
    elsif (@x - @image.width) >= @window.width
      @player1.wins
      reset
    end

    if @y >= (@window.height - @image.height)
      @angle -= 90
    end
    if @y <= 0
      @angle += 90
    end

    if (@player2.y > (@y + @image.height)) ||
        ((@player2.y + @player2.image.height) < @y)
      # Do not touch x
    else
      if (@x + @image.width) >= @player2.x
        @angle -= 270
      end
    end

    if (@player1.y > (@y + @image.height)) ||
        ((@player1.y + @player1.image.height) < @y)
    else
      if @x <= @player1.x + @image.width
        @angle += 270
      end
    end
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def reset
    @x = (@window.width - @image.width) / 2
    @y = (@window.height - @image.height) / 2
    @angle = 70
  end
end
