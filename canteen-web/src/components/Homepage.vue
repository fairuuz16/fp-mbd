<template>
    <body>
        <div class="container">
            <div class="content">
                <div class="text">
                    <h1>Sinargya</h1>
                    <h2>Welcome to Sinargya FoodCourt</h2>
                    <p>Sinarqya Food Court, established in 2022, stands as a vibrant culinary hub that has quickly become a beloved destination for food enthusiasts and casual diners alike. Located in the heart of the city, its architecture blends modern design with elements that reflect the cultural heritage of the region, creating an inviting atmosphere from the moment you step inside.</p>
                    <button @click="goToOrder">Order Now</button>
                </div>
                <div class="image">
                    <img src="https://via.placeholder.com/400" alt="Food Court Image">
                </div>
            </div>
        </div>
    </body>
  </template>
  
  <script>
  export default {
    name: 'HomePage',
    methods: {
      goToOrder() {
        this.$router.push('/order');
      }
    }
  }
  </script>

  