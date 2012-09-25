package photoview

import org.apache.solr.common.SolrDocumentList;
import org.apache.commons.logging.LogFactory

class SearchController {

	// inject SolrService
	def solrService
	
	private static final log = LogFactory.getLog(this)
	
    def index() { }
	
	def search(){
		// Example debug statement to see what class params is:
		//log.debug(params.getMetaClass().toString())
		String q = params.q;
		
		// Handle multiple values of the 'fq' param - make sure they are a list (even if one value supplied)
		// See http://mrhaki.blogspot.co.uk/2010/03/grails-goodness-get-values-from.html
		// Handles a query like 'http://localhost:8080/search?q=leo*&fq=iso_facet:200&fq=aperture_facet:5.6'

		List<String> fqList = params.list('fq')
		
		log.debug("Entering search with q=$q and fq=$fqList")
		
		def respMap = solrService.query(q, fqList);
		
		List<Photo> photoBeans = respMap["queryResponse"].getBeans(Photo.class);
		[solrQueryResp:respMap["queryResponse"], photoInstanceList:photoBeans, photoInstanceTotal:photoBeans.size(), q:q, fqList:fqList, facetQueryMap:respMap["facetQueryMap"], allFacets:respMap["allFacets"]]
	}
	
	def show(){
		String id = params.id
		Photo p = Photo.get(id)
		[photoInstance:p]
		
	}
}
