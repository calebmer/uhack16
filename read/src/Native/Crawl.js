function getSiteMetadata (html) {
  var element = document.createElement('div')
  element.innerHTML = html
  var metas = element.getElementsByTagName('meta')
  
  var metadata = {}
  
  for (var i in metas) {
    var meta = metas[i]
    console.log(meta)
  }
  
  return metadata
}

function make (elm) {
  elm.Native = elm.Native || {}
  elm.Native.Crawl = elm.Native.Crawl || {}

  if (elm.Native.Crawl.values) {
    return elm.Native.Crawl.values
  }

  elm.Native.Crawl.values = {
    getSiteMetadata: getSiteMetadata
  }

  return elm.Native.Crawl.values
}

Elm.Native.Crawl = {}
Elm.Native.Crawl.make = make
