<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="vehiclePackage.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Vehicle Reservation - Wheels4U</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f6f8;
    margin: 0;
    padding: 0;
}

/* Container */
.reservation-container {
    display: flex;
    max-width: 1300px;
    margin: 50px auto;
    gap: 30px;
    padding: 0 15px;
}

/* Sidebar */
.sidebar {
    position: sticky;
    top: 20px;
    min-width: 200px;
    background: #1e3a8a;
    border-radius: 15px;
    padding: 20px;
    color: #fff;
    height: fit-content;
}

.sidebar h2 {
    font-size: 20px;
    margin-bottom: 20px;
    text-align: center;
}

.sidebar ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar ul li {
    padding: 12px 20px;
    margin-bottom: 12px;
    background-color: #2948b3;
    border-radius: 10px;
    cursor: pointer;
    text-align: center;
    transition: all 0.3s;
}

.sidebar ul li:hover,
.sidebar ul li.active {
    background-color: #ffc107;
    color: #000;
    font-weight: 600;
}

/* Vehicle Grid */
.vehicle-grid {
    flex: 1;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

/* Vehicle Card */
.vehicle-card {
    background-color: #ffffff;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0,0,0,0.08);
    transition: transform 0.3s, box-shadow 0.3s;
    display: flex;
    flex-direction: column;
    height: 420px; /* Uniform height for all cards */
}

.vehicle-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
}

.vehicle-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
}

/* Vehicle Info */
.vehicle-info {
    padding: 15px 20px;
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between; /* Space out content */
}

