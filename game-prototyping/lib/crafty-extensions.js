// Execute a callback on each of Crafty(tag). The callback gets two parameters:
// obj (the object itself), and i (the index of the object).
Crafty.forEach = function(tag, callback) {
  var entities = Crafty(tag);
  for (var i = 0; i < entities.length; i++) {
    var id = entities[i];
    callback(Crafty(id), i);
  }
}

// First or null
Crafty.first = function(tag) {
    var all = Crafty(tag);
    if (all.length == 0) {
        return null;
    } else {
        var id = all[0];
        return Crafty(id);
    }
}

Crafty.last = function(tag) {
    var all = Crafty(tag);
    if (all.length == 0) {
        return null;
    } else {
        var id = all[all.length - 1];
        return Crafty(id);
    }
}

Crafty.single = function(tag) {
    var all = Crafty(tag);
    if (all.length == 0) {
        throw "There are no entities tagged with " + tag;
    } else if (all.length > 1) {
        throw "There are " + all.length + " entities tagged with " + tag + " (expected only one)";
    } else {
        var id = all[0];
        return Crafty(id);
    }
}


// Load an array of images
Crafty.loadImages = function(images, callback) {
  Crafty.load({ "images": images },
    function() {
      if (callback != null) {
        callback();
      }
    }, function(p) {
      // p.percent gives us progress
      console.log(p.percent + "% loaded");
    }, function(e) {
      alert("Error loading images: " + e);
    }
  );
}

// Load an array of audio
Crafty.loadAudio = function(audios, callback) {
  Crafty.load({ "audio": audios },
    function() {
      if (callback != null) {
        callback();
      }
    }, function(p) {
      // p.percent gives us progress
      console.log(p.percent + "% loaded");
    }, function(e) {
      alert("Error loading audio: " + e);
    }
  );
}

Crafty.wait = function(seconds, callback) {
  Crafty.e('Delay').delay(callback, seconds * 1000);
}
