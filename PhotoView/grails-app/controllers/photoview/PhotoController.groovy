package photoview

import com.drew.metadata.*
import com.drew.imaging.*
import org.apache.commons.logging.LogFactory;

class PhotoController {

	def grailsApplication
	private static final log = LogFactory.getLog(this)
	
    def index() { 
	
		redirect(action: "exifDump", params: [name: "picture-3.jpg"])
		
	}
	
	def exifDump() {
		
			String fileName = params.name;
			StringBuffer sb = new StringBuffer();
			String fileToOpen = "${grailsApplication.config.upload.dir}/${fileName}";
			
			log.debug("Reading JPG at: ${fileToOpen}");
			
			File jpegFile = new File(fileToOpen);

			Metadata metadata = ImageMetadataReader.readMetadata(jpegFile);
			for (Directory directory : metadata.getDirectories()) {
				for (Tag tag : directory.getTags()) {
					sb.append(tag.toString() + "\n");
				}
			}
			
			render(text:sb.toString() , contentType: "text/plain", encoding: "UTF-8")
			
		}
}
