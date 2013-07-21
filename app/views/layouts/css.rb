.ddsmoothmenu{
font: bold 10px Arial;
/*background: #414141; background of menu bar (default state)*/
/*width: 100%;*/
background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#A9B3BB));
background: -moz-linear-gradient(top,  #ffffff,  #A9B3BB);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#A9B3BB');
width: 98%;
height: 100%;
}

.ddsmoothmenu ul{
z-index:100;
margin: 0;
padding: 0;
list-style-type: none;

/*
background-image: -webkit-gradient(linear, left top, left bottom,from(#ccc), to(#999));
background: -moz-linear-gradient(top,  #cccccc,  #999999);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#cccccc', endColorstr='#999999');
*/
}

/*Top level list items*/
.ddsmoothmenu ul li{
position: relative;
display: inline;
float: left;

}

/*Top level menu link items style*/
.ddsmoothmenu ul li a{
display: block;
/*background: #414141; background of menu items (default state)*/
color: #4E5B67;
padding: 8px 10px;
border-right: 1px solid #D8DBDE;
color: #2d2b2b;
text-decoration: none;
font-size: 12px;
}

* html .ddsmoothmenu ul li a{ /*IE6 hack to get sub menu links to behave correctly*/
display: inline-block;
}

.ddsmoothmenu ul li a:link, .ddsmoothmenu ul li a:visited{
color: #4E5B67;
}

.ddsmoothmenu ul li a.selected{ /*CSS class that's dynamically added to the currently active menu items' LI A element*/
background: #BBC4CA;
color: white;
}

.ddsmoothmenu ul li a:hover{
background: #BBC4CA; /*background of menu items during onmouseover (hover state)*/
color: white;
}

/*1st sub level menu*/
.ddsmoothmenu ul li ul{
position: absolute;
left: 0;
display: none; /*collapse all sub menus to begin with*/
visibility: hidden;
background: #D8DBDE;
}

/*Sub level menu list items (undo style from Top level List Items)*/
.ddsmoothmenu ul li ul li{
/*display: list-item;*/
style-list:none;
float: none;
}

/*All subsequent sub menu levels vertical offset after 1st level sub menu */
.ddsmoothmenu ul li ul li ul{
top: 0;
}

/* Sub level menu links style */
.ddsmoothmenu ul li ul li a{
font: normal 13px Arial;
width: 160px; /*width of sub menus*/
padding: 5px;
margin: 0;
border-top-width: 0;
border-bottom: 1px solid gray;
}

/* Holly Hack for IE \*/
* html .ddsmoothmenu{height: 1%;} /*Holly Hack for IE7 and below*/


/* ######### CSS classes applied to down and right arrow images  ######### */

.downarrowclass{
position: absolute;
top: 12px;
right: 7px;
}

.rightarrowclass{
position: absolute;
top: 6px;
right: 5px;
}

/* ######### CSS for shadow added to sub menus  ######### */

.ddshadow{ /*shadow for NON CSS3 capable browsers*/
position: absolute;
left: 0;
top: 0;
width: 0;
height: 0;
background: #BBC4CA;
}

.toplevelshadow{ /*shadow opacity for NON CSS3 capable browsers. Doesn't work in IE*/
opacity: 0.8;
}


###########################################

        .menu{
    border:none;
    border:1px;
    margin:1px;
    padding:1px;
    font-family:verdana,geneva,arial,helvetica,sans-serif;
    font-size:14px;
    font-weight:bold;
    color:8e8e8e;
  }
  .menu ul{
    list-style:none;
    margin:0;
    padding:0;
  }
  .menu li{
    float:left;
  }
  .menu li a{
    color:#666666;
    display:block;
    font-weight:bold;
    text-align:center;
    text-decoration:none;
    padding:0px 25px;
  }
  .menu li a:hover{
    color:#000000;
    text-decoration:none;
  }
  .menu li ul{
    background:#e0e0e0;
    border-left:2px solid #0079b2;
    border-right:2px solid #0079b2;
    border-bottom:2px solid #0079b2;
    display:none;
    height:auto;
    filter:alpha(opacity=95);
    opacity:0.95;
    position:absolute;

    /*top:1em;
		/*left:0;*/
  }
  .menu li:hover ul{
    display:block;
  }
  .menu li li {
    display:block;
    float:none;

  }
  .menu li ul a{
    display:block;
    font-size:12px;
    font-style:normal;
    padding:0px 10px 0px 15px;
    text-align:left;
  }
  .menu li ul a:hover{
    background:#949494;
    color:#000000;
    opacity:1.0;
    filter:alpha(opacity=100);
  }
  .menu p{
    clear:left;
  }
  .menu #current{

    color:#ffffff;
  }
