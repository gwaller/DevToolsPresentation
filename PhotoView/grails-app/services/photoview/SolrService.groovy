package photoview

import org.apache.commons.logging.LogFactory
import org.apache.solr.client.solrj.impl.CommonsHttpSolrServer
import org.apache.solr.client.solrj.SolrServer


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
}