.vehicle-info h3 {
    font-size: 18px;
    margin-bottom: 10px;
    color: #1e3a8a;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.vehicle-info p {
    font-size: 14px;
    margin: 5px 0;
    color: #555;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/* Status Badge */
.status {
    display: inline-block;
    padding: 5px 14px;
    border-radius: 50px;
    font-size: 13px;
    font-weight: 600;
    color: #fff;
}

.status.available { background-color: #28a745; }
.status.booked { background-color: #dc3545; }

/* Price */
.price {
    font-weight: 700;
    color: #1e3a8a;
    margin-top: 10px;
    font-size: 16px;
}

/* Book Now Button */
.book-btn {
    display: block;
    margin-top: 12px;
    text-align: center;
    background-color: #1e3a8a;
    color: #fff;
    padding: 10px 0;
    border-radius: 8px;
    font-weight: 600;
    text-decoration: none;
    transition: background-color 0.3s;
}

.book-btn:hover:not(.disabled) {
    background-color: #3746a8;
}

/* Disabled Button */
.book-btn.disabled {
    background-color: #999 !important;
    cursor: not-allowed;
}

/* Responsive */
@media (max-width: 1024px) {
    .vehicle-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 768px) {
    .reservation-container {
        flex-direction: column;
    }
    .vehicle-grid {
        grid-template-columns: 1fr;
    }
    .sidebar {
        position: relative;
        top: 0;
        margin-bottom: 20px;
    }
}

.vehicle-card.car {
    background: repeating-linear-gradient(
        45deg,           /* diagonal lines */
        #e0f7fa,         /* base color */
        #e0f7fa 10px,
        #b2ebf2 10px,    /* line color */
        #b2ebf2 20px
    );
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.vehicle-card.bike {
    background: repeating-linear-gradient(
        45deg,
        #fff3e0,
        #fff3e0 10px,
        #ffe0b2 10px,
        #ffe0b2 20px
    );
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.vehicle-card.van {
    background: repeating-linear-gradient(
        45deg,
        #e8f5e9,
        #e8f5e9 10px,
        #c8e6c9 10px,
        #c8e6c9 20px
    );
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.vehicle-card.bus {
    background: repeating-linear-gradient(
        45deg,
        #f3e5f5,
        #f3e5f5 10px,
        #e1bee7 10px,
        #e1bee7 20px
    );
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}


/* Remove background images */
body,
.wrapper,
.contact {
    background-image: none !important;
    background-color: #ffffff !important;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="reservation-container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Vehicle Types</h2>
        <ul id="vehicleTypeList">
            <li class="active" data-type="all">All Vehicles</li>
            <li data-type="car">Cars</li>
            <li data-type="bike">Motor Bikes</li>
            <li data-type="van">Vans</li>
            <li data-type="bus">Buses</li>
        </ul>
    </div>

    <!-- Vehicle Grid -->
    <div id="vehicleGrid" class="vehicle-grid">
        <% 
            List<carModel> allCars = carController.getAllcars();
            List<bikeModel> allBikes = bikeController.getAllbikes();
            List<vanModel> allVans = vanController.getAllvans();
            List<busModel> allBuses = busController.getAllbuses();

            // Render Cars
            for(carModel car : allCars) { 
        %>
        <div class="vehicle-card" data-type="car" style="background-color:#e0f7fa;">
            <img src="<%= request.getContextPath() + "/vehiclepics/" + car.getCarimg() %>" alt="<%= car.getCarName() %>">
            <div class="vehicle-info">
                <div>
                    <h3><%= car.getCarName() %></h3>
                    <p><strong>Brand:</strong> <%= car.getBrand() %></p>
                    <p><strong>Model:</strong> <%= car.getModel() %></p>
                    <p><strong>Color:</strong> <%= car.getColor() %></p>
                    <p><strong>Status:</strong> 
                        <span class="status <%= car.getStatus().equalsIgnoreCase("available") ? "available" : "booked" %>">
                            <%= car.getStatus() %>
                        </span>
                    </p>
                </div>
                <p class="price">$<%= car.getPrice() %>/day</p>
                <a href="vRequest.jsp?vehicleType=car&vehicleId=<%= car.getCarId() %>" class="book-btn <%= car.getStatus().equalsIgnoreCase("booked") ? "disabled" : "" %>" <%= car.getStatus().equalsIgnoreCase("booked") ? "onclick='return false;'" : "" %>>Book Now</a>
            </div>
        </div>
        <% } %>

        <% for(bikeModel bike : allBikes) { %>
        <div class="vehicle-card" data-type="bike" style="background-color:#fff3e0;">
            <img src="<%= request.getContextPath() + "/vehiclepics/" + bike.getBikeimg() %>" alt="<%= bike.getBikeName() %>">
            <div class="vehicle-info">
                <div>
                    <h3><%= bike.getBikeName() %></h3>
                    <p><strong>Brand:</strong> <%= bike.getBrand() %></p>
                    <p><strong>Model:</strong> <%= bike.getModel() %></p>
                    <p><strong>Color:</strong> <%= bike.getColor() %></p>
                    <p><strong>Status:</strong> 
                        <span class="status <%= bike.getStatus().equalsIgnoreCase("available") ? "available" : "booked" %>">
                            <%= bike.getStatus() %>
                        </span>
                    </p>
                </div>
                <p class="price">$<%= bike.getPrice() %>/day</p>
                <a href="vRequest.jsp?vehicleType=bike&vehicleId=<%= bike.getBikeId() %>" class="book-btn <%= bike.getStatus().equalsIgnoreCase("booked") ? "disabled" : "" %>" <%= bike.getStatus().equalsIgnoreCase("booked") ? "onclick='return false;'" : "" %>>Book Now</a>
            </div>
        </div>
        <% } %>

        <% for(vanModel van : allVans) { %>
        <div class="vehicle-card" data-type="van" style="background-color:#e8f5e9;">
            <img src="<%= request.getContextPath() + "/vehiclepics/" + van.getVanimg() %>" alt="<%= van.getVanName() %>">
            <div class="vehicle-info">
                <div>
                    <h3><%= van.getVanName() %></h3>
                    <p><strong>Brand:</strong> <%= van.getBrand() %></p>
                    <p><strong>Model:</strong> <%= van.getModel() %></p>
                    <p><strong>Color:</strong> <%= van.getColor() %></p>
                    <p><strong>Status:</strong> 
                        <span class="status <%= van.getStatus().equalsIgnoreCase("available") ? "available" : "booked" %>">
                            <%= van.getStatus() %>
                        </span>
                    </p>
                </div>
                <p class="price">$<%= van.getPrice() %>/day</p>
                <a href="vRequest.jsp?vehicleType=van&vehicleId=<%= van.getVanId() %>" class="book-btn <%= van.getStatus().equalsIgnoreCase("booked") ? "disabled" : "" %>" <%= van.getStatus().equalsIgnoreCase("booked") ? "onclick='return false;'" : "" %>>Book Now</a>
            </div>
        </div>
        <% } %>

        <% for(busModel bus : allBuses) { %>
        <div class="vehicle-card" data-type="bus" style="background-color:#f3e5f5;">
            <img src="<%= request.getContextPath() + "/vehiclepics/" + bus.getBusimg() %>" alt="<%= bus.getBusName() %>">
            <div class="vehicle-info">
                <div>
                    <h3><%= bus.getBusName() %></h3>
                    <p><strong>Brand:</strong> <%= bus.getBrand() %></p>
                    <p><strong>Model:</strong> <%= bus.getModel() %></p>
                    <p><strong>Color:</strong> <%= bus.getColor() %></p>
                    <p><strong>Status:</strong> 
                        <span class="status <%= bus.getStatus().equalsIgnoreCase("available") ? "available" : "booked" %>">
                            <%= bus.getStatus() %>
                        </span>
                    </p>
                </div>
                <p class="price">$<%= bus.getPrice() %>/day</p>
                <a href="vRequest.jsp?vehicleType=bus&vehicleId=<%= bus.getBusId() %>" class="book-btn <%= bus.getStatus().equalsIgnoreCase("booked") ? "disabled" : "" %>" <%= bus.getStatus().equalsIgnoreCase("booked") ? "onclick='return false;'" : "" %>>Book Now</a>
            </div>
        </div>
        <% } %>
    </div>

</div>

<script>
// Sidebar filter without changing page
const vehicleTypeList = document.querySelectorAll('#vehicleTypeList li');
vehicleTypeList.forEach(item => {
    item.addEventListener('click', function() {
        vehicleTypeList.forEach(i => i.classList.remove('active'));
        this.classList.add('active');

        const type = this.getAttribute('data-type');
        const cards = document.querySelectorAll('.vehicle-card');
        cards.forEach(card => {
            card.style.display = (type === 'all' || card.getAttribute('data-type') === type) ? 'flex' : 'none';
        });
    });
});
</script>

<jsp:include page="vehicleFooter.jsp"/>
</body>
</html>
