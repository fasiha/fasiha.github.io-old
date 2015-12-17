#lang pollen

◊title{Cesium.js Showcase}
◊author{Ahmed Fasih (◊a['href:"https://twitter.com/fasihsignal"]{@fasihsignal})}

◊section{

Welcome to my ◊a['href:"http://cesiumjs.org"]{Cesium.js} cartographic showcase. Please visit one of the following applications.

◊marginnote["fig-japan"]{◊img['src: "images/permalink-screenshot.png"]}
◊h2{◊a['href: "Apps/"]{Texture-shaded terrain visualization} (◊a['href: "texshade.html"]{tutorial})}

The ◊a['href: "texshade.html"]{tutorial} will help you get started if you’ve never used Cesium before.

◊h3{◊a['href: "http://maps.aldebrn.me/Apps/#%7B%22version%22%3A0%2C%22baseLayerPicked%22%3A%7B%22name%22%3A%22The%20Black%20Marble%22%2C%22iconUrl%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2FBuild%2FCesium%2FWidgets%2FImages%2FImageryProviders%2FblackMarble.png%22%7D%2C%22layers%22%3A%5B%7B%22url%22%3A%22%2F%2Fcesiumjs.org%2Fblackmarble%22%2C%22isBaseLayer%22%3Atrue%2C%22alpha%22%3A1%2C%22brightness%22%3A1%2C%22contrast%22%3A1%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A0.48%7D%2C%7B%22url%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2Fworld-tex-cgiar-250m%22%2C%22isBaseLayer%22%3Afalse%2C%22alpha%22%3A0.52%2C%22brightness%22%3A1.32%2C%22contrast%22%3A1.4%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A1%7D%5D%2C%22destination%22%3A%7B%22x%22%3A-4555669.674111755%2C%22y%22%3A3702876.47327235%2C%22z%22%3A3697615.9732322954%7D%2C%22orientation%22%3A%7B%22heading%22%3A5.681369036822533%2C%22pitch%22%3A-0.8218479123823923%2C%22roll%22%3A0.027079069039927184%7D%7D"]{Japan: Mountains and Light. 日本、山と光}}

◊h3{◊a['href: "http://maps.aldebrn.me/Apps/#%7B%22version%22%3A0%2C%22baseLayerPicked%22%3A%7B%22name%22%3A%22ESRI%20National%20Geographic%22%2C%22iconUrl%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2FBuild%2FCesium%2FWidgets%2FImages%2FImageryProviders%2FesriNationalGeographic.png%22%7D%2C%22layers%22%3A%5B%7B%22url%22%3A%22%2F%2Fservices.arcgisonline.com%2FArcGIS%2Frest%2Fservices%2FNatGeo_World_Map%2FMapServer%2F%22%2C%22isBaseLayer%22%3Atrue%2C%22alpha%22%3A1%2C%22brightness%22%3A1%2C%22contrast%22%3A1%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A0.76%7D%2C%7B%22url%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2Fworld-tex-cgiar-250m%22%2C%22isBaseLayer%22%3Afalse%2C%22alpha%22%3A0.76%2C%22brightness%22%3A1.02%2C%22contrast%22%3A1.98%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A0.7%7D%5D%2C%22destination%22%3A%7B%22x%22%3A-2464107.383791575%2C%22y%22%3A-4029434.730869526%2C%22z%22%3A4902313.933333705%7D%2C%22orientation%22%3A%7B%22heading%22%3A6.277475095938724%2C%22pitch%22%3A-1.5697822508202304%2C%22roll%22%3A0%7D%7D"]{Constellation of four mountains in the Pacific Northwest}}

◊h3{◊a['href: "http://maps.aldebrn.me/Apps/#%7B%22version%22%3A0%2C%22baseLayerPicked%22%3A%7B%22name%22%3A%22The%20Black%20Marble%22%2C%22iconUrl%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2FBuild%2FCesium%2FWidgets%2FImages%2FImageryProviders%2FblackMarble.png%22%7D%2C%22layers%22%3A%5B%7B%22url%22%3A%22%2F%2Fcesiumjs.org%2Fblackmarble%22%2C%22isBaseLayer%22%3Atrue%2C%22alpha%22%3A1%2C%22brightness%22%3A1%2C%22contrast%22%3A1%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A1%7D%2C%7B%22url%22%3A%22http%3A%2F%2Fmaps.aldebrn.me%2Fworld-tex-cgiar-250m%22%2C%22isBaseLayer%22%3Afalse%2C%22alpha%22%3A0.6%2C%22brightness%22%3A1.4%2C%22contrast%22%3A2.06%2C%22hue%22%3A0%2C%22saturation%22%3A1%2C%22gamma%22%3A0.98%7D%5D%2C%22destination%22%3A%7B%22x%22%3A-4598840.353228228%2C%22y%22%3A2585327.365522466%2C%22z%22%3A-3614995.6905855313%7D%2C%22orientation%22%3A%7B%22heading%22%3A0.1462809727199561%2C%22pitch%22%3A-0.285454701682033%2C%22roll%22%3A6.282709415798561%7D%7D"]{Visualizing Sydney, NSW, Australia and its foothills}}

◊h2{More to come…}

}



