class Markers

  def initialize()
    @markers = ['x', 'o']
  end

  def reverse
    @markers.reverse!
  end

  def current_marker
    @markers[0]
  end

  def who_just_moved
    @markers[1]
  end
end
