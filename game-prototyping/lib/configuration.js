// Returns a piece of config from the URL (if available), then external.json.
function config(name) {
  return  queryParam(name) || extern(name, true);
}

// DO NOT USE. Use config(key) instead.
// Gets a variable from external.json.
function extern(key, hideWarning) {
  if (window.externs[key] === undefined && !hideWarning) {
    console.error("Missing extern: " + key);
    return undefined;
  } else {
    var value = window.externs[key];
    return value;
  }
}

// DO NOT USE. Use config(name) instead.
// Returns the value of a query parameter. Probably as a string.
// Original source: http://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
// It's probably very slow. We should cache these in a hash.
function queryParam(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
    var results = regex.exec(location.search);
    var toReturn = results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    if (toReturn == "true") {
        return true;
    } else if (toReturn == "false") {
        return false;
    } else {
        return toReturn;
    }
}
