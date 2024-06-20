<template>
    <div class="container">
      <div class="content">
        <h1>Profile</h1>
        <p>Welcome to your profile page. Here you can manage your account details and view your order history.</p>
        <div>
          <router-link to="/login" class="custom-link">Login</router-link>
          <router-link to="/register" class="custom-link">Register</router-link>
        </div>
      </div>
    </div>
  </template>
  
  <style scoped>
  .custom-link {
    margin: 0 15px;
    text-decoration: none;
    color: black;
  }
  </style>
  