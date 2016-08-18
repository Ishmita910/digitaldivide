# Script

 There exists a digital divide between web developers and internet users in the United States. Some households do not have high-speed Internet avavilable in their area, or cannot pay for high-speed Internet. As a result, there is a lot of variation in Internet speed across households in the US. We see this in the image below, which shows the relative frequency of different download speeds of US households. Meanwhile, web developers and researchers usually have top-notch internet connections. This disparity is called the "digital divide".
 
 ![varying speeds graph](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/percentDLwithColor.png) 
 
 Internet researchers and developers mainly use high-speed home or university Internet connections to test new ideas, or they use dedicated infrastructure called "testbeds" that have good quality links. Sometimes they use a single device, or a small sample of machines to run tests, but these tests are done directly connected to university networks, which have much better speeds than most home users.  
 
 Alternatively, researchers may use a platform called GENI to test developments on dedicated research infrastructure. When using GENI, reseachers use a web-based interface in which virtual machines (VMs) can be dragged onto the canvas area, and connected by links (as show in the screenshot below). These virtual machines and links are then reserved at one of a set of server racks at universities across the US, and researchers can log into each of the virtual machines, install networked applications, and use them and measure their performance. However, the default link speed on GENI is 100 megabits per second, which we see in the image above is much higher than most US households' download speed. Also, default latency and packet loss on GENI is minimal, which does not at all similar to real household network connections. 
 
  ![GENI portal](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/geniexample.PNG) 

Characteristics such as download speed, upload speed, latency, jitter, and packet loss, _can_ be changed on GENI.   However, many researchers do not change these to something more realistic. If researchers do not deliberately change characteristics of the link to match their target users' network characteristics, the network that they test on will not accurately represent real households.

When developers and researchers do not test their ideas on a variety of realistic networks, their advancements may not work as intended for the millions of Americans who have different Internet speeds. Companies like Facebook recognize the importance of this. Facebook instituted a program called "2G Tuesdays" where employees have the option of using low-quality Internet speeds similar to that of the developing world, in order to get a better understanding of how people with worse internet speeds experience their applications [2]. This experiment actually had a big impact on the Facebook team, and they have said that it led them to change the way parts of the Messenger app work to better support users in emerging markets.
 
 
 Our goal was to make it easy for researchers to use more realistic networks on GENI. With more realistic networks to test on, researchers should be able to make advancements that have a better impact on more Americans' internet. 
 
 We used a dataset of measurements from the Measuring Broadband America program. This is a program by the FCC to gather information on the Internet quality of US households. Volunteer panelists get a wireless router through which they connect to the Internet using their regular Internet plan provided by their own Internet service provider (ISP). The router automatically runs network tests every hour and reports measurements back to the FCC. The panelists have a range of Internet service plans, of different types (cable, satellite, fiber, DSL), from different ISPs, and paying different prices for different upload and download speeds. They also come from different locations around the US. Potential panelists are selected so that the measurements give information about all the different kinds of Internet service plans available in the US.
 
 The tool we created is a Python script that samples a random household from this dataset, and finds the measurements of that household's Internet connection in the data set. Researchers using our tool can also specify as input the state, price range, and/or technology so as to limit their outputs to households that represent a target group. For example, if a researcher is trying to make an application specifically for lower income communities, then the researcher would most likely search for a household paying a low price. The map below shows examples of households across the United States, paying different prices, with different ISPs, and in states with different average Internet speed:
 
  ![map](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/mapwithheat.png) 

Once an actual household is selected from the dataset, the information from the household can be used in two ways. Our code generates a script that can be put into GENI to create a small network. In the network, one machine represents the user, and the other represents the server. The link between the user and the server has the same qualities as the selected household. Because there are no outside factors involved, GENI allows researchers to test advancements in  a very controlled environment. ![GENI topology](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/GENIposter.PNG) So, if we run the script searching for a New York household using Fios, as was done here, we could get different characteristics each time. The idea is that if it is tested on multiple similar households, researchers will get a better idea whether or not their application works under different circumstances.

Our tool generates a profile where a researcher can connect to after setting up a VPN and a proxy server in addition to the GENI network. ![ATC](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/profiles.PNG) The link between the VPN and the proxy also has the same characteristics as the sample household. Then, researchers can browse the internet using that households speeds, latency, and other features. Since researchers only have control over the link between the VPN and the proxy, and not the link from the researchers device to the VPN, and from the proxy to the web, this method includes outside influences on the network that GENI does not have. The GENI network is completely controlled by whoever created that network. 

We hope that the GENI network and the internet profile our tool generates will have a similar impact on researchers. Our ultimate goal is that the tool will allow researchers to test their applications under more realistic conditions, which should lead them to design more effective developements for everybody.
 


## Citations
[1] [https://isis.poly.edu/~jcappos/papers/muhammad_seattle_geni_12.pdf](https://isis.poly.edu/~jcappos/papers/muhammad_seattle_geni_12.pdf)

[2] [https://witestlab.poly.edu/blog/2g-tuesdays-emulating-realistic-network-conditions-in-emerging-markets/](https://witestlab.poly.edu/blog/2g-tuesdays-emulating-realistic-network-conditions-in-emerging-markets/)
