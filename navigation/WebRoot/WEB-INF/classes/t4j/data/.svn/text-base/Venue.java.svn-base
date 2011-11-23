/*
Copyright (c) 2007-2009, Yusuke Yamamoto
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Yusuke Yamamoto nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Yusuke Yamamoto ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Yusuke Yamamoto BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
package t4j.data;

import java.util.ArrayList;
import java.util.List;

import t4j.TBlogException;
import t4j.http.Response;
import t4j.org.json.JSONArray;
import t4j.org.json.JSONException;
import t4j.org.json.JSONObject;

/**
 * 
 * @author gcwang
 * 
 * 地点信息
 */
public class Venue {

	private String name;
	private String address;
	private String city;
	private String province;
	private String state;
	private double[] coordinates = new double[2];
	
	public double getLatitude(){
		return coordinates[0];
	}
	
	public double getLongitude(){
		return coordinates[1];
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public double[] getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(double[] coordinates) {
		this.coordinates = coordinates;
	}
	
	public Venue(JSONObject json) throws TBlogException {
		
		try {
			this.name = json.getString("name");
			this.address = json.getString("address");
			this.city = json.getString("city");
			this.province = json.getString("province");
			this.state = json.getString("state");
			
			JSONArray coordinates = json.getJSONArray("coordinates");
			
			this.coordinates[0] = coordinates.getDouble(0);
			this.coordinates[1] = coordinates.getDouble(1);
		} catch (JSONException e) {
			throw new TBlogException(e);
		}
	}
	
	public static List<Venue> createVenueList(Response res) throws TBlogException{
		
		try{
			JSONArray jsonArray = res.asJSONArray();
			List<Venue> venues = new ArrayList<Venue>();
			
			for(int i=0; i<jsonArray.length(); i++){
				venues.add(new Venue(jsonArray.getJSONObject(i)));
			}
			return venues;
		}catch(JSONException jsone){
			throw new TBlogException(jsone);
		}
	}
}
