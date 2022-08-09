package com.slog.agentassignment.json;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.slog.agentassignment.models.TransModel;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ourdevelops Team on 10/19/2019.
 */

public class RideCarResponseJson {

    @Expose
    @SerializedName("message")
    private String message;

    @Expose
    @SerializedName("data")
    private List<TransModel> data = new ArrayList<>();

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<TransModel> getData() {
        return data;
    }

    public void setData(List<TransModel> data) {
        this.data = data;
    }
}
