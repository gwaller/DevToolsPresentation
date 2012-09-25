package photoview

import org.apache.commons.logging.LogFactory
import org.apache.solr.client.solrj.impl.CommonsHttpSolrServer
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer
import org.apache.solr.common.SolrDocumentList;


class SolrService {

	// Disable transactions
	static transactional = false;
	
	def grailsApplication
	
	private static final log = LogFactory.getLog(this)
	
	static def allFacets = ['cameraModel_facet','aperture_facet','exposureTime_facet','iso_facet','focalLength_facet','lens_facet']
    			
	
	SolrServer getSolrServer(){
		String url = grailsApplication.config.solr.url;
		log.debug("Using SOLR server URL: ${url}");
		SolrServer server = new CommonsHttpSolrServer(url);
		return server;
	}
	
    def indexPhoto(Photo p) {
		SolrServer server = getSolrServer();
		server.addBean(p);
		server.commit();
    }
	
	def query(String q){
		return query(q, null)
	}
	
	def query(String q, List<String>facetQueries){
		SolrServer server = getSolrServer();
		SolrQuery query = new SolrQuery();
		query.setQuery( "all_text:${q}"  );
		query.addSortField( "title", SolrQuery.ORDER.asc );
		
		query.setFacet(true).setFacetMinCount(1).setFacetLimit(-1)
		
		// Make a copy as we are going to change the list
		def facetsRemaining = []
		allFacets.each {
			facetsRemaining << it
		}
		
		def facetQueryMap = [:]
		
		facetQueries.each{ 
			String[] fieldAndValue = it.split(":", 2)
				
			facetQueryMap[fieldAndValue[0]] = fieldAndValue[1]
			
			log.debug("Processing facetQuery field = ${fieldAndValue[0]}")
			if (facetsRemaining.contains(fieldAndValue[0])){
				facetsRemaining = facetsRemaining - [fieldAndValue[0]]
			}
			
			query.addFilterQuery(it)
		}
		
		facetsRemaining.each{
			query.addFacetField(it)
		}
		
		log.debug("Issuing query: ${query}");	
			
		QueryResponse rsp = server.query( query );
		
		
		
		return [queryResponse: rsp, solrDocumentList:rsp.getResults(), facetQueryMap:facetQueryMap, allFacets:allFacets];
		
	}
}
