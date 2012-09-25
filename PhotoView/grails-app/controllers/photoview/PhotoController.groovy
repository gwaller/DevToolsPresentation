package photoview

import org.springframework.dao.DataIntegrityViolationException
import com.drew.metadata.*
import com.drew.imaging.*
import org.apache.commons.logging.LogFactory;

class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def grailsApplication
	private static final log = LogFactory.getLog(this)
	
	// Inject the MetadataExtractor service
	def metadataExtractorService;
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [photoInstanceList: Photo.list(params), photoInstanceTotal: Photo.count()]
    }

    def create() {
        [photoInstance: new Photo(params)]
    }

    def save() {
        def photoInstance = new Photo(params)
        if (!photoInstance.save(flush: true)) {
            render(view: "create", model: [photoInstance: photoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }

    def show() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def edit() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def update() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (photoInstance.version > version) {
                photoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'photo.label', default: 'Photo')] as Object[],
                          "Another user has updated this Photo while you were editing")
                render(view: "edit", model: [photoInstance: photoInstance])
                return
            }
        }

        photoInstance.properties = params

        if (!photoInstance.save(flush: true)) {
            render(view: "edit", model: [photoInstance: photoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }

    def delete() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            photoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def exifDump() {
		
		String fileName = params.fileName;
		StringBuffer sb = new StringBuffer();
		
		Metadata metadata = metadataExtractorService.extractMetadata(fileName);
		for (Directory directory : metadata.getDirectories()) {
			for (Tag tag : directory.getTags()) {
				sb.append(tag.toString() + " [ tag type " + tag.getTagType() + "]\n");
			}
		}
		
		render(text:sb.toString() , contentType: "text/plain", encoding: "UTF-8")
		
	}
	
	def showPhoto(){
		String id = params.id;
		Photo p = Photo.get(id);
		String fileName = p.fileName;
		String path = "${grailsApplication.config.upload.dir}/${fileName}" 
	
		response.contentType = 'image/jpg'
		
		File binFile = new File(path)
		response.setHeader('Content-length', "${binFile.size()}")
		
		// NOTE: Very bad - reading the whole file into memory
		response.outputStream << binFile.bytes
		 
		response.outputStream.flush()
	}
}
