package t4j.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import t4j.TBlogException;
import t4j.TBlogResponse;
import t4j.http.Response;
import t4j.org.json.JSONArray;
import t4j.org.json.JSONException;
import t4j.org.json.JSONObject;

/**
 * 
 * @author gcwang
 * 
 * 评论
 */
public class Comment extends TBlogResponse {

	private long id;
	private String source;
	private String text;
	private Date createdAt;
	private Date favoritedAt;
	private boolean truncated;
	private boolean favorited;
	
	private User user;
	
	public Comment(Response res) throws TBlogException{
		JSONObject json = res.asJSONObject();
		init(json);
	}
	
	public Comment(JSONObject json) throws TBlogException{
		init(json);
	}

	private void init(JSONObject json) throws TBlogException {
		try {
			this.id = json.getLong("id");
			this.source = json.getString("source");
			this.text = json.getString("text");
			this.createdAt = parseDate(json.getString("created_at"), "EEE MMM dd HH:mm:ss z yyyy");
			this.favoritedAt = parseDate(json.getString("favorited_at"), "EEE MMM dd HH:mm:ss z yyyy");
			this.truncated = json.getBoolean("truncated");
			this.favorited = json.getBoolean("favorited");
			
			if(!json.isNull("user")){
				this.user = new User(json.getJSONObject("user"));
			}
		} catch (JSONException e) {
			throw new TBlogException(e);
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getFavoritedAt() {
		return favoritedAt;
	}

	public void setFavoritedAt(Date favoritedAt) {
		this.favoritedAt = favoritedAt;
	}

	public boolean isTruncated() {
		return truncated;
	}

	public void setTruncated(boolean truncated) {
		this.truncated = truncated;
	}

	public boolean isFavorited() {
		return favorited;
	}

	public void setFavorited(boolean favorited) {
		this.favorited = favorited;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public static List<Comment> constructStatuses(JSONArray jsonArray) throws TBlogException{
		try {
			int size = jsonArray.length();
			List<Comment> comments = new ArrayList<Comment>(size);
			for (int i = 0; i < size; i++) {
				comments.add(new Comment(jsonArray.getJSONObject(i)));
			}
			return comments;
		} catch (JSONException jsone) {
			throw new TBlogException(jsone);
		} catch (TBlogException te) {
			throw te;
		}
	}

	public static List<Comment> constructStatuses(Response response) throws TBlogException {
		return constructStatuses(response.asJSONArray());
	}
}
