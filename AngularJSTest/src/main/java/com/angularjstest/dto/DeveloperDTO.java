package com.angularjstest.dto;

import java.io.Serializable;

public class DeveloperDTO implements Serializable{
	private String name;
	private String age;
	private String photo;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
