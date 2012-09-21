package photoview

import com.drew.metadata.*
import com.drew.imaging.*
import org.apache.commons.logging.LogFactory;

class MetadataExtractorService {

	// Disable transactions
	static transactional = false;
	
	def grailsApplication
	private static final log = LogFactory.getLog(this)
	
    Metadata extractMetadata(String fileName) {
		
		String fileToOpen = "${grailsApplication.config.upload.dir}/${fileName}";
		
		log.debug("Reading JPG at: ${fileToOpen}");
		
		File jpegFile = new File(fileToOpen);

		return ImageMetadataReader.readMetadata(jpegFile);
		
	}
}
