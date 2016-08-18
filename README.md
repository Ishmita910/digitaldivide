# Script
 There exists a digital divide between web-developers and internet users in the United States. While web-developers usually have top-notch internet conenctions, the US population's internet varies greatly. ![varying speeds graph](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/percentDLwithColor.png) Oftentimes, developers only use a single device, or a small sample of machines with similar speeds and other characteristics to run tests. These tests are also often done directly connected to university networks, which have much better speeds than most users. What ultimately stems from this digital divide is a situation where due to the fact that developers do not test their advancements on a variety of realistic networks, many of the advancements made do not work as intended for millions of Americans who have different internet speeds. The rising popularity of testbeds hosted on universities across America has given researchers a more efficient way to test advancements. One such testbed that I focused on is the GENI Testbed. 
 
 GENI is a platform that researchers use to test developments. Virtual monitors (VMs) can be dragged onto the interface, and connected by links. These virtual machines are then reserved at one of numerous available universities, and researchers can log into each of the virtual machines. Researchers can then install any application, and use them. The networks created are then used to run tests and see how their developments perform. However, if researchers do not carefully change characteristics of the link to match their target users' network characteristics, the network that they test on will not accurately represent real households. And thus these researchers have the same problem as those that did not use a testbed at all.
 
 These testbeds are often run just using the host University settings, or other unrealistic settings. For example, the default link speed on GENI is 100 megabits per second, and many researchers do not change the speed to something more realistic. Also, default latency and packet loss on GENI is zero, which does not at all represent real household network connections. But, as I just said, many characteristics, such as link capacity, download speed, upload speed, latency, jitter, and packet loss, can be implemented into the GENI system. 
 
 Our goal was to create more realistic networks on GENI. With more realistic networks to test on, researchers should be able to make advancements that have a better impact on more Americans' internet. Our tool takes an input of state, price range, and technology so researchers can limit their outputs to households that represent the target group of their development. For example, if a researcher is trying to make an application specifically for lower income communities, then the researcher would most likely search for a household paying a lower price. Then, our tool looks through a dataset, and randomly selects one household that matches all the given parameters. For example, if a researcher filetered for prices between 35 and 70 dollars, all of these households could have been returned. ![map](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/justmap.PNG) The dataset comes from measurements in the Measuring Broadband America program. Measuring Broadband America uses volunteer panelists paying different prices for different speeds, and from different locations. Potential panelists are checked to see that they closely match the overall state and region statistics of Internet access connections in the United States before acceptance to the program.

Once an actual household is selected from the dataset, the information from the household can be used in two ways. Our code generates a script that can be put into GENI to create a small network. In the network, one machine represents the user, and the other represents the server. The link between the user and the server has the same qualities as the selected household. Because there are no outside factors involved, GENI allows researchers to test advancements in  a very controlled environment. ![GENI topology](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/GENIposter.PNG) So, if we run the script searching for a New York household using Fios, as was done here, we could get different characteristics each time. The idea is that if it is tested on multiple similar households, researchers will get a better idea whether or not their application works under different circumstances.

Our tool generates a profile where a researcher can connect to after setting up a VPN and a proxy server in addition to the GENI network. ![ATC](https://github.com/csmithsalzberg/CodeRealisticTestbeds/blob/master/profiles.PNG) The link between the VPN and the proxy also has the same characteristics as the sample household. Then, researchers can browse the internet using that households speeds, latency, and other features. Since researchers only have control over the link between the VPN and the proxy, and not the link from the researchers device to the VPN, and from the proxy to the web, this method includes outside influences on the network that GENI does not have. The GENI network is completely controlled by whoever created that network. Facebook instituted a program called "2G Tuesdays" where employees have the option of using worse internet speeds, using the same setup as our tool. For one hour one Tuesdays, employees can use their application with the internet of the developing world, in order to get a better understanding of how people with worse internet speeds experience their applications [2]. This experiment actually had a big impact on the Facebook team, and they have said that the experiment led them to change some parts of the Messenger app. We hope that the GENI network and the internet profile our tool generates will have a similar impact on researchers. Our ultimate goal is that the tool will allow researchers to test their applications under more realistic conditions, which should lead them to design more effective developements for everybody.
 


## Citations
[1] [https://isis.poly.edu/~jcappos/papers/muhammad_seattle_geni_12.pdf](https://isis.poly.edu/~jcappos/papers/muhammad_seattle_geni_12.pdf)

[2] [https://witestlab.poly.edu/blog/2g-tuesdays-emulating-realistic-network-conditions-in-emerging-markets/](https://witestlab.poly.edu/blog/2g-tuesdays-emulating-realistic-network-conditions-in-emerging-markets/)
