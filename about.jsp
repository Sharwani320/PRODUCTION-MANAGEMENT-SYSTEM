

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" type="text/css" href="css/custom.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}
.img{
margin-bottom:100px;

.button:hover {
  background-color: #555;
}

/*@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}*/
</style>
</head>
<body>
<jsp:include page="nav.jsp"/>
<div class="about-section">
  <h1>About Us</h1>
 
  <p>Rashtriya Ispat Nigam Ltd, (abbreviated as RINL), also known as Vizag Steel, is a central public sector undertaking under the ownership of Ministry of Steel, Government of India based in Visakhapatnam, India. Rashtriya Ispat Nigam Limited (RINL) is the government entity of Visakhapatnam Steel Plant (VSP), India's first shore-based integrated steel plant built with state-of-the-art technology. Visakhapatnam Steel Plant (VSP) is a 7.3 MTPA plant.</p>
  <p>Resize the browser window to see that this page is responsive by the way.</p>
</div>
 <ul type="bullet">
<h2><b>  OUR MISSION  </h2>
<img src="https://thumbs.dreamstime.com/b/steel-plant-metallurgical-steelmaking-factory-138547987.jpg" style="float:right" style="margin-bottom:100px" height="250px" width="500px"
<p>To attain 20 Mt liquid steel capacity through technological up-gradation, operational efficiency and expansion;<br> 
augmentation of assured supply of raw materials; <br>
to produce steel at international Standards of Cost & Quality;<br>
 and to meet the aspirations of stakeholders.To be the most efficient steel maker having the largest single location shore based steel plant in the country.<br>
The mission of RINL steel plant, also known as Visakhapatnam Steel Plant (VSP), is to:</b><br>

<br><li>Produce high-quality iron and steel products, including Billets, Wire Rods, and     Rebars.<br></li>
<li>  Be a Navratna PSE under the Ministry of Steel, indicating its status as a highly  performing and profitable company.<br></li>
<li>  Be a shore-based integrated steel plant with a current production capacity of 7.3 Mtpa Liquid steel.<br></li>
<li>  Delight customers with its quality products.<br></li>
<li>  Be certified to various ISO standards, including ISO 9001:2015, ISO 14001:2015, OHSAS 18001:2007, and ISO/IEC 27001:2013<br></li>
<li>  Have a strong commitment to safety, health, and the environment.<br></li>
<li>  Contribute to the growth and development of the Indian steel industry.<br></li>
<li>  Provide employment opportunities and support the local community.<br></li>
<li>  Continuously improve and innovate its products and processes to meet the changing needs of its customers and the industry.<br></p></ul></li>


<ul type="bullet">
<h2>OUR OBJECTIVES </h2>
<li>Achieve Gross Margin to Turnover ratio > 10%.<br></li>

<li>Plan for finishing mill to integrate with 7.3 Mt capacity and commission the same by 2017-18.<br></li>

<li>Achieve rated capacity of new & revamped units by 2017-18.<br></li>

<li>Capture markets for high-end value added products by focusing on sector specific applications and customer needs.<br></li>

<li>Achieve leadership in Energy consumption by achieving 5.6 Gcal/tcs by 2017-18.<br></li>

<li>Globalisation of operations through acquisition of mines and setting up of marketing network abroad.<br></li>

<li>Diversify through operationalizing of Bhilwara Mines, setting up of Pelletization plant, DRI-EAF unit, Wheel & Axle Plants.<br></li>

<li>Create a high performance and safe work culture by nurturing talent and developing leaders.<br></li>

<li>To grow in harmony with the environment & communities around us.<br></li>


<h2 style="text-align:center">DIRECTORS </h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="https://www.vizagsteel.com/bod_admin/photos/39.jpg" alt="Sukriti" style="width: 90%" height="420px">
      <div class="container">
        <h2>Ms. Sukriti Likhi</h2>
        <p class="title">GOVERNMENT DIRECTOR</p>
        <p>AS & FA, Ministry of Steel, Govt. of India</p>
        <p>Sukriti@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="https://www.vizagsteel.com/bod_admin/photos/45.jpg" alt="Dr. Sanjay" style="width:90%" height="420px" >
      <div class="container">
        <h2>Dr. Sanjay Roy</h2>
        <p class="title">GOVERNMENT DIRECTOR</p>
        <p>Joint Secretary, Ministry of Steel, Govt. of India</p>
        <p>Sanjay@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div> 
  <div class="column">
    <div class="card">
      <img src="https://www.vizagsteel.com/bod_admin/photos/40.jpg" alt="Shri Atul" style="width:90%" height="420px">
      <div class="container">
        <h2>Shri Atul Bhatt</h2>
        <p class="title">FUNCTIONAL DIRECTOR</p>
        <p>Chairman cum Managing Director</p>
        <p>AtulBhatt@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>