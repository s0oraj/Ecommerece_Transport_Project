package com.slog.agentassignment.json;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * Created by Ourdevelops Team on 10/13/2019.
 */

public class GetMerchantbyCatRequestJson {

    @SerializedName("latitude")
    @Expose
    private String lat;

    @SerializedName("longitude")
    @Expose
    private String lon;

    @SerializedName("id")
    @Expose
    private String id;

    @SerializedName("phone_number")
    @Expose
    private String phone;

    @SerializedName("category")
    @Expose
    private String category;

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getKategori() {
        return category;
    }

    public void setKategori(String category) {
        this.category = category;
    }
}