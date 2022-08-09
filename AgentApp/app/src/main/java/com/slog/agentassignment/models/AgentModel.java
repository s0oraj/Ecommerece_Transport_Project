package com.slog.agentassignment.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

import io.realm.RealmObject;
import io.realm.annotations.PrimaryKey;

/**
 * Created by Ourdevelops Team on 10/17/2019.
 */

public class AgentModel extends RealmObject implements Serializable {

    @PrimaryKey
    @Expose
    @SerializedName("id")
    private String id;

    @Expose
    @SerializedName("distance")
    private String distance;

    @Expose
    @SerializedName("agent2_latitude")
    private String agent2_latitude;

    @Expose
    @SerializedName("agent2_longitude")
    private String agent2_longitude;

    @Expose
    @SerializedName("agent2_address")
    private String agent2_address;

    @Expose
    @SerializedName("agent2_city")
    private String agent2_city;
    @Expose
    @SerializedName("agent2_state")
    private String agent2_state;
    @Expose
    @SerializedName("agent2_zipcode")
    private String agent2_zipcode;
    @Expose
    @SerializedName("agent2_phone_number")
    private String agent2_phone_number;
    @Expose
    @SerializedName("agent2_customer_fullname")
    private String agent2_customer_fullname;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public String getAgent2_latitude() {
        return agent2_latitude;
    }

    public void setAgent2_latitude(String agent2_latitude) {
        this.agent2_latitude = agent2_latitude;
    }

    public String getAgent2_longitude() {
        return agent2_longitude;
    }

    public void setAgent2_longitude(String agent2_longitude) {
        this.agent2_longitude = agent2_longitude;
    }

    public String getAgent2_address() {
        return agent2_address;
    }

    public void setAgent2_address(String agent2_address) {
        this.agent2_address = agent2_address;
    }

    public String getAgent2_city() {
        return agent2_city;
    }

    public void setAgent2_city(String agent2_city) {
        this.agent2_city = agent2_city;
    }

    public String getAgent2_state() {
        return agent2_state;
    }

    public void setAgent2_state(String agent2_state) {
        this.agent2_state = agent2_state;
    }

    public String getAgent2_zipcode() {
        return agent2_zipcode;
    }

    public void setAgent2_zipcode(String agent2_zipcode) {
        this.agent2_zipcode = agent2_zipcode;
    }

    public String getAgent2_phone_number() {
        return agent2_phone_number;
    }

    public void setAgent2_phone_number(String agent2_phone_number) {
        this.agent2_phone_number = agent2_phone_number;
    }

    public String getAgent2_customer_fullname() {
        return agent2_customer_fullname;
    }

    public void setAgent2_customer_fullname(String agent2_customer_fullname) {
        this.agent2_customer_fullname = agent2_customer_fullname;
    }
}
