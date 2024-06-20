<template>
    <header>
      <div class="logo">
        <router-link to="/"><h2>Sinargya</h2></router-link>
      </div>
      <div class="topright">
        <nav>
            <router-link to="/">Home</router-link>
            <router-link to="/about">About Us</router-link>
            <router-link to="/profile">Profile</router-link>
          <button @click="goToOrder">Order Now</button>
        </nav>
      </div>
    </header>
  </template>
  
  <script>
  export default {
    name: 'Header',
    methods: {
      goToOrder() {
        this.$router.push('/order');
      }
    }
  }
  </script>
  
  <style scoped>
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    padding: 20px 0;
  }
  
  .logo {
    margin-left: 50px;
  }
  
  .topright {
    margin-right: 50px;
  }
  
  header router-link {
    margin: 0 15px;
    text-decoration: none;
    color: black;
  }
  
  header button {
    padding: 10px 20px;
    background-color: black;
    color: white;
    border: none;
    cursor: pointer;
  }
  </style>
  