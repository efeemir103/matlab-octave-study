function distance = dist2(x1, x2, y1, y2)
  % DIST2 calculates distance between 2 points
  % pass arguments x1, x2, y1, y2
  distance = getDistance(x1, x2, y1, y2)
  function distance = getDistance(x1, x2, y1, y2)
    distance = sqrt((x2-x1).^2 + (y2-y1).^2);
  end
end
