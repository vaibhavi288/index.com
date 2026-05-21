<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CalcVerse | Double Integration Solver</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.11.0/math.min.js"></script>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
scroll-behavior:smooth;
}

body{
background:linear-gradient(135deg,#dbeafe,#ede9fe,#f5f3ff);
color:#111827;
overflow-x:hidden;
}

nav{
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 60px;
background:white;
position:sticky;
top:0;
box-shadow:0 4px 12px rgba(0,0,0,0.1);
z-index:1000;
}

.logo{
font-size:32px;
font-weight:bold;
color:#6d28d9;
}

nav ul{
display:flex;
list-style:none;
gap:25px;
}

nav ul li a{
text-decoration:none;
font-weight:bold;
color:#111827;
}

.hero{
text-align:center;
padding:100px 20px;
}

.hero h1{
font-size:65px;
color:#4338ca;
margin-bottom:25px;
}

.hero p{
font-size:22px;
max-width:850px;
margin:auto;
line-height:1.8;
}

.btns{
margin-top:40px;
}

.btns button{
padding:15px 30px;
border:none;
border-radius:14px;
font-size:18px;
font-weight:bold;
margin:10px;
cursor:pointer;
transition:0.3s;
}

.primary{
background:#4f46e5;
color:white;
}

.secondary{
background:white;
border:2px solid #4f46e5;
color:#4f46e5;
}

.btns button:hover{
transform:translateY(-4px);
}

.stats{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:25px;
padding:30px;
max-width:1100px;
margin:auto;
}

.stat{
background:white;
padding:35px;
border-radius:20px;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.stat h2{
font-size:42px;
color:#6d28d9;
}

section{
padding:80px 25px;
max-width:1200px;
margin:auto;
}

.section-title{
font-size:48px;
text-align:center;
margin-bottom:55px;
color:#4338ca;
}

.cards{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
gap:30px;
}

.card{
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
transition:0.3s;
}

.card:hover{
transform:translateY(-6px);
}

.card h3{
margin-bottom:18px;
color:#6d28d9;
}

.card p{
line-height:1.8;
}

.formula{
font-size:34px;
font-weight:bold;
text-align:center;
color:#7c3aed;
padding:20px;
}

.example{
background:white;
padding:40px;
border-radius:25px;
line-height:2.1;
font-size:19px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.solver{
background:white;
padding:40px;
border-radius:25px;
max-width:750px;
margin:auto;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.solver input{
width:100%;
padding:15px;
margin:12px 0;
border-radius:12px;
border:1px solid #ccc;
font-size:16px;
}

.solve-btn{
width:100%;
padding:16px;
background:#4f46e5;
color:white;
border:none;
border-radius:14px;
font-size:18px;
font-weight:bold;
cursor:pointer;
margin-top:15px;
}

.solve-btn:hover{
background:#4338ca;
}

.output{
margin-top:25px;
padding:25px;
background:#eef2ff;
border-radius:18px;
line-height:2;
font-size:18px;
}

.team{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
gap:25px;
}

.member{
background:white;
padding:30px;
border-radius:22px;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.circle{
width:85px;
height:85px;
border-radius:50%;
background:#c4b5fd;
display:flex;
align-items:center;
justify-content:center;
font-size:28px;
font-weight:bold;
margin:auto;
color:#4c1d95;
}

.member h3{
margin-top:15px;
}

footer{
background:#4338ca;
color:white;
text-align:center;
padding:22px;
margin-top:40px;
font-size:18px;
}

@media(max-width:768px){

.hero h1{
font-size:45px;
}

nav{
padding:15px 20px;
}

nav ul{
display:none;
}

.section-title{
font-size:36px;
}

}

</style>
</head>

<body>

<nav>

<div class="logo">CalcVerse</div>

<ul>
<li><a href="#theory">Theory</a></li>
<li><a href="#formula">Formulas</a></li>
<li><a href="#example">Example</a></li>
<li><a href="#solver">Solver</a></li>
<li><a href="#team">Team</a></li>
</ul>

</nav>

<div class="hero">

<h1>Master Double Integration Visually</h1>

<p>
Explore multivariable calculus through interactive visualizations,
step-by-step solutions and advanced double integration examples.
</p>

<div class="btns">

<button class="primary">
Start Learning
</button>

<button class="secondary">
View Theory
</button>

</div>

</div>

<div class="stats">

<div class="stat">
<h2>20+</h2>
<p>Examples</p>
</div>

<div class="stat">
<h2>3D</h2>
<p>Visualizations</p>
</div>

<div class="stat">
<h2>4</h2>
<p>Applications</p>
</div>

</div>

<section id="theory">

<h2 class="section-title">
Theory of Double Integration
</h2>

<div class="cards">

<div class="card">

<h3>What is Double Integration?</h3>

<p>
Double integration extends single variable integration
to functions involving two variables x and y.
</p>

</div>

<div class="card">

<h3>Area Calculation</h3>

<p>
When the function equals 1,
double integration gives area of a region.
</p>

</div>

<div class="card">

<h3>Volume Calculation</h3>

<p>
It calculates volume under surfaces z = f(x,y).
</p>

</div>

</div>

</section>

<section id="formula">

<h2 class="section-title">
Important Formulas
</h2>

<div class="cards">

<div class="card">
<div class="formula">∬ f(x,y)dA</div>
</div>

<div class="card">
<div class="formula">A = ∬ 1 dA</div>
</div>

<div class="card">
<div class="formula">V = ∬ f(x,y)dA</div>
</div>

</div>

</section>

<section id="example">

<h2 class="section-title">
Worked Example
</h2>

<div class="example">

<p><b>Question:</b></p>

<p>
Evaluate ∬(x+2y)dA over R=[0,2]×[0,1]
</p>

<p><b>Step 1:</b></p>

<p>
∫₀¹ ∫₀² (x+2y) dxdy
</p>

<p><b>Step 2:</b></p>

<p>
[x²/2 + 2yx]₀²
</p>

<p><b>Step 3:</b></p>

<p>
2 + 4y
</p>

<p><b>Step 4:</b></p>

<p>
∫₀¹ (2+4y)dy
</p>

<p><b>Final Answer:</b></p>

<p>
4
</p>

</div>

</section>

<section id="solver">

<h2 class="section-title">
Interactive Solver
</h2>

<div class="solver">

<input type="text"
id="func"
placeholder="Enter function example: x+2*y">

<input type="number"
id="x1"
placeholder="X lower limit">

<input type="number"
id="x2"
placeholder="X upper limit">

<input type="number"
id="y1"
placeholder="Y lower limit">

<input type="number"
id="y2"
placeholder="Y upper limit">

<button class="solve-btn"
onclick="solveIntegration()">

Solve Integration

</button>

<div class="output" id="output">

Step-by-step solution will appear here.

</div>

</div>

</section>

<section>

<h2 class="section-title">
Applications
</h2>

<div class="cards">

<div class="card">

<h3>Engineering</h3>

<p>
Used in mechanics, structural analysis and fluid dynamics.
</p>

</div>

<div class="card">

<h3>Physics</h3>

<p>
Used in electric field and gravitational calculations.
</p>

</div>

<div class="card">

<h3>Computer Graphics</h3>

<p>
Used in rendering and lighting calculations.
</p>

</div>

<div class="card">

<h3>AI & Data Science</h3>

<p>
Used in probability distributions and statistics.
</p>

</div>

</div>

</section>

<section id="team">

<h2 class="section-title">
Project Contributors
</h2>

<div class="team">

<div class="member">

<div class="circle">
VL
</div>

<h3>Vaibhavi Lomate</h3>

<p>PRN: 125B1D003</p>

</div>

<div class="member">

<div class="circle">
MN
</div>

<h3>Meghana Nakade</h3>

<p>PRN: 125B1D019</p>

</div>

<div class="member">

<div class="circle">
SP
</div>

<h3>Shruti Pathak</h3>

<p>PRN: 125B1D017</p>

</div>

</div>

</section>

<footer>

Double Integration Project © 2026

</footer>

<script>

function solveIntegration(){

let func=document.getElementById("func").value;

let x1=parseFloat(document.getElementById("x1").value);

let x2=parseFloat(document.getElementById("x2").value);

let y1=parseFloat(document.getElementById("y1").value);

let y2=parseFloat(document.getElementById("y2").value);

let output=document.getElementById("output");

try{

let expr=math.compile(func);

let dx=(x2-x1)/100;

let dy=(y2-y1)/100;

let sum=0;

for(let x=x1;x<x2;x+=dx){

for(let y=y1;y<y2;y+=dy){

sum += expr.evaluate({x:x,y:y})*dx*dy;

}

}

output.innerHTML=`

<h3>Step-by-Step Solution</h3>

<p><b>Function:</b> f(x,y) = ${func}</p>

<p><b>Limits:</b></p>

<p>x : ${x1} to ${x2}</p>

<p>y : ${y1} to ${y2}</p>

<p><b>Step 1:</b></p>

<p>
Divide the region into many small rectangles.
</p>

<p><b>Step 2:</b></p>

<p>
Evaluate f(x,y) at each rectangle.
</p>

<p><b>Step 3:</b></p>

<p>
Apply numerical double integration method.
</p>

<p><b>Final Answer:</b></p>

<p>
${sum.toFixed(4)}
</p>

`;

}

catch(error){

output.innerHTML=
"<p style='color:red;'>Invalid Function Input</p>";

}

}

</script>

</body>
</html>
