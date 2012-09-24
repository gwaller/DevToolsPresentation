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
		SolrServer server = getSolrServer();
		SolrQuery query = new SolrQuery();
		query.setQuery( "all_text:${q}"  );
		query.addSortField( "title", SolrQuery.ORDER.asc );
		
		query.setFacet(true).setFacetMinCount(1).setFacetLimit(-1).
			addFacetField("lens_facet").
			addFacetField("aperture_facet").
			addFacetField("exposureTime_facet").
			addFacetField("cameraModel_facet").
			addFacetField("focalLength_facet").
			addFacetField("iso_facet");
		
		log.debug("Issuing query: ${query}");	
			
		QueryResponse rsp = server.query( query );
		
		
		
		return [queryResponse: rsp, solrDocumentList:rsp.getResults()];
		
	}
}
