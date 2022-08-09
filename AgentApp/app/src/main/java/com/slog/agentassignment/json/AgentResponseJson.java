package com.slog.agentassignment.json;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.slog.agentassignment.models.AgentModel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ourdevelops Team on 10/13/2019.
 */

public class AgentResponseJson {

    @SerializedName("message")
    @Expose
    private String message;

    @SerializedName("data")
    @Expose
    private List<AgentModel> data = new ArrayList<>();


    @Expose
    @SerializedName("customer_id")
    private String idPelanggan;


    @Expose
    @SerializedName("end_latitude")
    private double endLatitude;

    @Expose
    @SerializedName("zipcode")
    private String  zipcode;

    @Expose
    @SerializedName("end_longitude")
    private double endLongitude;

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getIdPelanggan() {
        return idPelanggan;
    }

    public void setIdPelanggan(String idPelanggan) {
        this.idPelanggan = idPelanggan;
    }

    public double getEndLatitude() {
        return endLatitude;
    }

    public void setEndLatitude(double endLatitude) {
        this.endLatitude = endLatitude;
    }

    public double getEndLongitude() {
        return endLongitude;
    }

    public void setEndLongitude(double endLongitude) {
        this.endLongitude = endLongitude;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<AgentModel> getData() {
        return data;
    }

    public void setData(List<AgentModel> data) {
        this.data = data;
    }
}
