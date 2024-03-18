# Bay Area rent project
> An exploratory data analysis on bay area housing rent using the Google data analytics 6 step process

 ![Zillow-Group-Brand-Logos_010422-01](https://github.com/StephDacu/Bay-rent/assets/161432984/4fa3bc51-ed35-4c7c-bf0d-ff6209807f2f)

# Welcome!
Here we will explore a data set comprised of data scraped from Zillow.
- You can find my Tableau dashboard -> [Here](https://public.tableau.com/app/profile/stephen.dacuyan/viz/BayAreaRent/Dashboard1)

# Background and Information
Zillow is an American online real estate marketplace that provides information about homes, real estate listings, rental properties, mortgages, and home improvement.

Zillow uses data analytics and algorithms to estimate property values, known as "Zestimates," which are based on various factors such as location, square footage, and market trends. The platform allows users to search for homes, apartments, and other types of real estate, as well as to connect with real estate agents and lenders.

Using an online tutorial I was able to scrape about 500 listings on Zillow using a website called Scrapeak. Here they gathered the necessary API information in order to process and provide me with a csv file that I then cleaned and organized. 
This provided a nice introduction to data scraping when I need specific information that is public but not necessarlily available in a digestible way like how Kaggle provides.

Here we lead to our first step in data analytics:

# 1. Ask:
> Defining the problem and objectives of the study

### Business Task:
Analyze Zillow rental listings of homes to gain insights into how the rental situations for homes is at its current form. 

### Objectives:
- What is the geographical distribution of properties based on latitude and longitude?
- How does the square footage of a property affect its price?
- How accurate is the rent Zestimate compared to the actual rent prices?

# 2. Prepare:
> Identify the data and explain limitations

As mentioned earlier the data was scraped from Zillow before providing API information to the website Scrapeak I first filtered my search on Zillow in order to reduce the amount of outliers I am recieving. This included anything above $1,000+ in terms of rent, houses built after the year 1900, and finally only homes as apartment listings contain a multitude of different rooms that could present further issues. 

The limitations of this data set is that this does not cover the widest range of places to stay. This also is limmited to what is available at the time, because these are live Zillow listings things can change. Listings may not be available or prices may increase or decrease over time. In the end this is a surface level analysis on the current state (3/13/2024) of housing rent in the bay area.

# 3. Process:
> Find any inaccuracies and errors in the data (cleaning the data).

After recieving the CSV I cleaned the data by removing any unnecessary columns that do not pertain to the objectives at hand. This included "city", "state", "timeOnZillow", "country", etc... I also reviewed the csv and made sure that the data is clean enough to run through SQL. I made sure decimals were rounded to their second place, street addresses were formatted correctly, prices were also rounded to the nearest second decimal place and formatted correctly to USD. I also Fished out any null values in order to keep my data set consistant. 

# 4. Analyze and 5. Share:
> Find the trends and patters that pertain to the business task. Then use visualizations to share the insights in an easily digestible manner. Here I will be answering the business objectives. 

### What is the geographical distribution of properties based on latitude and longitude?
Using SQL I created two queries to find the Geographical distibution of properties based on latitude and longitude in terms of price. I then ran a query that gave me each of the cities in the bay area and their average prices for listings in their area. 

![Geographical Distribution of Properties](https://github.com/StephDacu/Bay-rent/assets/161432984/312247ae-2893-4702-8e1e-a9775464ca06)

As you can see I also created a visual map using Tableau public in order to show each listing based on their longitude an latitude. When a user using my dashboard, hovering or clicking on any dot will display a tooltip with information involving the Address, bed/bath, price, square footage, and a link to the zillow listing itself. The dashboard also has filters similar to Zillows actual website's filters. 

Here I found that certain cities like Portola Valley and Lost Altos Hills have pretty high rent but this average may be high due to the low volume of rentals in those areas. Palo alto and Los Altos have higher averages along with more rentals so this may give a more accurate insight into the rental situations in those areas. 

### How does the square footage of a property affect its price?
In SQL I created a query that categorizes different square footages into ranges. 
- Small = 100> SQFT <= 500
- Medium = >500 SQFT <= 1000
- Large = >1000 SQFT <= 2000
- Extra Large = >2000 SQFT
  
![Square footage cats](https://github.com/StephDacu/Bay-rent/assets/161432984/8ff2e0cb-6193-427a-a51a-1bfba2a8a89a)

![Effect of Square Footage to Price](https://github.com/StephDacu/Bay-rent/assets/161432984/0d48531a-0072-43f7-8827-22a95c3fe5f9)

As expected there is a trend in square footage to price where the more space a listing has the higher the price will be. This is a small sample size but is expected. The gap in the bar chart is a gap in the data, there isn't any listing in this particular case that has that price and square footage range. 

### How accurate is the rent Zestimate compared to the actual rent prices?
The query I ran compares the Zillow's "rent Zestimate" which is Zillows way of estimating what the price or rent "should" be based on estimations and trends in the market. This is not the actual value but can give users an insight on how prices can be for that particular type of listing. 

The comparison I ran was to ffind the price difference whether the "zestimate" was higher or lower that the listing price, then to find the perent differents between the two prices. 

![Price Vs Rent Zestimate](https://github.com/StephDacu/Bay-rent/assets/161432984/d0b2839b-bd95-4a28-8a6d-72d962e00426)

In this visualization I created a scatter plot to represent the comparison between the actual price vs the rent Zestimate. In the middle off the graph you can see a trend line that is representative of the relationship between the two dimensions. The farther a dot is away from the line the larger the difference between the price and estimate. 

# 6. Act
> Delivering our insights and providing recommendations

This short sample size provides a micro analysis on the market trends in real estate and rent in the Bay Area. 
- First, the geographical location of each listing allows for a user to pick and choose specific listings and compare them to others based on the users criteria. This also gives an insight into how prices can vary city by city even though each city may be about 5 minutes away. This also shows that majority of higher rentals are towards South Bay. 
- Next, showing the correlation between square footage and price demonstrates what many users expect from the housing market. The higher square footage = a higher price.
- Lastly, the "Zestimate" that Zillow provides can have a large impact on users decisions. Users should understand the limitations of the "Zestimates" accuracy. As I am also sure Zillow is always continually trying to improve their Zestimate system in order to provide users with a more accurate estimate. Which seems to be the case in this example.
  
