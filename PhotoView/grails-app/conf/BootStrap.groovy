import photoview.Photo
import com.drew.metadata.*
import com.drew.imaging.*
import com.drew.metadata.iptc.IptcDirectory;
import com.drew.metadata.exif.ExifSubIFDDirectory;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.drew.metadata.xmp.XmpDirectory;

class BootStrap {

	// Inject the MetadataExtractor service
	def metadataExtractorService;
	
    def init = { servletContext ->
    
		// Check whether the test data already exists.
		if (!Photo.count()) {
			for (int i = 1; i < 5; i++){
				String fileName = "picture-${i}.jpg";
				Metadata metadata = metadataExtractorService.extractMetadata(fileName);
				
				if (metadata){
					Photo p = new Photo()
					p.fileName = fileName;
					p.title = metadata.getDirectory(IptcDirectory.class)?.getString(IptcDirectory.TAG_OBJECT_NAME)
					p.licence = metadata.getDirectory(IptcDirectory.class)?.getString(IptcDirectory.TAG_COPYRIGHT_NOTICE)
					p.exposureTime = metadata.getDirectory(ExifSubIFDDirectory.class)?.getString(ExifSubIFDDirectory.TAG_EXPOSURE_TIME)
					p.aperture = metadata.getDirectory(ExifSubIFDDirectory.class)?.getString(ExifSubIFDDirectory.TAG_FNUMBER)
					p.iso = metadata.getDirectory(ExifSubIFDDirectory.class)?.getString(ExifSubIFDDirectory.TAG_ISO_EQUIVALENT)
					p.focalLength = metadata.getDirectory(ExifSubIFDDirectory.class)?.getString(ExifSubIFDDirectory.TAG_FOCAL_LENGTH)
					p.cameraModel = metadata.getDirectory(ExifIFD0Directory.class)?.getString(ExifIFD0Directory.TAG_MODEL)
					p.lens = metadata.getDirectory(XmpDirectory.class)?.getString(XmpDirectory.TAG_LENS)
					p.save(failOnError: true)
				}
			}
			
			
			
			
		}
		
	}
	
	
    def destroy = {
    }
}
