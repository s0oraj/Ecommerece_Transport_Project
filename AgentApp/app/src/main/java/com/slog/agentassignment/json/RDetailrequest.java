package com.slog.agentassignment.json;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class RDetailrequest {
    @SerializedName("id")
    @Expose
    private String transaction_id;

    @SerializedName("agent_id")
    @Expose
    private String agent_id;


    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public String getAgent_id() {
        return agent_id;
    }

    public void setAgent_id(String agent_id) {
        this.agent_id = agent_id;
    }



}
