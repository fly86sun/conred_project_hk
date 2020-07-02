package com.hk.conred.dtos;

public class SubwayDto {
	private String subway_code;
	private String subway_name;
	private String subway_line;
	private String subway_outer_code;
	private String subway_latitude;
	private String subway_longitude;
	
	public SubwayDto() {
		super();
	}
	
	public SubwayDto(String subway_code, String subway_name, String subway_line, String subway_outer_code,
			String subway_latitude, String subway_longitude) {
		super();
		this.subway_code = subway_code;
		this.subway_name = subway_name;
		this.subway_line = subway_line;
		this.subway_outer_code = subway_outer_code;
		this.subway_latitude = subway_latitude;
		this.subway_longitude = subway_longitude;
	}
	
	public String getSubway_code() {
		return subway_code;
	}
	public void setSubway_code(String subway_code) {
		this.subway_code = subway_code;
	}
	public String getSubway_name() {
		return subway_name;
	}
	public void setSubway_name(String subway_name) {
		this.subway_name = subway_name;
	}
	public String getSubway_line() {
		return subway_line;
	}
	public void setSubway_line(String subway_line) {
		this.subway_line = subway_line;
	}
	public String getSubway_outer_code() {
		return subway_outer_code;
	}
	public void setSubway_outer_code(String subway_outer_code) {
		this.subway_outer_code = subway_outer_code;
	}
	public String getSubway_latitude() {
		return subway_latitude;
	}
	public void setSubway_latitude(String subway_latitude) {
		this.subway_latitude = subway_latitude;
	}
	public String getSubway_longitude() {
		return subway_longitude;
	}
	public void setSubway_longitude(String subway_longitude) {
		this.subway_longitude = subway_longitude;
	}
	
	@Override
	public String toString() {
		return "SubwayDto [subway_code=" + subway_code + ", subway_name=" + subway_name + ", subway_line=" + subway_line
				+ ", subway_outer_code=" + subway_outer_code + ", subway_latitude=" + subway_latitude
				+ ", subway_longitude=" + subway_longitude + "]";
	}
	
}
