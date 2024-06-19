<template>
    <footer>
      <p>Sinarqya</p>
      <div class="social">
        <a href="#"><img src="https://via.placeholder.com/20" alt="Facebook"></a>
        <a href="#"><img src="https://via.placeholder.com/20" alt="LinkedIn"></a>
        <a href="#"><img src="https://via.placeholder.com/20" alt="YouTube"></a>
        <a href="#"><img src="https://via.placeholder.com/20" alt="Instagram"></a>
      </div>
    </footer>
  </template>
  
  <script>
  export default {
    name: 'Footer'
  }
  </script>
  
  <style scoped>
  footer {
    margin-top: 50px;
    width: 100%;
    text-align: center;
    padding: 20px 0;
    border-top: 1px solid #ccc;
  }
  
  footer a {
    margin: 0 10px;
    text-decoration: none;
    color: black;
  }
  
  footer img {
    width: 20px;
    height: 20px;
  }
  </style>
  