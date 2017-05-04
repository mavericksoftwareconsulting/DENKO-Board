Maverick - Minneapolis
Set up and changes to the original repository made for the Minneapolis branch
Author: Levi Cottington
2/10/2017


The minneapolis denko board system uses two raspberry pi's to handle the music and the board itself

The first raspberry pi is for the actual denko board, which can be pulled from the github repository 
it uses nodejs to run the application. (see generic readme file for details)

the second rasberry pi is for the spotify music. 
it uses a api for linux systems called mopidy. This mopidy api has many add-ons that can be used for it. 
originally the music api that was used in tandem with mopidy was an api called 'mopify'
while the mopify api runs quite nicely, the issue is that it does not show a very appealing "now playing page" that the
denko board would use in it's iframe. 
Therefore, I ended up using a different api for mopidy (that works just the same) called "iris"
Iris was nice in that it had a very good "now playing" page that was easy to fit in the iframe of the denkoboard.

for the denkoboard itself there were a few changes that I made to make it a little better looking.
I also added some features that are specific for minneapolis.

1. changed the time in the top right corner to only show the hour and minutes.
		(this helped the marquee not be so glitchy)
		
2. changed the dimensions of the iframe for the music to fit only the album artwork, name of the song, and the artist (from the iris api)

3. changed the json files in ServerSide to contain the lat/lon coordinates of the minneapolis office for the weather.
	-also changed the contact information
	
4. Bus Schedules
	I added code in ClientSide/client.html that handles two seperate bus systems.
	A) Metro Transit System
		this uses a web-based api created by MetroTransit that returns a json file containing bus arrivals for specific bus stops
		this json file is called in the javascript code and is inserted into the busTimes section of the html. The retrieval of the json files
		happens every 30 seconds, using setInterval(..., 30000), for current times. however, using this causes the file to wait 30 seconds before it calls
		the url for the first time.
	
	B) UMN campus buses
		this works much like the Metro Transit System api, however it returns an xml file instead of json. because of this, the process for retrieving the data is
		a little different by using xmlHttpRequest. See the code for clarification. this is also implemented every 30 seconds using setInterval. 
		
		
	Both these data retrievals shows the next 2 times for bus arrivals at their respective spots. 
	

	
SETUP

both the raspberry pi's have been outfitted with a few lines of code (found in etc/rc.local) that runs everything automatically on startup
	for the denko board pi, the lines of code "cd" to the ServerSide file found in the denko directory, and runs "node denkoserver.js"
	this pi also has a code that starts the chrome in a full screen mode (kiosk mode) and is directed to the denko page as it is set as the homepage (127.0.0.1:1337)
	**for anyone on the same network as the pi, the denko board can be accessed by using the following ip address on any browser: 127.168.140.174:1337

	same with the spotify pi, the rc.local runs on startup and the code added looks like "mopidy", which simply runs the mopidy api. the iris api can then be accessed by 
	any device on the network by going to: 192.168.140.110:6680/iris
	
	
	
Denko: 192.168.140.123:1337
		admin: 192.168.140.123:1337/admin
Iris: 192.168.140.125:6680/iris
	
