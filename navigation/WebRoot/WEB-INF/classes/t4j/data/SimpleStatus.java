package t4j.data;

import java.util.Date;

import t4j.TBlogException;
import t4j.TBlogResponse;
import t4j.http.Response;
import t4j.org.json.JSONException;
import t4j.org.json.JSONObject;

public class SimpleStatus extends TBlogResponse {

	private long id;
	private String source;
	private String text;
	private Date create_at;
	private boolean truncated;
	
	public SimpleStatus(JSONObject json) throws TBlogException {
		init(json);
	}
	
	public SimpleStatus(Response res) throws TBlogException{
		init(res.asJSONObject());
	}
	
	private void init(JSONObject json) throws TBlogException{
		try {
			this.id = json.getLong("id");
			this.source = json.getString("source");
			this.text = json.getString("text");
			this.create_at = parseDate(json.getString("created_at"), "EEE MMM dd HH:mm:ss z yyyy");
			this.truncated = json.getBoolean("truncated");
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public boolean isTruncated() {
		return truncated;
	}

	public void setTruncated(boolean truncated) {
		this.truncated = truncated;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
