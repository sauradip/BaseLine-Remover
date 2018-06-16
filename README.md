# BaseLine Remover


This a small Matlab Implementation for Removal of Base Line from document using Edge Directional Kernel stated in paper " Edge enhancement algorithm for low-dose X-ray fluoroscopic imaging " by Lee et al. Here Baselines are Removed using Edge Directional Kernel . BaseLine Removal is an important topic in Document Image Analysis . In this paper Lee et al proposed removal of Noise from XRAY Images using Edge Directional Kernel and High Pass Filter but since our Noise is only Baseline we used a clever trick to implement only the Edge Directional Kernel and the reuslts are quite neat 

#### * This method works well  for Half Page Document and Cropped Line Images , however if full page images are preprocessed then it may work pretty well

### Results : 

#### Image 1 : Single Document Line Image

###### Input
![Input](/7.jpg)
###### Output
![Output](/line_removed_00069.JPG)


#### Image 2 : Half Document Image

###### Input
![Input](/4.jpg)
###### Output
![Output](/line_removed_00019.JPG)
