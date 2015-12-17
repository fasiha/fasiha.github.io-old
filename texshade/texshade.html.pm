#lang pollen

◊title{Texture-shaded terrain visualization—a tutorial}
◊author{Ahmed Fasih}

◊section{

◊h2{Introduction}
When you first visit ◊a['href: "http://maps.aldebrn.me/Apps/#%7B%22version%22%3A0%2C%22baseLayerPicked%22%3A%7B%22name%22%3A%22The%20Black%20Marble%22%2C%22iconUrl%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2FBuild%2FCesium%2FWidgets%2FImages%2FImageryProviders%2FblackMarble.png%22%7D%2C%22layers%22%3A%5B%7B%22url%22%3A%22%2F%2Fcesiumjs.org%2Fblackmarble%22%2C%22isBaseLayer%22%3Atrue%2C%22alpha%22%3A1%2C%22brightness%22%3A1%2C%22contrast%22%3A1%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A0.48%7D%2C%7B%22url%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2Fworld-tex-cgiar-250m%22%2C%22isBaseLayer%22%3Afalse%2C%22alpha%22%3A0.52%2C%22brightness%22%3A1.32%2C%22contrast%22%3A1.4%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A1%7D%5D%2C%22destination%22%3A%7B%22x%22%3A-4555669.674111755%2C%22y%22%3A3702876.47327235%2C%22z%22%3A3697615.9732322954%7D%2C%22orientation%22%3A%7B%22heading%22%3A5.681369036822533%2C%22pitch%22%3A-0.8218479123823923%2C%22roll%22%3A0.027079069039927184%7D%7D"]{Japan: Mountains and Light} with a WebGL-enabled browser◊marginnote['webgl-report]{◊a['href: "http://webglreport.com/"]{WebGL Report}. Look for the green ✓.}, you’ll see something like the right/below.
◊figure{◊img['src: "images/help-screenshot.png"]}
Feel free to drag the globe around to pan, zoom, or rotate using your mouse, trackpad, or touchscreen: at the upper-right is a description of how to do all of these on various devices.

This particular globe was designed to gain insight into the twin forces of urbanization and terrain on the Japanese archipelago. It uses ◊a['href: "http://cesiumjs.org/"]{Cesium.js}, a tool used to build 3D globes and maps—think Google Earth but open-source and runs everywhere a browser runs, including my smartphone. Specifically, this globe superimposes terrain, appropriately texture-shaded, on top of the ◊a['href:"http://earthobservatory.nasa.gov/NaturalHazards/view.php?id=79803"]{NASA Black Marble}, showing the lights seen at night from space.

This document won’t discuss texture-shading or fractional-Laplacian filtering, rather it will just show how to start getting the most out of this Cesium app.

◊h2{Basic usage}


Try this. Click on the button immediately to the left of the question mark, pointed at by the red arrow:
◊figure{◊img['src: "images/layers-screenshot-arrow.png"] Click the second-from-left button (pointed at by the arrow) to select another base layer instead of the Black Marble “nightlights”.}
This will pop out Cesium’s basemap selection pallette. These are all the maps you can replace the Black Marble with, including road maps from Bing or OpenStreetMap, satellite imagery from Mapbox or Bing, even the very informative National Geographic map.

Next, consider the slider bars at the left. These give you a number of ways to manipulate the basemap or the terrain texture (“tex”). For either you can dial up or down the ◊strong-em{brightness}, ◊strong-em{contrast}, and ◊strong-em{gamma} correction. You can also adjust the basemap’s ◊strong-em{hue} and ◊strong-em{saturation}, or the terrain texture’s ◊strong-em{alpha} transparency.◊marginnote["terrain-gray"]{The terrain is grayscale, so hue and saturation don’t make sense for it.} This last allows you to focus exclusively on the terrain (alpha=1.0) or make it completely disappear (alpha=0.0); all values in between allow partial transparency.

◊h2{Sharing}

When you find a view that you wish to share, click the “Permalink” button beneath the sliders. That will update the URL with a permalink to the current view, and includes your choice of basemap and any image quality parameters:
◊figure{
◊img['src: "images/permalink-screenshot-arrow.png"]
The “Permalink” button updates your browser’s URL with a link to the current view.}
You can now copy the URL and paste it into Twitter, etc. My apologies—currently the URL is extremely long because of how simple-mindedly I’m generating it, so a link shortener is advised.

◊h2{Further reading and contact}

Terrain texture-shading is the brainchild of Leland Brown, whose ◊a['href: "http://textureshading.com"]{website} and two presentations, from ◊a['href: "https://app.box.com/textureshading/"]{2010 and 2014}, provide more cartographic and technical background on the technique.

This document has been rendered with ◊a['href: "http://pollenpub.com"]{Pollen} and styled with the ◊a['href: "https://edwardtufte.github.io/tufte-css/"]{Tufte CSS}.

Please write to ◊a['href: "https://twitter.com/fasihsignal"]{@fasiha} with any questions or concerns.


}


