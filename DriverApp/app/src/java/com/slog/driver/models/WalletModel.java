package com.slog.driver.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.paypal.android.sdk.df;
import com.slog.driver.utils.Log;

import java.io.Serializable;

import io.realm.RealmObject;


import java.math.RoundingMode;
import java.text.DecimalFormat;

/**
 * Created by Ourdevelops Team on 12/20/2019.
 */

public class WalletModel extends RealmObject implements Serializable {

    @SerializedName("id")
    @Expose
    private String id;
    @SerializedName("wallet_amount")
    @Expose
    private String wallet_amount;

    @SerializedName("date")
    @Expose
    private String date;

    @SerializedName("type")
    @Expose
    private String type;

    @SerializedName("bank")
    @Expose
    private String bank;

    @SerializedName("holder_name")
    @Expose
    private String namapemilik;

    @SerializedName("status")
    @Expose
    private String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getJumlah() {



        // Code change made on 03/08/2022
        // Log.d("TAG","amount "+ amount);
        double amount = Double.parseDouble(wallet_amount);
        amount = (amount * 0.6)/10; // This calculation is done because we want to give driver 60% of original amount paid by customer.
        wallet_amount = String.format("%.2f", amount);
        return wallet_amount;

    }

    public void setJumlah(String wallet_amount) {
        this.wallet_amount = wallet_amount;
    }

    public String getWaktu() {
        return date;
    }

    public void setWaktu(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNamapemilik() {
        return namapemilik;
    }

    public void setNamapemilik(String status) {
        this.namapemilik = namapemilik;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

}
