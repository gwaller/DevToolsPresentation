package photoview

import org.apache.solr.client.solrj.beans.Field;

class Photo {

	// inject SolrService
	def solrService
	
	// @Field annotation is for SolrJ	
	@Field
	int id;
	
	@Field
	String title;
	
	@Field
	String fileName;
	
	@Field
	String exposureTime;
	
	@Field
	String aperture;
	
	@Field
	String iso;
	
	@Field
	String focalLength;
	
	@Field
	String cameraModel;
	
	@Field
	String lens;
	
	@Field
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
	
	// Event hook for after the object is written to the DB
	def afterInsert() {
		solrService.indexPhoto(this)
	}
	
}
