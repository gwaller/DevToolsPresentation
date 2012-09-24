package photoview

import org.apache.solr.common.SolrDocumentList;

class SearchController {

	// inject SolrService
	def solrService
	
    def index() { }
	
	def search(){
		String q = params.q;
		def respMap = solrService.query(q);
		
		List<Photo> photoBeans = respMap["queryResponse"].getBeans(Photo.class);
		[solrQueryResp:respMap["queryResponse"], photoInstanceList:photoBeans, photoInstanceTotal:photoBeans.size(), q:q]
	}
	
	def show(){
		String id = params.id
		Photo p = Photo.get(id)
		[photoInstance:p]
		
	}
}
