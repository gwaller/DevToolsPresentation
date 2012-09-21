package photoview

class Photo {

	String title;
	String fileName;
	String exposureTime;
	String aperture;
	String iso;
	String focalLength;
	String cameraModel;
	String lens;
	String licence; 
	
    static constraints = {
		title nullable:false
    	fileName nullable: false
		exposureTime nullable:true
		aperture nullable:true
		iso nullable:true
		focalLength nullable:true
		cameraModel nullable:true
		lens nullable:true
		licence nullable:true
	}
}
