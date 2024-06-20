<template>
    <div class="container">
        <div class="content">
            <h1>Hai!</h1>
            <div id="restaurant-list"></div>
        </div>
    </div>
</template>


<script>
fetch('fetch_restaurants.php')
    .then(response => response.json())
    .then(data => {
        const restaurantList = document.getElementById('restaurant-list');
        data.forEach(restaurant => {
            const restaurantCard = document.createElement('a');
            restaurantCard.href = restaurant.id_penjual.toLowerCase() + '.html';
            restaurantCard.className = 'restaurant-card';
            restaurantCard.innerHTML = `
                <div class="info">
                    <h3>${restaurant.nama_penjual}</h3>
                </div>
            `;
            restaurantList.appendChild(restaurantCard);
        });
    })
    .catch(error => console.error('Error fetching restaurants:', error));
</script>