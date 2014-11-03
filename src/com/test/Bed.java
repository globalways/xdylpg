package com.test;

public class Bed extends Thing implements ThingInterface {
	private double lenth;
	private double width;
	private int id;
	public double getLenth() {
		return lenth;
	}
	public void setLenth(double lenth) {
		this.lenth = lenth;
	}
	public double getWidth() {
		return width;
	}
	public void setWidth(double width) {
		this.width = width;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
