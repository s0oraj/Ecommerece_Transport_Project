package com.slog.agentassignment.json;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * Created by Ourdevelops Team on 10/13/2019.
 */

public class RegisterRequestJson {

    @SerializedName("customer_fullname")
    @Expose
    private String fullNama;

    @SerializedName("email")
    @Expose
    private String email;

    @SerializedName("phone_number")
    @Expose
    private String noTelepon;


    @SerializedName("address")
    @Expose
    private String address;


    @SerializedName("zipcode")
    @Expose
    private String zipcode;


    @SerializedName("city")
    @Expose
    private String city;


    @SerializedName("state")
    @Expose
    private String state;


    @SerializedName("latitude")
    @Expose
    private String latitude;


    @SerializedName("longitude")
    @Expose
    private String longitude;


    @SerializedName("phone")
    @Expose
    private String phone;

    @SerializedName("password")
    @Expose
    private String password;

    @SerializedName("alamat")
    @Expose
    private String alamat;

    @SerializedName("dob")
    @Expose
    private String tglLahir = "-";

    @SerializedName("token")
    @Expose
    private String token;

    @SerializedName("customer_image")
    @Expose
    private String customer_image;

    @SerializedName("countrycode")
    @Expose
    private String countrycode;

    @SerializedName("checked")
    @Expose
    private String checked;


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getCustomer_image() {
        return customer_image;
    }

    public void setCustomer_image(String customer_image) {
        this.customer_image = customer_image;
    }

    public String getFullNama() {
        return fullNama;
    }

    public void setFullNama(String fullNama) {
        this.fullNama = fullNama;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNoTelepon() {
        return noTelepon;
    }

    public void setNoTelepon(String noTelepon) {
        this.noTelepon = noTelepon;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getTglLahir() {
        return tglLahir;
    }

    public void setTglLahir(String tglLahir) {
        this.tglLahir = tglLahir;
    }


    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getFotopelanggan() {
        return customer_image;
    }

    public void setFotopelanggan(String customer_image) {
        this.customer_image = customer_image;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCountrycode() {
        return countrycode;
    }

    public void setCountrycode(String countrycode) {
        this.countrycode = countrycode;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }
}
