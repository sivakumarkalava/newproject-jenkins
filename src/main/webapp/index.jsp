<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NexusShop Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
:root {
  --bg:#0f172a;
  --card:#1e293b;
  --accent:#22c55e;
  --text:#ffffff;
  --muted:#94a3b8;
}

body {
  margin:0;
  font-family:Poppins, sans-serif;
  background:var(--bg);
  color:var(--text);
}

/* Header */
header {
  display:flex;
  justify-content:space-between;
  align-items:center;
  padding:15px 30px;
  background:#020617;
}

.logo {
  font-size:22px;
  font-weight:700;
}

.search input {
  padding:8px 12px;
  border-radius:20px;
  border:none;
}

/* Hero */
.hero {
  text-align:center;
  padding:60px 20px;
  background:linear-gradient(180deg,rgba(0,0,0,0.6),rgba(0,0,0,0.7)),
  url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover;
}

.hero h1 {
  font-size:40px;
}

.btn {
  padding:10px 20px;
  border:none;
  border-radius:20px;
  background:var(--accent);
  cursor:pointer;
}

/* Products */
.products {
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
  gap:20px;
  padding:40px;
}

.card {
  background:var(--card);
  border-radius:12px;
  overflow:hidden;
  transition:0.3s;
}

.card:hover {
  transform:translateY(-8px);
}

.card img {
  width:100%;
  height:200px;
  object-fit:cover;
}

.card-body {
  padding:15px;
}

.price {
  color:var(--accent);
  font-weight:700;
}

button.add {
  width:100%;
  padding:10px;
  background:var(--accent);
  border:none;
  margin-top:10px;
  cursor:pointer;
}

/* Footer */
footer {
  text-align:center;
  padding:20px;
  color:var(--muted);
}
</style>
</head>

<body>

<header>
  <div class="logo">NexusShop</div>
  <div class="search">
    <input type="text" id="search" placeholder="Search products...">
  </div>
  <div>Cart: <span id="cart">0</span></div>
</header>

<section class="hero">
  <h1>Premium Collection</h1>
  <p>Shop latest gadgets & fashion</p>
  <button class="btn">Shop Now</button>
</section>

<section class="products" id="products"></section>

<footer>
  © 2026 NexusShop
</footer>

<script>
const products = [
  {id:1,name:"iPhone 14",price:999,img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb"},
  {id:2,name:"MacBook Pro",price:1999,img:"https://images.unsplash.com/photo-1593642632823"},
  {id:3,name:"Headphones",price:299,img:"https://images.unsplash.com/photo-1600185365483"},
  {id:4,name:"Sneakers",price:150,img:"https://images.unsplash.com/photo-1542272604"},
];

let cart=0;

function render(list){
  const container=document.getElementById("products");
  container.innerHTML="";
  list.forEach(p=>{
    container.innerHTML+=`
      <div class="card">
        <img src="${p.img}" alt="${p.name}">
        <div class="card-body">
          <h3>${p.name}</h3>
          <div class="price">$${p.price}</div>
          <button class="add" onclick="addCart()">Add to Cart</button>
        </div>
      </div>`;
  });
}

function addCart(){
  cart++;
  document.getElementById("cart").innerText=cart;
}

document.getElementById("search").addEventListener("input",e=>{
  const val=e.target.value.toLowerCase();
  const filtered=products.filter(p=>p.name.toLowerCase().includes(val));
  render(filtered);
});

render(products);
</script>

</body>
</html>
