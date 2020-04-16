Number.prototype.pad = function(size) {
  var s = String(this);
  while (s.length < (size || 2)) {s = "0" + s;}
  return s;
}

(1).pad(3) // => "001"
(10).pad(3) // => "010"
(100).pad(3) // => "100"