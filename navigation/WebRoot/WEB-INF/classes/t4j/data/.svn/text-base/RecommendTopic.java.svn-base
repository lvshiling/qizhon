package t4j.data;

import java.util.ArrayList;
import java.util.List;

import t4j.TBlogException;
import t4j.org.json.JSONArray;
import t4j.org.json.JSONException;
import t4j.org.json.JSONObject;

public class RecommendTopic {
	
	public RecommendTopic(JSONObject json) throws TBlogException{
		init(json);
	}
	
	private void init(JSONObject json) throws TBlogException {
		try {
			this.name = json.getString("name");
			this.url = json.getString("url");
			this.query = json.getString("query");
			this.remark = json.getString("remark");
		} catch (JSONException e) {
			throw new TBlogException(e);
		}
	}

	private String name;
	private String url;
	private String query;
	private String remark;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public static List<RecommendTopic> constructTopics(JSONArray array) throws TBlogException{
		List<RecommendTopic> topics = new ArrayList<RecommendTopic>();
		for(int i=0; i<array.length(); i++){
			try {
				topics.add(new RecommendTopic(array.getJSONObject(i)));
			} catch (JSONException e) {
				return topics;
			}
		}
		return topics;
	}
}
